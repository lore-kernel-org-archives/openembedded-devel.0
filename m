Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 16B0F79034
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:42 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id d19-v6so4044989pgv.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a4hzTa2uUSAeUCtHAq2Zi0BYyt4Nbf9kVAH+0mqCivI=;
	b=eyf05sU+HLwC2Sd8wGXrCAUmimhhKa+bnjH48xP/nizWRW7FnP+wVWG9IxOHgZsx1t
	Lrw1SvzxJ3VjRR29p5LY0bP/CgGXZC7La4QuVCwndJyHTEWC5VcVJ0S5tUQKF+SitSbC
	F1eb3XWDO2S+tBdg2JO9a5s6+kb9kAS4NihjTSOTbTiUOFVm8chnneGO9a0NwQCNbyGc
	pS7VhKvVjZ2Q+NB0tBM41MhTphyxvordXwQyaApgp9to6i2S/Gzow4B3gBHZZWffdR2w
	30ku+X4YeVeua0KEplNw5QUvN1O7+Yv0DXJh9sEOsBc/rInQOSXS9Vc/er1snZk18l+N
	Njww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a4hzTa2uUSAeUCtHAq2Zi0BYyt4Nbf9kVAH+0mqCivI=;
	b=nwJBsEccfxc+ol0ExSNOAHkgT3jgmDD0lvd2X9XF57YXY1BX65lSY2oY/ACHwTGxAz
	Tv12RzTLwiAJ78GBcoUtvk8Hd86w50uaxHnKm8mVN+IRwfa8eYiCwyloH6oSOnIVPY4D
	NKHNDBDR1yYRaufyca2udqDHy+9yiUWqfluU9G7DrtDakzG9oSQeYpjwvRDx/DfbFIDw
	etIi4IMek5iK2DccBB37KyTa/UO9/nOghSYwpu5gzVaBXwfHtFVoJbuVxYUETVi++HfJ
	EahvJSvMUhT8g9J8K728zWK7HTVKIkHorGbq9EvSwNT0/GhW9NApCsrNtjSM+tmKWcRv
	73jw==
X-Gm-Message-State: APzg51BpK+87ZypUb4v7xwOzd0c28TULy1JZAUkWL7M226Bz6zndFYAj
	De9/k5TExe8zM5stcsteSL91kFXT
X-Google-Smtp-Source: ANB0VdZmwoGQHVf3VEBi2kUrTpVsAbEu7ZnEJINoohy9fDnyvYPsy4U6zLOMNBCxw00e8I/iYAlLoQ==
X-Received: by 2002:a63:1b07:: with SMTP id
	b7-v6mr14713942pgb.444.1536181363926; 
	Wed, 05 Sep 2018 14:02:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:24 -0700
Message-Id: <20180905210224.21225-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 12/12] rtmpdump: Depend on openssl10 and
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../rtmpdump/rtmpdump/fix-racing-build-issue.patch     | 10 +++++-----
 .../recipes-multimedia/rtmpdump/rtmpdump_2.4.bb        |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
index bb3d8b0efe..6e11c9752e 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump/fix-racing-build-issue.patch
@@ -8,11 +8,11 @@ Index: git/librtmp/Makefile
 ===================================================================
 --- git.orig/librtmp/Makefile
 +++ git/librtmp/Makefile
-@@ -107,6 +107,7 @@ install_base:	librtmp.a librtmp.pc
+@@ -115,6 +115,7 @@ install_base:	librtmp.a librtmp.pc
  	cp librtmp.3 $(MANDIR)/man3
  
- install_so:	librtmp.$(SO_EXT)
+ install_so:	librtmp$(SO_EXT)
 +	-mkdir -p $(SODIR)
- 	cp librtmp.$(SO_EXT) $(SODIR)
- 	cd $(SODIR); ln -sf librtmp.$(SO_EXT) librtmp.$(SOX)
- 
+ 	cp librtmp$(SO_EXT) $(SODIR)
+ 	$(INSTALL_IMPLIB)
+ 	cd $(SODIR); ln -sf librtmp$(SO_EXT) librtmp.$(SOX)
diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
index c5513b0252..a72b0d651e 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "http://rtmpdump.mplayerhq.hu/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "openssl zlib"
+DEPENDS = "openssl10 zlib"
 
-SRCREV = "3121324046e4ca1934e7e28293fc8326475d5053"
+SRCREV = "fa8646daeb19dfd12c181f7d19de708d623704c0"
 SRC_URI = " \
     git://git.ffmpeg.org/rtmpdump \
     file://fix-racing-build-issue.patch"
-- 
2.18.0


