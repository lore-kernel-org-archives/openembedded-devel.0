Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C5ED10365
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.6183.1729801138301271612
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:18:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KuF2aoKr;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e38fc62b9fso13130097b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801137; x=1730405937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBsc3X5TuWpphPTEPyqzxTg0p6w5hAx0v2sgta1HzLA=;
        b=KuF2aoKr8RnZtEy1PxYfjYlxSz3wgmgXwHzGi/cvknbZfuGZiKcHI+iKUYp0TLEzAr
         zqovJ/1KHRRdHi2ekl3Wa/bVxSPqeXUY6JybdjR5w30RrIsYyTUWbyjJAX9YkvMHA1O0
         o5YuisF85aApWCiH2L5X6wozIdl7GG2V/RpjCl6lSnRnbRhoHvWHuuYMDt7mhtjfXYhw
         TTy7WKztJSHVoJeafo/nNN2yLwpZdqQRu3JyJFh5NqBGQZ9OK5jqbriHcNTFrbwfRSaq
         RJMaylbqIosHcJEW2QKWM2ISsAWl3aA3SwGe6RFN2eezGkYpOtFiz2bZLwv4b91Yxuko
         mf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801137; x=1730405937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBsc3X5TuWpphPTEPyqzxTg0p6w5hAx0v2sgta1HzLA=;
        b=O3OA+nfKCv5CQUNzijbfwfcKYpo3zwXVsIx9IHavHIfd9n8q3xJX5yuwIt2Ea9KnOc
         LMgcxDYcd4iScowMcy7vxp80cuA52/iMWDLKrRCxzWVwOm5ofu7XBdGKZ8PGB4w09Lau
         oMhzp0rJt6S5aTJRVP3icKliQI0sGNC78jnVkdm035WuXZ0yJocmeSllyNk8jdJKIMtT
         6AnMpduDCH9SFbLbnUMQptLc6Lt4rPmUjsaW7qp54hEeopgQ6VukvwXw1CfpM95rK4LN
         APMbqhqhQEbeeNWmP/0C/SLqJ7yJXy7fzVsWtflItbHyGSegmHcYli4veX41jrRzpmxm
         CJkQ==
X-Gm-Message-State: AOJu0Yx/pDbI9pT+AWg6bOswlkwARmTU/IB2Q3DBgfDrpsrx3H/ZxTEb
	ggHwgHXXV3IugS80dpxfGeFHizbx7d4/jScVVbpt9lMRL2syQYSuiZWdig==
X-Google-Smtp-Source: AGHT+IG8n0pzTqGQvZtGKohJfdxlyWBBRCeptY5+u0cw6MQehP/CSpZO1u94oprbr68XkE1jk375YA==
X-Received: by 2002:a05:690c:67ca:b0:6e2:7dd:af61 with SMTP id 00721157ae682-6e7f0e04c70mr85121367b3.17.1729801137014;
        Thu, 24 Oct 2024 13:18:57 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:56 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 07/42] libconfig-tiny-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:26 -0400
Message-ID: <20241024201806.440273-8-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113185

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
index ccdc1e0cb..620659abd 100644
--- a/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
+++ b/meta-perl/recipes-perl/libconfig-tiny/libconfig-tiny-perl_2.30.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Config::Tiny is a Perl class to read and write .ini \
 configuration files with as little code as possible, reducing load time and \
 memory overhead."
 
-HOMEPAGE = "https://search.cpan.org/dist/Config-Tiny"
+HOMEPAGE = "https://metacpan.org/dist/Config-Tiny"
 SECTION = "libraries"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += "perl"
 
 S = "${WORKDIR}/Config-Tiny-${PV}"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tgz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/R/RS/RSAVAGE/Config-Tiny-${PV}.tgz"
 
 SRC_URI[sha256sum] = "b2f7345619b3b8e636dd39ea010731c9dc2bfb8f022bcbd86ae6ad17866e110d"
 
-- 
2.43.0


