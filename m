Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id B3B0F7468B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:20 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o8so8086954wra.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=COW/6791UIq6eM5JvioO8vGdH7DNV8l3Vud8uPlbZVI=;
	b=EmVjQmSbl6wpYe7k5omsFKS236EEMY6N/Z2Q51ovFXCHFr9FTq6pO+odB+VlOPMtzP
	zyu34dC+Ie0/PShUGyvwhT9vHiGZjmzFEEq54J82WM4EVgU1GaJdz2v9UytfpcPzYDJK
	Oo6qju6BIo5rCvxIh0A69ndQgkyZEXPQwtLh+M23/qf2RKyAnaHAyWHaRUOyMHiT6INX
	v23GkdRzUtdRKuRtTTcsuERiMq/O1wQEEDJZADzJJOtkyU3Rk2Ejsm03dHseTwbGiQm0
	bOdfQMm5UNXTARLK6cqTw1PskHqSNot/UwTBIq+T+IXGtyvecugyA+AuIoaZCzFrQkqY
	5qCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=COW/6791UIq6eM5JvioO8vGdH7DNV8l3Vud8uPlbZVI=;
	b=i/I2xbCmd6+PK9Xtp6qRsU393eCpDbCHRgaMxD8+gIWdL+m0RHWmc9wIijnrsZ9JEU
	qiwddUcZSqJ2ac9qVt/a2l2P950nggoMhIFoMeY98jVTwayOwg+yRg8J8vKjBMRbjmoT
	NNX8PPD2Zc3tkiSs3WHDqQz/G5vmDPpkW7k8DzxYxZLP6jZQ58SVpE3fhO1YZ1v+OOof
	uDjIg7R4KgKx4C4Mzc6zelGlaZW/vWrSjLSgwZq3MK6fty1OUjOKDYniqHaALqCGlyCY
	C6wFP2FCR6DHk0sMx6xBqq/OZ3khCsH54OdJnP1r1LEU6wXeEVvxMxz8Xg3M8A8lKzG9
	iU8g==
X-Gm-Message-State: AElRT7F4+4Lm3RCl26m7bMZM1zzQ4361gowXFk0eCtIKyoFS4VgiTdU8
	46lpoby/nmxFaOnXUh4GoytU/Q==
X-Google-Smtp-Source: AIpwx49yTVre9UisaBCSeKZgpkJ6CywXYC6385pL83ME4U970udX8pEuocari3NHH71eHGPWAwBH3Q==
X-Received: by 10.223.155.145 with SMTP id d17mr10014297wrc.145.1522416741378; 
	Fri, 30 Mar 2018 06:32:21 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:20 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:28 +0200
Message-Id: <20180330133151.25882-17-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/39] libunique: move to meta-xfce
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are the only recipes using it still and I take the maintenace burden

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch       | 0
 .../libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch    | 0
 .../recipes-extended}/libunique/libunique/build.patch                     | 0
 .../libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch              | 0
 .../recipes-extended}/libunique/libunique/noconst.patch                   | 0
 .../recipes-extended}/libunique/libunique_1.1.6.bb                        | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/build.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique/noconst.patch (100%)
 rename {meta-oe/recipes-gnome => meta-xfce/recipes-extended}/libunique/libunique_1.1.6.bb (100%)

diff --git a/meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch b/meta-xfce/recipes-extended/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
rename to meta-xfce/recipes-extended/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch b/meta-xfce/recipes-extended/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch
rename to meta-xfce/recipes-extended/libunique/libunique/0001-test-unique-Add-format-qualifier-s-for-string.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique/build.patch b/meta-xfce/recipes-extended/libunique/libunique/build.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/build.patch
rename to meta-xfce/recipes-extended/libunique/libunique/build.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch b/meta-xfce/recipes-extended/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
rename to meta-xfce/recipes-extended/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique/noconst.patch b/meta-xfce/recipes-extended/libunique/libunique/noconst.patch
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique/noconst.patch
rename to meta-xfce/recipes-extended/libunique/libunique/noconst.patch
diff --git a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb b/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
similarity index 100%
rename from meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
rename to meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
-- 
2.14.3


