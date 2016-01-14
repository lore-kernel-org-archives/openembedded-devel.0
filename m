Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 68149731CF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:04:20 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id 77so18910338ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9B9z57j8zjgAr3OLPECT1hJiQXTaldsFp8rM2P3NX2c=;
	b=bj5GoVkcWShY7RNrikR3d8gl9IaU0j3P+aFaNs2SB9uskCGPTi9IUczF6Mjq0VtkZP
	iKeLN0CjTjVkkCi0cnmAb7pejzX2kLhMAOtuMcGDC1alYYZkmccYMUxWXOC7u7rNVDh8
	OQoR3SVHWg3X8MrbDZCdLx/wXbKaemfZyg2hGfBIcJh9ylOZSi1b7rGq/2e+bwQ8NZCi
	NXffXimb4rbQUI0ayepP6f+HPz3ceDpBqleWtlTIzGmA4bx3J9SLGTKRyDuLbCX/quTb
	gJ/tzlsvinXqFWZPgoDIUF70s4N9YXUidnybuKY3Wys/MzviGTufXxxypmIUy/PzP/Sw
	IsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9B9z57j8zjgAr3OLPECT1hJiQXTaldsFp8rM2P3NX2c=;
	b=jPUzj4FzTYqn8TIAS6I59A0oOopW83Tp/WtFT2f3IgaxcGZ+dlHG+luhEXnQZ4IAzD
	YUDpwQZAYJQEiszoHdWRNRlhtm7biJJR19z1RkpaahQ/T3VIFEza2bxphKBKuWF3gBHX
	zuj542qkg83Zp9PQoXJinMdDPv69r6dA9Kjfw6rvT0jjWUH7l9N2trKBopJ64tj4QwVE
	OzgmZiS4ezEQJYsb+4JAxsyfUkxMJH4U+gQHGhci65tuYh65/ZJwFW+Uqpe1Kd3O+B9v
	RgFxcr15tPYiZuZlYzoYBG1n8Q2kb/y475nrvp0oAeyX0qwe1W9wgDo9QKIlyOCV4KdD
	z2qA==
X-Gm-Message-State: ALoCoQn3wH3jrGPGw2bU6wVBiZYVMBguXVM4uDOqbOn0z9peNg4tTWcqBWz3qacl8kD0aiL8/Tw01K2YASBKLyzrJXmDPJQVSA==
X-Received: by 10.107.30.17 with SMTP id e17mr5031461ioe.160.1452805461390;
	Thu, 14 Jan 2016 13:04:21 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52])
	by smtp.gmail.com with ESMTPSA id 81sm3210754iod.31.2016.01.14.13.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 13:04:20 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jan 2016 15:03:36 -0600
Message-Id: <1452805416-22520-5-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <1452805416-22520-1-git-send-email-george.mccollister@gmail.com>
References: <1452805416-22520-1-git-send-email-george.mccollister@gmail.com>
Subject: [RFC][PATCH 4/4] networkmanager: use bash-completion.bbclass
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
X-List-Received-Date: Thu, 14 Jan 2016 21:04:21 -0000

Use bash-completion.bbclass to package bash completions.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
index c2b00ed..4660710 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
 
 DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt"
 
-inherit gnomebase gettext systemd bluetooth
+inherit gnomebase gettext systemd bluetooth bash-completion
 
 SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
@@ -56,7 +56,7 @@ PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,wireless-tools,wpa-sup
 PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
 PACKAGECONFIG[netconfig] = "--with-netconfig=yes,--with-netconfig=no"
 
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion \
+PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests \
   ${PN}-nmtui ${PN}-nmtui-doc \
   ${PN}-adsl \
 "
@@ -97,8 +97,6 @@ FILES_${PN}-tests = " \
     ${bindir}/nm-online \
 "
 
-FILES_${PN}-bash-completion = "${datadir}/bash-completion"
-
 FILES_${PN}-nmtui = " \
     ${bindir}/nmtui \
     ${bindir}/nmtui-edit \
-- 
2.4.5


