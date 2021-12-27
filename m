Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A31C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 02:50:29 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.22785.1640573428361633348
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 18:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mcsc+WSn;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id g2so12475214pgo.9
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Dec 2021 18:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gYtNkJqySa/wFTzYrXljz/Fbew1U6RKVs4I97TVa4IE=;
        b=Mcsc+WSnoVYIkFqMTLiTbN9o6MDdkQZ5DrFTQvz17hchU5uYo2+V94iXEC7llJ+Xiw
         m3dvjhkCIvfA1d9s+HVF81I9xyA4z2rDtXHiutnWQdj75W3aUCx1JmNdG/HOSITU7m3L
         5zBBorev3YvuOHMck0OfsNe0wWbhawW6FLdn5y4VsgO/SASVg8jgN0je2vERwtdAS+/8
         Y4QlFRE6NGwaLoYSUX/LzQHu2u6p8PHW9YTFvwnFYEMEiVbcOJwo7bNGKdsaZAw9cINH
         ZIQpya5QMsRMG7XBvnN0xG1Fnn4MuF99kq6mwWuWlSWBdt0a7vpzki7mCpD5uqwLSRd9
         zuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gYtNkJqySa/wFTzYrXljz/Fbew1U6RKVs4I97TVa4IE=;
        b=5Va2nEkwGVMYXD7n5BkT3X+u93vCqNMxvYkgokh0UjLNnci8BYGzkX/vIdlSVX85Sq
         e2kR2egosixRKLwE5rJlHfN2GQEQ4343rgPmrx+5+2VNy6+gle+Rsblk95jsmrld0hCY
         06qgYYYQRDYskU0iLYYtPpzOYfASBzVms17q24v7rS98g4JreMOD5QgVB+8JGHt/Mpsk
         RADXvHJACrJMubjl6zskhMfxxovUhqDWE99f6N9gwS66kbkic7CLSdh5QEEvrA8r6dUu
         gpB8S/j9djJXkFj1rJ0/WzYfj45NytI+2d9jwifMJigNGD92fmq822UVPZmW8nI/sIuH
         anXQ==
X-Gm-Message-State: AOAM532/iB/EqEpUjyOARS4rYWgfy1/hMi6c+j55SrbmxkYTn79nPvvH
	aXrEl8G9YcepIwJcJScpuNqINtrSBaA=
X-Google-Smtp-Source: 
 ABdhPJzvNyby8dYlWRA/IXZFfS2kokHJRhJdyDTyktt8q948C34KWiiMjUL7a8/CDIy8qz1XsVHzYQ==
X-Received: by 2002:a63:6f49:: with SMTP id k70mr2981057pgc.358.1640573427696;
        Sun, 26 Dec 2021 18:50:27 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:9a12:d2b4:2175:e337])
        by smtp.gmail.com with ESMTPSA id
 e29sm12744268pge.17.2021.12.26.18.50.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 18:50:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/4] strongswan: add tpm PACKAGECONFIG
Date: Sun, 26 Dec 2021 18:50:23 -0800
Message-Id: <20211227025025.1211176-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227025025.1211176-1-akuster808@gmail.com>
References: <20211227025025.1211176-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 02:50:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94501

migrate meta-tpm strongswan tweaks to meta-networking

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/strongswan/strongswan_5.9.4.bb         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index a031c54f5..265528851 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -6,6 +6,7 @@ SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gmp openssl flex-native flex bison-native"
+DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://fix-funtion-parameter.patch \
@@ -23,8 +24,9 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl cureve25519\
+PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl cureve25519 \
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', 'tpm2', '', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
 PACKAGECONFIG[bfd] = "--enable-bfd-backtraces,--disable-bfd-backtraces,binutils"
@@ -46,6 +48,9 @@ PACKAGECONFIG[cureve25519] = "--enable-curve25519,--disable-curve25519,, ${PN}-p
 # requires swanctl
 PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
 
+# tpm needs meta-tpm layer
+PACKAGECONFIG[tpm2] = "--enable-tpm,--disable-tpm,,${PN}-plugin-tpm"
+
 inherit autotools systemd pkgconfig
 
 RRECOMMENDS:${PN} = "kernel-module-ah4 \
-- 
2.25.1


