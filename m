Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id A45807822D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 09:10:09 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id t72so9565112lff.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mRDsdyJ5YEjevHafOU/lI0btgEdJOOCLVUpFiKYHCAM=;
	b=ifNli0SLQ9+9uACpGlBlC7p0KzyB/Fx2YkoSryrUkNaenCpCZ4I0pHp0Z0fzKc6mtt
	/KdCj4iOJaaHN2FmqG+wD8Znk3H8dTf6YoX7QUjiWFYBhzVBOtreCU9o8gsPMMWZQsxa
	78S15/rxcaDyOGaeTK0bdlwWfVaX66BoaVXpMVRjsKAb3LRo6Glt3CLtWGBO9kW1BUac
	T+2Cdvxk6Aq4/IOMKblIG3C17Ej3CpWPK/+UYHb0FDzfafdX+Caacas/ium4fXHG2Jgt
	0UUdX6iyCYzRqWztIZGGWt/L8j4a0r9DiAiiGV6cbdiYhmuz8pXl01p0HXWi72iCNcjz
	8pNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mRDsdyJ5YEjevHafOU/lI0btgEdJOOCLVUpFiKYHCAM=;
	b=DZxD6NelNGifg7wxJnNejbWM6z6ZHyKOcEOJCvLqZErhOr1A6lDyvMYZ1pQZvrk+wR
	CtfaVcB8m48eIVeaVJqq9XIDRHrF72KXAgFd+F+utuJvjynnWskwriXLwjjQc8gYf3sP
	v6zugWpeFE1wRg7bD0QRs2UQr0gfTB59e2ciF+r3TdYk1DbOXGvyF2Jeh8s8fzAKJrEY
	uIKi/VvTqrl41wHIOcqXzyLzDNHA9fD9+w42xVXFcC82LVJ7xYhMQSP53TpMm8SQD+WG
	JEHfbBSR7h3rdaP++TbDc2AJJyI2zORiF12cgkjC8520s6gyTf2krlUo3oxQ+WdjiozC
	UIgg==
X-Gm-Message-State: AKS2vOxo9mSF1/xXwceDnyYViaCL0MTlRLzQ+qOMb4NzH7zlVq5C128T
	rXCupOY5qmcpVPpxhDs=
X-Received: by 10.25.1.130 with SMTP id 124mr6915837lfb.138.1498813809971;
	Fri, 30 Jun 2017 02:10:09 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id s6sm1505781ljd.27.2017.06.30.02.10.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 02:10:09 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 11:10:07 +0200
Message-Id: <20170630091007.21671-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-java][PATCH] javasqlite: Use BUILD_CC variable instead of cc
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
X-List-Received-Date: Fri, 30 Jun 2017 09:10:10 -0000

cc binary is not present in the sysroot-recipe, use the one pointed by
BUILD_CC

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../javasqlite/files/0001-fix-errors-during-cross-compile.patch         | 2 +-
 recipes-core/javasqlite/javasqlite_20150419.bb                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch b/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch
index fc0da704230e..7f423535dded 100644
--- a/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch
+++ b/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch
@@ -106,7 +106,7 @@ index aa46b24..c0fd87f 100644
 -	$(LIBTOOL) --mode=link $(HOSTCC) @HOST_CFLAGS@ $(SQLITE_INC) \
 -	    $(SQLITE3_INC) -DHAVE_SQLITE2=@HAVE_SQLITE2@ \
 -	    -DHAVE_SQLITE3=@HAVE_SQLITE3@ -o native/mkconst native/mkconst.c
-+	$(LIBTOOL) --mode=link $(HOSTCC) $(CFLAGS_HOST) -o native/mkconst native/mkconst.c
++	$(LIBTOOL) --mode=link $(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_LDFLAGS) $(CFLAGS_HOST) -o native/mkconst native/mkconst.c
  
  Makefile:	Makefile.in configure config.status
  	./config.status
diff --git a/recipes-core/javasqlite/javasqlite_20150419.bb b/recipes-core/javasqlite/javasqlite_20150419.bb
index d721d66cc6c7..5d664bf932c8 100644
--- a/recipes-core/javasqlite/javasqlite_20150419.bb
+++ b/recipes-core/javasqlite/javasqlite_20150419.bb
@@ -7,7 +7,7 @@ That API is wrapped by methods in the SQLite.Database class."
 
 LICENSE = "BSD"
 SECTION = "application"
-PR = "r0"
+PE = "r1"
 SRC_URI =  " \
     http://www.ch-werner.de/javasqlite/${BPN}-${PV}.tar.gz \
     file://0001-fix-errors-during-cross-compile.patch \
-- 
2.11.0


