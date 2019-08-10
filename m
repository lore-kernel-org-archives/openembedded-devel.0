Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFBB7ED76
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 17:15:57 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id w26so2387168pfq.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 10:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mh+yeYF21CWBc6+Iv79DrKaQm5WMA9WXcOJLxU/4vDg=;
	b=t6CPNKtm5kANR0vc4d/k5qRPFCfs1GY/CGQy1Vei90kan79lRsBWCs6vRu105MnpBy
	EkRoC5aAOx1S9KYrhCFGuwmyGXN8fJIs0W7GKfDJJAMMsCKqQmY/G6f/3nOZiGFMLZdt
	jnm2XvnMXmPnBBgg5RQf+hm8VV1v1X/d/36Plh9xN3YKzr6Q9M3d+CBRyWU/CnNpuMYt
	fZ6Gw89CtmqBiaoXKlJPpXgAcFQNEQSiqs0Vpwwf9bkzx1JLOKjqWC1iGEhDPmQsdgHT
	H7gpiV6yAVxi4gysrulet1hh6P3mC35r3RorFu9kWlKdQAwqhjtdztEp7Wcsql3PnLoO
	Yjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mh+yeYF21CWBc6+Iv79DrKaQm5WMA9WXcOJLxU/4vDg=;
	b=dYRBXdW8a2gIVxwh46zyZzFC8o75+KsES/hA7OjOAOY4VEj5b53zjEomrwL/o7sfhQ
	qWxIavm1e9QguIp9q0MoYLG6rWpgXXLlb1AzmdbxOYshavoyJRGlPy5EWpNW0fukY+rQ
	BmPKnN+BYhJBKmzQL9R3PLKvUfJD5pvCLabXHSebZX/ATIEhBK449xnMnVrRQMXjPk5o
	1awgbRc07fCw1HBHPgBLd8snaiHR2FITKeIljXb0LXiGQVn3W909d0Wz5aWvd1NotSNS
	7tNDkVn1AZAvovds9SlThzesiiWWT9iXunjfbz+5hjc/FnmhDY9unQrRXeYIV0wwG63H
	OOXA==
X-Gm-Message-State: APjAAAUAgIuoMw8GLm5Zc5w+LtW8H+X0XKu4aMm0glr9XmHNO5xcO4tC
	4z3wQck4bwDSBv1Y9I/kxw3R9eyXWe8=
X-Google-Smtp-Source: APXvYqwT5jbHW1U9QmaXmTV4KGJE8PN6Qjsft759xUQWclkMazahTpuBZCiVL4yLPdbnffNNqFP4HQ==
X-Received: by 2002:a63:dd17:: with SMTP id t23mr22156687pgg.295.1565457358039;
	Sat, 10 Aug 2019 10:15:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	i137sm108802345pgc.4.2019.08.10.10.15.57
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 10 Aug 2019 10:15:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Aug 2019 10:15:46 -0700
Message-Id: <20190810171546.8562-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-pillow: Provide python3-imaging
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
X-List-Received-Date: Sat, 10 Aug 2019 17:15:57 -0000
Content-Transfer-Encoding: 8bit

This is the maintained PIL fork for python3 now a days
helps in writing/porting py2 recipes to py3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <TicoTimo@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pillow_6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.1.bb b/meta-python/recipes-devtools/python/python3-pillow_6.1.bb
index b74326755b..1d91066481 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_6.1.bb
@@ -33,4 +33,6 @@ CVE_PRODUCT = "pillow"
 
 S = "${WORKDIR}/git"
 
+RPROVIDES_${PN} += "python3-imaging"
+
 BBCLASSEXTEND = "native"
-- 
2.22.0


