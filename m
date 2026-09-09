Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291EBC79FB6
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 20:07:23 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86.1788984433355974449
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 13:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QyZ+KSDb;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a2e985245eso45457431fa.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788984431; x=1789589231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iY4Iecz/ZPqzY7lvxx93aEPBHNLxXl7YhwabS0lK6jM=;
        b=QyZ+KSDbf2iiq/8gn0I6m7PGdkenG/y5d/Z5MMiZYj5UTRdehCHh24GW4++9yOsXBo
         8Lxbii6sMbEC3mup1adARvPTQuX0ZlPxZly6g0NnJs4uHE/C4Gx7ZMVeSbVeebq0pQQn
         yQeyViJnCCgZHbbp1JpSnSgzSHraTKLUQYnBWFHJS4Zvl1DI0W9Pvm82qSCr61WqXA1r
         gi8SvxnfS/k//fLKEH6YOD3GQu1UrabitedxYug49u2CeAt/nRBjdCx4abgbYyzEa0sm
         Of+LsNr6INFHVThF34PRZD76QtXjVrTl6L+gPx+ILh24E1D1XaF8d8HuzlACd55ph9rK
         Ewmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788984431; x=1789589231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iY4Iecz/ZPqzY7lvxx93aEPBHNLxXl7YhwabS0lK6jM=;
        b=rfVE//ATd/i10i2mBqbEkDiC9N4WLCRecAPJYEKit7j/ANxCLBdJMfN3ygwqsTCSu7
         Y1v/AJZvlbbi186m67hvFSIMBg+UqHa0CozjV6FQ8xtMCm1FXYip6bmMR6qSZzkmCanV
         IiZ7iZH5YrH7X9ncf8Kz/+g+GtIcIdcjCPP03g4V5xgviLJyxALjYiulPI+DNUQPJAxh
         rS3MWSFLPrYmf43PrL9KPcZfP54X9hvj7KyvEdKgy+P84jAmxU0eKbBqcZdfv1JyUwas
         kxXeciUwAUl1igJU2BetKDTHTtO20OzgsQ9C0iv2OynPlUjYAhn6xVr9aJUrg6v1BHdP
         DQ0g==
X-Gm-Message-State: AFuF++nigDhCysmpt7nIjaXuMWLjaRgIKmKTQ7n18oTsIrHQ+ZYp97y4
	EQUlHKl9J0qd23cs+YE31USAC1sgSuA69FvhJsP9q4aFssNB+n5cyJ81SkjedQ==
X-Gm-Gg: AYBFou2ApVdWvx5gAgJy2V8JJ0/lB2V2vrKSFt/9WBy6gi6/0ucqSrBJANPs22DUf80
	fhX3favZ3y2ziqq/M65MzwkfsLEooyK0OT7kfMP0zxaTsHzJRCIN8+DlwzjrAJ/fTxBNATQxmmM
	k3rYV0/ktvTHbNJUTpprIs2cZAvUUR0f25iTy/QgbTgX9kr3ySF14iytOsvATObZQ1Yvu+0uS2D
	QmZ4PoJ0mPPqPLs33MgUvim6loR5p3YWrpX9QiYwZFzyeJS4cVp84/BCf2ns4BP932ja4e8TCsi
	syiaLL1TLM3Wd1l/CpWkK3kknG8OUOBXj3RwZwjls3GXGLr1evheduUiyA5SLMoJCj4B3HwwzTq
	OqrI/3kEIJ62Ev+5CxP+Gd65R6msSccYEFs1miA1Z/t89nHmtXaAKaMHBcAwrZdgoCQ674Mpyyb
	mZtK8vANpXXMi9qkQZXUPTCxYEd1LEfwWAWR8gQTCnN+jc/hoiAZP7Y0msT06rf4DILVBLEH7aJ
	uJva5C5U2nU55GiV7qDjVOdYcyxfoVCt/gXI6YkMGgXABFyHYY8YdzyGppVGw7ZLBSJw0C+Mv+i
X-Received: by 2002:a2e:a991:0:b0:3a1:ee68:5082 with SMTP id 38308e7fff4ca-3a371aa9204mr47579321fa.2.1788984431047;
        Wed, 09 Sep 2026 13:07:11 -0700 (PDT)
Received: from localhost.localdomain ([176.88.90.107])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a49e959082sm6248011fa.20.2026.09.09.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:07:10 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] ipmiutil: fix build with OpenSSL 4.0
Date: Wed,  9 Sep 2026 23:07:06 +0300
Message-ID: <20260909200706.202485-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 20:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129898

do_compile fails with:

  lanplus_crypt_impl.c:233:24: error: storage size of 'ctx' isn't known

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...configure-enable-SSL11-for-OpenSSL-4.patch | 25 +++++++++++++++++++
 .../recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/ipmiutil/ipmiutil/0002-configure-enable-SSL11-for-OpenSSL-4.patch

diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0002-configure-enable-SSL11-for-OpenSSL-4.patch b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0002-configure-enable-SSL11-for-OpenSSL-4.patch
new file mode 100644
index 0000000000..ae790f1909
--- /dev/null
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil/0002-configure-enable-SSL11-for-OpenSSL-4.patch
@@ -0,0 +1,25 @@
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Sep 2026 23:00:00 +0300
+Subject: [PATCH] configure: enable SSL11 for OpenSSL 4
+
+OpenSSL 4 keeps EVP_CIPHER_CTX opaque, so it cannot go on the stack.
+The heap path behind SSL11 is already there, configure just does not
+turn it on for major version 4.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/ipmiutil/feature-requests/13/]
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -443,7 +443,7 @@
+ 		MD2_CFLAGS="-DSKIP_MD2 -DSSL11"
+ 		sslnew=1
+ 	fi
+-	if test "$sslrel" = "3"; then
++	if test "$sslrel" = "3" -o "$sslrel" = "4"; then
+ 		echo "Detected openssl-$sslver" 
+ 		MD2_CFLAGS="-DSKIP_MD2 -DSSL11"
+ 		sslnew=1
diff --git a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
index 7945c6f535..4bcf627672 100644
--- a/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
+++ b/meta-oe/recipes-kernel/ipmiutil/ipmiutil_3.2.2.bb
@@ -22,6 +22,7 @@ PARALLEL_MAKE = ""
 SRC_URI = "${SOURCEFORGE_MIRROR}/ipmiutil/ipmiutil-${PV}.tar.gz \
            file://fix_systemd_path.patch \
            file://0001-ihpm-Include-stdlib.h-for-malloc-free-atoi-functions.patch \
+           file://0002-configure-enable-SSL11-for-OpenSSL-4.patch \
           "
 SRC_URI[sha256sum] = "37f9bc8e6b18c1155e4d5ea38c87b83908b7acc7a44fbc5e3af493f26ef8b767"
 
-- 
2.43.0


