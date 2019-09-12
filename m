Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id 098347E18C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:26:28 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id h2so18531239ljk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=twWxdfjZFK88iboozoeMfoYOkHPD6mLGYuP4yZCGWMA=;
	b=j9O9WMcsXdlxMkprz4LO3GvlRLk86Ak1CZvrTdxXhk61bZkK/dbykRDFY2mWWehqWI
	ntdch2ZwUtgVAo1CdxcNxlb1BCcIAGvEC5Q3ezTIE2Jrknu4cXpg5WRd3Y0tjpZubamr
	2h2bcyIx70a7Lytl/jjG9o8tZ0LPvvYU3+irQqXYjADQQDn4Ia9V94IMWLLsa5gdj2Hp
	n0MGRRAGNcS7SD6/4cnNAXIEWTFrtGv8/pzbmMr5GBotd60Vb93Y5RjP79phATjg2dbi
	s0bj67RE4NjiZfR+ICGQe7hfXzzuQeDE9P9r4mlxaSB2FmmIcjND4GQNcMvQJr9AKstY
	3dsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=twWxdfjZFK88iboozoeMfoYOkHPD6mLGYuP4yZCGWMA=;
	b=dWvC3ZNZbvEc0z0T2hnUotyUm0iHb515UdrtTgw1ziMro/GoClsoILs3iliCDjm9BW
	FTZwd3yKNhRINfer/mcs0yGGafbFlhXCQFWpMwIOJrcEGrs0xhys1T856FQFQS7shkCe
	bFUQbpR9fuZ3+xd6j0NwCSN+6sStFmlmn0zk7nuhqcHODTNJSf9FXFN86l5foi1748Pk
	LbLPKLXwqPhL5SN1POQXPN22Lzp/B2s27CO2vF20JGpe0ijuDftruNU7p1a0tWxUIv+H
	w/N1XakYSwuYcjGINIqEOdxC3bwcWgCMsvd17d9HUoGULhz+rRnR3ZF9lsNRa3kjwAuA
	7F/A==
X-Gm-Message-State: APjAAAUa07M09e6bvtW0njkvzJQhAsMtid04R6galKGe4g5dvibbNbvW
	gMSpSCXa5OHGrfs7MWOU7V8Fw4dYfAg=
X-Google-Smtp-Source: APXvYqzz7LQOn2IAbAAPJ69MiRYILWJb10T6/uayuLfLbW6peOYyfaUYae5pb7ynbqY7s7mZ57dN9g==
X-Received: by 2002:a2e:740a:: with SMTP id p10mr257124ljc.110.1568323589283; 
	Thu, 12 Sep 2019 14:26:29 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	t16sm6611493lfp.38.2019.09.12.14.26.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 14:26:28 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 23:26:26 +0200
Message-Id: <20190912212626.15710-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] evtest: update to 1.34
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
X-List-Received-Date: Thu, 12 Sep 2019 21:26:29 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-test/evtest/{evtest_git.bb => evtest_1.34.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-test/evtest/{evtest_git.bb => evtest_1.34.bb} (84%)

diff --git a/meta-oe/recipes-test/evtest/evtest_git.bb b/meta-oe/recipes-test/evtest/evtest_1.34.bb
similarity index 84%
rename from meta-oe/recipes-test/evtest/evtest_git.bb
rename to meta-oe/recipes-test/evtest/evtest_1.34.bb
index fa0d6e2fe..b5b929f45 100644
--- a/meta-oe/recipes-test/evtest/evtest_git.bb
+++ b/meta-oe/recipes-test/evtest/evtest_1.34.bb
@@ -7,11 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "libxml2"
 
-SRCREV = "ab140a2dab1547f7deb5233be6d94a388cf08b26"
+SRCREV = "16e5104127a620686bdddc4a9ad62881134d6c69"
 SRC_URI = "git://anongit.freedesktop.org/evtest;protocol=git"
 
-PV = "1.33+${SRCPV}"
-
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.17.1


