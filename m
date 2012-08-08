Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Syy0R-0007DS-AN
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2012 06:36:27 +0200
Received: by pbcwy7 with SMTP id wy7so721788pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 21:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=w+nyznAvUWFGMwbEJfArnbAqXBnfqGhmDkIROrCjyo4=;
	b=Q+NVVkR2C3wApL7ky7kmVqTKFKn2JYjbts8PDxRl54PcYo3ruiM6TZ9MM3bqwRHprJ
	yuK/L6/3jRqBc2/KZag3FW+P0tWMyDjyXrc4S1dsdTf5+hvkMZbvLo1EVVINJYkauu4K
	7ZjKLHTzqJz73ouVVPwr5bEJ/uSfW0f600KtUepAu0BrtcmBzVsgnAhka9XDPiMxbozy
	W4zTnuHH7sMrPV8Qufz2YLZw9hXZVDZRlc43tpxxHAB1rGpSlAC/5UBwjW1OYrqOwbzR
	AaM/bburqxHNeNUec9P/DomsJQn6gJwTHZuq812KpLGBkOKN/rO+/SdlvR7gc2WTvfzs
	YX1Q==
Received: by 10.68.196.225 with SMTP id ip1mr32968150pbc.6.1344399879568;
	Tue, 07 Aug 2012 21:24:39 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id pa6sm9102305pbc.47.2012.08.07.21.24.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 21:24:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 21:24:29 -0700
Message-Id: <1344399869-3759-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-systemd][PATCH V2] meta-systemd: Create a hard link to gitpkgv.bbclass
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
X-List-Received-Date: Wed, 08 Aug 2012 04:36:27 -0000

git is not handling soft links

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-systemd/classes/gitpkgv.bbclass |   96 +++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)
 mode change 120000 => 100644 meta-systemd/classes/gitpkgv.bbclass

diff --git a/meta-systemd/classes/gitpkgv.bbclass b/meta-systemd/classes/gitpkgv.bbclass
deleted file mode 120000
index 8205151..0000000
--- a/meta-systemd/classes/gitpkgv.bbclass
+++ /dev/null
@@ -1 +0,0 @@
-../../meta-oe/classes/gitpkgv.bbclass
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
1.7.9.5



