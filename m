Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D83B74958
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 00:52:31 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id c7-v6so3014853plr.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Apr 2018 17:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=cZeC6Fd6m0EMwbk9nloSPfg4jua7i8T292S7YZHw+x4=;
	b=IhxgCFuk298cKwh4MQCVMSUoUyAWWBnpY/rVpESPudn1jQDkD2KUp0wrYVbRahGHNT
	DmmLmxLy1ahtR2uRFUbt16vF1dNUmYZzdyB0P4nf0yoLFnNwhHfhokg2JCjdhvuwmYqI
	TlqBpH7brJFhS7JQQlGXujg5mifkJAwCwQwYWQQtNchTjSoTKqxLh7O7hFkyawcnSmDT
	tv1YUTyEJuKKpFKjVLx4a6z/UYut1Gerjs1MC4XSid1D2YUBM6mvwklUkGwDNg0Zrr11
	8Bu4XEP/1QIDssVWTE4CHeLZQy/rRRYNPOoIJlMy6j1d/Xr2QWCLb4KAQydSisHzl5iB
	+/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cZeC6Fd6m0EMwbk9nloSPfg4jua7i8T292S7YZHw+x4=;
	b=re3BY/Rqrk9HmgNIO+bdQwQuLGidMNYv0atqipnBiafmN1uMwy68FFhAxO4cC9Bo21
	WBbCrO+MiGt2ikH7ankHbcryjFx7+1eZ0pzHFkg/jfnbdj2wpZtyDOQcnTQUm5y8vBMp
	8ePPcg1PMyImOPHLSNv6AyrElGo96DpCLFgCqv6ekqxoyjMl4WTajsmUIynn9WGK6gH+
	0TokskL5cYoy3K/pq/hHN+2BQT+GEm7GUuEV2Axz45jWSxyZKoxUs1VpQdY9aDMCU4CX
	fZVN2Z9Lz5npSsvadtPwvVAo9qJH/6uMZOTFFnC1bm9yNqQIisJo0A2llqJzEj9qAuet
	xzVw==
X-Gm-Message-State: AElRT7E+qrZgUReOSDxaAy7jV+ldUejJLu4gmuiIiMhdJurYfrhr6Zgq
	BMnB8fEiBDAkwLndmGpUaVdt1A==
X-Google-Smtp-Source: AIpwx4+NSPIM4jK/fGGOHvn/zxnhpP9Q7grnixREqWXlKWWvNp0Z3nEFy24MZ3raVVvmKvgpiHtIIA==
X-Received: by 2002:a17:902:7185:: with SMTP id
	b5-v6mr40875762pll.221.1523321552455; 
	Mon, 09 Apr 2018 17:52:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a81sm2584566pfc.168.2018.04.09.17.52.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Apr 2018 17:52:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Date: Mon,  9 Apr 2018 17:52:30 -0700
Message-Id: <1523321550-13037-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][V2][PATCH] libreport: add PACKCONFIG for gtk
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
X-List-Received-Date: Tue, 10 Apr 2018 00:52:31 -0000

needed when no X11 in DISTRO_FEATURES

[V2]
fix typo in PACKAGECONFIG

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/libreport/libreport_2.9.2.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
index 525437b..f2c661c 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.9.2.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://abrt.readthedocs.org/"
 LICENSE = "GPLv2+"
 DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
         json-c libtar libnewt libproxy rpm \
-        augeas satyr systemd gtk+3 \
+        augeas satyr systemd \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
@@ -26,6 +26,9 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 
 inherit gettext autotools python3native pkgconfig
 
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','x11','gtk','',d)}"
+PACKAGECONFIG[gtk] = "--with-gtk, --without-gtk, gtk+3,"
+
 RDEPENDS_python3-libreport += "${PN}"
 
 do_patch[prefuncs] += "do_gen_version"
-- 
2.7.4


