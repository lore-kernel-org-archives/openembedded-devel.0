Return-Path: <joe@deserted.net>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id C24087745B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:55 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id n68so5898604itn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n5+HBClPIXk6vadYNyLPDqk1gVlLXU7VOL3QvPsxaRo=;
	b=Y2IX43AfbmiPCCf5N0HvSRA5/eNqFroEHK0andje+k1wPnrYjhvPF1VgDjPg04k20g
	17TZaxKEsGjb2xwbL5RKCgFQHWqvUFTnd5gW2olubL1xpVrYDqxlZld9bnwJMgOvmufC
	xXLuBduT9BYXKUTrEpjLOjKBLLl8YeZXe511I2D6idjwPvN0XQa/dNrHeGuQDocLyyvP
	AAvtBrZx66Ipe1B5oRZvx/ME+8mDirmunaoVJos6J+blRImGieIf1LflSAdyMTtYIOJ/
	SRB4E6Ld55B+9CXcxCaH0TeKHwpsH/J6JXn5Rac1RCtPy4KjmAY7Wr5l+fG1pQHpSlf+
	OB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=n5+HBClPIXk6vadYNyLPDqk1gVlLXU7VOL3QvPsxaRo=;
	b=rDKJhk4JlVa/db7UQ2ZPxjkrde40k7je5Pws3H6V0HP9NyE4utowb/g6ngd6Tj9Ry1
	wby7V+zDSZhwa+Q0U2wDNpdGTAo7yBPgiFAZZPv9x/ydTY31YN8O0uKcyDmxbXxMG/hU
	daAOrIwKOx52Wrh0JMU7EliWZhmTQHLBHuRs1l1ZRloE+Mr15e2y0k8Gk3tT/jLPjY0z
	BWUj6tUYbIaXzeorb6nL/Ytvr4A8lHItNdx7ec+Z6DpZFoZhJfNDM1E4tBR3FlaQJNR5
	dzG9qusUPY73yH+0Ys4z0FhGhTNmNA1wTb8+v2nz2IdTgUPHpwh0kRL2XVfu7gT9WR+N
	gojA==
X-Gm-Message-State: AKaTC03X7LSx+4TCuNSjrSSepBUSYWz7EABJFOeRnMH1Hpfld4v5sgzt+KhvEBcFX+6lUA==
X-Received: by 10.36.175.82 with SMTP id l18mr9528971iti.113.1481990697255;
	Sat, 17 Dec 2016 08:04:57 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:56 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:58 -0500
Message-Id: <1481990698-15962-11-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 10/10] samba: simplify LSB handling
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
X-List-Received-Date: Sat, 17 Dec 2016 16:04:56 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 804a4d2..c2436af 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -38,8 +38,8 @@ DEPENDS_append_libc-musl = " libtirpc"
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
 LDFLAGS_append_libc-musl = " -ltirpc"
 
-SYSVINITTYPE_linuxstdbase = "lsb"
-SYSVINITTYPE = "sysv"
+LSB = ""
+LSB_linuxstdbase = "lsb"
 
 INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
@@ -48,19 +48,16 @@ SYSTEMD_PACKAGES = "${PN}-base winbind"
 SYSTEMD_SERVICE_${PN}-base = "nmb.service smb.service"
 SYSTEMD_SERVICE_winbind = "winbind.service"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'zeroconf', '', d)} \
                    acl cups ldap \
 "
 
-RDEPENDS_${PN}-base += "${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'lsb', '', d)}"
+RDEPENDS_${PN}-base += "${LSB}"
 RDEPENDS_${PN}-ctdb-tests += "bash util-linux-getopt"
 
 PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
-PACKAGECONFIG[lsb] = ",,lsb"
-PACKAGECONFIG[sysv] = ",,sysvinit"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[sasl] = ",,cyrus-sasl"
@@ -121,7 +118,7 @@ do_install_append() {
     install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
     echo "d ${localstatedir}/log/samba 0755 root root -" \
         >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
-    if ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
+    if [ "${LSB}" = "lsb" ]; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
     else
-- 
1.9.1


