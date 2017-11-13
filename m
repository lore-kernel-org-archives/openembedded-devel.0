Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4834278530
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:45:25 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id j15so13983582wre.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Nov 2017 02:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DmyrA8UzDyLlFLQPq+xv7tAZCsbOtLG54Xh81EeEqio=;
	b=tbzVT9E0FFgQy4aR2diJMX8nv9A0xPINAAH1owcKZhsOul3CfDNi8EKYGzpgtlhjhp
	q3lFZhsDoUgDs3GDavRxOUAL1v6+noDOT4Nk0fNUvgGnpz+jbFVtuX9ZfgLm2wBncthn
	iQAjyp6G3HbkUTiVEX/ZAWvfxpU7Dl5Y2n2BAKlJi3Ud+pPKwLYXqawoWWCn47G63d5Y
	+nE5dpCQIWRoax8L0lay7A8B0A3XnjmQL1xGbCyPecFQ+hpLqNucp/FAA9JR+UpAbH85
	wCnF/Wdt49iU3P7Fj72oVAQebcfSWs0zHIZmZI3XltwegK0mSK+ZXvD5edjzygEiov72
	B1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DmyrA8UzDyLlFLQPq+xv7tAZCsbOtLG54Xh81EeEqio=;
	b=edD5YhClylxGMDy6DPIopq7lsq8LJDDJmPm3dOzScL8COiUjnxyRRMWxC0fB/524II
	vnZgm7SJMg4y4Q+hQKM6SKBk3yjWS0WS77eRiIefIAHSIuRi8GjqB/UEucdn17kUK5ML
	Je2+gpaD9+S6pHauGIJ3E5l85kv9QkWLBFfd6qtwU5WMBIo8JODDe5Nvy6Imqw9yLMWI
	ixI0Uk5Oy1Vl5LQ2KlpmZXdWWLRM9R1dwyasvYNm6IzDiZRPure6Xlap+tcURd3gf6Cx
	RKG0CZ8Q6OT1NRtSAN102aI9ikq0IFwQq6GRo0DsUhp1h4yUGgro3QcGGv1oslyg3OOD
	i+TA==
X-Gm-Message-State: AJaThX56ccan5OjkzxSfSG4j1HJKMBILsYHvQbo8yvpu9sqeh3WpKGSG
	/z97R8t9wCbTjWr6WuRlWhfQTsXk
X-Google-Smtp-Source: AGs4zMY8eC8TGiN+1V98xcXFRbDXgKzrxK68OaT1O4J3k9o6bBBkLQXDXa6OQe3/QuyQuht1IYdoIA==
X-Received: by 10.223.153.100 with SMTP id x91mr6587426wrb.189.1510569926607; 
	Mon, 13 Nov 2017 02:45:26 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q124sm763014wma.18.2017.11.13.02.45.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 02:45:25 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Nov 2017 10:45:21 +0000
Message-Id: <20171113104522.3510-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] postfix: virtual/db isn't used by core, change to db
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
X-List-Received-Date: Mon, 13 Nov 2017 10:45:26 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index a588bd347..75cf13795 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -6,11 +6,11 @@ has a definite Sendmail-ish flavor, but the inside is completely different."
 
 HOMEPAGE= "http://www.postfix.org"
 SECTION = "mail"
-DEPENDS = "virtual/db icu libpcre openssl postfix-native \
+DEPENDS = "db icu libpcre openssl postfix-native \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ldap', 'openldap', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'sasl', 'cyrus-sasl', '', d)} \
 "
-DEPENDS_class-native = "virtual/db-native icu-native openssl-native libpcre-native"
+DEPENDS_class-native = "db-native icu-native openssl-native libpcre-native"
 
 LICENSE = "IPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64375f37431336ea1b1b3005fe3fa354"
-- 
2.11.0


