Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 672EC7264C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:21 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so14797185pad.38
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=d9hgd3WY+6AFN8LFZRUpmu9RqbOkIGwCZwkdPo3i2dY=;
	b=vwkv7MndExrBnzbzsKY60Tv9fAr6rSRUVKMpBUiY7FWTd668EjycOcplkrr6lvXFEg
	0luRwoGR6l4ob0MBGSQP7mV3DqaG/vjJlDwIbdHqvR+tN2ktluqHOhaLWnpiqwkElIsG
	5ijZIxTyYlpSZ6TS/dRQVAvs3kA6mzIczSEuUBexCE8AnZ76Piavx0Q53ySL7s02AoNH
	khHhkWbeZJB2921fYbrj9S0yezOVh9zJwkZiwpc96e1bQDbFgx2Ks0o24I0vhji1EygP
	zxngg/SsXz4dII4ycXl+BrymoEiMsnuO6THRRWbRAn/SLiFxaqrs+vvkFf6Q69rsfmkY
	sfRA==
X-Received: by 10.70.31.197 with SMTP id c5mr50236426pdi.93.1419700942730;
	Sat, 27 Dec 2014 09:22:22 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:52 -0800
Message-Id: <e324dd37cfc2f89eb9d392dac700416cd281db2c.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 05/27] samba: fix error messages when startup samba service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Dec 2014 17:22:23 -0000

From: "Chong.Lu@windriver.com" <Chong.Lu@windriver.com>

This solves the following error messages when startup samba:

  Unable to open new log file '/var/log/samba/log.smbd': No such file or directory

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 4392821..68e1b1f 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -35,7 +35,7 @@ EXTRA_OECONF='--disable-cups \
               --with-privatedir=${sysconfdir}/samba/private \
               --with-lockdir=${localstatedir}/lock \
               --with-piddir=${localstatedir}/run \
-              --with-logfilebase=${localstatedir}/log \
+              --with-logfilebase=${localstatedir}/log/samba \
               --libdir=${libdir} \
               --with-mandir=${mandir} \
               --with-swatdir=${datadir}/swat \
@@ -123,6 +123,12 @@ do_install_append() {
     sed -e 's,@BASE_BINDIR@,${base_bindir},g' \
         -e 's,@SBINDIR@,${sbindir},g' \
         -i ${D}${systemd_unitdir}/system/*.service
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+	install -d ${D}${sysconfdir}/tmpfiles.d
+	echo "d ${localstatedir}/log/samba 0755 root root -" \
+            > ${D}${sysconfdir}/tmpfiles.d/99-${BPN}.conf
+    fi
 }
 
 DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-systemctl-native', '', d)}"
-- 
1.9.1


