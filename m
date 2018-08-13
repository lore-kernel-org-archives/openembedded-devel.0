Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2F000600BC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:10 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id j8-v6so7345963pff.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TrPWzhWvvFqazs9GMswOs2QM0GIF7n6XcJxeq7ZBQSs=;
	b=ki0NqYD2soc9YJhaE8TBZ8clLSKVqYkoWVKMUxF23uyc7a2OKr665PmnE2izdNLvow
	QL0K3OJlfT9S4kzkfFUAdRo0DRYOh4+wMFg0eTBcD6WUCeDiO+yprrXTLbTcJAiUUuiR
	kxaOIJt3sJws5PGbJdqW1vHoBU1v1Uka8ufrFRVKBDFEq+i4NKldfifL/VeEZgYTFtyH
	BkB+mZBoJI8ZFClWSqfZ63LxtA23jZzfUbXadsmYDwzyhoe5tklcwKVUQoz9lPFXKspd
	YKur72qIUrxm2nuuBvVeFFrgSxe2Ee4ELFoYZRjb2eNDtwa2YOB23SZbuFwqmquFwTvE
	Eslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TrPWzhWvvFqazs9GMswOs2QM0GIF7n6XcJxeq7ZBQSs=;
	b=TyD4VcuVI4UD1+hk3MBtGNTKg7EXgcnvVXzRtTp3Q+tQvlHh2Tj7WORBtkBB9MJX49
	xc9HEIBDblcUK35aPiU27Dzp+++mgV6M1jvvZ8V76c5jJUMdcBi5vdcOyV8WuQwu1uP1
	RPjMay5k6Luqb5jTY/8HKDuN73+b4T/e2/rfY548cr6XavWCMQReWlYaMTbgl9DKrZxL
	JbzQiwKz7AmvXT7d6lFqmlbLUqLoUT9nbkcARY2io//5Ro9V0Iop1UDTE83eHgo9j3gg
	Jc1VMVgXUGG03Kcvq9I3yn7oysuw5ugiKfNuZXfSifA2kE/gTAJMW/g5yK022cbGpJwe
	a80w==
X-Gm-Message-State: AOUpUlHnE7ojxGYou510Sft6QvySzL1cESe3v/Bi/frGPI6ClI1dYjkH
	ChFqID1LG2LdCe2IyL0zXMprWPtP
X-Google-Smtp-Source: AA+uWPxyJAtSQSdGB7qu80b3DusGErjT9kfVNar1PChNB4nRpJDB1jpmjgDS1f1/ph3/FKLYEySQWA==
X-Received: by 2002:aa7:87d0:: with SMTP id
	i16-v6mr17938811pfo.82.1534148290930; 
	Mon, 13 Aug 2018 01:18:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:37 -0700
Message-Id: <20180813081742.6961-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/21] tcsh: Add dep on virtual/crypt
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:10 -0000

libcrypt is now a separate package starting glibc 2.28+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb b/meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb
index b59d88f5de..c171963c2f 100644
--- a/meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb
+++ b/meta-oe/recipes-shells/tcsh/tcsh_6.20.00.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.tcsh.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://Copyright;md5=575cf2715c3bf894e1f79aec1d4eaaf5"
 SECTION = "base"
-DEPENDS = "ncurses gettext-native"
+DEPENDS = "ncurses virtual/crypt gettext-native"
 SRC_URI = " \
     http://ftp.funet.fi/pub/mirrors/ftp.astron.com/pub/tcsh/${BP}.tar.gz \
     file://0001-Enable-system-malloc-on-all-linux.patch \
-- 
2.18.0


