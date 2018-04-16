Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id E31FE60685
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 06:01:46 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id c7-v6so9422496plr.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Apr 2018 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ii+X4CLztkCKPWfrNndcJ1P3lbLuQl78uXhzay1GKeg=;
	b=pVQM3Q0y8yktOHIxVExsdcmJ5bCqT5onpMza6GT9W852UTHeiyaz6dav5nVI+t1EsF
	j2sgmrmjCallS1+/HvXofAc2FtupT41ih1/6NupAWVPEn8GIsYotBvQQtCmSyaXp9k5c
	2ctGc5qe1icAELuNu47QY5ZTzCm7mvCP0erQFlG2owZ9wxzmAXI/eDoXLZPYvV6yw9FR
	g9eVfqREO+vSGMiZSQg+MF2tES2Wf8DnNSjVkONcbpiN/1p5r7JuBnb0xqWy5AP1jQuS
	WjYalm9iaUgBZb/OvTcXdKYsyx4PRIpdhw7vzt4guqL1v69JW7xYJgbzTDmxiRbE73Ze
	hlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ii+X4CLztkCKPWfrNndcJ1P3lbLuQl78uXhzay1GKeg=;
	b=oonbWRZlS8ajjIqinmyI/Q5+PAwxVpGCnQbuuOv6b0tjQAz45qqkX6weaah2wuIkyB
	Uv8fyCgSrGZetVUb9vcoB7UzQdrYCqYriCNQCcnfgwZxw8eYlkN2+WHmxGIFyquieQw8
	0Wyq27NCmxoz017c3V0hdBUTy416LPtShCoHgnwlk5mwQvQ0BqyKHW5KgMkfE0BRz9S+
	KbQELpsd/OozTSeyz+2qImDbCu7onsUJ/6o2pzyCZAjC+k6U4cwqRRX3mHr07MtrzdA9
	bBa6aZ6oTh5LQkE/SQM1XQiBE5w+oBI0yEimTaSM52uuG8qm3TbfHU+1WSY8p8Na1r3s
	2ufg==
X-Gm-Message-State: ALQs6tC+ZhioJMd1p8jspbjoz16mHclWaz0N8cP7y3sZw1Udtae/K1vi
	ubay4558HGk6+GfJ0HfMjj9GTA==
X-Google-Smtp-Source: AIpwx4/lfXZ2ZwiYe50aTe1IWmPMilvXmruHKqV222HpXH0OuU9on5lo002nHCrWeJueTmw+Sm+7PQ==
X-Received: by 2002:a17:902:128c:: with SMTP id
	g12-v6mr13855695pla.98.1523858507899; 
	Sun, 15 Apr 2018 23:01:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	75sm22412103pfx.71.2018.04.15.23.01.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 23:01:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Apr 2018 23:01:34 -0700
Message-Id: <20180416060134.26291-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180416060134.26291-1-raj.khem@gmail.com>
References: <20180416060134.26291-1-raj.khem@gmail.com>
Subject: [meta-webserver][PATCH 6/6] xdebug: Add missing dep on re2c-native
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
X-List-Received-Date: Mon, 16 Apr 2018 06:01:47 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
index 2b8943d22..6516988d7 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.6.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Debugging and profiling extension for PHP"
 LICENSE = "Xdebug"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34df3a274aa12b795417c65634c07f16"
 
-DEPENDS = "php"
+DEPENDS = "php re2c-native"
 
 SRC_URI = "http://xdebug.org/files/xdebug-${PV}.tgz"
 
-- 
2.17.0


