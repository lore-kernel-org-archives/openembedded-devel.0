Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C41D1357A
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 19:08:05 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.30466.1730039167533503768
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 07:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UUrgU/g6;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e3d97b8274so30799367b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039166; x=1730643966; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4WS5yKLnBKleUeAOsKfkmmFF9kcYC+zdVYW0o1+XUE=;
        b=UUrgU/g6byX4gJo101rmL9WExtRuJxDv9fJS3TQLpuFvvLsaBJ404LLhTSRJmLmoS7
         /UbBt4Gf7pQsy6TwuXiTGMTVk04Lr84H3ABThtnfqC31smhTce4t/c+h7nyMywQeA5cn
         HqNO1+t8PlnH/Yw179ULYL/n5eIaJdeJl3Xlx+ZucPfsB48+BWTWfHDK6CucW4U4p3ET
         54lRJjAGf0xpSl1KqZ6A7u6Q86QiHE2N8qlN//DlArVShGyvENoCpC4tngKi75i9h1i0
         ATcLM6wQYa+F/b/QwX/gRxUYGRiid6uXg8VLf61W9s/OBx60hkj0Kil33izPE0k+Gq0i
         ZldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039166; x=1730643966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4WS5yKLnBKleUeAOsKfkmmFF9kcYC+zdVYW0o1+XUE=;
        b=bFCiwk6dd52jlRm8khr8ArUaP+MSVHUvqD+cenlh3R9RL1plhzYsVKeDONHPcOIEHa
         4luulaxNGfbYpI+VhrWDZHLtfcdC/5iU/qaHl9ytGrfmj8yrhRMFJeFxHncLbGz9PNoS
         rdofpwZIzyQPLV4nbbPemNjb/u16O2kHUcMZPLs6UMq2GUZED1aZ8gTvlhAGguojyzlZ
         O5DX1B4vSZZP2Rd6WCVbuhq6zP2JQi+jk36UxHqqGxm2pwmuyH3GfgfTou13aINWS+Fk
         wrgA+XMIBnXaCVNyxeRTZtBE+GFaHDxa6fplmu6rSKMJvMm0RBPCoN58MTd0XAoD4WOX
         vZRQ==
X-Gm-Message-State: AOJu0YwV1WXHGvn5lzWK5kBsVKxPi9iFNh5Yumk+1580QdfCO1cj/puZ
	tFEE+W+NmWxdD72kBK06Sc4jnHo+PA0MOK00FxX70I6i2LV754/c25MqKA==
X-Google-Smtp-Source: AGHT+IFegxGkXpRjdgaa9cXOAxt68pgawXbur2y4gszP/mh49hB0pbF4vZG0KoBQw00lF1yQnwoU4w==
X-Received: by 2002:a05:690c:ecc:b0:6e2:c13e:20e8 with SMTP id 00721157ae682-6e9d8aa778dmr44992887b3.30.1730039166122;
        Sun, 27 Oct 2024 07:26:06 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9e2953ecdsm5593087b3.1.2024.10.27.07.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:26:05 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 2/6] libcurses-perl: www.cpan.org -> cpan.metacpan.org
Date: Sun, 27 Oct 2024 10:20:53 -0400
Message-ID: <20241027142547.261248-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027142547.261248-1-schonm@gmail.com>
References: <20241027142547.261248-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 19:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113247

Change from www.cpan.org to cpan.metacpan.org use the CPAN_MIRROR variable
defined in the global mirrors.bbclass

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
index 7951e0ddb..f44020986 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.45.bb
@@ -2,13 +2,14 @@ DESCRIPTION = "lib-curses provides an interface between Perl programs and \
 the curses library."
 
 SECTION = "libs"
+HOMEPAGE = "https://metacpan.org/pod/Curses"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://README;beginline=26;endline=30;md5=0b37356c5e9e28080a3422d82af8af09"
 
 DEPENDS += "perl ncurses "
 
-SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz \
+SRC_URI = "${CPAN_MIRROR}/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz \
            file://0001-testtyp.c-Use-proper-prototype-for-main-function.patch \
            "
 
-- 
2.43.0


