Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C24CDD0E8
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.21948.1729612090806780255
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Spk4OD4F;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e3cdbc25a0so63222907b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612090; x=1730216890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvJ+xzo9Xg49EX2Ld2n6LWygefI0G+IT5tzjJ9AakE8=;
        b=Spk4OD4F0X+FZ4xD6Xdel7PAQ+HCu/JoS+9n5loVLO0VhtsZcQeGtNz+LZmDe7LDqh
         aOwpZMIB4axv3bYRRaTRZSiiEkRRmA/2KeVub3TJ3cKypPXU/btDYH0k3IQzImvvyUwx
         7e7HFLVNiq+ENCCgBT5H7esko3RGt1q494dprXE5biSLRinm+bJEPRJ55zvPgE+sKO8q
         n4j9/r+u08w7+7ErbUN4S0cpbLyKK5+U7iPkqrn8bZA1QaSq67KKI56PgOT2+3eKpHsL
         tFl7eGM9LNbJujSo4FlF72PdrxK1XztbD/V3ADtiNem5TjHmhdtUc01eoWCLRm23LdQK
         G38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612090; x=1730216890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvJ+xzo9Xg49EX2Ld2n6LWygefI0G+IT5tzjJ9AakE8=;
        b=RQMRwWyQhs7ErG1+1cEV12/0FcaOuQ68uLsSqN/TP0IknWeiLg9VUMEHFdZyUc96uJ
         5ZC8jeqHtp+J+CLNlFj4Q+xv5o6ziIwNvy4J1wJu0Qkg+J2QCnWZLh5grlDrS6zU203n
         b7rUosUWs6zcKimoAIRDyQEnr6HM8ZEg9xc2tyomhjCulRTKNQ5Iwx9MN9Q/eKaXxTCq
         z6aYpGI2hMt8X5lm7/paz3y6n6EmDtiq2iznDrZXL6sFXx05m4j5+2Ii4cquopvXPvG/
         BQyhOlA5fympNLgpTgF2iRyyces6EMQY9EsCVn+g7PvDHaRJY4L8Z4uLg/OEW9Ykhkcq
         SuXw==
X-Gm-Message-State: AOJu0Yxr8bfjG4n/jw2NzqZgNqSR+p+YpakyqmEtD9vdFdLxGfwWq+ye
	2byeqCqJ2ds05CoIQto+YF6vMBl0R0NHXhyitdXP5bwxa8IRZQDjWlrKiQ==
X-Google-Smtp-Source: AGHT+IG3KdAY6gjEMM0MoagvwJE1VvIxZvFVdR2Y9+Yid9SuAJjpX+jhZ2lF/MvRkfXoKbm8wabiBA==
X-Received: by 2002:a05:690c:ec3:b0:6e2:ac0a:890e with SMTP id 00721157ae682-6e5bfc419b2mr145599867b3.6.1729612089414;
        Tue, 22 Oct 2024 08:48:09 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:09 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 23/46] libipc-signal-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:41 -0400
Message-ID: <20241022154729.20331-24-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113114

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
index 203db7b10..6172933f1 100644
--- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -12,7 +12,6 @@ S = "${WORKDIR}/IPC-Signal-${PV}"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4cebf17fdf1785eaf8c151bf2e8c360a"
 SRC_URI[sha256sum] = "7c21f9c8c2d0c0f0f0f46e77de7c3d879dd562668ddf0525875c38cef2076fd0"
 
 inherit cpan
-- 
2.43.0


