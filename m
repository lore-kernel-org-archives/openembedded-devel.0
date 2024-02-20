Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EB7C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 04:10:51 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.6225.1708402245261621353
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 20:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R21aw8AK;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso3740944a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 20:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708402244; x=1709007044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GmwYcKXSQcVKEWm+ToB9RIZNle39Ch2y+HWoAcNuORs=;
        b=R21aw8AKNC9qVtLyox/m8juu88eOeVMmkG9H0XV3QBgiG6yINjYT2fgVXksByRo1L6
         xFHgkw5RCGX4xm71rGBSYT2DUuOXB2W1MnqRVdaPlTap4O4M3kQl/YQSr40E+xXdncGD
         A33Jqbk5tVUaWmCmpj2mdj+w5cTHeNZ4WO3JphtfmLAF+8YXCnzX3+f/k2EN4JZQK3r9
         NcWpin2qzqBBwruaB305Xh35tvIPU/Sns6qgbaQe6NxFca4U5cDMab/vlnhr3ewfdp2F
         UKvlJqM3WjqKvcUFbR3z0HxLYZJrk3+V5Rf2b32eLjU5c7f8U3i7wQaDQ4yQZmOEr5jK
         Jo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708402244; x=1709007044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GmwYcKXSQcVKEWm+ToB9RIZNle39Ch2y+HWoAcNuORs=;
        b=sqXJF5V4PnSzom3J4juPFXy6Wf2RSOt+QoKaJyeQiOiM1QUCaCMK5Sxb39Vo2cKjwI
         5ALPinIEDAbdc3pRir/W1mR19ZUY/ASsW7fucR3YQkKDYUap71Iios+fCnUwuYv3Q0ae
         gP+i2D7Mlk+IwDElkwY+vsKQjD0cBUw3yAjFDw1ZY/cHqkepLyiCpmNH3ZyTppi4f4s/
         mm/L9rd3CLyHeWymMHDw0omUlQRn1h8Phh7KNzwH0HP54I/ExdRrhdn4rkXZxzmz7Br8
         yoUl2X9+AjN8jT2g05xHCIESrnA/jZtBZEq2yohLAP/Pg10x8az/DM4xf8/VRV3VhGtX
         5x/A==
X-Gm-Message-State: AOJu0Yy8UjbJUGPcIwjCPzoHlVJh87HvzAw3Jw7rLHb0o4Qgv6+PLuaT
	fTrm73e6jTK6O6Wzem/NniAbEkd8kiQqQl2Rw9QukQS9WXQnvmG7P+noLm+G
X-Google-Smtp-Source: AGHT+IEXSuLNYRlaikmsYnvH3b7kDXOdtwMg008eRrZETshxkTGz9VxrmS4EYSL4/U7VhffIqui44w==
X-Received: by 2002:a17:902:e74f:b0:1db:c1be:374d with SMTP id p15-20020a170902e74f00b001dbc1be374dmr9464493plf.7.1708402244221;
        Mon, 19 Feb 2024 20:10:44 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001db45ab819asm5229733plc.106.2024.02.19.20.10.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 20:10:43 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH v2 4/5] meta-networking: drop ${PYTHON_PN}
Date: Mon, 19 Feb 2024 20:10:27 -0800
Message-Id: <b019a7a393ef4bee71433affaaf505e211575616.1708401702.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708401702.git.tim.orling@konsulko.com>
References: <cover.1708401702.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 04:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108905

python 2 is long unsupported, so we no longer need this variable

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
Rebase on top of master-next

 .../recipes-devtools/python/python3-scapy_2.5.0.bb        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
index d99d7016b2..2fd4dc6baf 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.5.0.bb
@@ -36,7 +36,7 @@ do_install_ptest() {
     sed -i 's,@PTEST_PATH@,${PTEST_PATH},' ${D}${PTEST_PATH}/run-ptest
 }
 
-RDEPENDS:${PN} = "tcpdump ${PYTHON_PN}-compression ${PYTHON_PN}-cryptography ${PYTHON_PN}-netclient  \
-                  ${PYTHON_PN}-netserver ${PYTHON_PN}-pydoc ${PYTHON_PN}-pkgutil ${PYTHON_PN}-shell \
-                  ${PYTHON_PN}-threading ${PYTHON_PN}-numbers ${PYTHON_PN}-fcntl ${PYTHON_PN}-logging \
-                  ${PYTHON_PN}-difflib"
+RDEPENDS:${PN} = "tcpdump python3-compression python3-cryptography python3-netclient  \
+                  python3-netserver python3-pydoc python3-pkgutil python3-shell \
+                  python3-threading python3-numbers python3-fcntl python3-logging \
+                  python3-difflib"
-- 
2.34.1


