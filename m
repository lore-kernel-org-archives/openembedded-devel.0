Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B013AC6FA91
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.11131.1662276901555521950
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UOVqEOnx;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id c66so5858995pfc.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=4SpTj1lhf8Otgj4jzZQxQjQFaN0sOjD0Fyfi+d5IB7I=;
        b=UOVqEOnxJEMk7htbll/KcQzHUuK/Cc+1wrw/OFNphbhCbej+Ys3Z9SKVTi5q7NlRsk
         YVNaqebt7X/5EhBJtQseXysvsGe5mpRvkaQ3Dv2DziRn6ji5qIbdmy2cWq0PfQlIlRSx
         FgBwC2AvJC3EhdLVoqnu/2wGsnbK5Kw48luXD5tAfQFy7k4z2ZTzeNtMfygbejo6eQrQ
         o8xuLHJ7zVszA/ETaoGWxg/QU2ciPmLxGRIjsRoxpmobfUm+lFfsg1DveR8ZFptYtNgC
         tnB+xENUwRKVGgNEC1SudZTDl/jCcGW/ij5wKii20PhQYKwriHBc8ZuFJa/5PFYHdydY
         E8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=4SpTj1lhf8Otgj4jzZQxQjQFaN0sOjD0Fyfi+d5IB7I=;
        b=BcJCgaxLRGU2cOT3ZFbYj7FROXN/9ytUXDG6L++gkKfKicJPK2s7zpitTGGL2Kts/z
         RYG8CmOIYR+y0TTFlCpF+XsOBQDBM7Hja02JNo0TQRquaMq8k0fnxuG19CJM2VP7GLUw
         jml1VfJyLiT7Dog2Lm37Z4BCnswxrX2qzKVdp+DIOObIKnnn5plB9gzatlY0T4seR8Eu
         hZj5nL5r20AkQnb8ySgRNh9ROrQvSxBvgFb6ONcnoDMemwPYTz2fVojPsK2S4248a3mB
         6/emwz9p+OCDDKUJdM5hj2zA9JV4jZRVQrq27NoQOvLPhaU9pbS7AkoUgu4l6lHoQ/TW
         2JZg==
X-Gm-Message-State: ACgBeo3RnnreR5Pdb69fo9Q7/F0SGXSMXZKVkxxMFPeZaLYfvYopl8eT
	2uwqypg916ELqnf2wwE5beE38brTKOKQ7w==
X-Google-Smtp-Source: 
 AA6agR5cRY/3SuaSh9NJ8jEOJMPJU7zrAm6APRI2zXCSvlZ1ypVf4jkkeQRG6+Sm3/nUnPAT3RohiA==
X-Received: by 2002:a05:6a00:2404:b0:53b:ea5:ea4e with SMTP id
 z4-20020a056a00240400b0053b0ea5ea4emr15049636pfh.11.1662276900691;
        Sun, 04 Sep 2022 00:35:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 39/63] libgxim: Enable debug mode
Date: Sun,  4 Sep 2022 00:33:53 -0700
Message-Id: <20220904073417.3251865-39-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98633

This helps compile because it uses gdk_x11_atom_to_xatom_for_display()
in libgxim/gximcore.c unconditionally but guards use of gdk/gdkx.h via GNOME_ENABLE_DEBUG

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
index 80ab730406..2d93936f37 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -23,7 +23,7 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "\
 file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-EXTRA_OECONF = " --disable-static --disable-rebuilds --enable-compile-warnings=minimum"
+EXTRA_OECONF = "--enable-debug --disable-static --disable-rebuilds --enable-compile-warnings=minimum"
 DEPENDS += "gtk+ glib-2.0 glib-2.0-native ruby-native intltool-native gnome-common-native"
 
 inherit features_check autotools pkgconfig gettext
-- 
2.37.3


