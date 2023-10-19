Return-Path: <sam.van.den.berge@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04AECDB483
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 08:03:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.22444.1697702593729987855
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Oct 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DgU867MI;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: sam.van.den.berge@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32d80ae19f8so5932556f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 01:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697702592; x=1698307392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9iYxtGdK54NA0lVkzxDQg0YP18vgThshcjaqXYQuuBo=;
        b=DgU867MIKxpmRGygQzRmu56BixdSVYGYC9TnXr1WC7xr6Rw2rbOkgKTQ0xX+ATG2Ov
         pvXQLD/GE+ZLP/ZqhtiN163sSWjqkTJFZQqC7wm2pNN/Bf161LYA3+4z7eSpIp5z3EQT
         CZncldCJefj11NEQHAludxXJisD3KhZBNMKzY7vZsKW66gT+4haSftwOrLcLR4YYnx2+
         NdwSqfTGLr1AA6a4qniFSgUP8B85WZ9EH8I+hvL1Ziyv0zJjp2vSV3IA12PomIuFnxGD
         ndnuAYqakDylIFedzESBc91/YseVj8j2hg0esffcGEJLk7V8a724AqSEGu9BlkJ80dC6
         5Rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697702592; x=1698307392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iYxtGdK54NA0lVkzxDQg0YP18vgThshcjaqXYQuuBo=;
        b=I0SoP8dU2R7MI0FSi6y4yymkFLoNfk6M3weD9Y4n5JzZtOUv5+3CEZTpUSPFm77xLW
         DBTHaF9ZLPevmyU+2e4b090VhDGRofi6sETmkk475pEOQbCSl1YFUx+IbnCKQokVnHXB
         s/DpfNp7vYpEYX4YFajAx8ZWv2jRqYWtLd9OAVdm4Iy3RjpKGE1LjVurT54j+e7O1BWm
         PIN3jbWjH4NvwFB+oEuSxExW7nVok6CHq8AkGM6KzR57S9N9s61z+9Xc3gFURAQxTUl+
         zxIrPlAZ+VK8MzHoy+H/qbMoCLhr6h9hr3r7Lq/ePHoDSy+yO4iDZcxMzhgLr5BNYrL1
         rQ4Q==
X-Gm-Message-State: AOJu0YwgWjmOh/lO7b/J9CvYqDPXeUJ6EVQcyij3KuhAlhvHUkIYFvEx
	A5PHgbOPisP2EO1id+CcN6Uq5dysYQ==
X-Google-Smtp-Source: AGHT+IGE82SaghDOfPD3gZfsGplHpAK0NlpVnXvytBzkSWAdmDxEOpjgIucwcUe8DUB2LVVy+9o+3g==
X-Received: by 2002:adf:fccc:0:b0:32d:88fd:5c65 with SMTP id f12-20020adffccc000000b0032d88fd5c65mr927348wrs.1.1697702590984;
        Thu, 19 Oct 2023 01:03:10 -0700 (PDT)
Received: from OP01518NB.WTSOUT.OIP.LOCAL (mail.oip.be. [81.246.50.154])
        by smtp.gmail.com with ESMTPSA id x6-20020a5d6506000000b0032d886039easm3853613wru.14.2023.10.19.01.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:03:10 -0700 (PDT)
From: sam.van.den.berge@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Subject: [meta-webserver][PATCH] netdata: Upgrade 1.36.1 -> 1.43.0
Date: Thu, 19 Oct 2023 10:02:54 +0200
Message-Id: <20231019080254.2009-1-sam.van.den.berge@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Oct 2023 08:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105594

From: Sam Van Den Berge <sam.van.den.berge@gmail.com>

libyaml dependency now required. See:
6ee42875c: Bundle libyaml

json-c also seems required now. If I don't enable it, I get compile errors.

compression and https options got renamed upstream to lz4 and openssl. See:
c74bf56ee: Code reorg and cleanup - enrichment of /api/v2

Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
---
 .../netdata/{netdata_1.36.1.bb => netdata_1.43.0.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.36.1.bb => netdata_1.43.0.bb} (88%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.36.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.43.0.bb
similarity index 88%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.36.1.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.43.0.bb
index 52d99e770..07ee03d86 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.36.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.43.0.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://github.com/netdata/netdata/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-DEPENDS += "libuv util-linux zlib"
+DEPENDS += "libuv util-linux zlib libyaml json-c"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "f4a1233112b55e07e2862ffda0416255f0aa4c8e2b16929b76fa7ad6b69fd931"
+SRC_URI[sha256sum] = "d3c66273d8eb62290d412c870dcde45ea214ad187df9d5350f682d9e6d19d426"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
@@ -41,10 +41,10 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "--system --no-create-home --home-dir ${localstatedir}/run/netdata --user-group netdata"
 
-PACKAGECONFIG ??= "https"
-PACKAGECONFIG[cloud] = "--enable-cloud, --disable-cloud, json-c"
-PACKAGECONFIG[compression] = "--enable-compression, --disable-compression, lz4"
-PACKAGECONFIG[https] = "--enable-https, --disable-https, openssl"
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[cloud] = "--enable-cloud, --disable-cloud,"
+PACKAGECONFIG[lz4] = "--enable-lz4, --disable-lz4, lz4"
+PACKAGECONFIG[openssl] = "--enable-openssl, --disable-openssl, openssl"
 
 # ebpf doesn't compile (or detect) the cross compilation well
 EXTRA_OECONF += "--disable-ebpf"
-- 
2.34.1


