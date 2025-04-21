Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EB7C369D7
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 23:48:40 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.28508.1745279315346035508
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 16:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OgY2Wn02;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2255003f4c6so50117785ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 16:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745279314; x=1745884114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkX2xC798ijl7MKqqjcTiAa8agRgWtpCREeGSy3ZHR4=;
        b=OgY2Wn029Mh6SeC/n7fhcgMCc9RsKfYJYpMB+2HXhUQZ4PSbyjPt6uxEqRn/6cQlqo
         kzeqCDJGrIDr5dDFbtMEeav1u7qzLn2vMUtyMCylaOKmakp4MVOc1QdIqk7KWUviVWiE
         cK41maORRBRnzamg7vZswio2OrnRBGuE0E5oP1pATKnNogYXgZrdvGzayN0xjVlGR1+9
         qHMA4o8kwj3zRQVMbL+SFBgxuphHa6pfsdVWrXvSKZ8tXMawS340e1C6/hi+Z5lxVEe8
         QhN1EtPaxLl7Ljh0fkNGPgrTChglfc3C0xPdMjPl+37mvaTNcjiWnq99Zk+OqzXs27Jy
         CLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745279314; x=1745884114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkX2xC798ijl7MKqqjcTiAa8agRgWtpCREeGSy3ZHR4=;
        b=ECgIGdY/9lhJ35FcuMQQfPoOXSj+bOVe1Pkl1B4JkSB8RG4KdUUTYp4+WsRqvoxfhs
         mo4gaJiz4HCqNmLbQLHS5NlNvoD6x+NC84ZXtexJDN7Xy+AUwhAW1BysoHguxSyjB0p6
         iMopdEdghZFBTVB7UoW8aD4kkmOQc+o4AhEJyfamiVh7CVpOYYxgjSo2WPU5MVruxJ0d
         BexAH0Jr596uYQXMLkr4RRnS0JFSQEA3Q3QXg3QKgzBl5C0X46J9Qa5QAIo9wI+NxtVQ
         HzWPn3/mbFjhiSbf9e69vW346XY+ohShCRrqF4ouVzRDnSxhOZL/njKAK5zQndcjoPXv
         R20Q==
X-Gm-Message-State: AOJu0YyzdyJ1i/V9jJy8YrmNRFfqUy8ZI71s6TYhrX1H5CamCqWoqP4o
	B8SAiV2osR3w7NwEd/fQlWR8TL7aBEa7tXTAqQ0p9lIQFunqw7K4KSv63Rl2
X-Gm-Gg: ASbGnctjivI9o9t94ua7ccueOkFuMMRvfF1QXnX2DuTmSizxfprP1jwP/cS+OiH9tyM
	pF1E9ix/El+lFrz18A3oku5MHw50cDtaBV2Er7SY09Q+0v8mFK/yJMJWYh7pFgywYlxhEGblScU
	eXWdv5VjY2Hk07rhZT10alNpnJ924J0LAZcCnHjPJtaJ/KBwQlvu5cEUhEYAGYBReZx8lN7SZ86
	U4q117aL997x7eP8XZo5LTuzKA+ajoU9EmJ8lfeA8B01XPCNr32PXhLvUFhHKFdsopM7PHeAKOq
	/rsC3YjlZ8cM5lkJNTRKqdtxwkQOz6K5
X-Google-Smtp-Source: AGHT+IHsiUB0K8kne+DsszN9+HGtN9hmmeiJjVNfSjfHm0Jmm2YZCteUeEscmhlDzU2/Aze3NxCmYQ==
X-Received: by 2002:a17:903:98f:b0:221:7eae:163b with SMTP id d9443c01a7336-22c53627298mr191909445ad.46.1745279314461;
        Mon, 21 Apr 2025 16:48:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a1f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde986sm71683175ad.244.2025.04.21.16.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 16:48:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] ace: Delete -fdebug-prefix-map option from CXX
Date: Mon, 21 Apr 2025 16:48:28 -0700
Message-ID: <20250421234830.1217875-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421234830.1217875-1-raj.khem@gmail.com>
References: <20250421234830.1217875-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 23:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117012

-fdebug-prefix-map is implied in -ffile-prefix-map

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/ace/ace_8.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
index 4d3f210778..05f4973aed 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
@@ -27,7 +27,7 @@ export ACE_ROOT = "${WORKDIR}/ACE_wrappers"
 inherit pkgconfig
 
 CXXFLAGS:append = " -fpermissive -Wnodeprecated-declarations"
-CXX:append = " -ffile-prefix-map=${WORKDIR}= -fdebug-prefix-map=${WORKDIR}= "
+CXX:append = " -ffile-prefix-map=${WORKDIR}= "
 EXTRA_OEMAKE += "INSTALL_LIB=${baselib} install_rpath=0"
 
 do_install() {

