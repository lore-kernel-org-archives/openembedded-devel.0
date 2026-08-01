Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C24C55183
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13610.1785620756177334800
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lRotLN2u;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d032846c95so24287145ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620755; x=1786225555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UJxfQtKvcBsYHHdcqTLrpohi//fn6Cm4anH6gzaQ8c=;
        b=lRotLN2uN6cyJYkl37n26RuvBEBz5BvDwS97RqvhK6zksILBLSmBB/N6eHzxennhcS
         X1goOUmCXDx1xNTouHnfK38cLo/8pSrijSfc0+XPUOVGOn1erGy1mzMXkOP3HlFY/F+T
         vDJp55n2aK9MeBVpBIyb6Jwu9KN0j5tvq38Q6CGpDZnimLtJ53WqkkpIyK25TiT9RtgS
         /bfd6Q97XltMvBjT01Jsl+/OGJalo2BVB3c6bP+UMiK+K/9UuXCypCVQXpKsEi1z0l8o
         UB0319mrLNLwsTKdeEmI2iDqRKND1IcjGOdfB7511FOWW/NpCMBA9+3c2rqlGthngALk
         MOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620755; x=1786225555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4UJxfQtKvcBsYHHdcqTLrpohi//fn6Cm4anH6gzaQ8c=;
        b=jxv3rv6/C8MYkErUW7DT87FDgZGeyWlsd5CfopM74Gv+YrdQUsorsL13a1A1zt91z+
         9flV7yT1ZRgnw0WnDvUFpFt6BxuxZ3dkkOL3asO/Kz8+QGsLVWVLZcnZXnNzPqvbGNJS
         ex2OK9NeHe3AbrU5so+4IIjeRT5bnRzuP9XbqpABnD8+TJE22OZc4qBjBawUcHXme92D
         5kn6RyFTqhiLJrO1skYoqSkzxxzSH/59gcj6Fo5pXm9QGbRTGpZQfV4WfI4X/3oI/fZL
         VhAIRORjMdSkLxIJPdY63p+xp1kSn0pZxEoVVPfbSpoABdLnt8ixWK6WoCJ86P0UbfoI
         lIZA==
X-Gm-Message-State: AOJu0YxPEw3QcXbChh2X/XCBQlhz2uF0BGXxBeQU81bp9ozjl91C89mo
	rUGbkxFolbNmiab7g+TNzrzhU1CcCTQDbfID9nzr04xGdEo8hzdUG/HtRt8HDKNS
X-Gm-Gg: AR+sD10WICA5vmBTRuoqrnnVwh4Ymgd1Q4bsIxnEdY3cS3oZqbxz/NX2wTXt6qQTtYX
	hqwBsBCmhN2nAPrz/y+UeBw8e6QrpYjo5MbufcdyQKhXgL4/TbrXhxmsBANTZVFxDELfm6qMTz2
	CwsCR8U/KLniL/LimWZ6fsN9GyZFAkr5a1TMal1nGrrC0be3yE1eUO6SrT4jM851PBI+/99bWvQ
	RDidHhqyaAl5R0kMZxHDiMdbz6w096WxJmbnmZ15EAKtIZpYbP8htUDU4miQZcog5jKcWeW0YoR
	Ajk9uiAxAFG1oAgtFZeNrcpCWaLjZk/i+8uOmJYf5cg0J2PiWqjoh/9Pm6v6CaQMmZssDXTtN5y
	O4bpzfWmuhd43g8OAUaJf8yMwnvy8Yakg3vWOIolHJX6TYlf+ZSJPca5PFkgHlMjgnJeCSyApfo
	jNSAZrj7GkjC7Y1zUrlmDh4sDQJB3MphlVb4lOHK1mLJ6uOumkYF3ED6ZedryxApg+FDEg2DVYs
	E7/zLTtuvnVYqwrC90Iwp2Bkxhi/ASQbEWTz2gLbzT1y71+QPzAvO6jg+7uYstZ+6IPq8nurljh
	fbcQTvFc268AExIkQJDKB2zvIq1ScxLZA67112QEg8FlpSS+UNc329X/ZmG/h58QH5JocNALIT2
	mR9I=
X-Received: by 2002:a17:903:41c8:b0:2ca:de3:15e1 with SMTP id d9443c01a7336-2d0523f903fmr45723935ad.31.1785620755491;
        Sat, 01 Aug 2026 14:45:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 27/31] zabbix: Use oe.kernel.get_version_headers
Date: Sat,  1 Aug 2026 14:45:22 -0700
Message-ID: <20260801214526.788343-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128644

oe-core commit b980106560 ("lib/oe/kernel: Move python functions from
linux-kernel-base to library code") moved the kernel helpers out of
linux-kernel-base.bbclass into meta/lib/oe/kernel.py and renamed them from
get_kernelXXX to oe.kernel.get_XXX. In-tree users were updated, out of tree
layers were not, so parsing now fails:

  ExpansionError: Failure expanding variable KERNEL_VERSION, expression was
  ${@get_kernelversion_headers('.../work-shared/raspberrypi4-64/kernel-source')}
  which triggered exception NameError: name 'get_kernelversion_headers' is not defined
  The variable dependency chain for the failure is: KERNEL_VERSION -> do_configure

Switch to the new name. The functions now live in the oe library, which is
always available in python expressions, so the linux-kernel-base inherit is no
longer needed -- it only exports KBUILD_BUILD_* now, which is of no use here,
and upstream intends to remove the class entirely.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb
index 8707d65bb3..a7e617fa59 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.29.bb
@@ -29,7 +29,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.0/${BPN}-${PV}.tar.gz
 "
 SRC_URI[sha256sum] = "184d03454d7ff2d49fa1d292082ad335bce907ba22e30d54035d05329708ce32"

-inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
+inherit autotools-brokensep pkgconfig systemd useradd

 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "zabbix-agent.service"
@@ -41,7 +41,7 @@ USERADD_PARAM:${PN} = "-r -g zabbix -d /var/lib/zabbix \
     -s /sbin/nologin -c \"Zabbix Monitoring System\" zabbix \
 "

-KERNEL_VERSION = "${@get_kernelversion_headers('${STAGING_KERNEL_DIR}')}"
+KERNEL_VERSION = "${@oe.kernel.get_version_headers('${STAGING_KERNEL_DIR}')}"

 EXTRA_OECONF = " \
     --enable-dependency-tracking \

