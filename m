Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EB0E9270C
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:38:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6632.1766835492624498811
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nWvm7ACl;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso49126295e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 03:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766835491; x=1767440291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XYrat36zPSBMjky1agKZbd9InRAzfKOF00nhU9t/cA=;
        b=nWvm7ACl7KGUCQ+PT7rs6SjvB0JBEUUh8T2d/13KyRfzyfgjaU40lgzsERZWesyBwt
         HMU+VxisPRvyeqog9JCSZ5Uua9DDxm16vnXVb8T9Hok2ilK8yJXlYXB7TEWQfVT23Uh9
         PB6je720krdNLzbf/g5uJN15xLmnFddEFp+D90RhylyGWH0eJUVXlGF/KfSbYweggG5u
         oRyga1Pr7eHfKHbLOo8/9OuyQLnTCrwH2pG8tAtsn/SnbQLIoJzUqT6UQOfMd1oH4+Xu
         Mm6Z0pmBAeV3w8pRRcfKHBP1aiIrPC0x2E5yECjQ6MT3Vr4yNACkd75nUIdPvCjnp5+E
         ILsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766835491; x=1767440291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7XYrat36zPSBMjky1agKZbd9InRAzfKOF00nhU9t/cA=;
        b=dEbbj1EOn10zr3Bo9/KMVvX0xoZELQ2WvXvG+WA1elE6/0Skmpq4rW4YS1MCbNrfvr
         QBuiI2bIp/iWZA4odRFMAvM1iA0d8rMz37LP9+ogzl7eaL6VBsF3kUQ9+iHUkNHjNV3h
         7000PPPA7F4w4YENn6ikiMiblb2Tiz1e4KIoDNbqQd0ICt/l8DtCy857rkcQ54/BLZWV
         T4UpO+ci6Pj1sraG3GnElLTQma7ajTlRUozr6XwZqPWz7DqBy2RuI8D95l65mlMgOzDf
         ymd9b11YfcgIeoUnlVWnyv21qIWEgJQ7OzyQTVGNLHbrPSSy0ZsFQYtB+Pj7Xlwr/L5H
         RYMQ==
X-Gm-Message-State: AOJu0YwipJR7jRCUfwcTlWLrRDFF/x1z27J/knRgNzsQUgc+g5VA9KeM
	H8gPFQpj6Dubs4iQAzbhU/5NpKe3JEHWrtiPdU0+JIO3xx0+Wg2rD/D0nwc4XA==
X-Gm-Gg: AY/fxX5JIaKFSIbkGNOX4tOIJj/6bio2GcZsOpkk9DARh25v86XjEnm22BCqYGKCzq4
	dOO5evFA2adih/mJ0khUDMmxzkEvMoHKoYeLZJabi14FRy2+m21MNmK83qnMAt1OUMCJkPTCj52
	KIrm5VPaa/nuea9A044I7ilw4CPrVp06jy/Y/hprnDv+bIyJuZTqoNawCL3rpyiw9lSaHSZyAjL
	UfZx/yt/RCYkf1xHMnWFRHkg09OCJ75BwratILeAuPkFY1A3l7bPygAxsDDvl0flNlrzeH1zLxP
	dynamJZiCdBhEIdMomj8pdVvbi0AIyyw4uCzB7Yr+vdGMJU0Mx8KMjilsOAP0pWc+UV6DVhhHVC
	4bt+H9v6uX0zTHVQblp7+IGMwrMeIzi8jvmn8bufldWsELbZSBj3oFmlX5eUaRfCeqQHjZdiHaC
	XezJJiPEQd0ClJlxUs/Fs=
X-Google-Smtp-Source: AGHT+IHlS48wyCG9mTbmwiUqJMHPpRNZJ0GhCXo2T54VMkHhdWUl0+O8He0WWwWpHYL5mDPYKTzYOg==
X-Received: by 2002:a05:6000:4287:b0:432:8668:3ff9 with SMTP id ffacd0b85a97d-43286684017mr4263383f8f.13.1766835490764;
        Sat, 27 Dec 2025 03:38:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b82a58sm17023023f8f.6.2025.12.27.03.38.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 03:38:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] links-x11: vendor icon image from layer
Date: Sat, 27 Dec 2025 12:38:06 +0100
Message-ID: <20251227113808.3304770-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227113808.3304770-1-skandigraun@gmail.com>
References: <20251227113808.3304770-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Dec 2025 11:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122951

The url from where this icon was sourced origiannly has been inaccessible
since a while (the domain seems to be parked). Instead of displaying the
fetcher warning, just vendor this image from the layer directly - it's
only a 4kB icon.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/links/files/links2.png  | Bin 0 -> 4549 bytes
 meta-oe/recipes-support/links/links-x11_2.26.bb |   3 +--
 2 files changed, 1 insertion(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/links/files/links2.png

diff --git a/meta-oe/recipes-support/links/files/links2.png b/meta-oe/recipes-support/links/files/links2.png
new file mode 100644
index 0000000000000000000000000000000000000000..b420c6b4fdb550b371cd23542173a5817d5ba19c
GIT binary patch
literal 4549
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
T{#gYE1_lOCS3j3^P6<r_^NjV9

literal 0
HcmV?d00001

diff --git a/meta-oe/recipes-support/links/links-x11_2.26.bb b/meta-oe/recipes-support/links/links-x11_2.26.bb
index c1601ab7d9..cbee1f10f1 100644
--- a/meta-oe/recipes-support/links/links-x11_2.26.bb
+++ b/meta-oe/recipes-support/links/links-x11_2.26.bb
@@ -8,10 +8,9 @@ inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += " file://links2.desktop \
-             http://www.xora.org.uk/oe/links2.png;name=icon"
+             file://links2.png"
 
 SRC_URI[sha256sum] = "f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb"
-SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
 
 S = "${UNPACKDIR}/links-${PV}"
 

