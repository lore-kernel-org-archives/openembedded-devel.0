Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09487C4708D
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 11:27:41 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.12833.1670412460263318615
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 03:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=brEWl6nn;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id h7so21627400wrs.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 03:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCfv3BMBSaPuz/m3vHnHfBrUdY9oQqELRPJyY7n+DZk=;
        b=brEWl6nnJevW9B0zYsElyIDNoJsJDAPUsIaxc+SZgLlOpe/O8Oye65f9OXSlpOfbn4
         1J2CAC9V/n/62enkQUbXecHZp7bjTqRUJrYCLkrVvhPYdZrmOf79pgY8PQznoVJ8+JtH
         reqXM0wLcKuXil6QmfsV9TQJpstcbBiJC6V37pP9+TQQiAMpbIoRkzOcpI1GOvgIMFX8
         2ziBcEA5iixznZ5rzeUA4iKdLlsdZrhFwHAQSzqHhMGFasADctfrhbFhrpyfBKoFuAFF
         hjDHi82RdIUrc88rrklPDp09HVAP4h7UQZqgNncYBZq2tu9O0u+xf5cnIA98yb5mcZN8
         eoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCfv3BMBSaPuz/m3vHnHfBrUdY9oQqELRPJyY7n+DZk=;
        b=ZIXRqEtfN7qcRtAT7wr5kPR+VxYuXrgblio2bQUDhka/gBBukJuBpE3omqwTrN7Nep
         jufR+NlwMZMhw7+6rXyxxNiyKZh5b9gtlCTIZEVSBH0RnIGdZoBOPYwO2Kyfc0l3fDTe
         VL32FnKixXttF7e7jFRSD8f7utd0llLDaRkQjMLbAqTCl41dU8FUR/P8E1FcWuSdXi2Z
         imuuzdPDhBpWPIKdx7EKKZQdwebrjypKSI2WA2NHOtVvVGpcj9lB84qO9UNOqZEcsIj8
         XJ0SkGlv1PC9HTsg8gvruZ7NftLJadNiMnDYr0gzTexxLPOoF7XXrBwDYMbDTJsq072H
         Iv7g==
X-Gm-Message-State: ANoB5pnxKhGA/APrzf058tD2AmuvE8HQYdm0iWOLMCdMfSUf1s/6c53Q
	CDrGqG3Tb2IgQ/h5Q/F6wmZwT+a0mhs=
X-Google-Smtp-Source: AA0mqf76DvUYNC1q8ft+AEwD/N1dJVALr1K/RvHd0m+xHEqCgaL4cTc+1pcYL5hSdWD4bHzgH5d9ZA==
X-Received: by 2002:a5d:46d0:0:b0:242:91c:a12f with SMTP id g16-20020a5d46d0000000b00242091ca12fmr31935616wrs.524.1670412458124;
        Wed, 07 Dec 2022 03:27:38 -0800 (PST)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id j42-20020a05600c1c2a00b003c6d21a19a0sm1679036wms.29.2022.12.07.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 03:27:37 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 2/2] proj: avoid leaking host path in libproj
Date: Wed,  7 Dec 2022 12:27:30 +0100
Message-Id: <20221207112730.264291-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207112730.264291-1-peron.clem@gmail.com>
References: <20221207112730.264291-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 11:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99972

When compiling libproj for a SDK, the proj-targets.cmake generated
contains the host path in the INTERFACE_LINK_LIBRARIES.

This path comes from the sqlite3 libraries that gives the full path
to the sqlite3 library at build time.

Force the libproj to link with "sqlite3" instead of a full path.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-oe/recipes-navigation/proj/proj_9.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
index 818c87bf0..218f08396 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "81b2239b94cad0886222cde4f53cb49d34905aad2a1317244a0c30a553
 
 inherit cmake lib_package
 
-EXTRA_OECMAKE = "-DBUILD_TESTING=OFF"
+EXTRA_OECMAKE = "-DBUILD_TESTING=OFF -DSQLITE3_LIBRARY:STRING=sqlite3"
 
 FILES:${PN} += "${datadir}/proj"
 
-- 
2.34.1


