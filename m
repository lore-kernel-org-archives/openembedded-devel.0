Return-Path: <joe@deserted.net>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 025B077433
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:25 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id f73so13707054ioe.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9o0l+Zady5hcueEWdYA0Ve8jQ0FwNk4YCJI5LvcyWwI=;
	b=qmt/9ebjQGV84FUTUlWIqA6M5v/Jhy0wGYICBXgg6at0W32PbNVO4E3+WbelVtVPCo
	zLQghaWJRddRxH+KiO5KJu3gBNX2sgqKGMHYt2N0DItaExNBw+74TCzByj7BFOxzvhn/
	g7nc+X+ULUwVcY0JYiAxCJJaorBxRW08jYJz8iFi/WDrmTGdVMU3IOlbHnsCA8/tOotd
	ugyGb/5TTwH/EnORX1UQz5UQGoDLLwTkYse2SYiYC5DSFz6SzREOIeKvVbOyquq1ssvj
	L43+683+CdPeHiAM78M9GdIfFW6sDznG0MaylA4khId7KY6xm6tWB3BbGQvL0bwzbizm
	WZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=9o0l+Zady5hcueEWdYA0Ve8jQ0FwNk4YCJI5LvcyWwI=;
	b=gKR3FV71KRBMdvMvbRdfw3fllLdKy4b484gA5DRQ59kCFkIzQjpFsAeiUAfc9Ery4Y
	kN9E0jkEIb02hiBdzB4Y8iS82m4+A2kDwSpsdDW/su4duLmNU4rlxkMkUdAZLldRdgEC
	3eKYay9qbJs/ucsCKNQGgPMCF+8v458aj8EVJUdMTjqWssFqzRtbezeRk+FThN68ol5D
	MnjKWixfa+nvserSv+IM/ri9EwcKEZ/mLmA2r+kJtFyOBDubqSPFq3xzzdQD/ArwcPB3
	1EvohSRV3aXnS3C80D0aT3WiTJpFy5f83oghJ9ZowzrYx59NFFLda8LV16GzeEXHlC0R
	pbqA==
X-Gm-Message-State: AIkVDXJ/EXkgGJbe0wrhgBagcR48VPcl7MOqQ1J8ESKTjVB49sh6zcMKVZI8u2CofJvAGQ==
X-Received: by 10.107.172.134 with SMTP id v128mr6629681ioe.49.1481940926668; 
	Fri, 16 Dec 2016 18:15:26 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:26 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:23 -0500
Message-Id: <1481940923-12914-12-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 11/11] samba: simplify LSB handling
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:25 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index eb3038d..a126ac9 100644
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
@@ -120,7 +117,7 @@ do_install_append() {
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


