Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 68909745EF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 03:04:21 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id l27so6481237pfk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 20:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=uO+3VKE6pOAxskBZ6YiwLL/ETqjyajAD6QhfhY3jfXE=;
	b=nkFTu53DuMMRpYpp1bTxyPrcer5QqeDyvd97U4sI3JfI5JI9Fn1OzqBhJ8zoMYi1Ct
	IzZqg9aRGiORhGYycRCEjwtNMrOo08MPsiUqBI+YtVjDdquf2nVSzEgCViXirqisWpMa
	L4yVHSYXSX5j7noojyRDiqDB/eSdiq6bUVa/RO17JGMnVGrxkV2DUKgUOL69k2pj4ju9
	3pRa1JihfjgI8qqeSGwundga03zDZoWiUK6nqUGyUeilU+FBKdNuEUFex/8KR/zjY0IG
	XKbVNoXSJQTaLQK9MM5j7jQ0/5z+g9Fh4+5hxFsTMqCOMNx2CJPDIpm0LGWL34fhAfZK
	4H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uO+3VKE6pOAxskBZ6YiwLL/ETqjyajAD6QhfhY3jfXE=;
	b=d8OAB5Tn9leuMOsSoaJpgAbVzdKwlgrYiKFJUoC9xy+ua7hxZAVXn+djptm5TuJt5/
	eOfiSjwMa2lmcpzl56wSH+hkgcwlyVnXnmgWmGQGQIhQ32/Ab8q2H//af9R96JCfTJ58
	LsmmlfhCIbPoiKWO+Ah7TRq5GdEtFD9um20TrLwzjj0N0uHqT5ayx5WdVoYAf38H7iu8
	D4P6toIFbT4v0HK9c0SW8zzTZb5Y8wh91HfQ062nB9dWx3Qt0E2VxLknEaC0A/GwMSbY
	jAlGH08Q0s73+NBPwo5FgaA0urNIeKfshpFcz0o8pGfqJx79fQoafFVdb8kg2llfm4QP
	tFbw==
X-Gm-Message-State: AElRT7FtKj9JbDJD9UUKfw4/VFShx6tYxroy7sGj7v4U/GkktegCSn98
	y1ZTvegVccJuw5v/hfxmvJE=
X-Google-Smtp-Source: AIpwx4+Nc6H2j3HJZj85IwSE93N5WJilC21Jy06N+an9YpFmlKMsO7tVubkEFHGNaj6qoWyva/qcsg==
X-Received: by 10.99.102.132 with SMTP id a126mr884506pgc.385.1522465462991;
	Fri, 30 Mar 2018 20:04:22 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:7cbf:a2a0:bed1:4628])
	by smtp.gmail.com with ESMTPSA id
	b65sm21655159pfl.145.2018.03.30.20.04.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Mar 2018 20:04:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 20:04:21 -0700
Message-Id: <1522465461-19511-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] networkmanager: Fix many typos in DISTRO_FEATURES PACKAGECONFIG decodes
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
X-List-Received-Date: Sat, 31 Mar 2018 03:04:22 -0000

fixes issues found with yocto-check-layer

 File "/home/akuster/oss/maint/openembedded-core/bitbake/lib/bb/data_smart.py", line 436, in DataSmart.expand(s="nss ifupdown netconfig dhclient dnsmasq     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '', d)} ", varname='PACKAGECONFIG'):
         def expand(self, s, varname = None):
    >        return self.expandWithRefs(s, varname).value

  File "/home/akuster/oss/maint/openembedded-core/bitbake/lib/bb/data_smart.py", line 426, in DataSmart.expandWithRefs(s="nss ifupdown netconfig dhclient dnsmasq     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '', d)} ", varname='PACKAGECONFIG'):
                 except Exception as exc:
    >                raise ExpansionError(varname, s, exc) from exc

bb.data_smart.ExpansionError: Failure expanding variable PACKAGECONFIG, expression was nss ifupdown netconfig dhclient dnsmasq     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)}     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', '', d)}  which triggered exception TypeError: contains() missing 1 required positional argument: 'd'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.10.6.bb   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
index f201a75..d90b782 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
@@ -59,11 +59,12 @@ do_compile_prepend() {
 }
 
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'wifi', '', d)} \
 "
+
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
     --without-systemdsystemunitdir, \
-- 
2.7.4


