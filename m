Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F361FC48BEB
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 21:24:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.301.1708550651373068937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 13:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DDkCaabE;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33d8d4536adso257f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 13:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708550649; x=1709155449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06TplIg3uQDwC5BkJdLf5ZX7ROxZKRdCiom6WOFSqFI=;
        b=DDkCaabE1UBOHU8AeY+9dDY73mc960KzhMQN4wKzKlbX16JU1HHN71t8Y1zhIHeE5m
         MQ3/jHBdJBvO+LalX2TDFR9rvWwThQnY7jY7jArIi2SBmX/0lc0lK7JKTgX7r5auQ4MR
         CKLJLaUKkwA0zzhEVK7QbQc34dSNCEn/jF3crR/aGFx60n2QgurSbb9HOxcJUZ1DxAcr
         HQ6KUCfUiB6EXx+M10RbKbVFSM71KplfJ58OiHUiFhIISeWixAmKh5THiA/743Hr95Sa
         j4e3h/7YmmsRGVvY8FTdW5hgkQ50OVN/RceGp/a1mVg8pRHLR/yPvTHPjqlK9Ralp/lu
         Klpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708550649; x=1709155449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06TplIg3uQDwC5BkJdLf5ZX7ROxZKRdCiom6WOFSqFI=;
        b=fS2edMMPgLnDkng5JsjBVRtk5hONVIZQg8jJknWsAX0Z/7dtLxyCv0lLyEXcJPvq7Z
         O7FP8m/LChIHjv0YUjo6HNp082z5pMhRrTpuyWOAth/QtMoxNdaMtTGX12OisU+HfkPn
         9GUVD2kixm3JP9LKXjtQKhIGb34EwjPYRwA+v6cGERY4qrq/58vACj5W4jl/yKVm+4ec
         RwCUK6t0i00XeN5yASI7VWFJ4Nep8jYKLc+QT6cEH5ifsBxUfRJ1JciWidVsFzaYV4uO
         foMVBVpnCAZVt5PoZKwxZVxgVMGVzYOgyyjqnWwsFuvsHsPo2R2F5wASodF38Ba0EVsb
         31Jw==
X-Gm-Message-State: AOJu0YwXa3SMl/oKIx3bLHOwjo6qZahjDYbsd+HHNIhtSdWvQ7HTERYh
	clNjtyKIb3yiq/sBfRgUbBIE1DdIUhTuY3Mhk2NimER+K57d2JXMD0RzSmcN
X-Google-Smtp-Source: AGHT+IFb/6KKdBq//R4PzUojxy6oqXbzVlnPpmFH0BUvutRLXPxX+db2G/t0gJoSNBDyOll/2PZgLA==
X-Received: by 2002:a05:6000:a07:b0:33d:4e4:686e with SMTP id co7-20020a0560000a0700b0033d04e4686emr16769533wrb.68.1708550649074;
        Wed, 21 Feb 2024 13:24:09 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qwpe05upfboa6f.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:1715:9d41:4853:e087])
        by smtp.gmail.com with ESMTPSA id bt21-20020a056000081500b0033d1f25b798sm18213220wrb.82.2024.02.21.13.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:24:08 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH v2] netdata: version bump 1.43.2 -> 1.44.3
Date: Wed, 21 Feb 2024 22:23:58 +0100
Message-Id: <20240221212358.3153949-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 21:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108972

* fixed a few minor oelint-adv warnings in the recipe
* placed all SRC_URI lines in one block

Tested on Raspberry PI 4

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../{netdata_1.43.2.bb => netdata_1.44.3.bb}       | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.43.2.bb => netdata_1.44.3.bb} (87%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
similarity index 87%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
index 28e82dac3..700c6b234 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
@@ -5,17 +5,15 @@ HOMEPAGE = "https://github.com/netdata/netdata/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-DEPENDS += "libuv util-linux zlib libyaml json-c"
+DEPENDS += "json-c libuv libyaml util-linux zlib "
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
+SRC_URI = "\
+    https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
+    file://netdata.conf \
+    file://netdata.service \
 "
-SRC_URI[sha256sum] = "d4a7ea2717ac7c8f04865f18e13aeaa0a36784156059f1b5ced75a44f74afc4d"
 
-# default netdata.conf for netdata configuration
-SRC_URI += "file://netdata.conf"
-
-# file for providing systemd service support
-SRC_URI += "file://netdata.service"
+SRC_URI[sha256sum] = "50df30a9aaf60d550eb8e607230d982827e04194f7df3eba0e83ff7919270ad2"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
-- 
2.39.2


