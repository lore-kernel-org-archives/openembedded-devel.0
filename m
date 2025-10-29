Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0186BCCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 15:55:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web01.9182.1761753328941736059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 08:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4o6qfED;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4285169c005so6995f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761753327; x=1762358127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnz9AbtKGvYLh5RnKXcWvsUvblyTGyY14vAIomg8aUo=;
        b=T4o6qfEDxGXUUrRyy6QGGndgDjc8HKCBJPkoIHUUQYH0j77+ee8fqFOA1EA22apz5m
         HFuOZ4FrJQQhQRIjCUHpn8SYqpxpQr7l4Tb+0H5wPTsjVl5m1pmuCu8iqD/ur8b4OIpI
         bxzn3KW3ZzzxLlAoWzdnXRkxJm3gB/cWXJm8a323JcSketTuB3sI5fn965WPQUeGa5Z6
         wbN+27mC3Iq0Q5xNBm1s5bQ8tnmLxKaX9yIa5vp/oyL4X0Mo7iFKUe3SlxYrXNN/iI+s
         QaPGAlFvXhAYNKJk/9Y7ht5s8dDZx+cf/zMgHVPTh2Dc/Z1R7DeaU08iyIsGwdFip1oS
         17Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753327; x=1762358127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnz9AbtKGvYLh5RnKXcWvsUvblyTGyY14vAIomg8aUo=;
        b=K9gkp2r16I12HVisGW813zfjMIuKx4JolKWpzdo86E5Vdf4qmqDG8RtDIWhDfn2o2H
         jHmluYIQcKSLJs7MKG2/xMn/hM1bViEdiYMpGgyKvDLfIwXVfBjTX+JxgO25xfwCqDSp
         yxvuUl2a5pWPDxYCcR7dXPmPaHxzKbxpGwxz89dgXD6xUFbPQgdlHZEnL/6jeNhXDbq4
         +qcDLeIPX/xcy0tU+IVMcXgEDbgSIDT36vy8I/Fbd1f0VFC2wjLYqZeRSvkJAsX77J9r
         wvFkwNQxLw8QsQGGNYN/+SB+HVPK8CUAYS7rDTR1cuv8zgm7SEYTSfAZtf1eW7BWK8m6
         h5ww==
X-Gm-Message-State: AOJu0Yw2HLTbLEQU+/o1ZQ+kG1zWX1cbhJV/zAJFxjqd+YTH7YlLwBm2
	qocg1cZh0fC+PbEwELycCpQVY1SiGu3tZKs/C2XfpaVbTiBD38V+dLE9g9BZDoCc
X-Gm-Gg: ASbGncvJt2Tw+5IpARvQUmOrbkhOShtzAp5Fto1ral8yo5BKv3GLK9ntyq6OSU4KZWc
	ExUd+M4HPyfp5O0AKEIDnJFMywm/198ec6Z+hgoCwxIYhcbd4skOciyCW4w6wVM/P27MuvJ1SdL
	BgOTBBgsi+4rpo7ABthCbPIzKeKGrrOgsA1FPX6q5qcE4SD21jSscLqCEXk3+d1cefhGSpHKndo
	+7+HcLW+2L2PT3Dmc0hSBFJkFpgZ+gLPNsV0lqkMce538eopbp+fHUQT/7Fy3Ua/MF/oQwstGnr
	F84RPiiQN7OHDWvhUtGmHdcGOnL5pk7X8MS58/aUqkCO0xe4R93HpdqDf760sETHgXXOSzpaSuy
	JRC0zo8s2aAbOq1qeVFT+0JV13dWgUmlxlNf3WV082CjkT85wFX68bJ1H5UPBK1SpBqa/b+93PA
	==
X-Google-Smtp-Source: AGHT+IEG6LPleaUbUQBN25A3A7YAJ4L1vnVYiqvmctitglxGtK2QIIj4E3XpyYQHdBqs8RlcDXPrug==
X-Received: by 2002:a05:6000:601:b0:427:699:a9cf with SMTP id ffacd0b85a97d-429aefb9ca4mr3203464f8f.33.1761753327268;
        Wed, 29 Oct 2025 08:55:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d3532sm27723334f8f.20.2025.10.29.08.55.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:55:26 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 3/4] libmime-types-perl: fix ptests
Date: Wed, 29 Oct 2025 16:55:23 +0100
Message-ID: <20251029155524.3550326-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029155524.3550326-1-skandigraun@gmail.com>
References: <20251029155524.3550326-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 15:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121161

Add missing dependency

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
index d1f6f8c59c..c0946acb16 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.17.bb
@@ -28,7 +28,7 @@ RDEPENDS:${PN} = "\
     perl-module-overload \
 "
 
-RDEPENDS:${PN}-ptest = "perl-module-lib perl-module-test-more"
+RDEPENDS:${PN}-ptest = "libmime-types-perl perl-module-lib perl-module-test-more"
 #RSUGGESTS:${PN}-ptest = "libmojo-base-perl"
 
 do_install () {

