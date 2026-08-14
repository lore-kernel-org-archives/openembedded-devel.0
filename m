Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B829C5DF74
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24361.1786747569691115366
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BMjQYpfv;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39266382df6so1322405a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747569; x=1787352369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1E/3QazzmeijPdLiYrIybRKPqTXnWY/YZk2MAzzR8o=;
        b=BMjQYpfvNNF8tRIUMWaBiENlacK2gnoWhFQQLLzAhTaFcCoRqmMOj5sBxbbiG6sf8D
         Y27tFA8rRfqsa2fRAJnPSe4x0jnjvKa6iHTveyePB6D4wbdm3rWxUrM7axfPgsJmUZN1
         NfwWcNui5d/HmUDiXEmBgrXsdkvOg1zJ08JihI2fx+nrkS0GPQXzH7xy0bWQy8Rs0Ln8
         nJB1nBDPdpqZUkmjhGc3Z9BDJM5UbZhKlAVfmy7mNHFOoug/B6pL7pQk3JdVRfBv/XDe
         MmzzBe2qNEczZ1NudJpbKO9jPXhNQNqhNSbU9bzDkp339mYP5byT3RGoJ1osREuSKD24
         zHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747569; x=1787352369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1E/3QazzmeijPdLiYrIybRKPqTXnWY/YZk2MAzzR8o=;
        b=CpRIh7dH1dbqy3/O5Rw6H3IXbwXK2TRA28oKohjZPjyDETaAlUraRPCF9xBZqyP3qy
         y/6HEnD9DbzFMbJWPtUQLjxqIToCY/2wjaCqgGkUGKZbvaKLMOORKq9ZEss4MUzrnrlB
         BhsvundqAugylevOBl1lV/gh2mJUWxJeke8UajDi6MF3xaMoDcQ61dEPgN8IyvMTvpgR
         t30bT0F1Yw6ueRCdhdNdQZRx0kWgi8OsycCPotn3EJaySmS8+LDfLzFuTrCWKZPZPwx+
         2MZLVzsT3OEGQITp5nfIIVl0Uvdx07RcIutURNFnaIW3j2YoUITPTmaWTEmrXQeak4tO
         vjUg==
X-Gm-Message-State: AOJu0YzXpvFI7OXkqoxbBQjiluWhexfVLLvhb3QhisN0R4bDK3LDFcIk
	BRVVnzAdg5u7HKrzW9jQG2rcgoObXBhUAa8woVYOmbMTnfLklgvjfc/FuVVOqI8l
X-Gm-Gg: AR+sD13jGYdW5vSRHX3Dq2vg0tQ0060kEy7ouBA/naxd2AofUxb9LCeWEnpcnsr7SBn
	kAaxNrZSgvuc0kB9UpoLFOKixIwXLHi4sqKtl/1vWYvekTBz3QQ3AZUkurXoOaKUOGD3jPbslQR
	LeFVkYroDIqkeIdxaHogoGyMOMCk0EXY7s/rYDBPFWH4u8Mjb2OTd+Sxol78BjiKRD3UauQdMYg
	eA54NovZUPvcaXEhhVyvR67K7/hd/0yaCvAPvapC/Mz6Ua4bnOZe0z+AuPDBF+onqHF39UuYo7y
	xkUiK7K8YTo7H8ZxOCy2Z78GIe1Xtrg58i0ub2gihw8R6pKu3OHBhUlRFKgPRoHzG9vINFahUhl
	clTh9prLke5OeBEeVrOY4pmmwhuhdVRdikq618f4/y5nAWoW9yT2WLE44TdKgz9iEW6sb5hRaBS
	5qyal3LhzqcqmNQu2oxwzzQAOsgHxY670arHq4tSLzkTEvjx+54tLmQuwXSklPkb7UbYoUuLsar
	Y+baXB+GR7+IUzng3XgaJBHbOUecl0s8aq6dyzJyBfTEFKWEqeV/WPkIvLmIN/554NKwjWJ2Tkb
	5Gb5yjIJTsJjY/48qkHDCSYAT5lY+aQ5qGMA1KJ+I51LgfaprCA8Vm6OYGLasNBTbH/lcZn8+zf
	3Ehk3ARuoMZpaMo3vj5VtZKLsVZa/48pLfHIV/U84Z6Z1Kg==
X-Received: by 2002:a17:90a:d88f:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-3933b87a74emr10790245a91.12.1786747569011;
        Fri, 14 Aug 2026 15:46:09 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 024/109] glibmm-2.68: upgrade 2.88.0 -> 2.88.1
Date: Fri, 14 Aug 2026 15:44:10 -0700
Message-ID: <20260814224539.1523174-24-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129088

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../glib-2.0/{glibmm-2.68_2.88.0.bb => glibmm-2.68_2.88.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.88.0.bb => glibmm-2.68_2.88.1.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.1.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.1.bb
index 051dd05abe..cfabce5b5e 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.88.1.bb
@@ -12,7 +12,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "a6549da3a6c43de83b8717dae5413c57a60d92f6ecc624615c612d0bb0ad0fe2"
+SRC_URI[archive.sha256sum] = "c139f962b1575c8827cd39d1ac21b7a367be3bda1409c0c7e21a29090f371506"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

