Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F29CD40D14
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.31122.1730840302476074341
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IVtwRU2f;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ea5f68e17aso58870437b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840301; x=1731445101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+AmnhAUaR2hhC4FdiRuNKQWsD/jQArWmlc4M9PHdmY=;
        b=IVtwRU2fbdEgri62h//gmweVHP1jQbQMGR2Br+nDnPoutG2oJxlB/eH+ShGJoILrKJ
         NpjxIGuwKl7gGZyKjygTlb1nN2S2mMtQ6G77gmFCsDZ8JVw5zKtSreDEq84brmGgtvTs
         4vUMXsakdOJGyzWPF5SE1Aa1QWHsPBgFZWkxNVDLNnd8Ltgoa+ZxZfFUfVKy1y8P7Hxi
         Klb/RvPu3d8TV6HusjuomeCDctjHxYFJTUntSrt7G+PCgFw6WtY78924+EPDkq4izmnN
         UNZqQhH4ch6IwGGPoDIQIpWCoorpTWfWWq7C0/f8Uo1czB7qkpBPdJO57+S7rTyRcFP0
         u6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840301; x=1731445101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+AmnhAUaR2hhC4FdiRuNKQWsD/jQArWmlc4M9PHdmY=;
        b=f4MYDu0ll4J4gQUFqQVDDPpr+sCbqOnfh/VpoM6pAW+bs5brrzZI+a5AT9ev2eekOP
         +DTGmlKjuRGg8vI38cL1s2MBFwnoqS0UIeHxSJbiav7B9JdzakM+69ztBgnf3sZ2R+NO
         JzHf1nkI+evaaeWDZOsj8gun0v+FWpl6Mqy64+Bd1TaEu/xvUtgKjBtPWdUqboOR6dke
         FSqElSqFwCcXNpJBmLvBtmF24Obe9qCQ4SVRPMPjIY6iV1YoD35GjeAvyFTqdeWvdxu4
         3w0Vpc0r7A4f6S2ZP2SiAj2EH3x8+hwUfTgelkg55dP4eStsLdy+tGMZAsB/fiI8qnzZ
         6trg==
X-Gm-Message-State: AOJu0YyEcKzOy9XdhDV/y+NDHAQO35ehFgWhyCKHBqV4v3UD9d1VAyRD
	bXr7ejob7KtuOGksM6+79vTWI2aoA6aAelp4aEcWt+g/xqp+UGxHxBtC7OJe
X-Google-Smtp-Source: AGHT+IEYSVmIA4mIrzgAXPjw4b+mrR6+1GGYf9rx6ORv0cG1kR/w8Ku3a+RZ5SDWNk0RiXulGPgzTQ==
X-Received: by 2002:a05:690c:87:b0:6ea:3313:f98c with SMTP id 00721157ae682-6ea3313fa4emr279532687b3.32.1730840300972;
        Tue, 05 Nov 2024 12:58:20 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:58:20 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 149/161] pxaregs: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:55 -0500
Message-ID: <20241105204707.4155-149-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113665

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
index 09534c44f..bdbe6e73b 100644
--- a/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
+++ b/meta-oe/recipes-support/pxaregs/pxaregs_1.14.bb
@@ -21,5 +21,4 @@ do_install() {
     install -m 0755 pxaregs ${D}${sbindir}/
 }
 
-SRC_URI[md5sum] = "a43baa88842cd5926dbffb6fb87624f6"
 SRC_URI[sha256sum] = "f339b91cd8ab348052c36b36d20033e4bffc3666bc836ff72d5704f025e1c057"
-- 
2.43.0


