Return-Path: <mcfrisk@kapsi.fi>
X-Greylist: delayed 3353 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Sep 2017 15:24:35 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id B8ED665C5B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 15:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From;
	bh=5+m1t6at/tE6y2iooeDeGrpyNSUWhmxF42eUPfISqXE=; 
	b=E5BuhIC910eay91a/wVcxzPV/O9eBf2DV3PoV2RLQ8qxjNl7/Nqo2XPzlZRc7G/YGiFPNjbN03/6G98TZ9Z+eIf6fP8xsYDlrjGZq6fN7zh4woFpFFQyk9YJaX5i24iFcg84jBmq1UMisqctHBWLDEmeaHpLVzpqB0ILlNOQ3dJYHKZ4OozhcEllY6JKoCmr/gC7k/w627py35ZMPexyrgn5/Wgq1uVnG2elSQa5ePdmWlvp/OHLIikuNXKj136MaH5lirsy5No4IQuvw4yGUambDDl+/FCDqGoup6KOWkTgw/fSJBeej28f29n28YfSKBJn/0HN0GSg0azO1vnjBA==;
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.84_2) (envelope-from <mcfrisk@kapsi.fi>)
	id 1dnmw7-0005FG-2P; Fri, 01 Sep 2017 17:28:43 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1dnmw7-0007n5-0J; Fri, 01 Sep 2017 17:28:43 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Sep 2017 17:28:38 +0300
Message-Id: <1504276118-29353-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH] cve-check.bbclass: detect patched CVE's also from patch file names
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 15:24:36 -0000

While poky master branch has been fixed so that all CVE patch files have
the:

CVE: CVE-2017-1234556

strings in the patch comments, many older versions of poky and other meta
layers are not, but the CVE patches quite often have the CVE id in the
patch file name.

If the CVE: string also found, there are no duplicates in the report.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/cve-check.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f44bbed..bc2f03f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -118,10 +118,24 @@ def get_patches_cves(d):
 
     pn = d.getVar("PN")
     cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
+
+    # Matches last CVE-1234-211432 in the file name, also if written
+    # with small letters. Not supporting multiple CVE id's in a single
+    # file name.
+    cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
+
     patched_cves = set()
     bb.debug(2, "Looking for patches that solves CVEs for %s" % pn)
     for url in src_patches(d):
         patch_file = bb.fetch.decodeurl(url)[2]
+
+        # Check patch file name for CVE ID
+        fname_match = cve_file_name_match.search(patch_file)
+        if fname_match:
+            cve = fname_match.group(1).upper()
+            patched_cves.add(cve)
+            bb.debug(2, "Found CVE %s from patch file name %s" % (cve, patch_file))
+
         with open(patch_file, "r", encoding="utf-8") as f:
             try:
                 patch_text = f.read()
@@ -140,7 +154,7 @@ def get_patches_cves(d):
             for cve in cves.split():
                 bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
                 patched_cves.add(cve)
-        else:
+        elif not fname_match:
             bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
 
     return patched_cves
-- 
1.9.1


