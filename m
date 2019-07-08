Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
	[209.85.167.41])
	by mail.openembedded.org (Postfix) with ESMTP id A9A5D7BE3C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 00:35:57 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id b17so6068278lff.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jul 2019 17:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=wwCFZFS+Y0X4lotRxV9mjNOkJFGG9skPNozRxCmMkDg=;
	b=EqyDptTjXKbTSUgb1u/dg7sgeFMRUtauRx1SXd6L0g6oYG80gJJx/LpdVFwIg2Gf57
	/c4z3l0kJp+U/Ehx8ONr/aFnLT7qN/UWGrP/K8Ebi2KVB5hgV4VzwzCWdaedqXOSzpIr
	CUG4pQuDlH0C17KkeVehkCc+gnlGbS6/Ou0hFOPNUFv8ccp7wF7vJdh0tK98LajLB+II
	F2RgFdPKnUXH65g3y9ETCjkjevZasrqLqoIcRmLXjVLRvLc7QUAeXtTESCOs/YIj0cMO
	lKrriZN/gyhZQzyYL3P0Jmp6aRDYeDIMZl2T1vfO+iEwRQftIk/manqfzbfRz2U4xcmf
	+EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wwCFZFS+Y0X4lotRxV9mjNOkJFGG9skPNozRxCmMkDg=;
	b=dQ7KgEaiMiYHC5lLcG4vOSyN81IjjqZXe4BHfmplXUIFw7m0mQJQUgUFY1bs+WFysv
	qZyK5y809jrK1QIIWm6PyCAC+jQJDTbwE+MDJ0oG1Cl3JzCpzqEweVOcR5vFjVHzPPRS
	uOK5zy1SAvoIMJjemaxo8rE0Q5ScrK/mNobdXp+cT9YKACEbAbLRBzU4quVgvNJ9cBOT
	TkBGx4CaOzyr65rwRi/gMd4+qGSj7u4KqZkQcVyR/aD1eXJxHrr+moB5H9KV5yBIvkay
	lVWRNiJPaMjU9i0sy/MhYmC1LxWLgQVcs39OgMKC6Q+w7SD9VB63qIMRn7xD/LnlSxCJ
	BznQ==
X-Gm-Message-State: APjAAAXCfQNn85hwoFLB+9m9qdhMNjCIEg4pLwONuwjd0ntBE32YZ4gf
	y3nnu2A//tWEF3knrgBYiBtO0DbDjek=
X-Google-Smtp-Source: APXvYqzlRwjeSMN2D8FLRsqyFYrFrg7H3uSizpwUfyKMkvQ9geImMjy8K1d3z+U+aybq6CBKrEJn9Q==
X-Received: by 2002:a19:641a:: with SMTP id y26mr6409499lfb.29.1562546157774; 
	Sun, 07 Jul 2019 17:35:57 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	d16sm2481083lfl.26.2019.07.07.17.35.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 07 Jul 2019 17:35:57 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2019 02:35:55 +0200
Message-Id: <20190708003555.8064-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] mosquitto: update to 1.6.3
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
X-List-Received-Date: Mon, 08 Jul 2019 00:35:58 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../mosquitto/{mosquitto_1.5.8.bb => mosquitto_1.6.3.bb} | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_1.5.8.bb => mosquitto_1.6.3.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.3.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.3.bb
index 768b5930f..0a2555747 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.8.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.6.3.bb
@@ -1,5 +1,7 @@
 SUMMARY = "Open source MQTT v3.1/3.1.1 implemention"
-DESCRIPTION = "Mosquitto is an open source (Eclipse licensed) message broker that implements the MQ Telemetry Transport protocol version 3.1 and 3.1.1. MQTT provides a lightweight method of carrying out messaging using a publish/subscribe model. "
+DESCRIPTION = "Mosquitto is an open source (Eclipse licensed) message broker that \
+implements the MQ Telemetry Transport protocol version 3.1 and 3.1.1. MQTT provides \
+a lightweight method of carrying out messaging using a publish/subscribe model. "
 HOMEPAGE = "http://mosquitto.org/"
 SECTION = "console/network"
 LICENSE = "EPL-1.0 | EDL-1.0"
@@ -14,8 +16,8 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
 "
 
-SRC_URI[md5sum] = "bbbcceb32db3657d9d436a8440a9db1c"
-SRC_URI[sha256sum] = "78d7e70c3794dc3a1d484b4f2f8d3addebe9c2da3f5a1cebe557f7d13beb0da4"
+SRC_URI[md5sum] = "bd19cf124459ee26040912786ef177f7"
+SRC_URI[sha256sum] = "9ef5cc75f4fe31d7bf50654ddf4728ad9e1ae2e5609a4b42ecbbcb4a209ed17e"
 
 inherit systemd update-rc.d useradd
 
@@ -66,6 +68,7 @@ PACKAGE_BEFORE_PN = "${PN}-examples"
 
 FILES_${PN} = "${sbindir}/mosquitto \
                ${bindir}/mosquitto_passwd \
+               ${bindir}/mosquitto_rr \
                ${sysconfdir}/mosquitto \
                ${sysconfdir}/init.d \
                ${systemd_unitdir}/system/mosquitto.service \
-- 
2.17.1


