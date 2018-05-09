Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id C164374B83
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:25 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id t22-v6so4837702plo.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uwGphK1xRqUjobEX6fVo6J9g2nVc6c+8PYrDjeVaKQI=;
	b=uZAfZqTVSr1+L7O43hrP0Q3T7rcALm5tsx8FxcHmslsyQ282Cqv4UHzaSFlZ7tEkRw
	f0qIN11bAeaakxYMTgOHGhty8ZJfbcavTRHfjsDXU3/yCkDvezb9Wpw3Z1fvWbL3jroA
	npNi5B8xgn9TAkWaK4SVvMIbTBtJLQYUCJxas55l6zic+1Gx0WtXyDzwDUbh840AELAl
	e9FJlChdKwcKOg5bGS3KYb3bhMngYMME6IkaHetBxD0aCSrAChaEWB6QrCI07Al6izRY
	tND7cBEk/YgC0evlwmVmJZYVtXAGwT3VQFOjcXuzuDpvFgRhi0/uLJ/viOQ63SpwtYul
	FaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uwGphK1xRqUjobEX6fVo6J9g2nVc6c+8PYrDjeVaKQI=;
	b=WEx9qJNOe7ZIaTcIGr6LbChl8wwc8vVw7YXRS9OQLIXwG9FM6uljkdQNWE/+iAqXOv
	kRZcje6G8QrrlNPBmwfB0Mxgi7FWoDs2yVIw4aXnp4RplHnop289HGPuqkx6BinEIazU
	metTHF0FkyYylazq3jXqoP5kCklbIkVfeoKFK4KnaRRCD8j3qvV23bwffnoQfV9Xjym3
	zK5Ir4BBfIr0Fj5Bt47o0HO2W7AKo+Um0VsYGuqmIR22f3dPwuiJ99e5o5EsMnVMz7VF
	OZnnEcarXh3nJyB9C3poaZOHP9dNTMiKn/s47uUUJAiRiK9EglaUMrPXKsJVcWhAaRZT
	h3xg==
X-Gm-Message-State: ALQs6tCx1oYRk4jyGnt8dO3UCFsR5aig/aXI9OogyOK7+FToSoWCDrwn
	W4rXYxSYTTilroU/GDy5M6Skdw==
X-Google-Smtp-Source: AB8JxZpKygkTFAuSfEdEQwUGNTkWqlVjMPpcDMjOLk6b/e9SVcyj9gFTAK3w5N+MT2Fte7/S4MVb6w==
X-Received: by 2002:a17:902:205:: with SMTP id
	5-v6mr45085767plc.301.1525892426465; 
	Wed, 09 May 2018 12:00:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:02 -0700
Message-Id: <20180509190011.30006-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 07/16] postfix: Depend on external libnsl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2018 19:00:25 -0000

Glibc has dropped libnsl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index a8e7540333..ac0589467a 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -6,11 +6,10 @@ has a definite Sendmail-ish flavor, but the inside is completely different."
 
 HOMEPAGE= "http://www.postfix.org"
 SECTION = "mail"
-DEPENDS = "db icu libpcre openssl postfix-native \
+DEPENDS = "db icu libpcre libnsl2 openssl postfix-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "
-DEPENDS_class-native = "db-native icu-native openssl-native libpcre-native"
 
 LICENSE = "IPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
@@ -77,7 +76,6 @@ export CCARGS  = "${CFLAGS} -DHAS_PCRE -DUSE_TLS -I${STAGING_INCDIR}/openssl ${C
 export AUXLIBS = "-lpcre -lssl -lcrypto ${AUXLIBS-sasl} ${AUXLIBS-ldap}"
 export POSTCONF = "${STAGING_DIR_NATIVE}${sbindir_native}/postconf"
 
-export CCARGS-nonis_libc-musl = "-DNO_NIS"
 # OPT,DEBUG is aready in CFLAGS
 # ignore the OPTS="CC=$CC" in Makefile it will not use the CC=$CC $CCARGS
 EXTRA_OEMAKE += "OPT= DEBUG= OPTS= "
-- 
2.17.0


