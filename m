Return-Path: <akshay.bhat@timesys.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 377547D598
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 20:32:47 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id x19so181305qki.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=timesys-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=4xwgvxt9Rk4Ufug9mCd/J6A/GrpM4hG+ELjkWQl71GI=;
	b=WW903WeKH66GcE20iF4EB7PGkt3SGuncxET55fDqG1geB/yWFjDtA6+FsEEmj87jCK
	kJS/NSP4IhDOEcCn0by3dUefm6/++mOffkYsw4/8HjbnWvGaAsQSXDfDLzjmUXtXxVeN
	7MWhAY27ML2af51mJauDfEMOipOfVHjFm9vTQlSJ+dq+abVcOUwKgLD5OfzfQ03itrBW
	pLI9FYLQs0ClZ5Ei0x9AuBRgTFim6DeEkbSTNbqHBLDpwz3cpp1opPUUAXCWzCQ8z3Si
	jUwZs4A4J4brk5zkmPS+w1FeEFH2xbacAT334E+9rnylKAEAYY6n4NynYFGHN9HYowsu
	khDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4xwgvxt9Rk4Ufug9mCd/J6A/GrpM4hG+ELjkWQl71GI=;
	b=E3ypHZSV8cb3IR8yliBf0cpURQOFoHPErubtPGLIHj2SIT8Q2iglXa3bUWTJT9cEAO
	kAlbx+GxJ2GDHHaQkZyFyRt2NPl3xQ/LnUcu0FcOPlKamZNDrCx+0JYmhxPhUguUm9qs
	q9cRTF8qd6w2H6ej8/Pp626WdvMcGJj2/QT435MnOxQs6jmKXea6vOAIOLl90zvc5Nqn
	uAQ0zpJ4Gql2MGgk2Cl94lUN1U1c8EKkGqBpFRGACGIXAwqflSTeMbl74C0ogcfOWrPK
	/zadBWr9a79tnbF4U/m3sAx9mUOW3Y7folXU0CuqPGP3OKeuxrycTk3L8Y2D2M2/r8jB
	ITQA==
X-Gm-Message-State: APjAAAVNyRMa2oqJEeQ52oHb8WnNpPBDLBHEonK/50zsZ4tlHxW/UADR
	ZbXbWGXk3yKMAtSDCCUQStjYvzGYjP7Pmw==
X-Google-Smtp-Source: APXvYqzc5SLLinjzd2GCvHUf0BXKjkxlPUsWBqBXQfiMx6BujDsP6Wvx0746JWY13EtD5t6DVRVqeg==
X-Received: by 2002:a05:620a:1134:: with SMTP id
	p20mr127763qkk.20.1556742767785; 
	Wed, 01 May 2019 13:32:47 -0700 (PDT)
Received: from timesysax.timesys.com
	(96-94-100-129-static.hfc.comcastbusiness.net. [96.94.100.129])
	by smtp.gmail.com with ESMTPSA id
	k45sm1162691qtf.65.2019.05.01.13.32.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 May 2019 13:32:47 -0700 (PDT)
From: Akshay Bhat <akshay.bhat@timesys.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 16:32:18 -0400
Message-Id: <1556742738-28112-1-git-send-email-akshay.bhat@timesys.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-requests: Set CVE_PRODUCT
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
X-List-Received-Date: Wed, 01 May 2019 20:32:48 -0000

requests is used in NVD for CVE's like:
https://nvd.nist.gov/vuln/detail/CVE-2018-18074

Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
---
 meta-python/recipes-devtools/python/python-requests.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index e6337cb..53504d0 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -23,4 +23,6 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-idna \
 "
 
+CVE_PRODUCT = "requests"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


