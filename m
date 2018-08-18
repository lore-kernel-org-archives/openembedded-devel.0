Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC8B1792A9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 11:26:44 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id m27-v6so2914457wrf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l91Gbfay8b9lDVYDJQGHOoEkquspdextB5AZvtJjlso=;
	b=fOvH72SMSTnPTfa8aVoXolcZWEz04ma9jvbsxDFlBiH8gf/i1kcrscZGjao8toXH3w
	0WcFg0x1vsJuwXoZl4H3fsH7VMm9OhDTbSVH2SRkvQxIfgW7xd+2sRYVa/fGDI7NqD8O
	wn+FLTavC/+5TWCw0nomPR5Gitz1v/10sEkoIXH7OODTGhME9mM8gybGqUIjq3QDP+KW
	TaYCm4aUopONX6RNQE9spvAJtuoauRBlQmfMhzDahrCF22WPNhQQz7C6ehm6XQRZNCgt
	ixtqggVo5XwyMwQX+RMKPwOK1p+G+hQ5z5GgnWTHNMk8C09C32x3nRLAbexVotrK58t6
	iCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=l91Gbfay8b9lDVYDJQGHOoEkquspdextB5AZvtJjlso=;
	b=aD2BEVgPM1+CmrFP0PQjZUArWPB3D1fV8pIFgrEYxhdVkracuRHSFe47m4zKgmBx31
	nYalKCT83wOXgYsAeToI089jukrr7Uncempjn9xPLvmcEd+T54AWG9wj92cLHq9zbBe6
	TxmSKHGYWoBTDodWw44nlFh/VhDb4N9FJIy5RT7C0iKNhbPfNhh1nbYWfNSR1K5KIchH
	s+V2Gk+WL63amh838BncFVUDiPcRcgFtJ6gBImopFEZGha1ql3aDO8Fl96MN982l3Jeb
	1SiRko3/t36KEpW2rDSOONMweC5Bq1Pfi+lW4r3W3MqLTn5OwvTYJC4VcirLjfYO4gcr
	TwXQ==
X-Gm-Message-State: AOUpUlERrhL/CvFeOz9f6wDwoBXroE61Rpx/2JpSs0wKR8h0bBYQOgmg
	aa6KekXA8WMvILh+NnrEStF1Lpqx
X-Google-Smtp-Source: AA+uWPxZDHTmwMWvog5nINkpdP0UTJjMpZtO97wircSynJ2uzss3V/yTAk/ifmnd1F8QO5qqwkL6/g==
X-Received: by 2002:adf:ea0a:: with SMTP id
	q10-v6mr25629148wrm.224.1534591605382; 
	Sat, 18 Aug 2018 04:26:45 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	j3-v6sm3911518wrt.70.2018.08.18.04.26.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 04:26:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 11:26:35 +0000
Message-Id: <20180818112638.10006-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180818112638.10006-1-Martin.Jansa@gmail.com>
References: <20180818112638.10006-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 4/7] gsoap: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 11:26:45 -0000

* fixes:
make[4]: Entering directory 'gsoap/2.8.51-r0/build/gsoap/src'
/bin/bash ../../../gsoap-2.8/ylwrap ../../../gsoap-2.8/gsoap/src/soapcpp2_yacc.y y.tab.c soapcpp2_yacc.c y.tab.h `echo soapcpp2_yacc.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s/c++$/h++/ -e s/c$/h/` y.output soapcpp2_yacc.output -- yacc -d -v
../../../gsoap-2.8/ylwrap: line 176: yacc: command not found
Makefile:534: recipe for target 'soapcpp2_yacc.c' failed
make[4]: *** [soapcpp2_yacc.c] Error 127

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
index 8875844615..36530d2df0 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.51.bb
@@ -22,7 +22,7 @@ PARALLEL_MAKE = ""
 
 EXTRA_OEMAKE_class-target = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"
 
-DEPENDS = "openssl zlib flex bison"
+DEPENDS = "openssl zlib flex bison bison-native"
 DEPENDS_append_class-target = " gsoap-native"
 
 do_install_append() {
-- 
2.17.1


