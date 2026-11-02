Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8838.1793609825894995357
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 00:57:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aRviPTol;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so2548366f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 00:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793609824; x=1794214624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wx/7KCUHW/YZ108uel/kjCf4BfC078bDsjNOl4ZtQdg=;
        b=aRviPTol5+PcEKwHKBI3yQk1Op4/Cjjd/HEBFCSgX0IZSFX4K/eIYJu5TFH6WKIi2B
         Wfq2ny+zZFNDmthMdCoIQnIQluYMUMBTpM7jgejJ9lju1i+d/1uNzlVV7/VQMo+Prpmo
         yNCGOndvSiq737ifI76BYJe0S8sjr9/hU6bjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609824; x=1794214624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wx/7KCUHW/YZ108uel/kjCf4BfC078bDsjNOl4ZtQdg=;
        b=fe7P9KlTTx/tilGtvmOmUVH7NZdu+nN/O/v/tCjIPw1PNChp6V7Khuzyvxj0xFlBK1
         ySx0xIqBlIixm0pJil2jNjQcky6trhsPZEkrJjWdHmEbzIXw+C3AMEMuKUE8TBMr81g3
         VpTlXeDP6zaQ8XHATNzMbSrRZYey6Attiy2mejrYiA5tO4V9GITVp3GIA8uejzXc5mgH
         zxXcmq0Ge2UX8iKHsX+spVEfi4qlXS+bynokTGII8Td8pB7V5h4nbZROMLU6SXTL028R
         83b0T+Vaqs54TOXkx6zrRHJNrgG3Q7+piS8b2iz7AtlJzcrbfQyHq5wlrA1ODWyqnJwK
         04Gw==
X-Gm-Message-State: APuU4Z9Zkt3fOa+qX54vXrde7XwIXGqa7nEmyVAkOFxhqJvNcrfafnQC
	3hBGbV82mr9vn1+m2UkAM5ZxPpcUMGYngzGfsZnRslLtLDmfyQC00T+IDE0V30rLnV7u4T8NzXl
	56/OW
X-Gm-Gg: AYBFou0ZbX2AnYVC0KcAfgrpC2FrQNsy7KozAaXOIPiTXTwCGW2VdN3MOkeEGidna3B
	m3Wis6RUeIVca7yRadXFHhWXe5GsrLGAZk6/xLaqMctzarbxR1Jxa54mLqgbHOekiDcs7t00QA+
	b3e/gVxIDtM+y8ldznUjqf9creuesNdFvlL24dKCVpiO4bDHkW582HNnyZy3nK4qpAQhiou8Nuc
	kk3WISUKJVb+2noyQb1JMx8UQSSDYylw7IZqa74XuPXhCncGPZzuprDES8+TJY6QhJTx4U0295v
	KNVh4AO6+gbiIGT1H8lrYeuN9oayvXCIhexPg/VEpFFBsZpL9Aa3YJmvWhKjFOTNQ5GAo8JsARP
	aYi3sGiti4csPKgGKajqLlHjpZIIee4lgtrqw55dBZxL58DlbfNI2n6DRlFHqizJ5GHxzxtZnz/
	s0XghcPxyEC729x2PTJEFMilBunFH4IufPgFFudmP0C+jo84+jRb+nX2FE6tO3jR2uhWnCE+mRe
	/DAI3/QxVJr8bQDySV44VP4UcTyNWh5nVsJoHWbSUiuLahc4/j+Q5xJ4+y2Ik/yUGTSBwu9b2Wa
	eWIzW9P7BJp34oyI8roXcFqEZJq2l3onnvKrYXgUYVMwS/9PCQtu/hQAK2o7pP5EBZxlxKPPVjI
	ZS0OhSUkjSGuLKA7hekt9RY2xoofsuNiyzwNUdORp0A2bsbirlaSoGg==
X-Received: by 2002:a05:6000:46c3:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-48e6e2f069amr13591887f8f.32.1793609823727;
        Mon, 02 Nov 2026 00:57:03 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a6bsm18451088f8f.27.2026.11.02.00.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:57:02 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-asciitree: Upgrade 0.3.3 -> 1.0.0
Date: Mon,  2 Nov 2026 10:57:00 +0200
Message-ID: <20261102085700.236561-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131743
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.0.0:

- Configurable layout spaces through BoxStyle.gfx["SPACE"], with an
  ordinary-space fallback for existing palettes.
- Declared the existing public API stable, without breaking changes
  from 0.4.0.

Fixes:

WARNING: python3-asciitree-1.0.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

License-Update: Update copyright years to 2015-2026

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-asciitree_0.3.3.bb   | 8 --------
 .../recipes-devtools/python/python3-asciitree_1.0.0.bb   | 9 +++++++++
 2 files changed, 9 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-asciitree_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
deleted file mode 100644
index a3185a9c66..0000000000
--- a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Draws ASCII trees."
-HOMEPAGE = "https://github.com/mbr/asciitree"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a985ccb0df374f2a8cab75010bf8db73"
-
-SRC_URI[sha256sum] = "4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f2e18a96765145cc0f6e"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-asciitree_1.0.0.bb b/meta-python/recipes-devtools/python/python3-asciitree_1.0.0.bb
new file mode 100644
index 0000000000..086fc07392
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asciitree_1.0.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "ASCII trees"
+DESCRIPTION = "Draws ASCII trees"
+HOMEPAGE = "https://github.com/mbr/asciitree"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a533ab417405f77f9a3d236d35cd7069"
+
+SRC_URI[sha256sum] = "0c396808c13cab27b60cbe402b99ef37fa681c6b59d337a008719efa201cdd07"
+
+inherit pypi python_setuptools_build_meta
-- 
2.47.3

