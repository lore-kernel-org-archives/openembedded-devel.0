Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EACC25B7C
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:02:38 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.9267.1716973349523025142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 May 2024 02:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=S9qkal+o;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52b78ef397bso22149e87.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716973347; x=1717578147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3TzfHJKV/BHhyS6V1txVyMzHmfztWJ1plx/XY+7C+u4=;
        b=S9qkal+ovhhBrj+FBfyQw2JOP/l/YzAY0QGhZ+kJ55G3HIcHXzlvdawO1AOrLyosTy
         TMYHGNlo1o7VHgTqneDoVaW7FxmmoKw+4m+D3iFhmaUAkvZPje1ClHhxALgwp7DUOeBv
         igF464QF9Gxg912ba2TRtxELmfqfXnekAtUPQdlC7lchHM2PY/+SZdNCsjugZkqz7oVF
         SU4O1ZMwUTQz55LgIgyOQmHxsJbQlJtU/izY/3aMxUOEI+ZVjJiusj5zkYGCdNbtmP0Z
         xMRlh/L8gb2wQ7gTGlwZNS6DQSXug9ht3vEkFdpRCmruRSkWW07MfvnB+WZoQfanQehz
         LDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973347; x=1717578147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TzfHJKV/BHhyS6V1txVyMzHmfztWJ1plx/XY+7C+u4=;
        b=aXlgfDm48507xPXEbqCOodM62tnADICM31c+ADL5TLooXIjDSa/2K0cQNeDlm4EVPN
         wXZwOLwbk9n1V4B5J3jZA8FyBGFbTlntAkbxgiRKjfxDEUPGBVHrgB0AOXNr0C/r6a0r
         TdJbjKHzkL5e1AiDvWW6KVfUIG1WUlYkSLkNMwiKz5f95ePc/GR6QfKrE4GHxzsoRFMn
         tjhCw5a4O8wcwLIJtPkLKE1Bm2vjnyqwXcKsLNeejekvZazKluKcJLUssSbv6V020ZP8
         t7tqUOiASix1ZFvmjLqjbRCL2mFGzGNjfkoMlkOcibEaZsLr0rcBxhpdu9fH6k1tN/w9
         SOUw==
X-Gm-Message-State: AOJu0YxK35sRarT3ExllV2TlJKDWgU+w/kaqdbU/AuaifJCgvipyet7f
	k/UEdfCaG2lu2mERWLiRjLhu9lI//h5/rVWqKUfe94E4fXZlkeX6kDfSBUUKYglkLs3BqJdVrzq
	0
X-Google-Smtp-Source: AGHT+IEiBfzplaxKT9q0U9lR8iGeu784KfqpyeWFv+nt8c/I0dg4e9Q6Xr6HX3Ph8zH0AJ5Ncwjn+g==
X-Received: by 2002:a05:6512:55c:b0:52b:56c:b4c7 with SMTP id 2adb3069b0e04-52b056cb6b6mr278799e87.5.1716973345020;
        Wed, 29 May 2024 02:02:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529b71cd9bfsm664356e87.128.2024.05.29.02.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 02:02:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][PATCH] cabextract: add utility to extract Microsft cabinet files
Date: Wed, 29 May 2024 12:02:23 +0300
Message-Id: <20240529090223.1816443-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 09:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110609

WoA firmware, fonts and some other useful files are being distributed as
a Microsoft cabinet files. Add recipes for the cabextract utility, which
is used to extract such files.

Cabextract can either use a bundled source tree for libmspack library or
an externally provided library. Package the library separately in order
to be able to share it with the meta-security layer.

Cc: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../cabextract/cabextract_1.11.bb              | 18 ++++++++++++++++++
 .../cabextract/libmspack_0.11alpha.bb          | 16 ++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/cabextract/cabextract_1.11.bb
 create mode 100644 meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb

diff --git a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
new file mode 100644
index 000000000000..4d035eeee4b0
--- /dev/null
+++ b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Software for extracting Microsoft cabinet files"
+DESCRIPTION = "tool for extracting Microsoft cabinet files"
+HOMEPAGE = "http://www.cabextract.org.uk/"
+SECTION = "console/utils"
+
+LICENSE = "GPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://src/cabextract.c;beginline=4;endline=11;md5=b0a10c6d3843f262114e7ecf91fc7e78"
+
+SRC_URI = "https://www.cabextract.org.uk/cabextract-${PV}.tar.gz"
+SRC_URI[sha256sum] = "b5546db1155e4c718ff3d4b278573604f30dd64c3c5bfd4657cd089b823a3ac6"
+
+DEPENDS = "libmspack"
+
+EXTRA_OECONF = "--with-external-libmspack"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND += "native nativesdk"
diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
new file mode 100644
index 000000000000..169a5f271be9
--- /dev/null
+++ b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A library for Microsoft compression formats"
+DESCRIPTION = "The library provides compressors and decompressors,\
+archivers and dearchivers for Microsoft compression formats: CAB, CHM, WIM,\
+LIT, HLP, KWAJ and SZDD."
+HOMEPAGE = "http://www.cabextract.org.uk/libmspack/"
+SECTION = "lib"
+LICENSE = "LGPL-2.1-only"
+
+LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI = "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar.gz"
+SRC_URI[sha256sum] = "70dd1fb2f0aecc36791b71a1e1840e62173079eadaa081192d1c323a0eeea21b"
+
+inherit autotools
+
+BBCLASSEXTEND += "native nativesdk"
-- 
2.39.2


