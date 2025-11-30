Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAD0CFD376
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 19:44:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4097.1764531861853445735
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 11:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ns1+0iFJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so30177815e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764531860; x=1765136660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QHvziaL+u4tH3lrsj+2AgaHrJnd3hMs31+Jv0Huawc=;
        b=ns1+0iFJo5vIS/ulXvDKShRZDT4dnPdaPXzjxXZtZYjV2WrsrI3zevqh8URtRS/qCr
         OGOmgJ0ZoJOMmN8SmQuBB0DJo+gjFyAUG8nXWWbV1JmUwKzpJQqo9JtRzTRR0vqP7pUp
         xkqDDANNPKfgiyQhoRf7MJ5vrws5ttv6xO1t0LgcXVW2LWLKcWwCASK+ASmwvAN79AVA
         C3p3E8RmJ1NUa9gRokmhnrhXAhz6C055fdCjoWfv0jWNpoWTPYGHz1JQkqKaVgiMUb54
         7FZnij3RJ2r+3lRj6hcoRipoylcw8xlbR9QIv+ow1GLrcu9oABvVBM6dRn8i2ybIcdFK
         cajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764531860; x=1765136660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8QHvziaL+u4tH3lrsj+2AgaHrJnd3hMs31+Jv0Huawc=;
        b=D75vthH38oAQUTGtWLVpFXBWwrJLI6FCdg+GLEp9DKBPKiCbil/zA5YAs6dq6nLzN+
         tIET8ZqQHdwQhuMfROSAuDXog8bN/bmPi6rBpS7Pn6qhWCaHg55tpqwPrWsskREL3vA4
         zJagD9xUisICZrjv3/STjnKlpqrdVjJWA12Eowv4XSFW9r77w09LHUcs/GsKOwSMm9QA
         GxEaqN0VA/RTjucektpw6gO4Jii4yvDuUcUFGKFT6sC5fgwQELAIwGp6j7WluMCO1M6H
         4IYJOEIgyiC43tyKlNMOQ+vaRqM3Dx0txTy2oLWGWBVq//nu/GYeG1vOCXOZeJyISmcJ
         rabQ==
X-Gm-Message-State: AOJu0Yz/oqfWKyb3eqn/G69pSsNkHxrTtpF0sTOKhdTbfZ9Dp5vItl03
	iH6Fb6lGLUQvoZZ2EIKxhbsCd7Ge7zdmEweqtqFNLVZ8RchRZXhnS+14MLPtdw==
X-Gm-Gg: ASbGncufWlaqnd+Jqw7nDAuwwJ5ygU196kFjFRSIv8A8U7p0AgtZ6fS73obkMIX6dZl
	u8Q85qiECHe/Iznpc63z4o9bik+JG0UGgPKItiKc5btUvNGJjHLth7QAvkYqinxVwDPr3IArJV8
	pViVkYxNAMogzCvRgNwFV/hKn835G3n+3SaE9xrOcA7l9x5vnK+Qr+YuVH0EQWF35EkQqDMhu/W
	sutwyzz1iH/tGkOAxiBnlm8UNN57bdPZGmICloIOdp+RuFDuCTOmLKeBSvmUOYd+TIxkmzOvU73
	En8kWXIuX47mVW4tQAxGrK1Rci0mRok28mDUy52SgY51nuA8FzNPvzzWd0Skl4aLimlI3Ux5+86
	lAM0Hoa3khIeDGRT9O1E/SGsYYbXXGZFUtqdvXZfoy1qKmYjhpZsCh3xsmikkXxBd7nU6DHPmYP
	ASLOxsHzhE
X-Google-Smtp-Source: AGHT+IFG4t3QctEMp8M4cbpNoxvKNSiJwaq1kPHeOTJXc68cQmrMVQMTkHIU2TM6btOwEy3iAi9DCw==
X-Received: by 2002:a05:6000:615:b0:42b:3d5f:ebfb with SMTP id ffacd0b85a97d-42e0f34405dmr23850420f8f.27.1764531860129;
        Sun, 30 Nov 2025 11:44:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm21399153f8f.29.2025.11.30.11.44.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 11:44:19 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 6/7] fontforge: patch CVE-2020-5395, CVE-2020-25690 and CVE-2020-5496
