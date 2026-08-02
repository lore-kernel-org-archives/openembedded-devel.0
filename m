Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A96C55171
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:04:58 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22324.1785672297687645725
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T7rdqiAK;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84e27035206so2808896b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672297; x=1786277097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NDmp23NKyMkTgh1Q4iKsC8O4TrihMQJPvoEiuzKQFI8=;
        b=T7rdqiAKsKnTbD3rjZF5IoA5V6eWLlYe8j7KEZufBlk6jd/Q1hVzqvjI8YCB7Nu/Xw
         JnaJLVmTsBk984hkSyiToMbfAKFusBUKV5HJgsUI62ZU6Lqgv0wD+wWyaR/fwvNNu1cq
         0tyyXmssnh2oov/+8/m6wmk31UnbLOKAaWrb/tvxTz++/T+MWLtn5MElvhYanxm1+nko
         TARfRLfu+Cg4hDADW3yRmCnZK/c7znyFstKeaXmm9aihLB1jz7RtbY1CoIW6rg8Wf07C
         rU2jQupTUzSMvEoNRcJmdWD4eMlCK8+uN9LRKbJtNApX6sNxrslYi31RHCF/9/lLLd6u
         OZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672297; x=1786277097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDmp23NKyMkTgh1Q4iKsC8O4TrihMQJPvoEiuzKQFI8=;
        b=oBbE48gANJpbGoTDdvu07EuZ86b80LtdEomM6CqVygNsrjUiG4nx9ihksFySrR4Rc2
         CYA+q3aZla0x+ZFK+3BkYOiA06NKNx3I98SH6T8676oeoaiTV4Vn8tu8OgOnniFnv23N
         JUJOITvsnZMID4GYossx5HtJ8GfA6+CMSoMvYqI7VeQ9wJHd2NrN3OLbYG/OoDEsl/sn
         a+2sqdp+hXF2woLhJasuvhcL8OQveNneDrIDWkG8llBc3StSh7fcqTiqsXLQEkX1ViOV
         uNxBIxf5a6SGhng2ZfTvarM4qY/kgXPiBrqJIqMRh3i64m6OUU1Ex4FlGonjger3mMto
         mCGg==
X-Gm-Message-State: AOJu0YywEe8mUZzzr6U5bUPnvusvxBLhu5VEP6cGA8uOYRuWBiCHdsIX
	eO7yTura2nc06Y5paCBkXQTLH/UjBy6eNCZpBdQIO6N6nXXMMOFAGClnLpUE4A==
X-Gm-Gg: AR+sD13Yt6gKq3ZyUVy9J3F1xRXL1ueUsQ3wxVxIuC/pyrN21il02R/aDw+u21xbs9V
	s6yFZd2w03nFNRAs8c4RPdhni24Th4O1cxPjFhz/MVK2OKYjzF8inpCWBsvctR0c8e+/RTNIwrG
	et/DfNeiSIXSJ85ITYGODd70HVd03FMmyhEi6D6G6AOwihtLawf4jtrPOb6bNZ6/3AiXfjcqJaZ
	i01OBWFZ3rOtvkaDyamoMImVYWQe6GMWm1UXXEn4Z16Hs1QdNUh8jDcvs2wdtHqvjSAqwqosbZl
	1HTZDqq24YxX7UweWBk6eVQ0O93LUIexFCor2v4xUxZKILUCZOqU8/VhgR0Z4+grM36wwV/hm91
	fp82n9WtnVazEyQZr0DF+sLNLvO09nbf56QuJVIkfbU/7vWKuEQog8b9NT+7KBIgPI2VDc0Qgdb
	T/aXC4em/vt7wCHgwbE7oEvpt3niuz/5mNKbVnepW4l+sYHRUVPruM7NQFfdK3geJ6SdO6jF1Xk
	K71KboVY8Rt
X-Received: by 2002:a05:6a00:178c:b0:847:99b4:d005 with SMTP id d2e1a72fcca58-84ee4931e9cmr5483948b3a.61.1785672296760;
        Sun, 02 Aug 2026 05:04:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:04:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][master-next][PATCH 1/11] ulogd2: upgrade 2.0.8 -> 2.0.9
Date: Mon,  3 Aug 2026 00:04:32 +1200
Message-ID: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128656

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Removed ulog from packageconfig[1]

Changelog:
https://git.netfilter.org/ulogd2/log/?h=ulogd-2.0.9

[1] https://git.netfilter.org/ulogd2/commit/?h=ulogd-2.0.9&id=2f49c9bb6a9e4b7ed26d8e487e372695031aa5f9

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ulogd2/{ulogd2_2.0.8.bb => ulogd2_2.0.9.bb}            | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-filter/ulogd2/{ulogd2_2.0.8.bb => ulogd2_2.0.9.bb} (94%)

diff --git a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb
similarity index 94%
rename from meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
rename to meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb
index febcf5147c..86d0011c4d 100644
--- a/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.8.bb
+++ b/meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb
@@ -9,18 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 DEPENDS = "libnfnetlink"
 PROVIDES = "ulogd"
 
-PV .= "+git"
-
 SRC_URI = "git://git.netfilter.org/ulogd2;branch=master \
            file://ulogd.init \
            file://ulogd.service \
 "
-SRCREV = "79aa980f2df9dda0c097e8f883a62f414b9e5138"
+SRCREV = "1fe54ec39a071ea3b06e6883e542dfdcf40d2840"
 
 
 inherit autotools manpages pkgconfig systemd update-rc.d
 
-PACKAGECONFIG ?= "dbi json nfacct nfct nflog pcap sqlite3 ulog"
+PACKAGECONFIG ?= "dbi json nfacct nfct nflog pcap sqlite3"
 PACKAGECONFIG[dbi] = "--enable-dbi,--disable-dbi,libdbi"
 PACKAGECONFIG[json] = "--enable-json,--disable-json,jansson"
 PACKAGECONFIG[manpages] = ""
@@ -31,7 +29,6 @@ PACKAGECONFIG[nflog] = "--enable-nflog,--disable-nflog,libnetfilter-log"
 PACKAGECONFIG[pcap] = "--enable-pcap,--disable-pcap,libpcap"
 PACKAGECONFIG[pgsql] = "--enable-pgsql,--disable-pgsql,postgresql"
 PACKAGECONFIG[sqlite3] = "--enable-sqlite3,--disable-sqlite3,sqlite3"
-PACKAGECONFIG[ulog] = "--enable-ulog,--disable-ulog"
 
 do_install:append () {
 	install -d ${D}${sysconfdir}

