Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1884.1795113447723172149
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:37:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=T6iHQUAG;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-89d6bd67045so6371b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113447; x=1795718247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TPO9KCr8z/DxZy8c8XrGFAIF1T8M7xeqY7NOEchHbNY=;
        b=T6iHQUAG65ST9wHsqAMvt3D0T2/OygJU+UbgITdsc63B5DR/9wDoxmkTwNmkB5KISl
         bIiacVcX2TByeXrnEphgDDWtuz3eJfpglMtQe6jEjQPM27KHBb+JJw1/qpy94+MPqzr4
         vCQyHne0CZJdaSK9IyW/iZo1oCtvLj2l3BBf74lsC1mURyGHCKA2CLdqDI2rt5nrd/AK
         cBIFY4r8lyD6NttrKNtAdfMDp/AqbKdz6bEjVZKcaTu+L3u9VT383ilAW1luvqWCOBpA
         lAl4brn2V97gMIwHm5MK0x1VfgFyulCff8lG5Vta9UmyAvdT/OMFXn3NssmfN1UZ7jhl
         59Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113447; x=1795718247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TPO9KCr8z/DxZy8c8XrGFAIF1T8M7xeqY7NOEchHbNY=;
        b=w0uxEvOYd2iCy1HL52HOykHuCbrXTCuncpZyGCX+loSJMyVFxhcpR5Au2kmsqIeaIc
         hZf+qltpNDZIn9b3Sc1eVHr4D/RxsJGw5GuDcE6ups/rwCwd7h0CoLzFA4CJjc8vU5Ov
         dzH24Ox274IRhdXCGiB7Z/whHh3fZRdAqsHwOqk7R+mDafWdbZfnuWVERnHkTksYezLD
         GezAO8kZDS/eJYdvnnPx+YFrpfRsRc+00MfVLatFIHaptxre8RukEEYpPs/UmxPUx3hU
         xLkACHCAlQZiI8pz2pT21NroV9sqgJ8lPgZNUlDyOpiv93/0MQWcz7wOD8tCkC3fTCvv
         5cWQ==
X-Gm-Message-State: APuU4Z/wq/MfM1x7wcssEpL05z2wIebyp5EXW4RxSdSCG9ES1SgH/FEe
	Mree+KJCrnvhUbHnQXMXTCYzrQGyP/fukEgNYybcwBV4cbWTomiZ1ipzVjgw8w==
X-Gm-Gg: AYBFou38y548RM49UR63sDMTzQy72kPfNVd+L1YGJIgqU1VoMuh9Vtd+5ZRqd2CoQ3B
	QAfyljVFB3aylpWBfQ/h/ky/qK0bU4YWtddpKP565CZngRfNTDrgnjuVaD/vYdSbV2wWuRjCUtG
	Z0Sm2Zzn9chlw81Suzu3ircbAKFH6NeuxNleIjJXX1ZmLUlvS4ABGr3q0961GMxy6srvNLJpWFo
	aQ7wzVB4jRqxzcyGidfvf0bkMdweb/yshK8wG0M6A50ri9tDBv11nkb7fWvi52zoAQmi26LjFi/
	5hZTUyLFG/YC0lii8/WzT9yttTsBx2itcr3rdQpqpdbWr8pS96Pd6qeRXG7LwqcJTNJcvv3X6JX
	zk+CnXRawRXFbDBpqYYq+JDwK2I488E1qcebAzhjShoUDbDOOH/CGVZvt0UUoftcuOa+lUlcJH0
	aCbslN3j5OZz0/u1Jr7C/cF9tsm6q8HqX+UkF30oChc2YstZYB1ml5CHKY7rIesroTIK4AHm8lY
	22biPSj0NQVgcJRI5PtVhR4rHnDX12x2Zz4UL4ZpsnI5KjL+AZZC98G26J/5/m3tqaXxtrFZfvV
	m1F+TpG8MFCoVb9Gr0MLcoW0OBoXY9Tg4j9Mu65OM3MtathZQj0qu3MjXv4Rsk2w3C2o4/Bgw+9
	yt+IWupM=
X-Received: by 2002:a05:6a00:1892:b0:8b9:a5ee:cf05 with SMTP id d2e1a72fcca58-8c7dd3075c0mr1353469b3a.17.1795113447109;
        Thu, 19 Nov 2026 10:37:27 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:37:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: James Lee <james@codeconstruct.com.au>
Subject: [blacksail][PATCH 36/64] mctp: upgrade 2.6.1 -> 2.6.2
Date: Fri, 20 Nov 2026 07:33:04 +1300
Message-ID: <bd4be0c3ae6172e814e1b37122b758cf9bc663f9.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132726
Content-Type: text/plain; charset="utf-8"

From: James Lee <james@codeconstruct.com.au>

mctp 2.6.2 is a bugfix release that corrects mctpd's dbus policy file.
Users need access to the org.freedesktop.DBus.Properties interface to
view the properties of the objects managed by mctpd. There is a
misspelling in the v2.6.1 policy file that prevents this.

Bump mctp and mctpd to version 2.6.2 to correct this.

Changelog:
https://github.com/CodeConstruct/mctp/blob/v2.6.2/CHANGELOG.md

Signed-off-by: James Lee <james@codeconstruct.com.au>
---
 meta-networking/recipes-support/mctp/mctp.inc                   | 2 +-
 .../recipes-support/mctp/{mctp_2.6.1.bb => mctp_2.6.2.bb}       | 0
 .../recipes-support/mctp/{mctpd_2.6.1.bb => mctpd_2.6.2.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mctp/{mctp_2.6.1.bb => mctp_2.6.2.bb} (100%)
 rename meta-networking/recipes-support/mctp/{mctpd_2.6.1.bb => mctpd_2.6.2.bb} (100%)

diff --git a/meta-networking/recipes-support/mctp/mctp.inc b/meta-networking/recipes-support/mctp/mctp.inc
index cc140f23a1..1150c9aae7 100644
--- a/meta-networking/recipes-support/mctp/mctp.inc
+++ b/meta-networking/recipes-support/mctp/mctp.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4cc91856b08b094b4f406a29dc61db21"
 
 SRC_URI = "git://github.com/CodeConstruct/mctp;branch=stable/2.6.x;protocol=https;tag=v${PV}"
-SRCREV = "ea1dfa9e59681c42d02ed3bf91cb150161481403"
+SRCREV = "96a3d47ae30df7bd47fa57cd88f69d5317d68ef0"
 
 inherit meson pkgconfig
 
diff --git a/meta-networking/recipes-support/mctp/mctp_2.6.1.bb b/meta-networking/recipes-support/mctp/mctp_2.6.2.bb
similarity index 100%
rename from meta-networking/recipes-support/mctp/mctp_2.6.1.bb
rename to meta-networking/recipes-support/mctp/mctp_2.6.2.bb
diff --git a/meta-networking/recipes-support/mctp/mctpd_2.6.1.bb b/meta-networking/recipes-support/mctp/mctpd_2.6.2.bb
similarity index 100%
rename from meta-networking/recipes-support/mctp/mctpd_2.6.1.bb
rename to meta-networking/recipes-support/mctp/mctpd_2.6.2.bb
