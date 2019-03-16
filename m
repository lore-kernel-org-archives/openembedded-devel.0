Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 978E07BFB3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 20:43:44 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id t13so10801386lji.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 13:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=jksSY31wdpxe3T/juNxfXT1FZ69rnJ/meo1jTZaT4VI=;
	b=qBETAnP3KA6FWcOkElyaXKk/Y+M3Idl08F4KicVeHNtDZh0ZF3mS2rQo3QedvCKpFn
	hJMapX/O6dl6/+YOIjIB0Ch68w5wPvf5uE4RCrkUHfGUzJ1Hwf4LKborIiMEubuFQ9d5
	iEA19m8mIHQjXTVpzUIo76QFrWUs1ksTndGGW2biZ12V2kw/w+bHLFjTZviTj1JX4H3a
	dIxX+qdhJs4z8YcoCMja9UK5+OVg2jMu3jnuj1Jd/08UUDTrdaEDZ4JXUJ6dgwjN0R1F
	7XOQGGvjV7cEOm+zpsGHUTemI37VGvjFaUcuS/zBo2yYxvF/idVexQX5cjzy3CVj7ysK
	vYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jksSY31wdpxe3T/juNxfXT1FZ69rnJ/meo1jTZaT4VI=;
	b=n4E5td3YaId4mu/5E6vCdKur7Lmr/jcueo9/ysZ8F+K3Sq5Buk77cIFv43Me3EJqXq
	z5V1TtYzvt329c/iYva/wkjGn8qgRYiM5a+xxKQDChTTc1azR5GUxz/Xs5vujucy70iZ
	9K8enMcHVEM8wvgtOI7WXLtbMhxKBAS8eF+U5AhBiUlL1eqpb6/oskNYOcM4i8v/E1f3
	wku+1PT+DKH4nPLQPdV+TCLov2/+FiH+aze9nEpXH83Cb+ZnSfz+zbN7v4/u5b3VXnMo
	PCmPjxa9Rf1rJaDBDq036Fy/LigC6Gk/l3cDxhTqruBfuvcW6KTIlFFTSa8e95r+Y4Ru
	3I6Q==
X-Gm-Message-State: APjAAAU0Nv8sR1QxtPczAbAjmh/5zm/YNopFUaBljveJhkzJFJRTbMtG
	+CUc8kdtntFNuQhXsKqsCapprj3167s=
X-Google-Smtp-Source: APXvYqxJIynbXQPjRMI78VDUm9zK1v/uuRcistKmbOwTGDnAradDaI51kUZRFox8kq3udJzAMnlIcA==
X-Received: by 2002:a2e:240a:: with SMTP id k10mr5997400ljk.31.1552769024953; 
	Sat, 16 Mar 2019 13:43:44 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id h26sm1152834ljf.5.2019.03.16.13.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 13:43:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 21:43:42 +0100
Message-Id: <20190316204342.2184-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] cxxtest: update to 4.4
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
X-List-Received-Date: Sat, 16 Mar 2019 20:43:45 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../cxxtest/{cxxtest_4.3.bb => cxxtest_4.4.bb}           | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-test/cxxtest/{cxxtest_4.3.bb => cxxtest_4.4.bb} (81%)

diff --git a/meta-oe/recipes-test/cxxtest/cxxtest_4.3.bb b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
similarity index 81%
rename from meta-oe/recipes-test/cxxtest/cxxtest_4.3.bb
rename to meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
index 291501173..342fccf41 100644
--- a/meta-oe/recipes-test/cxxtest/cxxtest_4.3.bb
+++ b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
@@ -1,12 +1,13 @@
 DESCRIPTION = "CxxTest is a unit testing framework for C++ that is similar in spirit to JUnit, CppUnit, and xUnit."
 HOMEPAGE = "http://cxxtest.com/"
-LICENSE = "LGPL-2.0"
 SECTION = "devel"
+LICENSE = "LGPL-2.0"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/cxxtest-${PV}/COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
 SRC_URI = "http://downloads.sourceforge.net/project/cxxtest/cxxtest/${PV}/cxxtest-${PV}.tar.gz"
-SRC_URI[md5sum] = "b3a24b3e1aad9acf6adac37f4c3f83ec"
-SRC_URI[sha256sum] = "356d0f4810e8eb5c344147a0cca50fc0d84122c286e7644b61cb365c2ee22083"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/cxxtest-${PV}/COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
+SRC_URI[md5sum] = "c3cc3355e2ac64e34c215f28e44cfcec"
+SRC_URI[sha256sum] = "1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f4895cf7d8"
+
 S = "${WORKDIR}/cxxtest-${PV}/python"
 
 inherit distutils
-- 
2.17.1


