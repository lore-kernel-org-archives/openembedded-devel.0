Return-Path: <marc.ferland@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id F0E4C7BFE6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 19:57:08 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id y16so4834344qki.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2019 11:57:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rLlDgjcj15OlypQP742o7p3sowTIzEUmroAHUVDlyXE=;
	b=e0vJvvV/0yLImDhdgQGS5Nr09X1Lpm/a16H8Q7tnHHSfjO54PqsakI43e0nE0NORDX
	odTfEmF6mfZU8En5766FxGZhVFqzIouvxo288NangflgeNUS9XxkMHmn0dMkYI0ZC1Yw
	9NrzoGCNlpgO4B1cY4kewR8koZPyc+LMjVMbCzebAagaffEEv3Qxd3CIL1/PMb7cT6c9
	4Dcu82lRiwW1D3U1KOjULyywY0j4A2lO7JY9kEHxu9QmGJkgukvgiq//rxCBiTwJHjhy
	359IeKXybxLTimt0aq/R9JifIA6LfJTnnQIIniwuZXBFpACfMtItWjAbxPD9Ws0X4uib
	JkoQ==
X-Gm-Message-State: AHQUAuZJYhizVfeYGeU3tc9+9tzWgMXoySl4fb5cSDrDA5RVzFaLL9Mg
	RZY4ENLIA/Ov6+uEkWcTRK+m6ZQr
X-Google-Smtp-Source: AHgI3Ibka+Y880MVRoraddiVihPcJs/UZbluddzJDI8DQD/85eiG30f+m8xRf/y3cFXWNoe26zSsXg==
X-Received: by 2002:a37:9b41:: with SMTP id d62mr9550186qke.215.1549051029656; 
	Fri, 01 Feb 2019 11:57:09 -0800 (PST)
Received: from mfe-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.googlemail.com with ESMTPSA id
	e4sm13014789qka.31.2019.02.01.11.57.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 11:57:08 -0800 (PST)
From: ferlandm@amotus.ca
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:56:24 -0500
Message-Id: <20190201195624.16760-1-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] networkmanager: fix QA issue when using modemmanager and ppp in PACKAGECONFIG
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
X-List-Received-Date: Fri, 01 Feb 2019 19:57:09 -0000

From: Marc Ferland <ferlandm@amotus.ca>

Got the following error when I activated both ppp and modemmanager
options:

ERROR: networkmanager-1.14.4-r0 do_package: QA Issue: networkmanager: Files/directories were installed but not shipped in any package:
  /usr/lib/pppd/2.4.5/nm-pppd-plugin.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.14.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
index f1826c68e..26c40a5fe 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
@@ -110,6 +110,7 @@ FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${noarch_base_libdir}/udev/* \
     ${systemd_unitdir}/system \
+    ${libdir}/pppd \
 "
 
 RRECOMMENDS_${PN} += "iptables \
-- 
2.17.1


