Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sxkmu-0006GU-1L
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Aug 2012 22:17:28 +0200
Received: by pbbrq2 with SMTP id rq2so2960879pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2012 13:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RYBliMQoLDlBXrfGVgt9mSBSjMn9Cg4ITYbNMkup7fw=;
	b=YjJ4D92yY/KNMjDduPQWlF8F3vBmN4joMKacZyXqP2p7qKyNKQabRpdbro8M6lNmpG
	y65QPhzH94LQI6jrJv5JX9OqGbozP79wVLfOSDucl9f2xr2tXexc5fLbds+zUcfKZAxH
	L/CY3d//CpLjmTjtbjzeLpGUtH7JjT7ZAbb/rycqto3Z36TUIlp51dcZ14f7H0976Rkz
	HX7/4eJ64HR5gZGZfE5FqxEoJSo2n3jK+SF0IXq80W1HMXnULaQGV3ACvyhtqoELr11I
	IWR4+tERI46oibrM08qiB27mWVZcakqLq5UrmXj4nXbjDdPpOC1ESkzz5VR6nEssOGDg
	8XgA==
Received: by 10.68.192.40 with SMTP id hd8mr7335861pbc.125.1344110744639;
	Sat, 04 Aug 2012 13:05:44 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id ro7sm427008pbc.8.2012.08.04.13.05.43
	(version=SSLv3 cipher=OTHER); Sat, 04 Aug 2012 13:05:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Aug 2012 13:05:29 -0700
Message-Id: <1344110736-6999-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH V4 1/8] gitpkgv.bbclass: Add a copy from meta-oe
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
X-List-Received-Date: Sat, 04 Aug 2012 20:17:28 -0000

This is for systemd layer to be used with
out depending on meta-oe eventually gitpkgv
or similar solution should come out of OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/gitpkgv.bbclass |   95 ++++++++++++++++++++++++++++++++++
 1 files changed, 95 insertions(+), 0 deletions(-)
 create mode 100644 meta-systemd/classes/gitpkgv.bbclass

diff --git a/meta-systemd/classes/gitpkgv.bbclass b/meta-systemd/classes/gitpkgv.bbclass
new file mode 100644
index 0000000..238b0d2
--- /dev/null
+++ b/meta-systemd/classes/gitpkgv.bbclass
@@ -0,0 +1,95 @@
+# gitpkgv.bbclass provides a GITPKGV and GITPKGVTAG variables to be
+# used in PKGV, as described bellow:
+#
+# - GITPKGV which is a sortable version with the format NN+GITHASH, to
+#   be used in PKGV, where
+#
+#   NN equals the total number of revs up to SRCREV
+#   GITHASH is SRCREV's (full) hash
+#
+# - GITPKGVTAG which is the output of 'git describe' allowing for
+#   automatic versioning
+#
+# gitpkgv.bbclass assumes the git repository has been cloned, and
+# contains SRCREV. So ${GITPKGV} and ${GITPKGVTAG} should never be
+# used in PV, only in PKGV.  It can handle SRCREV = ${AUTOREV}, as
+# well as SRCREV = "<some fixed git hash>".
+#
+# WARNING: if upstream repository is always using consistent and
+# sortable tag name scheme you can get sortable version including tag
+# name with ${GITPKGVTAG}, but be aware that ie tag sequence "v1.0,
+# v1.2, xtest, v2.0" will force you to increment PE to get upgradeable
+# path to v2.0 revisions
+#
+# use example:
+#
+# inherit gitpkgv
+#
+# PV = "1.0+gitr${SRCPV}"      # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
+# PKGV = "1.0+gitr${GITPKGV}"  # expands also to something like 1.0+gitr31337+4c1c21d7d
+#
+# or
+#
+# inherit gitpkgv
+#
+# PV = "1.0+gitr${SRCPV}" # expands to something like 1.0+gitr3+4c1c21d7dbbf93b0df336994524313dfe0d4963b
+# PKGV = "${GITPKGVTAG}"  # expands to something like 1.0-31337+g4c1c21d
+#                           if there is tag v1.0 before this revision or
+#                           ver1.0-31337+g4c1c21d if there is tag ver1.0
+
+GITPKGV = "${@get_git_pkgv(d, False)}"
+GITPKGVTAG = "${@get_git_pkgv(d, True)}"
+
+def gitpkgv_drop_tag_prefix(version):
+    import re
+    if re.match("v\d", version):
+        return version[1:]
+    else:
+        return version
+
+def get_git_pkgv(d, use_tags):
+    import os
+    import bb
+
+    src_uri = bb.data.getVar('SRC_URI', d, 1).split()
+    fetcher = bb.fetch2.Fetch(src_uri, d)
+    ud = fetcher.ud
+
+    #
+    # If SRCREV_FORMAT is set respect it for tags
+    #
+    format = bb.data.getVar('SRCREV_FORMAT', d, True)
+    if not format:
+        format = 'default'
+
+    found = False
+    for url in ud.values():
+        if url.type == 'git':
+            for name, rev in url.revisions.items():
+                if not os.path.exists(url.localpath):
+                    return None
+
+                found = True
+
+                cwd = os.getcwd()
+                os.chdir(url.localpath)
+
+                commits = bb.fetch2.runfetchcmd("git rev-list %s -- 2> /dev/null | wc -l" % rev, d, quiet=True).strip()
+
+                if use_tags:
+                    try:
+                        output = bb.fetch2.runfetchcmd("git describe %s 2>/dev/null" % rev, d, quiet=True).strip()
+                        ver = gitpkgv_drop_tag_prefix(output)
+                    except Exception:
+                        ver = "0.0-%s-g%s" % (commits, rev[:7])
+                else:
+                    ver = "%s+%s" % (commits, rev[:7])
+
+                os.chdir(cwd)
+
+                format = format.replace(name, ver)
+
+    if found:
+        return format
+
+    return '0+0'
-- 
1.7.5.4



