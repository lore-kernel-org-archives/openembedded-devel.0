Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id C51A861299
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 16:00:01 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t23so13070499wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 08:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P/3p6Cs0qJ/vkeM4sYdF0s4YhTk+JbWJ6dF0mDj4o3w=;
	b=f4H3w6RwI2ZHbM/KPZKLz+PRlwYhQ2Yr80AQRoDyNIw1xL5cWHnUHOXPeMS+jGWXtU
	Ze/fFWK5TgOxMd9GwUCGyQuiwVhSUHtFgdvEtRh9y/QnqtvDN2mbkV+8BvvtS/JnDJvL
	Oq5VTeFlX7pMNXZDZuvKf4AwQTdNOr4UGr+rzSUP1YezbjIHvjD2Fur/hLpfLKeIR78P
	SWs3ORf4MpPrKPqPhS02VWvHyLDnYFLlEmSWou0H7FXyRdo0HOl4aQGbuKv8TEd02mgz
	16KJRG84kopgme0cz+85N/Yc+xJejseMrpzHxOWhL1i/CcmrnKyinC36RdW/vnIHecH5
	ZKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=P/3p6Cs0qJ/vkeM4sYdF0s4YhTk+JbWJ6dF0mDj4o3w=;
	b=qklFuSNKoKUfAiTJBpeVpuke/NQ6jOkr9tIW7TCKlFA4xEgjgf/JYq6VULlC+T8yk1
	S4DHZgpvE2yDuAgELnHLV8xQah/a7Uqrc+rfrW9gJ4L4skQItdXEOE9k9F9++FQSzWzH
	ePEUKnyTkBONgXVg5UWKX6JjkSGPUSTcyhZ12aRotuJsO8aR6DjE3Ui4zDaL5FU5xIcM
	Ocm4US0Dlbh+3zL5t5uHQIV16BEkuwlcszgmYRoNgfJQEo4h4ek1g0LeOl/afRKX9Wm7
	ue7mpp3vKxC+ucNmC5GkhievLB3/HS+6lQsVAqbW7WFYwdyzvjNCSu1KHrD1pkUmL3S8
	4BGg==
X-Gm-Message-State: APjAAAWeRqH5+J0dXUJkFjLX+1binZbrVkdPJF4S8Ht01I0D8KL/+lIm
	xa8V6RzOg6SJWxPAzwkI6XnlNP9m
X-Google-Smtp-Source: APXvYqyOv8aGk+dqbH/KMSOW7LpGpAkWTEgT0gIV/Aermvj63k0DCMg5CUyHLF5g+OOrdunl8ObxiQ==
X-Received: by 2002:a05:600c:d6:: with SMTP id
	u22mr11601300wmm.77.1581782402177; 
	Sat, 15 Feb 2020 08:00:02 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
	[31.10.206.124]) by smtp.gmail.com with ESMTPSA id
	c9sm11666220wrq.44.2020.02.15.08.00.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 08:00:01 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 16:59:33 +0100
Message-Id: <20200215155935.6255-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 1/3] vpnc: splitout the vpnc-script into its own package
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
X-List-Received-Date: Sat, 15 Feb 2020 16:00:02 -0000
Content-Transfer-Encoding: 8bit

The vpnc-script can be used unchanged with the openconnect package. Provide
it in its own package and make vpnc RDEPEND on it.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index ea2179985..54e855a09 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -28,6 +28,8 @@ PACKAGECONFIG ?= "gnutls"
 PACKAGECONFIG[gnutls] = ",,gnutls"
 PACKAGECONFIG[openssl] = ",,openssl"
 
+PACKAGES =+ "${PN}-script"
+
 S = "${WORKDIR}/git"
 
 inherit perlnative pkgconfig
@@ -54,6 +56,8 @@ vpnc_sysroot_preprocess () {
     install -m 755 ${D}${sysconfdir}/vpnc/vpnc-script ${SYSROOT_DESTDIR}${sysconfdir}/vpnc
 }
 
+FILES_${PN}-script = "${sysconfdir}/vpnc/vpnc-script"
+
 CONFFILES_${PN} = "${sysconfdir}/vpnc/default.conf"
-RDEPENDS_${PN} = "perl-module-io-file"
+RDEPENDS_${PN} = "perl-module-io-file ${PN}-script"
 RRECOMMENDS_${PN} = "kernel-module-tun"
-- 
2.20.1


