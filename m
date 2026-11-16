Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9.1794851759058718656
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WWmTwHsS;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-37628596783so6272945eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851758; x=1795456558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vPSXAzX7vKGORRnBoMwslXfhEt3rM0PiJloq3Q3DFE=;
        b=WWmTwHsS2NAiyazI7LgVdN90BIW3cG8eOjcBgttxh9n7e5oe25uitVZkumtt18w4kN
         f/Zf0cmI75woFJcIuOJgeGr3wZFvoIjxqlze0bphT8fqAbCcC+4FK8ntVHUzO4sZf0KE
         KOsbxdvRqfnuPopDzv2VzbsoEaheHTyMBE0mRMn+E+4EIO5UuQ50beUH22izwNxcLGS+
         ivmp2yOQJEyHTOd/g06J5BJeVwGfgg7MtplUg73XecmhNMxINb8dbDPz3HeAeIr3iVdu
         6jA7h3l7jthCp6Q+AjAzG9LeKgff/2Z9DgXYydiU/BCTz6OmcS9DerjDp6TENQ/ElupA
         jc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851758; x=1795456558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vPSXAzX7vKGORRnBoMwslXfhEt3rM0PiJloq3Q3DFE=;
        b=K1Dyei+zYZmkwUjLN681kr1f6EjeoFFwkHCfhLaxCMiYBWHK6BxFWklXuuOaV7htx7
         5IQQNLjIc9NZs21aCRkmLKpjOThRlSUVMbHCrKS6Zbu/URKQ6gc0HP+z/+Sbu4++Vs7U
         ztqBMDZyYWisUVN2JepQz1F7s5e8rtm0XUOcx1MYYjPRYSuhQz1OyKvSh5V+eW4EU2Nw
         QUSNMWm1rRs0ZfQSx/F29oV0B0zeKwv6gZbJWPohwXoV1vNZqqRQGpxPpLV0zjM33bT4
         uF5fxpw3LGhdH+UdtQU39U66xgeGn+9uy567MgcPJdxz/J9bYLythdYJGaCfz5TMg8Qn
         91hA==
X-Gm-Message-State: APuU4Z+uNrggJKJKquI8DMM+6mV4aJAWnvQ/xdkCNmIfgVh+NNaKTWMt
	S+aIXbthNJsIroTXU4MfJFez+VUfzjx2M9+l1p1ekqD5ANQwhaqmve6FB+rRRy/G
X-Gm-Gg: AZFdTZeChvqBxWIcWu6syqB8HuYgLCCVvO89U0/6I2j7p1nZymFZH/v7LfUuP+B0HP8
	b78ng0AmlBHOSCd1JqBCsoFpiOCmm1vPdmYNxBp9ChdrZU4zhtvIT8CmH4maAnGcSA33YdQxK3Q
	S9P1r83RlCPGdDOhQodVDU9NGyRKDWlYpVP5hmd6BvH+GtOmSG1y3lnjsdJGY+sOVHvjeIOkeck
	YMVtrX70XBSVkKG7Xvyak01EDtK7lCkeuEs/XElURmgqNGFY4Xs2PzF96PBluba1RIA5c4lvhue
	Wzm4bPgP4j7kydYr/sUc2ZZlpS/7qhE1lxOO1k+2zedsCldpPzb9hvLzCUbUnmdRJ9LI48+saV+
	osXpgWeqgw1+5MT5IMyhojJoBVq9fhoIylhSexVLKxOnbgdacT0lvy+E07KKw3U3rLsE2OBPVD5
	IAMTVEzc9J/NH9TPh1JDdIuVCOdhgNkyIb0oTggvgKEYflN4YSr3xPe+WbILqeKYu6i+XptvCgO
	dnkjJfCHy1vcdK6bfQGLZQ84D31qB9rWpBuDc8N3cM0Vk+A2C5EHYBG4/oveyoLf8ENivnds1CJ
	t/zN/1kD+0Zeh9leyPWnK50A5jwIFwxwyVwVDtZutkfFcqSuy53A4MtaTl/dbSFb+TKTCDFME0e
	6sFJ258sbjgN9S1dnUkJ9wK1WBGEsUowzaC8vZj4dBX+VmeMNm3dA6pzvy5B58YWE3JA802AE3+
	KMcmxrEc2/Om8vVNXVt/LfM9yRtj9h9no2L0CFlsDXvG6cQIHRFuQxYpHguxhkJo89HmOAebExy
	TzMWkyLK2ffF3OxC11TcQihxNEZcTGssonyhlaZf66V6CL4E25ZSW856yCeSRVZW46ApVLaX5AX
	6ocv
X-Received: by 2002:a05:693c:87d2:10b0:36e:53bc:467d with SMTP id 5a478bee46e88-3796047ef7dmr9825296eec.0.1794851758343;
        Mon, 16 Nov 2026 09:55:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 086/105] python3-send2trash: upgrade 2.1.0 -> 2.2.0
Date: Mon, 16 Nov 2026 09:53:38 -0800
Message-ID: <20261116175359.342679-86-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132541
Content-Type: text/plain; charset="utf-8"

Drop tests/test_plat_mac.py from the ptest; it runs
send2trash/mac/__init__.py from the source tree, which isn't installed.

License-Update: Line endings only.

Changes:
- Security: fix path traversal on file restoration due to incorrect
  path when trashing (CVE-2026-55788, GHSA-fgv9-r74r-hqmx).
- Handle unavailable macOS version during backend selection.
- Resolve symlinked home directories when choosing the trash device.
- Improve legacy Windows error diagnostics; more Python 2 cleanup.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../send2trash/python3-send2trash_2.1.0.bb    | 14 --------------
 .../send2trash/python3-send2trash_2.2.0.bb    | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
 create mode 100644 meta-python/recipes-extended/send2trash/python3-send2trash_2.2.0.bb

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
deleted file mode 100644
index f612e8137e..0000000000
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a02659c2d5f4cc626e4dcf6504b865eb"
-
-inherit pypi python_setuptools_build_meta ptest-python-pytest
-
-SRC_URI += "file://run-ptest"
-SRC_URI[sha256sum] = "1c72b39f09457db3c05ce1d19158c2cbef4c32b8bedd02c155e49282b7ea7459"
-
-
-RDEPENDS:${PN} += "\
-    python3-io \
-    python3-datetime \
-"
diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_2.2.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_2.2.0.bb
new file mode 100644
index 0000000000..77ae719965
--- /dev/null
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_2.2.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Send file to trash natively under Mac OS X, Windows and Linux"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05faa35ba1ca10b723f19d286c9d5237"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+SRC_URI += "file://run-ptest"
+SRC_URI[sha256sum] = "e0ac412073f7984288908d9d8b8d13c82be69a615bb513d948fa2f053447970a"
+
+# the macOS backend selection tests run send2trash/mac/__init__.py from the
+# source tree, which isn't installed
+do_install_ptest:append() {
+    rm -f ${D}${PTEST_PATH}/tests/test_plat_mac.py
+}
+
+RDEPENDS:${PN} += "\
+    python3-io \
+    python3-datetime \
+"
