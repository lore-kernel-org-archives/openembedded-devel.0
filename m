Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9576D40CF2
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:09 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.30711.1730839856623970366
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g7don0FN;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea5f68e17aso58785347b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730839856; x=1731444656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HZIDrT82s9Vb1s0xwunY4y1eIQ4lVzaArdAd7gxLJU=;
        b=g7don0FNjY3uK2ipc7xA76nZdR27IEdO6FnW80osUhcQINfCY8TkRNaCuyMseKer6H
         quvmqsOTiCw5lXejTVORSaPIUCykrgm3n8PxxVytqkbXEj+9gc8fzdPKoQBSCyDkh2FS
         nMw86EOyH0CsKvv4mNnMcILVo+EbW611VSDOCxgqQh8dMImYE/Dar5SMDoIwIlGGphwm
         7ki+vkrY4frJylV50wLhD1DWEloFtGQTeAVNqCDUkpTDQdziAQG081KFtggEk2GV8YlY
         U0VSt3coSeFoShtGm85IAQucsgvyMK10ga3MZjGY1NDg4Qwhg3hzxyd2sigfdEP3VEvx
         XmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730839856; x=1731444656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HZIDrT82s9Vb1s0xwunY4y1eIQ4lVzaArdAd7gxLJU=;
        b=ooRWoFS6uPXA9oSAMGPtYfyjIgkWWoPfShKdaU3lpsXTQCJQgPtkh9oddDm7S8BeZ4
         c1Kq9kDqM8gnBqnVIc4D70bHdqbTlc5JAeKRIX2bKYxp4ZzXS5CqrBz4dbIP7gFEB1eV
         f2uMghjNTyecjhLsSwfVUO3M5GAhDBIJixwizGkwkfn45mS4OHmIKr4TiA1/eRzSD+Y/
         cMO70NNoqlXktN+/Az3j2NT5SxMhMwIMKJBZ41H/TmYn1auAv5H+4GVOtVby4J+MqasE
         JUJOoF+tklEQxiQ7gRxlCNIOoqmfbh8pWKhPbuVPrHBb4JDDsTL2R3rZ32q9JPmtEa5O
         4wtg==
X-Gm-Message-State: AOJu0YwQUEoF0SFHbUu2hcvz3MOVXfcx2OX/Z3B8Fbd67WzCWpz0VmvW
	eIQyeAha+2Z57UIN6XmG+jlXLtEoix+6jn4P1ZeDSTUYQX/W5yfLI1R1p7pE
X-Google-Smtp-Source: AGHT+IHx9kmwI4CVAv9UuPweaHo137L9x9bcbo+8IWmaPiNjY6VQTipOR6FVYtI+fKkoZ2mrFp8A2Q==
X-Received: by 2002:a05:690c:628a:b0:6dc:7877:1ea3 with SMTP id 00721157ae682-6e9d893a84dmr400591577b3.17.1730839855318;
        Tue, 05 Nov 2024 12:50:55 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:50:55 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 140/161] minini: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:46 -0500
Message-ID: <20241105204707.4155-140-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113656

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/minini/minini_1.2.b.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/minini/minini_1.2.b.bb b/meta-oe/recipes-support/minini/minini_1.2.b.bb
index 4a73f1212..582f18393 100644
--- a/meta-oe/recipes-support/minini/minini_1.2.b.bb
+++ b/meta-oe/recipes-support/minini/minini_1.2.b.bb
@@ -16,7 +16,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb21481ad45c5578ae8c8d37b8c8d76d"
 
 SRC_URI = "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/minini/minIni_12b.zip;subdir=${BP}"
 
-SRC_URI[md5sum] = "32740621098e3f0a321c7c23f4bcbc5d"
 SRC_URI[sha256sum] = "b08839af74acb36061fb76e1123bf56711bc5cf7a08b32e189b0ad78a2e888e2"
 
 do_configure[noexec] = "1"
-- 
2.43.0


