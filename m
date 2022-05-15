Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56986C43217
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:49:50 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.16690.1652622586492370343
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mNXGJ0el;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id i1so12094263plg.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9oM6LBAFsjPte6bE700PyA8t+GbgGcz6jsmLZSKKALw=;
        b=mNXGJ0elKZX9a6akhpzY1gn3hUFcGcTNlNZ0+xJdSqJV6aFZ3Z1p4ifqm8zHUx/w8C
         C52rYtwa7RoZG1ROiAvNsvKTMqfGWLQfudtCWNLMkIznRIp5VrWfPlBeXiSNY5us594y
         plMj4JI9AJF1VJgo+rz3Fquf49qhet9UvzY+4Iqici1gK2+oYVeeMJW/+iHuRiDqF7Ux
         gInq52NDo2KRWI0w4okpO+LBVk67gbwTJByUpku2z1vQr1T7zgLGTr3enm+bVU0/NDZB
         I4vVbQ/mCMeEHdH/RTmNu/no/fahNGU7Rrch/3GhEHbE7loLSGVXkGDG7/ejz4LSFyAq
         wUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9oM6LBAFsjPte6bE700PyA8t+GbgGcz6jsmLZSKKALw=;
        b=ATR5jfWn4DHgCkF/Q6Vd0hY+uiNLvjL23dLwhZ34FmD/PQpctcTeZ+IvEXfNoWj4I2
         h/H82YOCDjlYNdkyAmkWRlG1Jq3yNzSaBIx9ne2v243gxr/tBqz7HqicxZAg2kamuUsG
         cqBtc3FUKejYQBaXzYgUR6i2KfJ/uzSkD/gAIpueggDbYTw4BnpdKM63qWIGtIvq70tR
         h8g7gJXvOyjcF6LXb0sT8Ml9mPLXij8DNP2LY5E8lJK8MA0/cfen+UdqTy2BDi8TWM08
         +7gcQvXa4XO9pjSwNr3ekT8zh0xRMWcDu4B483kO0QS9h28whRzejAiMi8UnzsryeaHs
         Apfw==
X-Gm-Message-State: AOAM532s1TltMD+oqujCSAn7vHzZ5sPHqOcPIOiYh7UVJNNIjgrMAYaD
	p90JXHk6r+QWnvGThcfbxb6M4nI3U/G6tA==
X-Google-Smtp-Source: 
 ABdhPJzTPEwiMgW35raDUmbAJUYhY9MVIulf31xRrJB1atX4nPfIidO5wlCQIfP1QEaSplXFqsBmFA==
X-Received: by 2002:a17:902:e94d:b0:158:2f50:d04c with SMTP id
 b13-20020a170902e94d00b001582f50d04cmr13466235pll.11.1652622585580;
        Sun, 15 May 2022 06:49:45 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 15/22] openldap: Remove libgcrypt dependency
Date: Sun, 15 May 2022 06:49:15 -0700
Message-Id: 
 <5dbd9bda908df701b681daad0aa58cb079decdbe.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:49:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97112

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

Since OpenLDAP 2.5.0, it uses nettle instead of gcrypt.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a5512ab27231d33f08a58cab4422c60b080c9067)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openldap/openldap-2.4.28-gnutls-gcrypt.patch  | 15 ---------------
 .../recipes-support/openldap/openldap_2.5.9.bb    |  3 +--
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
deleted file mode 100644
index 8cfd0033c8..0000000000
--- a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-From http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-nds/openldap/files/
-
-Upstream-Status: Pending
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -1263,7 +1263,7 @@ if test $ol_link_tls = no ; then
- 				ol_link_tls=yes
- 				WITH_TLS_TYPE=gnutls
- 
--				TLS_LIBS="-lgnutls"
-+				TLS_LIBS="-lgnutls -lgcrypt"
- 
- 				AC_DEFINE(HAVE_GNUTLS, 1, 
- 					[define if you have GNUtls])
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
index 5ac5660cdf..958a21b9c1 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -15,7 +15,6 @@ SECTION = "libs"
 LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/${BP}.tgz \
-    file://openldap-2.4.28-gnutls-gcrypt.patch \
     file://use-urandom.patch \
     file://initscript \
     file://slapd.service \
@@ -51,7 +50,7 @@ PACKAGECONFIG ??= "asyncmeta gnutls modules \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
-PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls libgcrypt"
+PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls"
 PACKAGECONFIG[openssl] = "--with-tls=openssl,,openssl"
 
 PACKAGECONFIG[sasl] = "--with-cyrus-sasl,--without-cyrus-sasl,cyrus-sasl"
-- 
2.25.1


