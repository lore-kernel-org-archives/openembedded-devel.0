Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75735C5DF90
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:35:49 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.661.1787286947216002594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KJTSzWXz;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso4610545ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286946; x=1787891746; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+RmenQjE9RWPnb6j6WM2vT2O66+alhR4jTKmZza8ls=;
        b=KJTSzWXzPC213BjtarqXga2wnfmTZoaMUkbDDUvnNZ3wQIUxDiQ4uDYwm3CfT32ehF
         MG1vsc7YHciiT98sz1pKKJkb/aYROV7rgI5RsQ0om0V0EFPzjQVl/7KT7VyYOTOwYbBV
         w/TapdBth4RdCuPIjsp9Qjsah0rX7uzvgnX7RB6rAKgvWMt/DIVdC7Dn9pP0dFX43mSo
         yxJ3vY4gZwf8tJGkzpkjosCGdB0lHK2sohPbVVo2H5varfSlZ2QWFQrGguMnzhahlqVf
         X8VSn3tpe7lXsbGZjJjyM92dbMzSsu5H3YiMKSSjyqjyiNHaQRL3unPSQRAkgRdnQUw0
         xMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286946; x=1787891746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+RmenQjE9RWPnb6j6WM2vT2O66+alhR4jTKmZza8ls=;
        b=KXCHOPSybtBnLMv4xmb/fsLB9/VN07UzauZVkLWlMwYLNS+tza04uBQpsAgYqogAug
         zNAXfSTqybs8q3ZSSaGoJ3ulZ5sa4ZB2Ry9j5oAEKpY5T/X9vVXj0hMF4dD3PEWrPDwW
         CB90JszDht//lfdsZRQvvDBiq11VO/bx8RHL140lhfpippRmxCMsJ8tu6sFqTSiT0Le7
         Ifw2g+7re7rYxscx6Kg+VcXxZVMzau6/cRJDU1QzbyyBf2ph/6pxSVBFg+/Q4RuzWGL9
         L1njA3NQpRLtsEV39ffocu22Fu63VnBcpgNR5JHo3jlUdAyX+wLpuMo9rBbkaWmW9Up2
         5WRg==
X-Gm-Message-State: AFuF++nP2PkRYhzCZZt1cEgLN7QEZ9YkaYIyLSsoCq3pK2veUcKCvjPD
	xvzMFfW9Rie5JxAfbpbjalIVyqUtuqhksM5WyXmA+fEa6fgUJhgvQTDyHGSIDw==
X-Gm-Gg: AR+sD12uvcBeFPYdp26XeBoC4MNVFmEnIrcakkn3NTnEesNHhd6jCfjhyxRfvtAYvNR
	HThxbwxeJCbOa49arAlvdLhJQvT6wSMSmYVg7FZmkbtsL8pED6ZRA2+FR4p9BBgFKMy6jBD/bL0
	sXTM88Ke0luokJ82RplFJ+WO3Or9Sby1KO4xRZu+RD8GeA4FcrSva2dCdqTlKEj4GTJfZHNdydY
	GNJVMSVXUg0RFXf8P0Sf5UTYN9gKFBaBqR34hZGVKEJyD8xzNYVb6Qs4gC3vFDIAMhcWP1Amd3i
	Kw/by9ggjl2TASUrjU4CNjBcT+UofkWiBCZJNjg84LeVoLd6R4//JGqtnb+SOV3uvS+6kJGbI0s
	VGEgFtHOZCb/3vvC/T6WJ8LEe5GKE/MxzkMLQAxncaCQSU+rDI2Z3KmRgVLVULriHMis0qBS+DP
	E9cHwn3rI1tK5FRTgA9bM0Stm5bXQcwJZ0tvD6LoGkpnVxOYPyOLTdGWJlozSF50nDoTLQ8aQhy
	TGyPlzlLM+nT1ytnAY=
X-Received: by 2002:a17:90b:35ca:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-395c3a7c27emr7091392a91.16.1787286946522;
        Thu, 20 Aug 2026 21:35:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/15] libconfuse: upgrade 3.3 -> 3.4
Date: Fri, 21 Aug 2026 16:35:15 +1200
Message-ID: <20260821043525.448011-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129401

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Drop patches that are part of the upstream version

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...rch-path-logic-to-relative-pathnames.patch | 48 -------------------
 .../libconfuse/files/CVE-2022-40320.patch     | 42 ----------------
 .../{libconfuse_3.3.bb => libconfuse_3.4.bb}  |  6 +--
 3 files changed, 1 insertion(+), 95 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libconfuse/files/0001-only-apply-search-path-logic-to-relative-pathnames.patch
 delete mode 100755 meta-oe/recipes-support/libconfuse/files/CVE-2022-40320.patch
 rename meta-oe/recipes-support/libconfuse/{libconfuse_3.3.bb => libconfuse_3.4.bb} (70%)