Date: Sun, 30 Nov 2025 20:44:13 +0100
Message-ID: <20251130194414.2335669-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130194414.2335669-1-skandigraun@gmail.com>
References: <20251130194414.2335669-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 19:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122179

Details: https://nvd.nist.gov/vuln/detail/CVE-2020-5395
https://nvd.nist.gov/vuln/detail/CVE-2020-25690
https://nvd.nist.gov/vuln/detail/CVE-2020-5496

The same patch fixes all three.
The patch for CVE-2020-25690 is mentioned in the RedHat bug, which is
referenced in the nvd report.
The patch for CVE-2020-5395 is mentioned in the Github issue that
is referenced in the nvd report.
The patch for CVE-2020-5496 is mentioned in the comments of the issue
that is linked in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/CVE-2020-25690-1.patch          | 81 +++++++++++++++++++
 .../fontforge/CVE-2020-25690-2.patch          | 32 ++++++++
 .../fontforge/fontforge_20190801.bb           |  4 +-
 3 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-1.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-2.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-1.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-1.patch
new file mode 100644
index 0000000000..b41bc1088a
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-1.patch
@@ -0,0 +1,81 @@
+From 169bfc28246c10493ac085c9e9ed5b0ab58ac979 Mon Sep 17 00:00:00 2001
+From: Skef Iterum <unknown>
+Date: Mon, 6 Jan 2020 03:05:06 -0800
+Subject: [PATCH] Fix for #4084 Use-after-free (heap) in the
+ SFD_GetFontMetaData() function Fix for #4086 NULL pointer dereference in the
+ SFDGetSpiros() function Fix for #4088 NULL pointer dereference in the
+ SFD_AssignLookups() function Add empty sf->fontname string if it isn't set,
+ fixing #4089 #4090 and many other potential issues (many downstream calls to
+ strlen() on the value).
+
+CVE: CVE-2020-25690 CVE-2020-5395 CVE-2020-5496
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/048a91e2682c1a8936ae34dbc7bd70291ec05410]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c  | 19 ++++++++++++++-----
+ fontforge/sfd1.c |  2 +-
+ 2 files changed, 15 insertions(+), 6 deletions(-)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index 214163343..cdce0b08a 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -4032,13 +4032,16 @@ static void SFDGetSpiros(FILE *sfd,SplineSet *cur) {
+     while ( fscanf(sfd,"%lg %lg %c", &cp.x, &cp.y, &cp.ty )==3 ) {
+ 	if ( cur!=NULL ) {
+ 	    if ( cur->spiro_cnt>=cur->spiro_max )
+-		cur->spiros = realloc(cur->spiros,(cur->spiro_max+=10)*sizeof(spiro_cp));
++		cur->spiros = realloc(cur->spiros,
++		                      (cur->spiro_max+=10)*sizeof(spiro_cp));
+ 	    cur->spiros[cur->spiro_cnt++] = cp;
+ 	}
+     }
+-    if ( cur!=NULL && (cur->spiros[cur->spiro_cnt-1].ty&0x7f)!=SPIRO_END ) {
++    if (    cur!=NULL && cur->spiro_cnt>0
++         && (cur->spiros[cur->spiro_cnt-1].ty&0x7f)!=SPIRO_END ) {
+ 	if ( cur->spiro_cnt>=cur->spiro_max )
+-	    cur->spiros = realloc(cur->spiros,(cur->spiro_max+=1)*sizeof(spiro_cp));
++	    cur->spiros = realloc(cur->spiros,
++	                          (cur->spiro_max+=1)*sizeof(spiro_cp));
+ 	memset(&cur->spiros[cur->spiro_cnt],0,sizeof(spiro_cp));
+ 	cur->spiros[cur->spiro_cnt++].ty = SPIRO_END;
+     }
+@@ -7992,10 +7995,12 @@ bool SFD_GetFontMetaData( FILE *sfd,
+     else if ( strmatch(tok,"LayerCount:")==0 )
+     {
+ 	d->had_layer_cnt = true;
+-	getint(sfd,&sf->layer_cnt);
+-	if ( sf->layer_cnt>2 ) {
++	int layer_cnt_tmp;
++	getint(sfd,&layer_cnt_tmp);
++	if ( layer_cnt_tmp>2 ) {
+ 	    sf->layers = realloc(sf->layers,sf->layer_cnt*sizeof(LayerInfo));
+ 	    memset(sf->layers+2,0,(sf->layer_cnt-2)*sizeof(LayerInfo));
++	    sf->layer_cnt = layer_cnt_tmp;
+ 	}
+     }
+     else if ( strmatch(tok,"Layer:")==0 )
+@@ -8948,6 +8953,10 @@ exit( 1 );
+ 	}
+     }
+ 
++    // Many downstream functions assume this isn't NULL (use strlen, etc.)
++    if ( sf->fontname==NULL)
++	sf->fontname = copy("");
++
+     if ( fromdir )
+ 	sf = SFD_FigureDirType(sf,tok,dirname,enc,remap,had_layer_cnt);
+     else if ( sf->subfontcnt!=0 ) {
+diff --git a/fontforge/sfd1.c b/fontforge/sfd1.c
+index cf931059d..b42f83267 100644
+--- a/fontforge/sfd1.c
++++ b/fontforge/sfd1.c
+@@ -674,7 +674,7 @@ void SFD_AssignLookups(SplineFont1 *sf) {
+ 
+     /* Fix up some gunk from really old versions of the sfd format */
+     SFDCleanupAnchorClasses(&sf->sf);
+-    if ( sf->sf.uni_interp==ui_unset )
++    if ( sf->sf.uni_interp==ui_unset && sf->sf.map!=NULL )
+ 	sf->sf.uni_interp = interp_from_encoding(sf->sf.map->enc,ui_none);
+ 
+     /* Fixup for an old bug */
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-2.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-2.patch
new file mode 100644
index 0000000000..bbd3854eee
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2020-25690-2.patch
@@ -0,0 +1,32 @@
+From c169022972d82ee0da4812e77aa8f560d173fcd7 Mon Sep 17 00:00:00 2001
+From: Fredrick Brennan <copypaste@kittens.ph>
+Date: Tue, 21 Jan 2020 15:16:00 +0800
+Subject: [PATCH] Fix crash on exit introduced in previous commit
+
+When the number of layers is greater than 2, as in Chomsky.sfd and most
+of my other fonts, FontForge will crash on exiting.
+
+This is just a simple mistake @skef made.
+
+CVE: CVE-2020-25690 CVE-2020-5395 CVE-2020-5496
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/b96273acc691ac8a36c6a8dd4de8e6edd7eaae59]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index cdce0b08a..132f9fa0c 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -7998,9 +7998,9 @@ bool SFD_GetFontMetaData( FILE *sfd,
+ 	int layer_cnt_tmp;
+ 	getint(sfd,&layer_cnt_tmp);
+ 	if ( layer_cnt_tmp>2 ) {
++	    sf->layer_cnt = layer_cnt_tmp;
+ 	    sf->layers = realloc(sf->layers,sf->layer_cnt*sizeof(LayerInfo));
+ 	    memset(sf->layers+2,0,(sf->layer_cnt-2)*sizeof(LayerInfo));
+-	    sf->layer_cnt = layer_cnt_tmp;
+ 	}
+     }
+     else if ( strmatch(tok,"Layer:")==0 )
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index 84644f2560..7686b04fb3 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -17,7 +17,9 @@ REQUIRED_DISTRO_FEATURES:append:class-target = " x11"
 SRCREV = "ac635b818e38ddb8e7e2e1057330a32b4e25476e"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://0001-include-sys-select-on-non-glibc-platforms.patch \
-"
+           file://CVE-2020-25690-1.patch \
+           file://CVE-2020-25690-2.patch \
+           "
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "--without-libuninameslist  --enable-python-scripting --enable-python-extension"

