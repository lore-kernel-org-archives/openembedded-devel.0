Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 04FAC605DE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 20:44:23 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 6so5034914wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 13:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ew8+3NPsGKWemu5xBTNIsHm+GpnoqKRjp+gLSmgsX8A=;
	b=NwvzBYL9LFg0n/Z0AHtgREnbGtw9hNxiP9HLie4F3LzAO3e2mjBrGqBZWMLVmBP2UY
	x9DxYffLTMGlLANSpQV77ZB+YzvhQ2PKobuXB1Tcr7iMcrza9hvZ0tWeYQ6g1FhbML1e
	uApiew5tVuWXTp7j4NFQjeYPoYnri12wsXjZ1ivxiGb5TazG1LRxnnXDHAenNUlBFUn4
	cfRBdygNZFfIE3DtUYpYRxuJiNgjorxjI0TgJiYnKZ5ow7DKzj/Vew/dJ9j4Pgok25fq
	Lz+VxjNRU1B3mzVz9G0LxPVBS1cs+uNYbQWHqdM0AiPecnmdC85WWZiiZvR8ri/i7ZuH
	2JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Ew8+3NPsGKWemu5xBTNIsHm+GpnoqKRjp+gLSmgsX8A=;
	b=W0/026/sNhNqbNq7rnR/FRq+dF2e319/Mw2vpskIQKaOtJVV5EMn86ffIrxU5IFxQU
	EVYFAbKXUch18sddxVtJB8SEKZ8N95VPpdk6lxklZeNcKb3U85ud/wab97cbzYGJwlIa
	re9+xLpO/Wsd4Rmwq8RX3Xq5Whu4g9Gn3KpLkR86V5CvgFj30EcMrZYsMFOe5qvRIiiy
	i2wrO1m47qlntQRA50P6QBOiev6b7thyVT9S5srVaTiSWqx6NJ0oJOP6cfSWspX0CQ5i
	2X4HI30K13KqduUg83v42f2Qg1+FRO0goDnEsPZjMkWl2l1pZdEhR6UQNsuvkHSgaUeM
	5UlQ==
X-Gm-Message-State: ANhLgQ05/J8o81ePCM814kpuPDTifzpbfwuXJS9Gno58/2fRPm1qyAr5
	lEhnNWrPrD83baC/fBXThecm8wacNgg=
X-Google-Smtp-Source: ADFU+vuA5NJv0nStPq3HcBmXnoiNgvVohOKkQtWPkv+zvEWk454qp0IUfwitoHkpe6Y/EulbD2GT4Q==
X-Received: by 2002:a7b:cc72:: with SMTP id n18mr5713389wmj.187.1584564264231; 
	Wed, 18 Mar 2020 13:44:24 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E8C3838FF9D0BB177A6DE.dip0.t-ipconnect.de.
	[2003:f0:7f0e:8c38:38ff:9d0b:b177:a6de])
	by smtp.gmail.com with ESMTPSA id
	j188sm3982590wmj.36.2020.03.18.13.44.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 13:44:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 21:44:07 +0100
Message-Id: <20200318204411.12996-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Subject: [PATCH 1/5] libnma: initial add 1.8.28
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
X-List-Received-Date: Wed, 18 Mar 2020 20:44:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With upcoming network-manager-applet 1.16 this library gets mandatory: GNOME
splitted out common code from network-manager-applet to libnma.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libnma/libnma_1.8.28.bb                    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
new file mode 100644
index 000000000..de5ad0863
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.28.bb
@@ -0,0 +1,18 @@
+SUMMARY = "NetworkManager GUI library"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "glib-2.0 networkmanager"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase gobject-introspection gtk-doc gettext vala
+
+SRC_URI[archive.md5sum] = "094c45d7694b153612cbdc3c713edcb5"
+SRC_URI[archive.sha256sum] = "4af69552d131a3b2b8b6a2df584044258bf588448dcdb4bddfa12a07c134b726"
+
+PACKAGECONFIG ?= "gcr iso_codes mobile_broadband_provider_info"
+PACKAGECONFIG[gcr] = "-Dgcr=true,-Dgcr=false,gcr"
+PACKAGECONFIG[iso_codes] = "-Diso_codes=true,-Diso_codes=false,iso-codes,iso-codes"
+PACKAGECONFIG[mobile_broadband_provider_info] = "-Dmobile_broadband_provider_info=true,-Dmobile_broadband_provider_info=false,mobile-broadband-provider-info,mobile-broadband-provider-info"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.21.1


