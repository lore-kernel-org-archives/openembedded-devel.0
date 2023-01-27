Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD73C61DA4
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:04:31 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.109245.1674842670189290740
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jan 2023 10:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h8F6h/3r;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id k13so5868968plg.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 10:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKJU3yT81pRvl90ts/8JU+zx4y3Xbdc6By6XzVDZqk0=;
        b=h8F6h/3rv6ECMonc7tpoDx2Q1/Sn8S4VCkaEKm7Qevc/y0TKzlTGyMaAEufw4D3XZd
         YxsrqTdsHlPjuwTZCecfHlx8irQt6hQixqkGDihVMD8d0ld9As5tDyjlka01G3Xhx1lz
         VcuIk5Ems7yRG2XyecHrI+jy0JFi6YzMTxWsZV01Ct66fEw/e62KVyxnuCDv9uheOViv
         Hhs4BtfGTkncE8DLnUoVrrNjuPdeC5PL6UqQO7RKqdPwxMnziHdtnIW6MfiqpiI+TCB3
         tbLCD0i0myXW2Qj3as0xBr9IHUIEOKj0yL5foONcDt9LPb5iSA6VKLY5GWYqbhkV5ZzV
         JyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKJU3yT81pRvl90ts/8JU+zx4y3Xbdc6By6XzVDZqk0=;
        b=VA1VZpXGtut66d8VZgtrzTkCwefBdNjQMVxbXsJdjq+Vz6gJil1qw5/MahhUMjz1WK
         wcKezgJEDx/hub/niI1yDskug2ub1wChFPp+LPjm4gBEZteQTmd7MJBsDgnfw9u/6he1
         GgwAP4yzja6UohY085JckYeu+5R6OiMjudrV1PUg4px7qrEo1N8P48+7hKUTMsrFI/VV
         Qo9Gxgl57dxuu6pdEcu9fNINT33kcOvycl6/03cYtzhV+4JCNz8LowNDn9exLgw2HHS5
         gtOakoJQ8Yr3hf0HwOEf7FOcCn05irD5QzrfdOUbOkcbLbMBVftuyVg2H9dXRF4F+5FT
         cm/Q==
X-Gm-Message-State: AFqh2krXofhxlBo+oXnhyMC8rtHB2UDxRJK0xzvaPdtEYfuQdr066RIa
	Xc9vbzK+jGtdJLYFZp8Jks7xQ2o/RF8cdg==
X-Google-Smtp-Source: AMrXdXsxyUvWI6R9HI+aZ4+l9cQBJn4/ImU6SIBVjH/GGrg5GkCnb9sx+EsNFT0Syi56PkvZyoZXlw==
X-Received: by 2002:a17:902:8a98:b0:185:441f:70b1 with SMTP id p24-20020a1709028a9800b00185441f70b1mr37091396plo.54.1674842669426;
        Fri, 27 Jan 2023 10:04:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b00186748fe6ccsm3163554plb.214.2023.01.27.10.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 10:04:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] sedutil: Fix build with gcc13
Date: Fri, 27 Jan 2023 10:04:24 -0800
Message-Id: <20230127180426.754319-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127180426.754319-1-raj.khem@gmail.com>
References: <20230127180426.754319-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 18:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100824

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-include-missing-cstdint.patch  | 32 +++++++++++++++++++
 .../recipes-extended/sedutil/sedutil_git.bb   |  2 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/sedutil/files/0001-include-missing-cstdint.patch

diff --git a/meta-oe/recipes-extended/sedutil/files/0001-include-missing-cstdint.patch b/meta-oe/recipes-extended/sedutil/files/0001-include-missing-cstdint.patch
new file mode 100644
index 0000000000..8afcb1fa48
--- /dev/null
+++ b/meta-oe/recipes-extended/sedutil/files/0001-include-missing-cstdint.patch
@@ -0,0 +1,32 @@
+From 927cd88cad7bea94c2eebecc18f7881f0defaccb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 23:36:29 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint>
+is no longer transitively included [1]. Explicitly include
+it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/Drive-Trust-Alliance/sedutil/pull/425]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Common/DtaOptions.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Common/DtaOptions.h b/Common/DtaOptions.h
+index c012af1..7530a0b 100644
+--- a/Common/DtaOptions.h
++++ b/Common/DtaOptions.h
+@@ -21,6 +21,7 @@ along with sedutil.  If not, see <http://www.gnu.org/licenses/>.
+ #ifndef _DTAOPTIONS_H
+ #define	_DTAOPTIONS_H
+ 
++#include <cstdint>
+ /** Output modes */
+ typedef enum _sedutiloutput {
+ 	sedutilNormal,
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-extended/sedutil/sedutil_git.bb b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
index a377d4ec5a..972a33c742 100644
--- a/meta-oe/recipes-extended/sedutil/sedutil_git.bb
+++ b/meta-oe/recipes-extended/sedutil/sedutil_git.bb
@@ -7,11 +7,11 @@ LICENSE = "GPL-3.0-only"
 
 LIC_FILES_CHKSUM = "file://Common/LICENSE.txt;md5=d32239bcb673463ab874e80d47fae504"
 
-BASEPV = "1.15.1"
 PV = "1.20.0"
 SRCREV = "d3de8e45e06a21d31cca0046ceb16ced1ef3563a"
 SRC_URI = "git://github.com/Drive-Trust-Alliance/sedutil.git;branch=master;protocol=https \
            file://0001-Fix-build-on-big-endian-architectures.patch \
+           file://0001-include-missing-cstdint.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.39.1


