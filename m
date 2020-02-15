Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 54E1761340
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 16:00:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s10so13071080wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Feb 2020 08:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aiAJr6qlZTWGu7pWqguz00qFqc+wfXWfQQqLukIOO0o=;
	b=ORdzxyP15KWAuhj7iJS/Z/di1aWC5DcCioyDbWYyYVqApRZ4YLKdw0GbgwNB9AHtTT
	H8b78ra1XvcDrCwokBRSI7kHL9q5F7tSKa91Qppvd75mSzsEUWTCxs6zclQVbFf6VvQb
	K/TrCEpRWTeMJBBijcA1kzuTPGX+0jcZ88gx5hfZy3nE7VpGAwycMauncDmiBVbtxX6o
	0lpwnZm/LKLcz35xL0pUun1I7OMUs8rcQZDk2EI4YEGaU4BSVCjWcS1yVqOy27UOhjwF
	b71Ygn2tsN2o2GSebTNECMTH7r2xyP0rI6EADQBLuCrTgnu+44e6NLYXynJBsEwgEC9k
	nIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aiAJr6qlZTWGu7pWqguz00qFqc+wfXWfQQqLukIOO0o=;
	b=MA1DiThNZbbHguIbzfj2ymB9n11MvD2+rnZex8WwHDaqcucSHHKwlrgGli/BPST4o3
	1TuLHK8lPqCbWS/TuUfpP4qRWWEq0u4SS1p+9aDrnwg+fA42Ur7TBj6c7feKWwbBb3DS
	YiNDgKd7sei3MawE8npYXJeDWOn0lRZkZHTruR4vh1PA12970yGFPT9ua/99BviBjdnl
	KYn8iPTx8uPkJWb5V3V1cbp4WyPhldSNA5ACNeHdwqk0dOgGd0PsUShYDtcNfxYvuKG3
	V1CUSxX7gHumnynAMJGYzGS5Dwnz5y2MLA9Yn8ERRq7n3KUb4A750jq3i37yygqQEqwG
	IOyA==
X-Gm-Message-State: APjAAAXb/m1VYVhgAZJmDZiw6CEzR/55041KnpUAMsNWx8jhX7JAFcca
	QRMYHzhooPpm2vHU/94vfwu+Csp/
X-Google-Smtp-Source: APXvYqz5LIbmsJjVTGEA5gniySbtuN+UmA17AsfmGGyTnJPdr/jCowuPTD/G/yjJYn/pK5U90m3U5Q==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr11230924wmf.75.1581782403671; 
	Sat, 15 Feb 2020 08:00:03 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
	[31.10.206.124]) by smtp.gmail.com with ESMTPSA id
	c9sm11666220wrq.44.2020.02.15.08.00.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 15 Feb 2020 08:00:03 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Feb 2020 16:59:35 +0100
Message-Id: <20200215155935.6255-3-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200215155935.6255-1-max.krummenacher@toradex.com>
References: <20200215155935.6255-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH 3/3] openconnect: use target path to script
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
X-List-Received-Date: Sat, 15 Feb 2020 16:00:03 -0000
Content-Transfer-Encoding: 8bit

openconnect puts the default absolute path to the vpnc-script into
its binary from the --with-vpnc-script configure options.
So do not prepend the value with the path to the OE sysroot.

RDEPEND on vpnc-script to have the script from vpnc installed on target.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 .../recipes-connectivity/openconnect/openconnect_8.03.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
index 974ff4547..597c1920c 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_8.03.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
 SRCREV = "ea73851969ae7a6ea54fdd2d2b8c94776af24b2a"
 
 DEPENDS = "vpnc libxml2 krb5 gettext-native"
-RDEPENDS_${PN} = "bash python3-core"
+RDEPENDS_${PN} = "bash python3-core vpnc-script"
 
 PACKAGECONFIG ??= "gnutls lz4 libproxy"
 
@@ -25,5 +25,5 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF += "--with-vpnc-script=${SYSROOT_DESTDIR}${sysconfdir}/vpnc/vpnc-script \
+EXTRA_OECONF += "--with-vpnc-script=${sysconfdir}/vpnc/vpnc-script \
                  --disable-static"
-- 
2.20.1


