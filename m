Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 112EE77E46
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:03 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 81so18579764pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3nmNxsxmf9OacJjOZmV5wU0N5JsljUa/sYu43qrXD7s=;
	b=BXmJEEeNtXOFdWRrthvfy0QPlIWtS6Dk7qbtiZWIheBHfdDrK/N2szQjXXLAVu9At4
	y/edUQ28U+NIj4pwy3I11U5gxbI/Wra6OJIs3yUMHuccUrapelreOBieeWlLFcKEN4VL
	kpKinvFei4KhpJOG26YzQwCapmK9wLkkpOhWTYIQfK48AiWy/Uih+BiG+h6DCACmDw8S
	wgTI4Pyv6xKstMm6tmAjNANAc+q7TAsZjn7kd1yPOa4j2JkLLf9lEBm/yWdI50blfGkV
	I2WWdPZtzWC/McIADGQhVXsccmcWwJVI7uINndk2xYM78tSSmU5MDZ32cOzE//rEHp1O
	qzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3nmNxsxmf9OacJjOZmV5wU0N5JsljUa/sYu43qrXD7s=;
	b=SeTEA3RaG8Z5A0nAVwqh4Oj6RC0itz0VpeLS5t0fVHRUPoiUTCY+09/ngPJl+RU3ov
	FEkBEBYGnHpB4bxY7jm1+/aRAdfsnXJUH6IYLBQyn/ndxy+jzMnICgf213VkTiRW3QKE
	CbDzuTmCfxVytsJfKEprLNGKcYiP+u5DZVQX/GDqfzjAp50AiWBsYSXMDAsv77Vo/8rc
	6z/xPtXzMAPtaAsSjJKOen3qfasAJiC5s2Mq138QaQfx1vH3bAcTRQ6KRRQ8Ui+hPGgN
	iZS21uewW1funx4J5kf0tCObVcK/66UpCkRvwZmWgLS0aXeajZEQVzAYGPZFrS6p163L
	fzjw==
X-Gm-Message-State: AFeK/H3GYjdNoa1aVoXwLuZUxmdGCn3vibNb1SBVbD8plIjG+RvejHSn1L2jqwGW8pA60w==
X-Received: by 10.98.49.1 with SMTP id x1mr3841989pfx.26.1490978584362;
	Fri, 31 Mar 2017 09:43:04 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:11 -0700
Message-Id: <20170331164247.5052-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 07/43] squid: Update to 3.5.23
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:03 -0000

Disable NIS on musl, it doesnt yet build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-daemons/squid/{squid_3.5.20.bb => squid_3.5.23.bb}   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_3.5.20.bb => squid_3.5.23.bb} (95%)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb b/meta-networking/recipes-daemons/squid/squid_3.5.23.bb
similarity index 95%
rename from meta-networking/recipes-daemons/squid/squid_3.5.20.bb
rename to meta-networking/recipes-daemons/squid/squid_3.5.23.bb
index 2e9e1f116..0fe9673af 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.20.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.23.bb
@@ -22,13 +22,12 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://set_sysroot_patch.patch \
            file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
 "
+SRC_URI[md5sum] = "b9e5603f00b0c40109610667d8693b22"
+SRC_URI[sha256sum] = "4384564e6227fbb4c18626d663e1b47912d3507b596ed997f2149f10dd8d70bd"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
                     file://errors/COPYRIGHT;md5=0d98c4448c368d146f31a970bb0ced21 \
                    "
-SRC_URI[md5sum] = "6a29d7dfc544205001f7a75c6996dc60"
-SRC_URI[sha256sum] = "5a114f8f7f44b5ae3c9b77d7b81aef13fe69e7f530855213d551f48b157cb5f1"
-
 DEPENDS = "libtool krb5 openldap db cyrus-sasl"
 
 inherit autotools useradd ptest
@@ -45,7 +44,9 @@ PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir
 PACKAGECONFIG[noatomics] = "squid_cv_gnu_atomics=no,squid_cv_gnu_atomics=yes,,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
-BASIC_AUTH = "DB SASL LDAP NIS"
+BASIC_AUTH = "DB SASL LDAP"
+BASIC_AUTH_append_libc-glibc = " NIS"
+
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 BASIC_AUTH += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'PAM', '', d)}"
 
-- 
2.12.1


