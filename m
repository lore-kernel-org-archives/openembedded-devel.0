Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id F0A1A77BDF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 21:48:14 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l64so4160752pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Aug 2017 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BacPIVgoeSTWGDoXVtcBzS/VSDGsHgpnhpc0YCl84hU=;
	b=Xwfq9DRqLkcleqGyGujrSJAUUkBTwMq3ZpOvqq7CfC/1ncg3PdunwlImpIowtQe2N+
	+rcmZe6/rvejg8fREytmIkSSG3SP4LcCHEBDywRG3LHa+8uufeNlszsin+X8gB8mOGoy
	+bExEVGuU/OET/A6x2yDe0dZ2wHgRlsIQV64WY0pP9C7Atmhcqx/Fllv8ZunkSdnxHs/
	QKaZZfheWGHYexwCSyrQsktDBTSPDL9x9RnKqdy9yW5ZSyxE6aDhBdXZP3AHxWxc5OHl
	mLQOgZkJR2/rtjHpvnaGocCQUOe/h2cNb40GED1721oFT52VfQG7aXLjhIgJ4dqdfDOb
	gZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=BacPIVgoeSTWGDoXVtcBzS/VSDGsHgpnhpc0YCl84hU=;
	b=aZ5cBeTuwQPn32BMxb+vAuG3HBc4NM7zK/2cEzVEPwTqBHUgSS6hshMmC+5xSFR/MT
	nrRrjSgQW/e7m1uDwUR8XpbqqY/onIJgsoRbSQRPeS3DBRJfJ+fAfYa1k40OZcVXdei/
	JodwwZJGFcMzfyxBHVjgLmsbDPEbCoI/1ysU/2eAJllSc/5Ye5xhtiTbAOi/Pbo2llRU
	cHD8WUggeS7k959GjmbWQSANcAdqZGIJ3XX2kYIfBJeRExqnsSHRjEjxrE5VlTzYSLlR
	jegSKPq1lE6OWCqBO1Ltf6+uo87oZI9HarHBK4A2C7ehGalsaZcb3TdxAXHy5aR2dm3R
	6Wng==
X-Gm-Message-State: AHYfb5hKZTS0RZlJ1EsEHNxKc8M8e4EnB/sth3mQPYQLO0lRWev3IgFR
	Yx0xAyTQ6FMAy4VF
X-Received: by 10.84.233.141 with SMTP id l13mr6395264plk.333.1502228895686;
	Tue, 08 Aug 2017 14:48:15 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::f213])
	by smtp.gmail.com with ESMTPSA id
	d135sm2768713pga.6.2017.08.08.14.48.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Aug 2017 14:48:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 14:47:54 -0700
Message-Id: <20170808214800.39621-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170808214800.39621-1-raj.khem@gmail.com>
References: <20170808214800.39621-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/9] squid: Add missing dependencies on openssl expat and libxml2
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
X-List-Received-Date: Tue, 08 Aug 2017 21:48:15 -0000

inherit classes needed for pkgconfig and perl
NIS is not buildable with gold linker, disable it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/squid/squid_3.5.26.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
index a78a09135..24cd15669 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
@@ -32,9 +32,9 @@ SRC_URI[sha256sum] = "41d8845863dcd026c856508cd1599d417c8947ffd96e86e24085f9893c
 LIC_FILES_CHKSUM = "file://COPYING;md5=c492e2d6d32ec5c1aad0e0609a141ce9 \
                     file://errors/COPYRIGHT;md5=8861130fae91400bcf99b66f133172b3 \
                    "
-DEPENDS = "libtool krb5 openldap db cyrus-sasl"
+DEPENDS = "libtool krb5 openldap db cyrus-sasl openssl expat libxml2"
 
-inherit autotools useradd ptest
+inherit autotools pkgconfig useradd ptest perlnative
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /var/run/squid --shell /bin/false --user-group squid"
@@ -49,7 +49,6 @@ PACKAGECONFIG[noatomics] = "squid_cv_gnu_atomics=no,squid_cv_gnu_atomics=yes,,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 BASIC_AUTH = "DB SASL LDAP"
-BASIC_AUTH_append_libc-glibc = " NIS"
 
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 BASIC_AUTH += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'PAM', '', d)}"
-- 
2.14.0