diff --git a/meta-oe/recipes-support/libconfuse/files/0001-only-apply-search-path-logic-to-relative-pathnames.patch b/meta-oe/recipes-support/libconfuse/files/0001-only-apply-search-path-logic-to-relative-pathnames.patch
deleted file mode 100644
index aa9fab86e6..0000000000
--- a/meta-oe/recipes-support/libconfuse/files/0001-only-apply-search-path-logic-to-relative-pathnames.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b684f4cc25821b6e86a58576f864e4b12dfdfecc Mon Sep 17 00:00:00 2001
-From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
-Date: Sat, 5 Jun 2021 22:57:51 +0200
-Subject: [PATCH] only apply search path logic to relative pathnames
-
-Adding any directory to the search path via cfg_add_searchpath breaks
-lookup of absolute paths. So change the logic in cfg_searchpath() to
-ignore the search path when the given filename is absolute, and merely
-check that for existence.
-
-This is technically an ABI change, but the current behaviour is quite
-unusual and unexpected.
-
-Upstream-Status: Backport [https://github.com/libconfuse/libconfuse/pull/155]
-
-Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
----
- src/confuse.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/confuse.c b/src/confuse.c
-index 2ea0254..19b56e3 100644
---- a/src/confuse.c
-+++ b/src/confuse.c
-@@ -1746,12 +1746,20 @@ DLLIMPORT char *cfg_searchpath(cfg_searchpath_t *p, const char *file)
- 		return NULL;
- 	}
- 
-+	if (file[0] == '/') {
-+		fullpath = strdup(file);
-+		if (!fullpath)
-+			return NULL;
-+		goto check;
-+	}
-+
- 	if ((fullpath = cfg_searchpath(p->next, file)) != NULL)
- 		return fullpath;
- 
- 	if ((fullpath = cfg_make_fullpath(p->dir, file)) == NULL)
- 		return NULL;
- 
-+check:
- #ifdef HAVE_SYS_STAT_H
- 	err = stat((const char *)fullpath, &st);
- 	if ((!err) && S_ISREG(st.st_mode))
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-support/libconfuse/files/CVE-2022-40320.patch b/meta-oe/recipes-support/libconfuse/files/CVE-2022-40320.patch
deleted file mode 100755
index 52296b9c0f..0000000000
--- a/meta-oe/recipes-support/libconfuse/files/CVE-2022-40320.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From d73777c2c3566fb2647727bb56d9a2295b81669b Mon Sep 17 00:00:00 2001
-From: Joachim Wiberg <troglobit@gmail.com>
-Date: Fri, 2 Sep 2022 16:12:46 +0200
-Subject: [PATCH] Fix #163: unterminated username used with getpwnam()
-
-Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
-
-CVE: CVE-2022-40320
-Upstream-Status: Backport [https://github.com/libconfuse/libconfuse/commit/d73777c2c3566fb2647727bb56d9a2295b81669b]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/confuse.c | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/src/confuse.c b/src/confuse.c
-index 6d1fdbd..05566b5 100644
---- a/src/confuse.c
-+++ b/src/confuse.c
-@@ -1872,17 +1872,20 @@ DLLIMPORT char *cfg_tilde_expand(const char *filename)
- 			file = filename + 1;
- 		} else {
- 			/* ~user or ~user/path */
--			char *user;
-+			char *user; /* ~user or ~user/path */
-+			size_t len;
- 
- 			file = strchr(filename, '/');
- 			if (file == 0)
- 				file = filename + strlen(filename);
- 
--			user = malloc(file - filename);
-+			len = file - filename - 1;
-+			user = malloc(len + 1);
- 			if (!user)
- 				return NULL;
- 
--			strncpy(user, filename + 1, file - filename - 1);
-+			strncpy(user, &filename[1], len);
-+			user[len] = 0;
- 			passwd = getpwnam(user);
- 			free(user);
- 		}
diff --git a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb b/meta-oe/recipes-support/libconfuse/libconfuse_3.4.bb
similarity index 70%
rename from meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
rename to meta-oe/recipes-support/libconfuse/libconfuse_3.4.bb
index b755c5d0b5..3d23fde23f 100644
--- a/meta-oe/recipes-support/libconfuse/libconfuse_3.3.bb
+++ b/meta-oe/recipes-support/libconfuse/libconfuse_3.4.bb
@@ -3,15 +3,11 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=42fa47330d4051cd219f7d99d023de3a"
 
 SRC_URI = "https://github.com/libconfuse/libconfuse/releases/download/v${PV}/confuse-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3a59ded20bc652eaa8e6261ab46f7e483bc13dad79263c15af42ecbb329707b8"
+SRC_URI[sha256sum] = "d98a793f4cafc1b3c18e2509ba54f6cb9ac6291b181bcda152dc987cb78f43ec"
 
 UPSTREAM_CHECK_URI = "https://github.com/libconfuse/libconfuse/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
-
-SRC_URI += "file://0001-only-apply-search-path-logic-to-relative-pathnames.patch"
-SRC_URI += "file://CVE-2022-40320.patch"
-
 inherit autotools-brokensep pkgconfig gettext
 
 S = "${UNPACKDIR}/confuse-${PV}"

