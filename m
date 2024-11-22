Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942D3E65D23
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 04:12:03 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.17265.1732248715834569131
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 20:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hjNI/NX5;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6eeb3741880so16881497b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 20:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732248715; x=1732853515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKEpf0saLQu52sFbhwc7YIHcLXIso8XE39B93ZMmJ64=;
        b=hjNI/NX5uC2Pb/qljNoKcAf57XXm8S3qRSxdYMf9KwopydZy4U1XL62g+O8u2zNYyi
         /ea8cxQseih/yHCMit0Mit1RklxfLW0loHJhS9sCXfT5ZaVkwZzSkkDNEYzjleQ8vnig
         DSxIADwkaCL6P2tPd33E5HVQtzL/HMbQvjDvgq8tXKFng9fMgJzULSmwx53M1ryfBoK1
         f9tCxyolgDJoNZdiodDMRN99Lpmhj2je9YYhDjZZCieWmrAH/G1iu3MOgOzkdSUPuFAA
         e7XeK40KRbqCXK613Y8Uo42vr3/uCj7WRH69g8VOJpsajgC9udY5hJ2ynFQEOLfLN7Vu
         bDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732248715; x=1732853515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKEpf0saLQu52sFbhwc7YIHcLXIso8XE39B93ZMmJ64=;
        b=xG+bz8HRWZRPH5Xyb7oP11YYNwd81xAFP6/yJPnbIJrwgiBlO6bforYGLAL+fgsx1+
         38zpz4AuVaRZtYOFRcD0l4nNbK6+jbmCoKwOwKnbYDHlA6nca6dOoKrgDipjEF2w5bsg
         8CULU5UbIntzHN9A8ljn2nket6jddfEUjK//vtg6xOfRUSIuuvBf6F8DqIfbAljHNrta
         6slyjU42rYf+biwX3ZY7RBv+VnscexiPTTuFTB8pVGVBtPVKmaZwz6ubjiqb+H/Jlrs3
         9E/32D7fdvz9P6xoDoYzIdXZyMi7i00JWuS0YAe8Tw8vcwYxoSvi6n/WhFHkOZVRlyns
         dX9A==
X-Gm-Message-State: AOJu0YxuRnKKsYhO8neH/LDlx4UaHjGXfr/xjgmLpvwb/od0Gu3WTKj/
	79p2OrLS8ZihzEkg2GE3OFDavBliASTFlu7XXMLVadZ/Rp3Hq0LOnj7dwCjF
X-Gm-Gg: ASbGncv4N/8nFf9hsI6Pz9NlktTD9Ksd4wHciRTW1gUQ5IQoGpg2TCiF9v901YhNDI9
	wWL8dGggVdECKRztdA9qL4JUph8osifz2VN7okRhT4WemwIG1vPsE9ITp2/whx11yhg4XAY7yyC
	1goxD+qNCbKgbtCNc2U8xbd3zga2B8+axy9GLJt48FXOxg2DL8F3xmA4sGGDXrR9nxh5SCMSJTE
	+NqD57OIoRlIFSHj7fEKenEPIoJOFTnUFgSo85qr2/PxXw7L8BmCktD
X-Google-Smtp-Source: AGHT+IGGupaPuEiLV2BetYK/pQ5A4WVA9aLPFYDbOXCqwq1rdD1/ZLzQuPPeA27n97rowLPkj6AWoA==
X-Received: by 2002:a05:690c:7011:b0:6ee:bbe2:ffb3 with SMTP id 00721157ae682-6eee08b90c7mr17559637b3.25.1732248714365;
        Thu, 21 Nov 2024 20:11:54 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe42061sm2828877b3.54.2024.11.21.20.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 20:11:54 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 5/7] libmozilla-ca-perl: Upgrade 20231213 -> 20240313
Date: Thu, 21 Nov 2024 23:10:42 -0500
Message-ID: <20241122041044.1111236-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122041044.1111236-1-schonm@gmail.com>
References: <20241122041044.1111236-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 04:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113985

Changelog: https://metacpan.org/release/LWP/Mozilla-CA-20240313

    Update from Mozilla repository to 2024-03-13
    Added certificates:
        Telekom Security TLS ECC Root 2020 sha256: 578af4ded0853f4e5998db4aeaf9cbea8d945f60b620a38d1a3c13b2bc7ba8e1
        Telekom Security TLS RSA Root 2023 sha256: efc65cadbb59adb6efe84da22311b35624b71b3b1ea0da8b6655174ec8978646

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...zilla-ca-perl_20231213.bb => libmozilla-ca-perl_20240313.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmozilla/{libmozilla-ca-perl_20231213.bb => libmozilla-ca-perl_20240313.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20231213.bb b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240313.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20231213.bb
rename to meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240313.bb
index 3a9c04bf0..ca5fe3d34 100644
--- a/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20231213.bb
+++ b/meta-perl/recipes-perl/libmozilla/libmozilla-ca-perl_20240313.bb
@@ -10,7 +10,7 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://README;beginline=32;endline=39;md5=51e666dce556490a1132e937ad3f8729"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LW/LWP/Mozilla-CA-${PV}.tar.gz"
-SRC_URI[sha256sum] = "421a12ba7cef443bd368671cee9c9b46a8b55c2ccf7ac76c42f99e23a06115df"
+SRC_URI[sha256sum] = "624873939e309833894f881464a95dfe74ab77cab5d557308c010487161698e7"
 
 S = "${WORKDIR}/Mozilla-CA-${PV}"
 
-- 
2.43.0


