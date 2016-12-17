Return-Path: <joe@deserted.net>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9D0F277419
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:17 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id n68so4526844itn.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ouAX8PefsCwH2MPsZAnNHhGaoDQJsRW4XvqwoGik4Ec=;
	b=tUSRTVNdSKGlStU0gWEnDo/CTa/AK5DHSFix2xzjA6LVTaI0c20wQn5jCNDuRK4o3k
	CpFsQsA/sHTutXJ8ssvymu6HpwNmIvMnWtbH4Eq+3dCGhXxTk6zRWacMSimqFqgXp+L+
	cTiKE1MJwhAXXMgBRyfPWLIk8wEC5rd82Bs9oigjsqx4LSugnrgve8t1+bhjzNORn3Hx
	RuuDeAzYtLMhBuDrR8xNF+483NtLc8DFzSQxpHLoR4hxTjPSyfNCWMB6mOJn5YV9zPgb
	2Yr/BnIbuAMJ1psxdYt/DI07I7ktHHf/92plMjqTPUHEvmLGRupEuuFgqmCNS0XmjLct
	/ykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=ouAX8PefsCwH2MPsZAnNHhGaoDQJsRW4XvqwoGik4Ec=;
	b=uBPxK1Y2UsSPsGvZGg3ui/rTLQEQRrfWN4BZQOYmeEI7f1KVakTyfeTqESarNL5hXb
	8D5C3DfSqZZnZBHCoObWRln6pWmiI6UyhyWcpCJN0D2rrUbYDqn9mvva5r4sjuaN7YlW
	PzoGZO+tJCSiz0wV/356pXottN3+UPecGhw4Fl2Yo2kxIlkeY2uUmxsUTWNmNe2YqrT2
	SDOHBhv+DpRSDRWCOqxY6+S5idp0dCGWbXFOxhXsvSqtBTLfD7wjULczEcZ/iW/WYNKb
	T8r13mZSB1OQYNzaH2xToG98DQGESqRuBmyjb1ehKLpqRcDmufDsReofr48epM9hr1lS
	iAaA==
X-Gm-Message-State: AKaTC03w23qRRqPzM+RXEXOzxFBreWgF2/cQ3Yc+DAYvjD23P8jWsaDKg16PwKJiJ8NEPg==
X-Received: by 10.36.216.70 with SMTP id b67mr6042814itg.5.1481940918620;
	Fri, 16 Dec 2016 18:15:18 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:18 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:14 -0500
Message-Id: <1481940923-12914-3-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 02/11] samba: install systemd units and initscripts unconditionally
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:17 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Fixes hybrid systemd/sysvinit setups.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb       | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 783a7cd..aabc043 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -98,19 +98,18 @@ DISABLE_STATIC = ""
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 do_install_append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${systemd_system_unitdir}
-        install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
-        sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
-
-        install -d ${D}${sysconfdir}/tmpfiles.d
-        install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
-        echo "d ${localstatedir}/log/samba 0755 root root -" \
-            >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
-    elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
+    sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
+
+    install -d ${D}${sysconfdir}/tmpfiles.d
+    install -m644 packaging/systemd/samba.conf.tmp ${D}${sysconfdir}/tmpfiles.d/samba.conf
+    echo "d ${localstatedir}/log/samba 0755 root root -" \
+        >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
+    if ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
-    elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', d)}; then
+    else
         install -d ${D}${sysconfdir}/init.d
         install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
         sed -e 's,/opt/samba/bin,${sbindir},g' \
-- 
1.9.1


