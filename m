Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341B2C55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 13:12:20 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5261.1785589934344877912
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 06:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PaQ6GvDu;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8485ef63b68so2156531b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 06:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785589934; x=1786194734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niy3ZGu2xdsZ2ZY8z0SQYU518qGC4gLz7KEuH9EKkDI=;
        b=PaQ6GvDuq+vbYHSs1AX4kQ3ff56RXx6DLgF+88xl/YIz7zImmdRo/LMCnb5slsjUJa
         4oWOqQJK24U3sxkCLPUxJDpMiqCnqm3QPV1UccfLFMzeomB6Xh7eSYepufaYQlFY+iw9
         yPzV3mUseC51oxCx8r+lGXs8m8Ak32JY+pENArWiAJDmStCWNNZGvHQMtAzo4aJSstch
         XIL5Qom6xK975fXxs8Pum9JG22g0uvgv0OZTFllCzyxU/cCbPjWOrEmyfU/5VlOLUAcd
         lIDPKNJ1aNGAY8eUDTOgCvW2Cryd4IJB80b+ka0BHsb4/AK9LE1c1r4YevmLM/zckaXA
         9Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785589934; x=1786194734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niy3ZGu2xdsZ2ZY8z0SQYU518qGC4gLz7KEuH9EKkDI=;
        b=hGAFN0K1XFQVbMzd7+LGiumfCX864NjQancWB4uZVHNfPel3MmFA4qkQx8Uc0k1nHw
         jOEHXLC2vtjHrzQjDPfo84/BAqb4Qz95MS7EC8PwoYfja1G6Vd6Oy3JgoMY/YzlP53ye
         pe7Ny/pTh7fdfr6tTak5GJIKkt4zQQfmuQmYobZPKfPqFqIzxeAkUnD/5+UBOUCgMqbz
         REYBvmYgvm51Td74simnHUPZw1I6TJnXFxFgLS3jMXqPzcZpfEIVrolbLHh4Hh6RXMUY
         29MHLCLxDRlQiFuz4tqPer9mqblTQYD7dWvDhczNp478it+gsZxnClBWZ2lDocaltrhX
         FmZw==
X-Gm-Message-State: AOJu0YzobB5ks4aT92UTbVbfEBG+QmlIqW7p69vTWUCK5S3437vWueNr
	Jrvj9Fa5DZS4nSHcFIP78JU8+2EoXtHAJSaSGPxyXCi8wpyvUM3KGha9t6VntwFR
X-Gm-Gg: AR+sD10UZ4qn+CA6Bqh0V5MzkpFbIBZpHeDMy0jJXO/v//P3eissUr0hzc2ojx0kTvw
	26b4RZ02Iut/j6jAcrTfCieeLfdgtPHvQ/99oeLqVid558WBuB9ELqpvczU6J+rx8qPrlGhTnjs
	/74zGiur+Gr/RHhjjzEp4cEgam8g5+SEWDgiB1MyFfRrLF54wkjBCzz8mWl/ObG6Q+bBmgnJCzd
	F7EJqRsbPGTs2lu/6K0seFrcyGneh/ucmksqGE53jJyZ12DftdFJR0YUjNootLq1GVUrVKO1uQB
	vi00QivemZb/HymqgR/hb7sPF9x81Vi6NNOige1cLcLoIbPTK0du5Cy0N5XwGOtOqZ5kVwYhZpV
	vuyPwWe8qEmLCky6Xnk0TQzQ2/RnkIAby/4z/zmrqa8xUegYI2sRM3A/QCpIeUTQibp96N/oOPN
	bIFnhgj2HUj2tS/4+nl/fLj+vXqTlhWe/ZdQ09iew3nCjXxKVZXpW9AaA3ignKrNDgGFRHD1s/T
	Q==
X-Received: by 2002:a05:6a00:1807:b0:84e:685:cbe1 with SMTP id d2e1a72fcca58-84ee48fa1cfmr2914097b3a.69.1785589933553;
        Sat, 01 Aug 2026 06:12:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd35ad5sm1652362b3a.1.2026.08.01.06.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 06:12:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 10/20] gupnp: upgrade 1.6.9 -> 1.6.10
Date: Sun,  2 Aug 2026 01:11:28 +1200
Message-ID: <20260801131138.3299410-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
References: <20260801131138.3299410-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 13:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128604

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.10/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gupnp/{gupnp_1.6.9.bb => gupnp_1.6.10.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.6.9.bb => gupnp_1.6.10.bb} (93%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.10.bb
similarity index 93%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.10.bb
index e2bfcb5ed7..6ba8a0689c 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.10.bb
@@ -7,7 +7,7 @@ DEPENDS = "e2fsprogs gssdp libsoup-3.0 libxml2"
 
 inherit gnomebase pkgconfig vala gobject-introspection ptest
 SRC_URI += "file://run-ptest"
-SRC_URI[archive.sha256sum] = "2edb6ee3613558e62f538735368aee27151b7e09d4e2e2c51606833da801869b"
+SRC_URI[archive.sha256sum] = "a1ee07b7b12673c32d7fc73ca158a50c1a4dc69ab35b65e94d24d38ac875345e"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
 

