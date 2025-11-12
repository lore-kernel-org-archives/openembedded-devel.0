Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBF1CD37A7
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 19:35:51 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6229.1762976148875264781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 11:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LieE2XhI;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b32a5494dso19082f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 11:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762976147; x=1763580947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXz3NyWPHeHC/nuvPJ3BchmiXVUTn3ZuM75wckOXUHo=;
        b=LieE2XhI/VCyLrbySbKN2tieVqz/wWouwG6JjwkM1aMmgJKowXLeAglZ9g8ALYZSTp
         QEApEmUGXFzHr63fi1rzRXrG4bMMYgSv3mkIEVZ1AFGFnswgGO3O4EbhDBpwpEazIgoW
         tc8/21QfBgwmQKScW8vY0GSXe6ETusBduWJPPvk2uEcCLklL0pabHEkIEiQpcHXn0csp
         TJk5il5g9H5mw14gmA9RkHKbZVhY4TGCwJ8Bo7Y6M1/FqnqbZdptSufEn7IqvtEKf2LK
         42WhsO0JVsN3MOLk0759BKHvYpK5bFlxRUIsbKTeAeQFzJ/rY14rhWwLSa6JJ6uyDJ0+
         T3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762976147; x=1763580947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AXz3NyWPHeHC/nuvPJ3BchmiXVUTn3ZuM75wckOXUHo=;
        b=QgAGjOCjk7WsBfLat27mq1l6/ak2ocb5dWRZXc/YDO0RNB8kFxCZtRi8onl0p7A467
         uCWaFrTvQvxO0YWBGES/ZRM3Yo4Fw6bmg26bzbeNBdN2+c51IXolJG9GzN8iZcAtTcVd
         l9mwrhcdAk9uRaQ+zPNHkdn0hMtlU7AoxR3YSSGA+yo7eUOTHz6xJOdlsx+Wdm6lQ59C
         fu8ubFs6qBpCsEsi8NBn2hmXyDm4j0K96GxaU0YLlZhivSQsDDxKc3hvnrGHvQha3sDP
         jrliqrCWcQjhNI1Bp9n2S8F2gJmaH8ifitJA1A/naRH0FSWdrDhxRsd1w8mnV9ifKs6V
         UriQ==
X-Gm-Message-State: AOJu0YzBbTKLIAgXQcEF1UFi5Uup/gL224HBvECDe9QyFANNkS8bLXIc
	cVl2Cjc/F25AqNfRmLpnJunQm9hqI5JUawCEClJACOgB7Q3UbYW0QoLaWb9yHL3T
X-Gm-Gg: ASbGncvqxZlAoWhDLUatgaGEyKuac5JttCMuslUYAYY+O3CZO3EKAi8iQrR20Vi8Z+s
	v6EPOh7Q63B9ti5uh8u4SHeBlHDFAgi9PlwitM48hMZ5N0QWsY96PKqku+D58nKahukmWbX4pXe
	ToFPddstNSVH03BYK5mXlYclZUtNTM5/utrtgrq2kKhzBm9T+sUMWDk8unJq7QWbdOWkuUcWSAo
	5JGArgGvO658Wg2seRAL4H95pI37OrkJHDshdrdVk8VPd1KsuFE2HpUCxWpZunFQ4Bg7VoHK77p
	MgHJjWt/4QmLkK3YN+JnkZGz6MpTconAS6Y+a302rRDYWhGFvJD6NmQWXg6CRotiaCfwIcV/qww
	wRzx2Q1wgvPPeEvjigtS1j/qny1JTN9Qmuf/LKmWEhOfeDPjwjB6OFaogFkoxZzt5jYd2wV87GZ
	I8VbGkRLDQ
X-Google-Smtp-Source: AGHT+IFI27CjRJiu1n0fdZvbK8VXzZagtw2eu1M2soTdhYz0DZLs5EZqRs3teWN0RMbI6ubwDbfnmg==
X-Received: by 2002:a05:6000:64c:b0:42b:3e20:f1b4 with SMTP id ffacd0b85a97d-42b4bb8b4b3mr3566994f8f.5.1762976147168;
        Wed, 12 Nov 2025 11:35:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2dd927c9sm28723881f8f.27.2025.11.12.11.35.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 11:35:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 07/21] ncftp: correct SRC_URI
Date: Wed, 12 Nov 2025 20:35:27 +0100
Message-ID: <20251112193542.1589821-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251112193542.1589821-1-skandigraun@gmail.com>
References: <20251112193542.1589821-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 19:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121568

The original xz-compressed tarball isn't available at the download
location anymore - switch to the gz tarball which is still there.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
index ac7355f525..d705cd5e3c 100644
--- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
+++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.7.bb
@@ -5,11 +5,11 @@ LICENSE = "ClArtistic"
 LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9c2390809f71465aa7ff76e03dc14d91"
 DEPENDS = "ncurses"
 
-SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/older_versions/${BP}-src.tar.xz \
+SRC_URI = "https://www.ncftp.com/public_ftp/ncftp/older_versions/${BP}-src.tar.gz \
            file://ncftp-configure-use-BUILD_CC-for-ccdv.patch \
            file://unistd.patch \
            "
-SRC_URI[sha256sum] = "d41c5c4d6614a8eae2ed4e4d7ada6b6d3afcc9fb65a4ed9b8711344bef24f7e8"
+SRC_URI[sha256sum] = "dbde0d3b4d28ba3a445621e10deaee57a6ba3ced277cc9dbce4052bcddf6cb2a"
 
 inherit autotools-brokensep pkgconfig
 

