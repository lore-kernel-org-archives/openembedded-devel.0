Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E89D35E57
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.27864.1730831924328172569
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Srh/iCzh;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e290554afb4so5843238276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831923; x=1731436723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U64fGhnG/yWSP7pUIL3BDXeSOoQdWwxrHBYyYBpRPCU=;
        b=Srh/iCzh8z8N5Yc/uJHvi7ce22lKswYZjvVgOcWEfC6dEKCxM/DfeJ8foznnDjVg/W
         URfzY/h5yfkbhkNxjrweTFcwhNFsrTp3RxIuucOGAu8mPa0WLbX8kU8K04xyx67c//2Q
         mfoO7FYf04k8fkgOhTJKtwk68yJ1tZuC/QJmJnL4yY7pYx/HYgCfBzVWaIe+tESMCbPA
         kM2vzsPI30XxSpWzkYLfGiURjB0kVlITO73mBfILkiAYb3y3dilEUDAIm6X3xlNmWATf
         g+fqkgMcB2F9TEEynS/zAoGyGnzxYm2NlJscNgNFjgjHzZF6j+NqVclvgfy6zcFi3bRq
         YkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831923; x=1731436723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U64fGhnG/yWSP7pUIL3BDXeSOoQdWwxrHBYyYBpRPCU=;
        b=qpX/7pjCZpqzFPSxjC0hG+Ha5YRnbMS0a1VeRxO+CEa8s1PWjs9o4mTrYNIMj8gdbt
         j4ETjbgoEf5YT/W+kcP3TE+DeVTSjAZrCnMbggnDbSpC7JCO1nu/AS70V3m6aNKOnPSi
         BPKuw4Z3Rj8mwgBTydX2IRwMDOhoVwqFOa47Bs3v1HF7/GSOHDjhJ+Bo5pmRGFhU/7dl
         p3E19Sw1nzUb13JCBylfBniFHj5EbI7lxheE2kkwyJ6O0Fu6LDD3YedEU8srvz+QcwoL
         zXIcpfwygnk1gAsA3Ol0hZChYzZXlET85YP44c50Q/1l37aa5fpFN6WmYM01KVJyKm9c
         Rltg==
X-Gm-Message-State: AOJu0YxMX84K0Y3td5zBeN2sWHw8euMSFZxMG/07XiCJGh9HqR0AKMUT
	1OBmZ6SR7I06Y41yMCn7mUx2AvJBpD65KXOHOOfALedx/ka3UwIKKI4Av389
X-Google-Smtp-Source: AGHT+IH59GFOiXU/FcgTLrwMdKW1XHXSL8eDUyPBcJAC6FNR4A0fv+kF90AbyCUSjnwKPIU5EOQCwg==
X-Received: by 2002:a05:690c:6e88:b0:6ea:7afd:d901 with SMTP id 00721157ae682-6ea7afddd68mr119287337b3.18.1730831922978;
        Tue, 05 Nov 2024 10:38:42 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:42 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 054/161] sblim-cmpi-devel: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:30 -0500
Message-ID: <20241105183658.34982-56-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113569

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb b/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
index b71ad234e..41cbe4c42 100644
--- a/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
+++ b/meta-oe/recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
@@ -10,7 +10,6 @@ SECTION = "Development/Libraries"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/sblim/${BP}.tar.bz2 \
            file://sblim-cmpi-devel-2.0.3-docdir.patch"
-SRC_URI[md5sum] = "b934616f88a848f17ca3cf1b9e792cbf"
 SRC_URI[sha256sum] = "1671cabff6b922b6fde897673d9fdafd56c9310f82a7eacc0547d596b9cdfea6"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/sblim/files/development%20pkgs/sblim-cmpi-devel/"
-- 
2.43.0


