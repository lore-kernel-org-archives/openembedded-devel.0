Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19883C53200
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 15:38:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22000.1784907481795552080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2026 08:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FCyfe8oN;
 spf=pass (domain: konsulko.com, ip: 209.85.128.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so9020515e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784907480; x=1785512280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0C2qsZBNC5FZ/Nm9Z/i8jcNpGIwwSgd/thBG3ppCmI=;
        b=FCyfe8oN5QwS30hfBRoRyRjlKpD/UGQ+FetxwFXWZB8pTChrTNXwYt+0xSTVnUEVdx
         4idNvBGlBvghjzyFPfCv2GvcY9unNIMvhPzgWtFpB9PbL6kcK1ogmfceEB5JJXV2IB3G
         zqSfbIHK/20Ki/UZOmLDsHYJRPX4WnqzQjmVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907480; x=1785512280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c0C2qsZBNC5FZ/Nm9Z/i8jcNpGIwwSgd/thBG3ppCmI=;
        b=bnWGwVxAsRph5/h86r/1kDfDy4YQ0ryukCiAAjgEKL9yS3r8c3YtylPzrRgLb2yjiQ
         cETycR3B+tQ1XV9wRR9iU+CMQJGJp89VhzDSdAkRZtlysK2VqsNFBMGdmuU757Stk+EB
         m4TOrc3M80tGdckPegGTlZ2iolehuzDGZIUmmf3b6fPZGIovGu0QBwFAj2dI7lEVXt8Z
         GgvmMhYFe6q7cPK2IV186wwYU2faUWAYdmcvFjPltpMdH/+Nf13n9JulPlDpll7H6nCM
         NICh1/wFHysO+pYlBP7tAzSbXZwgrTp4XJg5MKB2ankXt1Lwl6uj4Hd8ujxJpbruyb2Z
         qD/w==
X-Gm-Message-State: AOJu0YxDGVk6sQeSa9s04O4eY3IIktAgmVKEvajmC59BhUxHUFSsyqCt
	986i4ccsRB1TgcJhqyq1zbP7bi88R4PcsMMmDtjPmySjqzLktGbW+4SFYxQa4uizDcOUDO7zplV
	25FdS
X-Gm-Gg: AR+sD13AUrwIBuPrrKEKA8SYYBjYnNmo2tbhVfNJPVhbvHoJf6GdoAvcjIQc5z9JBg2
	1VhzV8II8yBpEejaRW0I2GUdwMlabZymesG3VdMQZBC88xGF1K88f3gSEEeLKl403axwcecsUD7
	TYhtk2JYFY1X3Nrczk+9xwQlLisna/lwsJBU1IyizGFv7UPbYrCImt2wTKKqMHV3vsaSzhQlF3Y
	9BySuSDIYTk1QBHWkHJQokNcSVk0vSzu9zTJwA2ldMjyILS04p7dovX/JxfVG4Op6jvO1PCqICy
	OGdOyQhYX5Mtx8HWcQqOIUuUXu0mGLfepY2mO6Gp/v4irBcCAGc6P21bO3tvaQB8dCMsKkIBW/K
	Qse0pck7g/Rv1MO/MJ+PDMBYOW5X7wSJe9VqP8AkPM6ZMNU3NxHrZ2NWpbfgLxzHQG/upf25Jrf
	HjSaSk4Op61KMNdvrw90LEOhPX3JmvBoZ6e/vN87T8W83BIPyk//ohFlzoARvfrZu5Juop1WOhE
	Rn6hoR4tRA3OUA+nPAxI+3pt5HFKIY=
X-Received: by 2002:a05:600c:257:b0:495:41ea:f6e with SMTP id 5b1f17b1804b1-49690c4c28bmr11655775e9.8.1784907479875;
        Fri, 24 Jul 2026 08:37:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63678sm23839780f8f.29.2026.07.24.08.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:37:59 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-textparser: Upgrade 0.24.0 -> 0.26.2
Date: Fri, 24 Jul 2026 18:37:55 +0300
Message-ID: <20260724153755.2259698-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724153755.2259698-1-leon.anavi@konsulko.com>
References: <20260724153755.2259698-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 15:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128441

Upgrade to release 0.26.2:

- Minor doc improvements

From release 0.26.1:

- Add readthedocs configuration
- Add py.typed marker

From release 0.26:

- Update the required python version
- Add type annotations to the module and the unit tests

Fixes:

WARNING: python3-textparser-0.26.2-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-textparser_0.24.0.bb => python3-textparser_0.26.2.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-textparser_0.24.0.bb => python3-textparser_0.26.2.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-textparser_0.24.0.bb b/meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-textparser_0.24.0.bb
rename to meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb
index 8db949d0dc..40276038a3 100644
--- a/meta-python/recipes-devtools/python/python3-textparser_0.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-textparser_0.26.2.bb
@@ -3,11 +3,13 @@ HOMEPAGE = "https://github.com/eerimoq/textparser"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fe9942a8bba5458a9dbd11277bc347ad"
 
-SRC_URI[sha256sum] = "56f708e75aa9d002adb76d823ba6ef166d7ecec1e3e4ca4c1ca103f817568335"
+SRC_URI[sha256sum] = "859825876a9c38f7c313ee1cf991a59d6b56232a9f67be6dcc0a758d84654fba"
 
 PYPI_PACKAGE = "textparser"
 
-inherit pypi setuptools3
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit pypi python_setuptools_build_meta
 
 CLEANBROKEN = "1"
 
-- 
2.47.3


