Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 67962792AF
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 11:26:48 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id e7-v6so9129731wrs.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 04:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6mDB5pbsjQl7Jo7Auflo8C5EhKezxRtyrjb5DQ4cOhQ=;
	b=A5XHYOTZoTEgl9ksx+ZevG564cahbOgDajDQpIOEGPFjY2KdcQGJUMU1wKTGV5nkJ+
	rs4Yk+/pyc0lZ/quJG6cPfQqYkRGP+bBiFPsaLGPV2pXgdyyxM+uptRhYDtzVVwPB5Ib
	KKrMSwQ7yjjCVZTIBmZRvU5K97Fv2t8r8t5T6sbg/s2esNqaYCadzO0bv9jgbn1z9e6N
	3xY9wdQTh5yg4MKV1585kd5HSRVxJlZUQ2GpV5drXe+ZsnVF7hzfUD5SbSnBFEnBbNiO
	LprOs5ELZHgf1Znrk1WL8N17uPSi6w05Lfj0lITBx3OkUlGTdS47RbAuKwWwB1doIzrs
	J7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6mDB5pbsjQl7Jo7Auflo8C5EhKezxRtyrjb5DQ4cOhQ=;
	b=rmVke3wGMDBzb9xhK96vlIIWduTS9OEaRnAdiECOcrbv4JxgT5dRr55bPr2dwEOwBZ
	8GGbvmGOduAfH/x5zvn4xciEBJojfu3f5yPR1yMuN/UP1zOyQKv55UTk+gEgqFf+W/kF
	YVPlTwhM6j9M2UvLz6aBpE7tevVJ0xqH4JoU76OB4esZcvU7hI1FqmmbU3iX9gNwaTpi
	mjeJ/vBALjal3MpFTpNoREw4fZ2JB9wtPWuiiVwh8HjNdL47I9tqkjb5sHwgB17KNUVn
	j5FKgK1GO0cPzoM78tJERHJ2Z1dZVPjRJJEEhR8DPpzGDahRVP/vESAg0ctGrL+0JpCq
	eXgA==
X-Gm-Message-State: AOUpUlF0dhMYb+kUKW0/Oz5Ui0pjWO0KXSFn0eF2gnxNiVapIs8lTOTd
	q6kWWjmZ20aHrdL1kLJdkS8p/ke7
X-Google-Smtp-Source: AA+uWPw4/pQM336U04WiIONtVbc0CwnpGUXpzq4P7L+9lTQCiFTzu6hNySDqjVNhlLgCaFENFZdufA==
X-Received: by 2002:adf:ea0a:: with SMTP id
	q10-v6mr25629244wrm.224.1534591609063; 
	Sat, 18 Aug 2018 04:26:49 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s1-v6sm4087551wrt.82.2018.08.18.04.26.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 18 Aug 2018 04:26:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Aug 2018 11:26:38 +0000
Message-Id: <20180818112638.10006-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180818112638.10006-1-Martin.Jansa@gmail.com>
References: <20180818112638.10006-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-networking][PATCH 7/7] freediameter: add dependency on bison-native
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
X-List-Received-Date: Sat, 18 Aug 2018 11:26:49 -0000

* fixes:
-- Looking for bison
-- Looking for flex
-- Looking for flex -- freediameter/1.2.1-r0/recipe-sysroot-native/usr/bin/flex
CMake Error at CMakeLists.txt:81 (MESSAGE):
  Bison and Flex are required
...
CMake Error at libfdcore/CMakeLists.txt:11 (BISON_FILE):
  Unknown CMake command "BISON_FILE".

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-protocols/freediameter/freediameter_1.2.1.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
index c556eb48e8..670d8b0b60 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
@@ -7,7 +7,7 @@ Accounting needs."
 
 HOMEPAGE = "http://www.freediameter.net"
 
-DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn lksctp-tools virtual/kernel"
+DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn lksctp-tools virtual/kernel bison-native"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.17.1


