Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id E90F060ADF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 20:44:28 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z12so4965303wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 13:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gNpftL8qzHejFS3pvq3dt/W31dEyArvnEjzRgymD20A=;
	b=kdkFE6q8c1XPJLXsszAfxizO7/yCSa4cQ2lds18QKH0oXJNAgVhIxtp3Z8U+qVhAHj
	icXN9s29F8bSCVaX96evs6PfIh9i8HYqLxC6wHv3PRrjsYmx09OdSuNNYiU4c3rn+o3y
	15j/mH4BnSUK7ZjqpLoVnLdgc0g4rtL2leVtDEx6nurr/hHI+7ayZZNqw1C7lQho3Jg7
	JyKtNuR3rdNr5PmBCP4OacRkX4SX/gsVZNT0HFZ3uzXdhv8bvsh0sB9hiNJaGsU0yzkU
	L0Yr01IIFWpNrPHH7eIWSrOx2LKZcNQJKINqntT0wbaQlajyN0lkU67L4/NX+4DV4CDS
	YCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gNpftL8qzHejFS3pvq3dt/W31dEyArvnEjzRgymD20A=;
	b=iopf8IY7OXvl+8RblNyT2phWn9INAO35QFCFBeOboBlO9qWh+IFdFgYUaHEjUYie0g
	cR6daOpgIpzffFNYuREqzHH0dIrOKp2Cc+ZcTNRU1tm39tapFcHiI2wjb8AZxA7I3jPs
	jM4bR8Pp9PJUVTRaYkYaIf3sa6cDL2UR1L4fnH5r2Hyyclv8uiJhcbGFXtWbMev2U63O
	FnfVBZ3mXuBnvhGkgnek43+Fl+SlPKVH9yL6MnpLGbPlV0UfxMd3GbQtzyO90e9Rowo3
	e9cK8OByOkCfF41feY39NvVMub5lUvRRdhbBxrL0tkskEt31sK3ME+Qf54wIE0DTRacC
	cisQ==
X-Gm-Message-State: ANhLgQ0Z4R3m0f4TT/uuBuCrHJWdZ2wEwfia58XGzeVx0EvXKZLtndG1
	RQ+gvtds1op5Mx/4WrmfP3cra0m0ez8=
X-Google-Smtp-Source: ADFU+vsJHYuT+IPKa2llux3eZyptk5gBJYgC5t8+pbVB0QhQwP8GXyH+0qHYDaQOV8Tmua/ioDDd5Q==
X-Received: by 2002:a7b:c770:: with SMTP id x16mr6851122wmk.159.1584564268920; 
	Wed, 18 Mar 2020 13:44:28 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E8C3838FF9D0BB177A6DE.dip0.t-ipconnect.de.
	[2003:f0:7f0e:8c38:38ff:9d0b:b177:a6de])
	by smtp.gmail.com with ESMTPSA id
	j188sm3982590wmj.36.2020.03.18.13.44.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 13:44:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 21:44:09 +0100
Message-Id: <20200318204411.12996-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200318204411.12996-1-schnitzeltony@gmail.com>
References: <20200318204411.12996-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] networkmanager-openvpn: upgrade 1.8.10 -> 1.8.12
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
X-List-Received-Date: Wed, 18 Mar 2020 20:44:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:
=======================================================
NetworkManager-openvpn-1.8.12
Overview of changes since NetworkManager-openvpn-1.8.10
=======================================================

* The auth helper in external UI mode can now be run without a display
  server. Future nmcli version will utilize this for handling the
  secrets without a graphical desktop.
* libnm-glib compatibility (NetworkManager < 1.0) is disabled by default.
  It can be enabled by passing --with-libnm-glib to configure script.
  Nobody should need it by now. Users that still use this are encouraged
  to let us know before the libnm-glib support is removed for good.
* Add support for the following OpenVPN options: tls-version-min,
  tls-version-max, compress.
* Support inline CRL blobs during import.
* Allow option mssfix to be set to zero.
* Update Catalan, Czech, Danish, Dutch, Friulian, Hungarian,
  Indonesian, Italian, Polish, Serbian, Spanish, Swedish and Ukrainian
  translations.

[1] http://ftp.gnome.org/pub/gnome/sources/NetworkManager-openvpn/1.8/NetworkManager-openvpn-1.8.12.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...er-openvpn_1.8.10.bb => networkmanager-openvpn_1.8.12.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.8.10.bb => networkmanager-openvpn_1.8.12.bb} (85%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
similarity index 85%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
index 56db770b9..5e246a85b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.8.12.bb
@@ -10,8 +10,8 @@ inherit gnomebase useradd gettext systemd
 
 SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/NetworkManager-openvpn-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4dbbc103761facc7a61a1c00dfd55231"
-SRC_URI[sha256sum] = "af3cc86ba848d21b4ac807a09d575de11335ba4df8ce6fdb089212e77c2231ef"
+SRC_URI[md5sum] = "e8b1210011ece18d0278310fbff45af5"
+SRC_URI[sha256sum] = "0efda8878aaf0e6eb5071a053aea5d7f9d42aac097b3ff89e7cbc9233f815318"
 
 S = "${WORKDIR}/NetworkManager-openvpn-${PV}"
 
@@ -26,6 +26,7 @@ USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system nm-openvpn"
 
 FILES_${PN} += " \
+    ${datadir}/dbus-1 \
     ${libdir}/NetworkManager/*.so \
     ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
 "
-- 
2.21.1


