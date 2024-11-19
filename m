Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFC7D6C283
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:55:01 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.28154.1732038897059984203
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mmuwiJLm;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-382423e1f7aso1887954f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 09:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1732038895; x=1732643695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Am91LJVdKA5DDbhYdHq5i9M8nnRJCivCoY9OGUiTqA=;
        b=mmuwiJLmYlUQijwYYlW8THaMWeuZrNKRlOwAeq4Y4W7Lv8IWtKPLoJwTsDo3E6EUNc
         4fHJTyOMww0slWieNYJWl/d3O59QLea5qygGzlgZ337B55DyMimnrOWpFffQVvLVf+nW
         hT/MMpesIy+1PH9n2KKydwkcl1W8T22sNzxzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732038895; x=1732643695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Am91LJVdKA5DDbhYdHq5i9M8nnRJCivCoY9OGUiTqA=;
        b=hzVFaPzI+50nq3E/5CTV9DzSMpGAEa7dPuNcqjhDYK1rnJhVAqA3tSd5etFpD5Hc1H
         +riZw+NrmGLHy+KD19fD1fiOOr2V+2UtMCLe3AexjOJNLx9/kQ2ywMQZPbuTPe/feYFl
         j75D+nR3fsjCmbP5uBNAkqim+lrL2ut6gjaL1elIqrTSh4rLVdUqXyw3t681zu59fIgs
         3HdKODK8J4PLFJ0bfcVlB7W6yZLs9jssEu09xM202QKvA5L+BCZ+qQbQJRCn16S9ccVV
         ufgau1NkNydavfp3RW/v6iU6bOrxU1Yuj48PdDVlJy04prSEEpvR2J+e0vcCamo9cXQR
         OwCA==
X-Gm-Message-State: AOJu0YxscorPz/4rZhInSSRVbQLHd6CISMKD9fFlipDiHzuZrpKgxVSY
	SvMZ69uiCv0gnIcBZdfOjFIOmHZEAEjm0uiTPgzmZNnKX4huK0RTb566e5ozyEwY0ilMH62Hy9f
	C
X-Google-Smtp-Source: AGHT+IHIGoRR3o0y3KraiG/MWiG/nYgm5krIoy58esG1zZOkQszZLnhWci8lYh5r7+xNguARbusiOg==
X-Received: by 2002:a5d:6484:0:b0:382:3be6:5502 with SMTP id ffacd0b85a97d-3823be657ffmr8986302f8f.51.1732038894987;
        Tue, 19 Nov 2024 09:54:54 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae2f602sm16220606f8f.90.2024.11.19.09.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 09:54:54 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] tk: make tk_8.x depend on tcl8
Date: Tue, 19 Nov 2024 18:54:47 +0100
Message-Id: <20241119175446.1889573-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Nov 2024 17:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113911

From: Yoann Congal <yoann.congal@smile.fr>

tk_8.x depends on tcl8 (tcl is the 9.x version in OE-core)

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
NB: This patch fixes a do_configure failure but a later do_compile
failure is fixed by a patch in OE-Core:
https://lists.openembedded.org/g/openembedded-core/message/207399

This is kind of a workaround since the proper solution would be to
upgrade to tk_9.x. But I would rather fix the build first and upgrade
later.
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
index 1438a05625..ddd7043c0a 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://license.terms;md5=c88f99decec11afa967ad33d314f87fe \
     file://xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
 "
 
-DEPENDS = "tcl virtual/libx11 libxt"
+DEPENDS = "tcl8 virtual/libx11 libxt"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \

