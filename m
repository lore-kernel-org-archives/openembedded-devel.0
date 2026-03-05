Return-Path: <andrea.ricchi@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E577CF33A6A
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:03:53 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44757.1772719427606023632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:03:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=b5VeHB5Y;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.52, mailfrom: andrea.ricchi@amarulasolutions.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso73558085e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1772719426; x=1773324226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4QepHVFC8YxoYbjlWJBjVCD4xcFI2byDqPOgD7Bf7u4=;
        b=b5VeHB5Y5ichNUPWXuTBKUoShvkUvkiB369SMZgGIVFPE8NFzxKYQBSGUdZVVg5nYU
         MUP4QN81Yf7va1UHKdZnqn+2aQI3i5zM4+9SllUbzpyT+yAagSjyQXQGh4EwgFpMQc6W
         9gE0Fgdy5mO+aJJaTsRD3qrmk1YUx1mUXaCik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772719426; x=1773324226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QepHVFC8YxoYbjlWJBjVCD4xcFI2byDqPOgD7Bf7u4=;
        b=bfFX4jqGIFmGAMtAD5wd18Jm7D6waFXUTqrfcpUnxv0fEL6+NXFp3TPDtm9N0z8t6c
         3XOBZwodeEEIOFdS87z9/hEic/QUznDhWaHlbGeacPI4MZ41Xnssqtkfa88DuLp3YiUQ
         EWi170iFet1ZyzB6Io1u3zNwhjIJB8CB1FHTmHOYgyChwpppIc+dHctUYfGHAjwd4o/j
         954oc6cA9cgyH7/tuZGoYs6NMQ14KBn+6M42tFITulqLz9Bq+59kSRAA8sdqfSlr1wsI
         373CQUsDZjH/EArtzvsdRMfsjYunvUC8rf6MIOYvzaNdPzPCDp5IXCMocZjdyxIXDCs8
         XsdA==
X-Gm-Message-State: AOJu0YzRIYW2u37Qfc8lS2xK87HAhl6VFIKm/lJHvzk8mSZWTFuaHJuZ
	/aahwo29R6dRyjjzHvn1/2WPjnAu+xEUn4a4LIGdhlSyrmPXLPmy0rMGRUo5WLtX05FZvpmqfJN
	nsYcz
X-Gm-Gg: ATEYQzwctiOmQzhgmZxrpgM47AowgsDbc1sGLyvVSEMWmarTNiHhUuMAgJTsIIjhNKw
	uXXGM/WYuXmhbuziXQ96ggKZplLBq2qyMiUO0Jo791/69wxVM0Os9u1j9HrGn+Wbj5m5L7x0wNX
	ZXEczJG97059t+A9b6mc96RsLxrthWL3WqSvhUx/giXHixKMhuKP92JsZi4xwkKo5K+DPsDT05F
	u/47rSWmpMnQ8s54qXBNQw9Pjx9M0a/5lvrN+lA77s7lcmNS/t+YH8bf3Mo0LfM/TxULh2nc7PE
	jB+pQAeJzOxr61PXS5QF98ns34OxRtLE84LFhS6I86jUwosypWnrrnDjpWdZEZqs/KhfKbVCWvO
	7sxQoYVYGOfOQVRp7f4kPaLkRpldWbJVX2DOB3l8baYkXOwBiQmuJ8TFTiV/5hrvqhNQdjsRY4J
	qON1G5ZzjishgygBvRMJO1LmMayCiA31HLzXUxBJhuCtiQe3R8SHIJ8qBJTevWjihmkI0ZqnC57
	GgpBB8ayurXgkJ2UnkHSM4tJwkNVOIYyU2J+p0IU3LbN7SD+VFKxj9UavEd8uIJ5GGaLe3CvNqs
	dPYToJI3Q59s
X-Received: by 2002:a05:600c:a087:b0:485:110f:5b7f with SMTP id 5b1f17b1804b1-48519888e6amr101972005e9.19.1772719425576;
        Thu, 05 Mar 2026 06:03:45 -0800 (PST)
Received: from localhost.localdomain (93-47-52-235.ip111.fastwebnet.it. [93.47.52.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ae0e7abasm37959151f8f.23.2026.03.05.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:03:45 -0800 (PST)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Subject: [meta-oe,scarthgap v1 1/1] meta-oe: libcppconnman: add recipe
Date: Thu,  5 Mar 2026 15:03:40 +0100
Message-ID: <20260305140340.81357-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 14:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124874

libcppconnman is a C++ library to control ConnMan via D-Bus. It exposes
simple aync methods to perform all the controls that ConnMan allow via
D-Bus.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 .../libcppconnman/libcppconnman_git.bb          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb

diff --git a/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
new file mode 100644
index 0000000000..daa32a8d48
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libcppconnman/libcppconnman_git.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Amarula libcppconnman library"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a87a7059d580c45495c1218f53e3610d"
+
+SECTION = "libs"
+
+SRC_URI = "git://github.com/amarula/libcppconnman.git;protocol=https;branch=main"
+SRCREV = "d89262c2cd7336da8ba9eb06228d422847fe4b20"
+
+inherit cmake pkgconfig
+
+DEPENDS += "glib-2.0"
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DBUILD_CONNMAN=ON"
+
+# LICENSE file
+FILES:${PN} += "${datadir}/Amarula"
-- 
2.43.0


