Return-Path: <cjp256@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6EDE0731B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:49:46 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id c96so42847650qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DfJzGbrd6v3GSeLagDkBhPy0OmGmsnSzdJRCGSjQnTU=;
	b=yJH0wF9skgCyZmM1PKDou487M9fM+RT95mDiNEjoDgd5H1+e17dEHBEZv/cKe02emM
	tOE039sIqUCdXYLGFaLXTzyMXMtF1BZwhAdjXKEfFA1FOB+yU42a4QLjrZ5RVrH++pSX
	RlTn5xesYhkeRRfnLB3w+B1gLhinSWrFbOUc7nAQPz2xBe8p1z8fir57LJ0RdItL++hV
	2naUQddaXkuXQ+huC/js/3af6KaeYO1qhjOpAGnik+GGTMYfMpYBeLlTjLqMAG3rgOSH
	s/ARTz1aGi0/4RqEbLYR1tOX+CgvGKyyvVAEnz/PoEf/CVdXTek6s8wgGIzNuZRshwLq
	VfpA==
X-Received: by 10.140.37.100 with SMTP id q91mr7313996qgq.6.1450471787354;
	Fri, 18 Dec 2015 12:49:47 -0800 (PST)
Received: from roost.members.linode.com (chrispatterson.net. [66.175.209.160])
	by smtp.gmail.com with ESMTPSA id
	p101sm3032415qkp.36.2015.12.18.12.49.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Dec 2015 12:49:46 -0800 (PST)
From: Chris Patterson <cjp256@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Dec 2015 15:49:40 -0500
Message-Id: <1450471782-25731-1-git-send-email-cjp256@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Chris Patterson <pattersonc@ainfosec.com>
Subject: [meta-networking][PATCH 1/3] strongswan: add additional PACKAGECONFIG flags
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
X-List-Received-Date: Fri, 18 Dec 2015 20:49:49 -0000

From: Chris Patterson <pattersonc@ainfosec.com>

- Add aesni, charon, gmp, openssl, scep, stroke, swanctl, and
  systemd-charon.
- Organize the packageconfig list alphabetically.
- Update the default PACKAGECONFIG to match current defaults.
- If swanctl is enabled, use strongswan-swanctl.service instead of
  strongswan.service.

Signed-off-by: Chris Patterson <pattersonc@ainfosec.com>
---
 .../recipes-support/strongswan/strongswan_5.3.2.bb |   24 ++++++++++++++------
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
1.7.10.4


