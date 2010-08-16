Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Okwn9-00012d-EJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 12:19:48 +0200
Received: by ewy7 with SMTP id 7so2235272ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 03:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=evQtHfIxy7CTKWBIE0txinflvGG7dYbG7ZokW7V9qWU=;
	b=UvxuLQVsqpaDIGRK+nIWeKkOKUvIZFvi9V6V20OE3o/F4AhEzlJqyX1kGkmiUWQoD6
	DuP2r1ag5nlqtrb2/JvfgD7Xr917XIZ9GdiFZmZUmAoL53LDoKxg4tlQwbu3CJCIUFIC
	QHIQ1tTAQAgxDSAyS/c+YlwCH5a5sSyYRmaIs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=N3ZzS9iJtQkkjHatUebt0vvc6bJkz9nN6k3uGBODCcAMsXKVDDVfyOHo1qt1Y0o1VJ
	W2adbOldjYQtpWQN9//AvpZ0dSZkLD7OC3eXW3pXuzvHGmYw1ZUazHN9xbPwGHnAD0ab
	cMSd8hIKVG5dEwFB7XjCND+9rSpnxKPo3UPpo=
Received: by 10.213.34.77 with SMTP id k13mr4523203ebd.77.1281953963372;
	Mon, 16 Aug 2010 03:19:23 -0700 (PDT)
Received: from localhost.localdomain (atwork-193.r-212.178.107.atwork.nl
	[212.178.107.193])
	by mx.google.com with ESMTPS id z55sm9742320eeh.3.2010.08.16.03.19.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 03:19:22 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Aug 2010 12:20:40 +0200
Message-Id: <1281954040-17014-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] utils.bbclass: remove tests for checksums.ini
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Aug 2010 10:20:04 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

As we have checksums in recipes for quite a while now, I feel the time has come to
remove the checksums.ini code from utils.bbclass and to remove the (now empty)
checksums.ini file.

Attached is the patch.
Your feedback is appreciated

 classes/utils.bbclass |   45 +--------------------------------------------
 1 files changed, 1 insertions(+), 44 deletions(-)
 delete mode 100644 conf/checksums.ini

diff --git a/classes/utils.bbclass b/classes/utils.bbclass
index 7740ea3..83cf33c 100644
--- a/classes/utils.bbclass
+++ b/classes/utils.bbclass
@@ -157,50 +157,7 @@ def base_get_checksums(pn, pv, src_uri, localpath, params, data):
     expected_md5sum = bb.data.getVarFlag("SRC_URI", md5flag, data)
     expected_sha256sum = bb.data.getVarFlag("SRC_URI", sha256flag, data)
 
-    if (expected_md5sum and expected_sha256sum):
-        return (expected_md5sum,expected_sha256sum)
-    else:
-        # missing checksum, parse checksums.ini
-
-        # Verify the SHA and MD5 sums we have in OE and check what do
-        # in
-        checksum_paths = bb.data.getVar('BBPATH', data, True).split(":")
-
-        # reverse the list to give precedence to directories that
-        # appear first in BBPATH
-        checksum_paths.reverse()
-
-        checksum_files = ["%s/conf/checksums.ini" % path for path in checksum_paths]
-        try:
-            parser = base_chk_load_parser(checksum_files)
-        except ValueError:
-            bb.note("No conf/checksums.ini found, not checking checksums")
-            return (None,None)
-        except:
-            bb.note("Creating the CheckSum parser failed: %s:%s" % (sys.exc_info()[0], sys.exc_info()[1]))
-            return (None,None)
-        pn_pv_src = "%s-%s-%s" % (pn,pv,src_uri)
-        pn_src    = "%s-%s" % (pn,src_uri)
-        if parser.has_section(pn_pv_src):
-            expected_md5sum    = parser.get(pn_pv_src, "md5")
-            expected_sha256sum = parser.get(pn_pv_src, "sha256")
-        elif parser.has_section(pn_src):
-            expected_md5sum    = parser.get(pn_src, "md5")
-            expected_sha256sum = parser.get(pn_src, "sha256")
-        elif parser.has_section(src_uri):
-            expected_md5sum    = parser.get(src_uri, "md5")
-            expected_sha256sum = parser.get(src_uri, "sha256")
-        else:
-            return (None,None)
-        
-        if name:
-            bb.note("This package has no checksums in corresponding recipe '%s', please consider moving its checksums from checksums.ini file \
-                \nSRC_URI[%s.md5sum] = \"%s\"\nSRC_URI[%s.sha256sum] = \"%s\"\n" % (bb.data.getVar("FILE", data, True), name, expected_md5sum, name, expected_sha256sum))
-        else:
-            bb.note("This package has no checksums in corresponding recipe '%s', please consider moving its checksums from checksums.ini file \
-                \nSRC_URI[md5sum] = \"%s\"\nSRC_URI[sha256sum] = \"%s\"\n" % (bb.data.getVar("FILE", data, True), expected_md5sum, expected_sha256sum))
-
-        return (expected_md5sum, expected_sha256sum)
+    return (expected_md5sum,expected_sha256sum)
 
 def base_chk_file(pn, pv, src_uri, localpath, params, data):
     (expected_md5sum, expected_sha256sum) = base_get_checksums(pn, pv, src_uri, localpath, params, data)
diff --git a/conf/checksums.ini b/conf/checksums.ini
deleted file mode 100644
index e69de29..0000000
-- 
1.7.0.4



