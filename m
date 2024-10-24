Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AD6D10376
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:35 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web11.6097.1729801162072298298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zx7V8uBL;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e390d9ad1dso11857317b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801161; x=1730405961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkZZp29qqLN9JNIwmKMuoS0D8aki4AWwX6mqb6kOpDU=;
        b=Zx7V8uBLYvQttfxlSBaZua5QzE4CEg5+whBL8Ko2sfn9nDIEyF3kvhjP0121IAKPpy
         swm8Qo6rRis5VR++9yUXJ4R018Sni03fp4qadx9yffzh2hDNF0/hMCjhDv2hiqxqgEcJ
         tlGVE0H+PCC8PVLjun4/J6mZYhKTSQrKpaV+q25fbXxwPrYlM7lP/R98zSmhdSZiqu8j
         TyrUCa+tBEqiplN8tMEvLfkbD8EIugsXH8NCGI0HSgsmFvgE1/hoJwTjQJ+ooJXq6phM
         FsX+9dUfTXBRXVy1SF7Xot6KqEBY0O3py/NznY+m4DC5thVY3n0U0pMXhRjWPQvCG3Zv
         JIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801161; x=1730405961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkZZp29qqLN9JNIwmKMuoS0D8aki4AWwX6mqb6kOpDU=;
        b=A4oaVJYjCdaPNKQ+8c6B0PVeFvIYuJZit1Ll8+wALzPrDeZYGEp5gsJWQbGmvUJ40s
         KNGVtNJJvfAwLYens4ztTSa7oA2gkHuT55BXk5RKz82a0J71YCnwwwRO5PWUyt7uRPv0
         aA4ttia4Vf20DPZcjv2Ujj/h4yGunutf5BU1iCo/qRO3g8O0CAreer48pWzajQph5NfC
         U6VKt97BsCpUzrz3Al/voeTFST5m0IaMY+/gq9KJ9ESkEke4gUmJasejAPtxhqQfirkf
         1R1052hQuQBN5aF5QOuXziNLPj5q0ySSFLPiqTjesehFZY3BGUshpNEkqDg7ePy+c1UT
         H+yA==
X-Gm-Message-State: AOJu0Yzjd6hDzI1iaXC82LzmwEWC8lpOGDbAvn+GAXo1/FZJr5bYdFAU
	gDB+CnF9sXbedO1ri0M29ZE9OsuXxHfUC8hs2PCPSMtmZuQvqc5QQTRocA==
X-Google-Smtp-Source: AGHT+IFI1LzUmfrRnCoJEURi0Was+lT8/Rm+jtt5VfiaI6eNnzBemT17Y/ehcZnoYx55R/+0EzSzng==
X-Received: by 2002:a05:690c:386:b0:6e2:2600:ed50 with SMTP id 00721157ae682-6e7f0e2eefdmr88254797b3.21.1729801160717;
        Thu, 24 Oct 2024 13:19:20 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:20 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 41/42] libxml-libxml-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:08:00 -0400
Message-ID: <20241024201806.440273-42-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113219

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
index f184b89e5..b1d5e5db5 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0134.bb
@@ -6,7 +6,7 @@ The module is split into several packages which are not described in this \
 section; unless stated otherwise, you only need to use XML::LibXML; in \
 your programs."
 
-HOMEPAGE = "http://search.cpan.org/dist/XML-LibXML-1.99/"
+HOMEPAGE = "https://metacpan.org/dist/XML-LibXML"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 DEPENDS += "libxml2 \
@@ -22,7 +22,7 @@ RDEPENDS:${PN} += "\
     zlib \
 "
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
+SRC_URI = "https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.tar.gz;name=libxml \
     file://disable-libxml2-check.patch \
     file://fix-CATALOG-conditional-compile.patch \
     file://using-DOCB-conditional.patch \
-- 
2.43.0


