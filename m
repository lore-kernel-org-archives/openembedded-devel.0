Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9BF5B731DB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:59:57 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 65so2220177pfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=a4zPfX+BkMssNrVW2HWMaYmLkGKRA1Z4bT1/Am2pP8o=;
	b=C5KmC07UC2+TeCVj5jU2tN3mKH26dfbS/0RquaZ1oaYb5bXS5GQXPDrlg4f/l9IiOH
	9Z1aFue9q3XxOsdoXQG7K3fM19HVYugi3sd9+B3dMOb/G9wtHaqSaMalmyUfcsPUrcFS
	bD22p/BtosI8gNGhHDZdHEtNWfTZJFfRMiu3yhc67Rtwdqq13w5yruZZbqdQNi+U8Gsb
	IXMQgbW0oWASjtCSetsS7BlFEPApWyuJq1lsZ5M24GU0BV1ugr2N2kgTIBiXICJPO6HT
	sAUEY2uFAN6aD/LjYmjUWOXoEJbKxJDg4ucl30UqwhpmQT1HKzFBbISXbXOMGzflxbbc
	sEWQ==
X-Received: by 10.98.13.7 with SMTP id v7mr15652661pfi.150.1452387598527;
	Sat, 09 Jan 2016 16:59:58 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	fc6sm176334830pac.44.2016.01.09.16.59.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:59:57 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 91024FCC83D; Sat,  9 Jan 2016 16:59:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:59:28 -0800
Message-Id: <a4130f703b9c601ca6e153d5b3a29b32bd509985.1452386603.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
In-Reply-To: <cover.1452386602.git.akuster808@gmail.com>
References: <cover.1452386602.git.akuster808@gmail.com>
Subject: [PATCH 05/22] strongswan: add additional PACKAGECONFIG flags
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
X-List-Received-Date: Sun, 10 Jan 2016 00:59:57 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

- Add aesni, charon, gmp, openssl, scep, stroke, swanctl, and
  systemd-charon.
- Organize the packageconfig list alphabetically.
- Update the default PACKAGECONFIG to match current defaults.
- If swanctl is enabled, use strongswan-swanctl.service instead of
  strongswan.service.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/strongswan/strongswan_5.3.2.bb | 24 +++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
index a231a90..df7b496 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.3.2.bb
@@ -14,21 +14,31 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "fab014be1477ef4ebf9a765e10f8802c"
 SRC_URI[sha256sum] = "a4a9bc8c4e42bdc4366a87a05a02bf9f425169a7ab0c6f4482d347e44acbf225"
 
-EXTRA_OECONF = "--enable-gmp \
-        --enable-openssl \
+EXTRA_OECONF = " \
         --without-lib-prefix \
 "
 
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ??= "sqlite3 curl \
+
+PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
         ${@base_contains('DISTRO_FEATURES', 'ldap', 'ldap', '', d)} \
 "
-PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,"
-PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,"
+PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,"
+PACKAGECONFIG[charon] = "--enable-charon,--disable-charon,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
-PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
+PACKAGECONFIG[gmp] = "--enable-gmp,--disable-gmp,gmp,"
+PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap,"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
+PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl,"
+PACKAGECONFIG[scep] = "--enable-scepclient,--disable-scepclient,"
+PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4,"
+PACKAGECONFIG[sqlite3] = "--enable-sqlite,--disable-sqlite,sqlite3,"
+PACKAGECONFIG[stroke] = "--enable-stroke,--disable-stroke,"
+PACKAGECONFIG[swanctl] = "--enable-swanctl,--disable-swanctl,,libgcc"
+
+# requires swanctl
+PACKAGECONFIG[systemd-charon] = "--enable-systemd,--disable-systemd,systemd,"
 
 inherit autotools systemd pkgconfig
 
@@ -42,4 +52,4 @@ FILES_${PN}-staticdev += "${libdir}/ipsec/*.a ${libdir}/ipsec/plugins/*.a"
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}-swanctl.service', '${BPN}.service', d)}"
-- 
1.9.1


