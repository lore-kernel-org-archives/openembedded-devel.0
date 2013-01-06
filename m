Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrmXM-00036z-Hy
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:29:01 +0100
Received: by mail-pa0-f43.google.com with SMTP id fb10so10159271pad.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Uf5+JZkBl1s0yG3wd7WTmEh7OViqfmcmNbYZzPc4SFM=;
	b=ntMiWtcdvZbSIseUoW9RzAFa8URwuMd+vtl65Kun0hcUh1uresIPTPqJyqBwVAuhas
	jtH01u+vERlK7uCMxl3jHkMrzHvDccvujQBnsLfMYXe0v/g/1BzNO8ohcWfrhxDgWb7E
	ObCxQ36gCcFGuV5yNlVHk5yoA8wXow/hDt7Be2Zqrhb8EfyEi1Q4CS2uhO7vKq4YikYm
	t3MG5p1/PICguJ1139pWOtlZ1WLPdaAMSDCiJt7jyu4vwZ65huYzBh/z3TeQhC0zp5nl
	nDUJINWRZqwbtd0GzqItedPMY6M2Wee7V0n7GlXV70vxqgs4MYLCeqlzZoa08+frRmsX
	50/w==
X-Received: by 10.66.90.72 with SMTP id bu8mr168328903pab.69.1357463632332;
	Sun, 06 Jan 2013 01:13:52 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:42 -0800
Message-Id: <1357463568-26241-19-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 19/25] systemd.bbclass: Fixes for living along with multilib
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
X-List-Received-Date: Sun, 06 Jan 2013 09:29:04 -0000

This essentially fixes two problems
1. We were ignoring systemd for multilibs now we dont
2. We were replacing '-systemd' string in PN which is
a problem whenre -systemd appears more than once
e.g. lib32-systemd-units-system it was removing both
essentially we should only chop the end of PN if it
ends with '-systemd'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/systemd.bbclass |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index 9582492..16ac1fb 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -53,7 +53,9 @@ def systemd_after_parse(d):
                         "\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
                         (bb_filename, pkg_systemd)
             else:
-                pkg_systemd_base = pkg_systemd.replace('-systemd', '')
+                pkg_systemd_base = pkg_systemd
+                if pkg_systemd_base.endswith('-systemd'):
+                    pkg_systemd_base = pkg_systemd[:-8]
                 if pkg_systemd_base not in packages:
                     raise bb.build.FuncFailed, \
                         "\n\n%s: %s in SYSTEMD_PACKAGES does not match <existing-package>-systemd or ${PN}" % \
@@ -68,9 +70,10 @@ def systemd_after_parse(d):
 
 
     bpn = d.getVar('BPN', 1)
+    ml = d.getVar('MLPREFIX', 1) or ""
     if bpn + "-native" != d.getVar('PN', 1) and \
             bpn + "-cross" != d.getVar('PN', 1) and \
-            not d.getVar('MLPREFIX', 1) and \
+            ml + bpn == d.getVar('PN', 1) and \
             "nativesdk-" + bpn != d.getVar('PN', 1):
         systemd_check_vars()
         for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
-- 
1.7.9.5



