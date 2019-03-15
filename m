Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail.openembedded.org (Postfix) with ESMTP id 43E8B7C724
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 18:22:40 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id v10so8779675lji.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Mar 2019 11:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=ASuvlNVUk8EDXHaEZR9hNecWXqWzdw0A06r2Tch8FdA=;
	b=R4LpxgmzubTb5K511Olui3mtnYJpvnwcRVh2x+WB7zItvtU3scD0cPsFEqDWK6Mw5q
	tBvuKc6gU+o0ZXTJgxZVoSAx6Ev7pdDU8YDhFfkvHBj+8AcGfj5LOyUj/Yq1Y5QwkM/l
	sYDbtWJh7KNZBxsEfzgtQLgoFNIeuwDqoYYTKTL7QShemiPw47GTiSFiHdoCQI1cFpD0
	RWA5eYiojf5MkwMecupobyYRst/PrVWigUuVCknwnFUm68ffddjGMuJ7+9C53AK6O1nL
	B1Ot2bue5CcGSDPZd6D5hCguOclvrmbAAud1iXbIDuUs9vOkM4IuK9zNSCry0VgYDO+E
	L3uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ASuvlNVUk8EDXHaEZR9hNecWXqWzdw0A06r2Tch8FdA=;
	b=UBW12lCJUkhBL3dnOrXChS2osS1Yjm5Pm1tlj81sAg3E0iFS0zPTEs6XAmNtb6l6Dn
	MgVix6zjkiP0wxXu01rs4blzENqR4iRf7hOh3vFt27Puh41XuoIfO9DlllP+5asFv47d
	1j8Itrjrybrao0nCNQKDla9kEdq6SA3PTpaqRBIiSvyL9ibu9Vq17HrA2Zc6TpvGYUif
	fmiMYJlMr8M7FxZm7Tsi8adHBFgu3duGnPUdKBWRxvFcbHJAFGxdj29vp1S3Slf+7h0z
	VRkL9m6LrBMyEvx58tw8FtXX93KYlkhLO/1pzJPhP4p3vQnqsSUBIk/V3GdL282FD0x7
	u2mw==
X-Gm-Message-State: APjAAAUkidxsv5z0uIbKuAiKL9u4bAORFm67b9RfIJ+msju1gqcqU8rX
	d6fKGm4eHlOjM5/tfswMqAMw4ct8pYs=
X-Google-Smtp-Source: APXvYqxRphAKAgetyDMjke+U+eEBtu4U4YaAO46Ahe/TO17dqr2D21TdccZiEuLtYtCCRolFUzRgYw==
X-Received: by 2002:a2e:86d2:: with SMTP id n18mr2911827ljj.128.1552674160578; 
	Fri, 15 Mar 2019 11:22:40 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id l21sm548879lfh.30.2019.03.15.11.22.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Mar 2019 11:22:39 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Mar 2019 19:22:34 +0100
Message-Id: <20190315182234.19250-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-networking][PATCH] mbedtls: update to 2.16.0
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
X-List-Received-Date: Fri, 15 Mar 2019 18:22:40 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../mbedtls/{mbedtls_2.13.0.bb => mbedtls_2.16.0.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.13.0.bb => mbedtls_2.16.0.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.13.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.0.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.13.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.0.bb
index ff3f7f0c1..2e9d01e14 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.13.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.16.0.bb
@@ -23,9 +23,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=302d50a6369f5f22efdb674db908167a"
 SECTION = "libs"
 
 SRC_URI = "https://tls.mbed.org/download/mbedtls-${PV}-apache.tgz"
-
-SRC_URI[md5sum] = "659d96bb03012ca6db414a9137fcdbd6"
-SRC_URI[sha256sum] = "593b4e4d2e1629fc407ab4750d69fa309a0ddb66565dc3deb5b60eddbdeb06da"
+SRC_URI[md5sum] = "eae9cf16114f4491dbbc0fe36bb7e6c3"
+SRC_URI[sha256sum] = "e3dab56e9093c790b7d5e0f7eb19451010fe680649d25cf1dcca9d5441669ae2"
 
 inherit cmake
 
-- 
2.17.1


