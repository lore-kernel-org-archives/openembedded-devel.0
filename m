Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F360BD5B15F
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:15 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.1067.1730142303632942391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nSJaBTwL;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e290e857d56so4318194276.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142303; x=1730747103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqT5VbfTw9fZjWFeyiCx+vRUHgMwudsWOXjFaOq9w+4=;
        b=nSJaBTwLGALxbMqRlttghrFlwM/UFa2cLrI9y2v3dgj/VXOl2kbRL2X4g4EvCYQfWE
         e2z+RksRDdZNURgpuFP0PHBCVHzwm9UlBND7/sYLt+jCqVWLkQUAI5Jt/3wzMk0wWCLa
         JSE5/omSJ5stNyITkUjrLxp5o8JX/9SM02vAug3gyqI3oHmHxdrSlu9tZ6OYoGe66fyB
         cdgYIrXsjfm5X3ci4pEcGObkYmRDlrL7viLyfn1HHp7nUqdgeJQwUQ97iihWWaqYVtTY
         buxRz+WnkHTtMqjWESbG/IL4UHrrfoe63CvtknqwFJ05XezgmkI7HRizpS8GkDnHG/eL
         Pmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142303; x=1730747103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqT5VbfTw9fZjWFeyiCx+vRUHgMwudsWOXjFaOq9w+4=;
        b=tfL7FIgL7COeMGrNDqGi55H09DCqKghpj3ujkxwY13HhDkkxC4lWl6TmmlpLQbEr2o
         +4gshl9NNVYQ30M00ENT3/XDtLFhBVQ7BTgai4cRlPkYHc1aRHr6ZkWnk9WbGMBbUicz
         7DT18KXtapcuqRjJDHPA/isjEwud0nl0AJMfPkVL19NmtSq6ecbu6gsadnIP4756aNVh
         Z/c52SPxgyNcW4BS0G4/Tx7YwZ3ZDAL78SG17Zsjwss+70vrf01vi2zX+hFmdxgcneRZ
         znV0eBTOm/K3+IU/C5h91wJ0Qkv02hzPactPJb14syPDKbIrxjcHxIcPun8vJyyAYUKL
         aB4w==
X-Gm-Message-State: AOJu0YxHApyu5RkiJLn8JZU5aOvNz2zFf7RaiQOoD+tgQjlCSa8XYVZZ
	0nO7x9qrae0Ace8hNnUUi1DhxY23jMI+pj5AjT3g1XAS/dVJkm7NSZ4fMg==
X-Google-Smtp-Source: AGHT+IG+qWW0/D5+yDA7n75+Ex1p9/n03fR0M4RKJdryXgjMl8/hClfAO96fgQsho6TkMCDnG6PICg==
X-Received: by 2002:a05:690c:f15:b0:6e2:aceb:fb34 with SMTP id 00721157ae682-6e9d88ea2b9mr83258577b3.1.1730142302238;
        Mon, 28 Oct 2024 12:05:02 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:02 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 14/22] libnet-dns-sec-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:50 -0400
Message-ID: <20241028190444.10522-15-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113304

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
index 37b5d61f7..ba79922ba 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=165;endline=192;md5=6ef523fa09e8c272675839e21de16bde"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/W/WI/WILLEM/Net-DNS-SEC-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/W/WI/WILLEM/Net-DNS-SEC-${PV}.tar.gz"
 SRC_URI[sha256sum] = "37a47d4def72d7338f3cc7cd807ec19bd9e2ae638ae656fa536cf0314801989e"
 
 DEPENDS += "openssl"
-- 
2.43.0


