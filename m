Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73C2D6E2D1
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 08:22:22 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.8892.1732090935513588104
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 00:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FdzU3TzV;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so1070305866b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 00:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732090934; x=1732695734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wnhVHrLTjRSbHn2eU2wDSo2Sps2rqivIFOlRMqC+fFY=;
        b=FdzU3TzVraNfw3L1Z4slw0FJW2Jw1OQDc5sFAjz3jmv4FnsoNHfHnSP8FcGycQi0vQ
         L/MtCZTHYu10vFjjQZRWlfQvMJMQW9amcrZ1J+lCNr9Fx1qDspYuXQxnFRy1wtkGbJaq
         NaS2edDAoNIxbJxy1X5G0KDBoZ80sd4e7oameujAC2UuV9/yX4iMg/ADFAoBBKRGlYdu
         +jdX8VvLcNWfYzX/CcRnfdP9nV9yGckqd2vYFZoxDbIAH4NckP2p/fBRhRLny+cRyC3q
         zchgmO8+4I0KSWd93V9alNGsz9//ftf0GZWmgUujvik20poSH3oZJgdLop6QMhZ48J6f
         swxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732090934; x=1732695734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnhVHrLTjRSbHn2eU2wDSo2Sps2rqivIFOlRMqC+fFY=;
        b=qZgq9cXuhO538dyMqglwyvxpsSm1h9Ms+CkgMNQt1Jwjm5rBGhL5cNyjvqzMWrbftE
         d59oxuPlS0NDzaKA4PCksjgovGLEfuAeiQSdOq0mmhWMvQB62lblH5RgSV8q0+LbFL5w
         CKVrxExKvizKJG3P6Hy/w4fSOVd1BEiHDVeDTHK75887NWIHFW9au6/EGFuv9kPxZlK1
         MRMAi5JSNU/oJfXgQgNVRytx0Kz5cjwmSib2UDwnS55fshkTtd2Xj1VMbmS9gq7k6oxF
         QpDYmeaBtc7zxY2S/n62WK0+BB9PyFzWT+ASO55ozWvelNMnPPIOhb8iAUwsO+dd0NSi
         kf1w==
X-Gm-Message-State: AOJu0YzA7F25P8T0oGwtTCgqDSm5sB/h0DE5HRAxJB2I9qvWorOo03jf
	VyQMZzHQTBqRIVZxT0yV9l0DBMtM2dNyXkBWvv/PSZWpNlxGYxem3JP34A==
X-Google-Smtp-Source: AGHT+IHqQREukqNiqjuw5kKREYmbYEfmh8gsqaVBamINPG4onbIQD8Gp84lPghVCOGz458YN3xc1sA==
X-Received: by 2002:a17:907:3e98:b0:a9e:471e:ce4a with SMTP id a640c23a62f3a-aa4dd53db26mr164325666b.11.1732090933542;
        Wed, 20 Nov 2024 00:22:13 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e043b6bsm743580966b.140.2024.11.20.00.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 00:22:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][styhead][PATCH 1/2] python3-pdm-build-locked: Add recipe
Date: Wed, 20 Nov 2024 09:22:07 +0100
Message-ID: <20241120082208.1619368-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 08:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113923

From: Khem Raj <raj.khem@gmail.com>

* backporting new recipes is against stable policy, but
  https://git.openembedded.org/meta-openembedded/commit/?h=styhead&id=cb58461c8f9067247d630ec385851ed9c3889f79
  was backported and added this dependency, so now styhead is failing with:

ERROR: Nothing PROVIDES 'python3-pdm-build-locked-native' (but
meta-oe/meta-python/recipes-devtools/python/python3-pdm_2.19.1.bb
DEPENDS on or otherwise requires it). Close matches:
  python3-build-native
  python3-filelock-native
  python3-pdm-backend-native

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/python3-pdm-build-locked_0.3.3.bb        | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb
new file mode 100644
index 0000000000..f20f11ff44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "pdm plugin to publish locked dependencies as optional-dependencies"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
+
+SRC_URI[sha256sum] = "b784135abf62b93ce0a11332ee24723a2699b7f266fddb7950a5b70c93df6214"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += " python3-pdm-backend-native"
+
+PYPI_PACKAGE = "pdm_build_locked"
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.47.0


