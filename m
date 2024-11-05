Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ADAD33A3D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.27851.1730831914588138568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WscT7D1/;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea85f7f445so30724367b3.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831913; x=1731436713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYqNWCPwRTlzlGv7OVrDv0TOuoJopXxdfgZfeYZMnuA=;
        b=WscT7D1/Jb0QM9BJXR9PC33D69ElVZTKAO17KB5TfE9u7jm4mNGClm6JxpCQjiiLWB
         4G7zkfUuKacfIvA0vLF+wN2wzkQMpNflAbFzqazSa8j7ac3zCXI6fc2SaqZaGJy8A96X
         o1ycT4H8g2ZQJRR5LMwXPHnx0aRaGE8u58oqhfA/uaGa8/3CikC4PG55hgvtT2r0/VRZ
         FzRi5GWyw+zdjqX0F8wAQyPbVrf79RLq3PIKbvCg2sAuFEI8WdvV5xRWqNNxn6MbDd0y
         bMxkKZE7xGDKtPb9KE9GQYBnIJ6A57CfBDnBsI2gQEUm24ugvIaBJ3pwXc+M9yXct0iV
         qt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831913; x=1731436713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYqNWCPwRTlzlGv7OVrDv0TOuoJopXxdfgZfeYZMnuA=;
        b=wIcU1ckb/Fgz06BJnbyX1BF80RePDpr/EZs23RdsGmOKQVLIRCoWxKF6tD7reuDd3c
         o6SztD9htD1p4ZaHj35pELC+kXRx6UNK6BwzP4UNQX28JS9o/KIlneqqW4Y2EYlJoYr0
         KjnddInutQ4WYHPRMceoodz5JGNFKxAt/p9wyMtK9YIqd+aEeL1oPrB1C+UfOCY+gPLx
         uCKvrxMPLod0wpUHm/1Qiv80W/nRJIrvltRJpovmcDfUnxSapw8I99pxnYmiTHPvO36O
         XlUpASrRr6jzWQBn8gM+iJJSEDDrPQxcxRWtj/2oKCGfPtdzDGUDR2x0MJtB2STrH1dF
         1wCQ==
X-Gm-Message-State: AOJu0YzoxrznelQ7c93s+xeRhofnp8vLO6YQCyGZfBS0cPilFcdW4JeP
	GXrMraJfLl6xMV70Ky7QsMlj9nMur/nrocPzOmiqSKYwZ+jC6su39d58MCwD
X-Google-Smtp-Source: AGHT+IFf0AaqQti19+OfRMQhfMlBIuGuYSW9+e8Rmn6ndq35DCoSaYASeMR8UrX/Ct8E/mKuME6NIw==
X-Received: by 2002:a05:690c:6f02:b0:6ea:1f5b:1f64 with SMTP id 00721157ae682-6ea521cb7edmr232175367b3.0.1730831913233;
        Tue, 05 Nov 2024 10:38:33 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:33 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 041/161] enscript: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:17 -0500
Message-ID: <20241105183658.34982-43-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113556

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/enscript/enscript_1.6.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
index 9490ee09d..f6400213c 100644
--- a/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
+++ b/meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
@@ -20,7 +20,6 @@ inherit autotools gettext
 
 EXTRA_OECONF += "PERL='${USRBINPATH}/env perl'"
 
-SRC_URI[md5sum] = "3acc242b829adacabcaf28533f049afd"
 SRC_URI[sha256sum] = "6d56bada6934d055b34b6c90399aa85975e66457ac5bf513427ae7fc77f5c0bb"
 
 RDEPENDS:${PN} = "perl"
-- 
2.43.0


