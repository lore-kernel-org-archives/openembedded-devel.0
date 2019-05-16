Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id D026D7DF1D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 07:06:44 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id d18so2044485wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 00:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3SFZZ/gspQFUvJhJUFkE8MeAKr/n57wxdD4PEK6/Z8Y=;
	b=W2LnpEHgQIOQurVhptYBHBZaFW1667W2UyXLvArq38jXPZvPko+7bvnkliVB6Kn5ks
	mJCbKdsWf4bybH55PowPT19OZXVoW7jIr9DgJDwmrvQ84Iinfl1n5rHrOB6J/pkeYWu7
	eU9N5zM41JYg0u/m0o7P/JFS32Yjld+HIPNzLGkiaIeaf6WuSNQHhCuAykT2/fI0a8Ww
	F9koeNq1W2OKBaNcQuQ1adHdZq9NaihNVeYa4hS4SykwYmqkZPYcaxE+GNQA+su6jN02
	88V6XPby1nFB6flt0luHMTPRZAB2EtNPx+nAg3DFmUDwezah7PiIa7PambkSsLvB+ljy
	f5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3SFZZ/gspQFUvJhJUFkE8MeAKr/n57wxdD4PEK6/Z8Y=;
	b=LKpMCcIx1ZWc+Tj0uSD5I+qyWZ7ldM3zvbgvCJyOITZy2pVsoR3dRpEWW88EbUocAu
	RWp+FMtpaN3Pex7L78QdH/99p8y8ditTu+NIKuR4gBY3xta72B1oxRX/qLL8vzSZ30FS
	kk+3JJ8zQr39ODBXDfPk9XTXjF+Q36zOdH7f7KyzPNmj1j4Zuwoz/x3NQA36gsH2lUYq
	cqNgh/kclM9OAsUmuHfH3sId0nhSQdiXorj4IDoJ+ZGRZ8Bljx0anZJINKUTWbONdEXk
	M7TaN4jDBz9ZQzhGkehRKT/yroNiROiRdeODxmn+Gyt594k91Y77WwtMJeRsUD0Ex/H2
	oZjg==
X-Gm-Message-State: APjAAAVuxSdb3ubIjY+JnQamGjouLhpIxjGeLs9nn93lRfMEncojKbpo
	hrNo/IW0q02JyuciL/hHhah7Tq3h
X-Google-Smtp-Source: APXvYqzmMgqkYtC+80cf/ele5fieQVSJrThRQHFpzA+7J/tvt3wJ/IjaQoUjqNK8vot4PXHz56+ydg==
X-Received: by 2002:a5d:54d2:: with SMTP id x18mr29927781wrv.186.1557990405234;
	Thu, 16 May 2019 00:06:45 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	l127sm5668242wml.40.2019.05.16.00.06.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 00:06:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2019 07:06:44 +0000
Message-Id: <20190516070644.28384-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH] umip: make MACHINE_ARCH
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
X-List-Received-Date: Thu, 16 May 2019 07:06:45 -0000

* Depends on ipsec-tools which is already MACHINE_ARCH (and also RRECOMMENDS kernel modules)
* Fixes:
  ERROR: umip different signature for task do_configure.sigdata between hammerhead and mako
  Hash for dependent task umip/umip_1.0.bb.do_prepare_recipe_sysroot changed from 7c74a208880f6c8a5aa46b1c8577e39b6b71429d9a379ea75f17a155ca270035 to 87c6cd438dd9645c98530e3ac1094005bace785bfd89bfe4073bc8815926abba
  Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-networking/recipes-connectivity/umip/umip_1.0.bb.do_prepare_recipe_sysroot with hashes 7c74a208880f6c8a5aa46b1c8577e39b6b71429d9a379ea75f17a155ca270035 or 87c6cd438dd9645c98530e3ac1094005bace785bfd89bfe4073bc8815926abba

  bitbake-diffsigs /OE/build/luneos-master/webos-ports/tmp-glibc/sstate-diff/1557963509/[hm]*/*/umip/*do_prepare*.sigdata*
  Hash for dependent task ipsec-tools/ipsec-tools_0.8.2.bb.do_populate_sysroot changed from 1100c4984d88050bb7ca154445205bac3c3ab80c3ff0aa7c9124825c9d4f6e14 to feeddbd35a8106b264c98076e21d0b3cb227ab1d209e150926112b2906273ef4
  Unable to find matching sigdata for /OE/build/luneos-master/webos-ports/meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.2.bb.do_populate_sysroot with hashes 1100c4984d88050bb7ca154445205bac3c3ab80c3ff0aa7c9124825c9d4f6e14 or feeddbd35a8106b264c98076e21d0b3cb227ab1d209e150926112b2906273ef4

  as detected with:
  openembedded-core/scripts/sstate-diff-machines.sh --targets=world --tmpdir=tmp-glibc/ --analyze --machines="hammerhead mako qemux86"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/umip/umip_1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/umip/umip_1.0.bb b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
index e2abc02ce7..43367b5503 100644
--- a/meta-networking/recipes-connectivity/umip/umip_1.0.bb
+++ b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
@@ -20,6 +20,9 @@ SRC_URI = "git://git.umip.org/umip/umip.git \
            "
 SRCREV = "cbd441c5db719db554ff2b4fcb02fef88ae2f791"
 
+# Depends on ipsec-tools which is already MACHINE_ARCH (and also RRECOMMENDS kernel modules)
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--enable-vt"
-- 
2.17.1


