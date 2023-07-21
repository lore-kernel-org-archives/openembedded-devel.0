Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 150DDC04A94
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 19:25:42 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web10.15563.1689967536706878754
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jul 2023 12:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=vEvvMpCE;
 spf=pass (domain: baylibre.com, ip: 209.85.221.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-48143577cfbso948609e0c.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 12:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689967535; x=1690572335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3sDGzjMgmFlcV1VXAhG2+Ypp9Xct4LpsCKv99vvbp4=;
        b=vEvvMpCEKh6BGWmN0heyTWba4CLwVgCYcOKoHvHNBoDanQKwhn+lp5URmRJ+ZrGXxh
         fZ6bC2WzlzXBsqN3Mv8DRK2q83LM1DBTS+KRdAukEG8Niu2hGsTUKoYetaIgvXVSyiya
         Oddg9ukHBqicA52uR9djwpgZ/k6AIQihKPaoTeI/ma16Y9DrQ83j4LYpdKMT9hWYOY4o
         vZ9bVGq23Jy9p9CNu0WJoZv/S4uqmZCHZrgE8PhCTca5GENOBrpFFBb4DEvYtfG2CEd5
         OlkQNrvSkUperENeluRZbU+wmQh2aT0+ghSQYSpsoCm49uRHdUY0DF8lMTVoPcveJZs2
         ZaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689967535; x=1690572335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3sDGzjMgmFlcV1VXAhG2+Ypp9Xct4LpsCKv99vvbp4=;
        b=NWCjbWnOQ2YZuPjaAxePuf7hJPuN1VcdbaInYFZH4Q966e75j8w2FtSnOIrYOw8SSW
         cCbRT5Vkc0ywMYHtm/xXkZGM5143Z4wIoLdYNooCEvTu6/2KI58LebYo9Yk+YhaUSo3i
         MkE2uId4FWd7pCQp+a/w92i2Jy6oq2rGy0WAKacRn1FF9LHOoj8eLR2sJJPy9WBbTcxc
         i6xL/n0T5njvs8qi4NTLZrX1/WxWtMDNXvVu9QbZDptUeHwbl1KwKFNvo9OP9yUztIVl
         u6ayOhlQJp91eV562wZhTh7g5rMhw9aEn5YZnp7fQk+cvXw4zMW/dIa97pIi3POCv286
         8Jvw==
X-Gm-Message-State: ABy/qLZAqLJA1rFe1jqscJRMUdBQYneTLMa3kiM8ToNVIq/cH8L5X4SD
	pVphUxneYBvegCsYOqBwzfG66VtAV+OdiN5DT9k=
X-Google-Smtp-Source: APBJJlFP1yxz0LVrIMPuj0mihBXh4MOq/Ac4GOym9EqrMSJRE7O8b/K+VLU33eHbEXQVEWmjspqe2g==
X-Received: by 2002:a1f:5cc8:0:b0:471:3639:210d with SMTP id q191-20020a1f5cc8000000b004713639210dmr2002990vkb.15.1689967535540;
        Fri, 21 Jul 2023 12:25:35 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id k30-20020a0cb25e000000b0063cdcd5699csm676669qve.118.2023.07.21.12.25.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:25:35 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 7/9] python3-execnet: upgrade 1.9.0 -> 2.0.2
Date: Fri, 21 Jul 2023 15:25:28 -0400
Message-ID: <20230721192530.2515633-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230721192530.2515633-1-tgamblin@baylibre.com>
References: <20230721192530.2515633-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jul 2023 19:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103980

execnet requires hatchling and hatch-vcs now, instead of setuptools.

Changelog (https://github.com/pytest-dev/execnet/blob/master/CHANGELOG.rst):

2.0.2 (2023-07-09)

- Re-release without code changes, just to include tox.ini into the source distribution.

2.0.1 (2023-07-08)

- Re-release without code changes, just to include docs and tests into the source distribution.

2.0.0 (2023-07-06)

- Removed support for Python < 3.7.
  - Applied pyupgrade --py37-plus.
  - Minimal mypy fixes and dropped Python 2 support code.
- Migrated packaging to hatch.
- Dropped deprecated APIs of old makegateway names.
- Removed py testing dependency.
- Explicitly pass encoding when opening files in the gateway to get rid of warnings when using PYTHONWARNDEFAULTENCODING=1 (#195).
- Fixed error when loading source code files from a path containing non-ascii characters.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-execnet_1.9.0.bb => python3-execnet_2.0.2.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-execnet_1.9.0.bb => python3-execnet_2.0.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb b/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
index ea17e84143..a934d1c461 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_2.0.2.bb
@@ -8,14 +8,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=772fcdaca14b378878d05c7d857e6c3e"
 
 DEPENDS += "\
     python3-pip-native \
-    python3-setuptools-scm-native \
+    python3-hatch-vcs-native \
 "
 
 SRC_URI += "file://run-ptest \
            "
-SRC_URI[sha256sum] = "8f694f3ba9cc92cab508b152dcfe322153975c29bda272e2fd7f3f00f36e47c5"
+SRC_URI[sha256sum] = "cc59bc4423742fd71ad227122eb0dd44db51efb3dc4095b45ac9a08c770096af"
 
-inherit ptest pypi setuptools3
+inherit ptest pypi python_hatchling
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
-- 
2.41.0


