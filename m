Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF096025E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 12:12:36 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o8so21995667wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 05:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mdlCslzgKIJsqYpWUNRqcc6/1YfSbQA0ygr/9Mcm4yw=;
	b=croTm2TS/Y83SUFoQx5CKWxWF3yVsMdTyXM/6AK2V60aD+QftN5a10CpDmeImRYmrz
	8aHYGEWtNysbv5d3jK2bPhMqQYXyE+Cb67A///Kfxm97jpkkCBn/yMt1DDw4oPJHZNGI
	b97iOCEjgG8FSRcbm8gvY2LdMiYUb2XaBWZZGYZ1FRDAwfRMsDQofFY89B3AiwzBN04U
	vL73hZOxJXcVA8pGmqd3eJbzkoGaj7mPwk8vAefdVNBH42+UutH/XdWfhp8+F3Eekymn
	M19h0anyE+xHldT3kX9v1V1CM8wvZ4byneWBRu/zjcd+N0jsm0rOHMKo6K2rz/1B1Mkn
	/3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mdlCslzgKIJsqYpWUNRqcc6/1YfSbQA0ygr/9Mcm4yw=;
	b=Fk3NiRDA+KyumELLjpeshnRq7qIWJOuXz7Uruf+b+f5PQaCqJuS00zGcbnPLDTeN75
	+DVTHFmvvtXvPaad4SL05l7cvh/5A4/SGo57AFnyHX+OmEUpp2gH9e4w+yuY/fWsB0Me
	PNWihGGqthiQqb37tc0mtV5WnuWrk0rugP8JtJlIutDbIWq1t/iFfmQhAsczmKhkHcOT
	5kZ+A67jquE/Ls4II7es/uPIVbTNJD2Cl864JWqjpoWmbFgg/2iwbBTKLBGCX48Qd4PB
	YnphPYKCgljJM75l72JUYGIaM30YFbdf8gqq04Y52NMKkIiu5e5q8z4ljOINrbYbvJAF
	sBvQ==
X-Gm-Message-State: AElRT7ETCAKgaRXZ81mCeOj2xLkTaqV689Ir/3DFXd7/pyANhuIfoCow
	KyYP2Foxh+OS1ObG6qCZ6pNx6g==
X-Google-Smtp-Source: AG47ELsf99lIxRDBHzSHX3g0JlAv71sndKvifHWIb8m2AK98zZCjhVXLtA8/Modxqe1PMU/4NHqolg==
X-Received: by 10.28.107.9 with SMTP id g9mr581150wmc.157.1520943157570;
	Tue, 13 Mar 2018 05:12:37 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id n49sm52106wrn.90.2018.03.13.05.12.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Mar 2018 05:12:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Mar 2018 12:12:39 +0000
Message-Id: <20180313121239.438-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CA+chaQeLE3TtaZVBfts0ye566SG=ropNX3QMT7rfUfDyUf6eww@mail.gmail.com>
References: <CA+chaQeLE3TtaZVBfts0ye566SG=ropNX3QMT7rfUfDyUf6eww@mail.gmail.com>
Subject: [meta-oe][PATCH] krb5: remove PACKAGECONFIG for openssl
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
X-List-Received-Date: Tue, 13 Mar 2018 12:12:37 -0000

* --with-pkinit-crypto-impl option was removed in 1.16 by this commit;
  https://github.com/krb5/krb5/commit/3e2344a14fad828dee624af0ae7ba2d12aec2c81#diff-f543b6d8715dcf859ebec297c750c370

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.16.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
index 3bdb090be5..80bc8afe94 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
@@ -15,7 +15,7 @@ HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=59b8da652f07186b44782a8454574f30"
-DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
+DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native openssl"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d
 
@@ -38,9 +38,8 @@ CVE_PRODUCT = "kerberos"
 
 S = "${WORKDIR}/${BP}/src"
 
-PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
-PACKAGECONFIG[openssl] = "--with-pkinit-crypto-impl=openssl,,openssl"
 PACKAGECONFIG[keyutils] = "--enable-keyutils,--disable-keyutils,keyutils"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
-- 
2.15.1


