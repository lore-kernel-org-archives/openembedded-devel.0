Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id E7D2F7E7C9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jun 2019 21:50:10 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id p17so11010022ljg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jun 2019 14:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=rRu5vD1JZMw3jf8FeNO5kDd5viDU6W5wcKhCUAvq1oo=;
	b=oiYp9+MfCtBKzhf1S19XfbSl//pQNhP4mlp7BYEK93/+E7RY96q737GOpskYb5zuzE
	kvthSB+x30hp5KDThNPYJMWoW/1XoIi2+eKZfDCfltcdJMZ7tTjEsR6vZwh1fUPOCwj2
	v8h5oLSiYMx2ngUd+mtp1fM5is72ehr/N+8vBHOzCbE0S/iUReueBZE5wO34nL7dVKxO
	INs4qDw6ZOVdiH9uLAb9tdA33fOJ90HZariZoL5dJ6h7IBHJ50dp3TWJSsZ1i2/N8yJn
	AkDBRXulxfWHB7pl5v27B3frJY/WUlsILDbVXVvEoeDum32ioc0ZCGC4CB7lAIKg0s6Z
	BSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rRu5vD1JZMw3jf8FeNO5kDd5viDU6W5wcKhCUAvq1oo=;
	b=AaxH/ssgDGGZ8hn/Q0rAqlVlnwojDc+UD3DPX5YrUsZ+V0OjmDAcR1aFJoQPINUJk9
	lJfoaFqOCPkknI8PU2j6ywKqaYJ/VCAO767H9e15PH8yTiZbnOa5b+giX0iSN/cM2FTY
	JVkllklPGEe+ECKCaJ6Aa6SYbUQ+Z4ZFyx+4fJLHH9cfmTxxRj/N4Ywn8SluNR+ZPn5w
	sSkLGu1jqO9Lh1yX+Gst7IdHdxYlmRgBtlXulNULh9ZOUhbP+3Fj0nYJMIFoCrq1OSZd
	hQiAIGaHWd09C6jnRjCJTllOrJiJgmj4SlGb0tSU0wi8EnelIO80CJenyfH6TJq73ldJ
	POlg==
X-Gm-Message-State: APjAAAUTf65T02vhkCChhhx/CDHNQ1eJmhI3HjPacBEtfeh3eigwo20o
	9Do7RIE77z6VRtBerVH5FgDCQcusjNE=
X-Google-Smtp-Source: APXvYqxeYJNOMWbJC7wiIVpqpCa4WAV2qWLwmsYF2z6G9nBp5v+9pSo2Ity/RzMGHgOb0vmFtTohRg==
X-Received: by 2002:a2e:9a58:: with SMTP id k24mr12053416ljj.165.1561931411050;
	Sun, 30 Jun 2019 14:50:11 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id q6sm2937483lji.70.2019.06.30.14.50.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 14:50:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Jun 2019 23:50:07 +0200
Message-Id: <20190630215007.13328-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] sethdlc: set PV in filename
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
X-List-Received-Date: Sun, 30 Jun 2019 21:50:11 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../sethdlc/{sethdlc.bb => sethdlc_1.18.bb}                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/sethdlc/{sethdlc.bb => sethdlc_1.18.bb} (94%)

diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
similarity index 94%
rename from meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
rename to meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
index fc304fae7..fa9399310 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc_1.18.bb
@@ -5,14 +5,14 @@ LICENSE = "GPLv2 & GPLv2+ "
 LIC_FILES_CHKSUM = "file://sethdlc.c;endline=10;md5=90f936879e9f8b755a138aeb348782eb"
 
 
-SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18.tar.gz \
+SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-${PV}.tar.gz \
            file://sethdlc-fix-host-contamination.patch \
 "
 SRC_URI[md5sum] = "9016878156a5eadb06c0bae71cc5c9ab"
 SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6ab6b04e"
 
 
-S = "${WORKDIR}/${BPN}-1.18"
+S = "${WORKDIR}/${BPN}-${PV}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "virtual/kernel"
-- 
2.17.1


