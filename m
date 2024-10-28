Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC0DD5B160
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.1063.1730142301654115545
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=izYht/ia;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: schonm@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5ebc5b4190eso2639048eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142301; x=1730747101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQjlvFoSlOQywYWnOKYjYYhcX5fYzytgN90VcymOg+Y=;
        b=izYht/iaH/fB/TehBJgI4t41ztrIiEJoFNudoHPQhIMtABi3atTtjYSdG/bjcFN+MP
         zvEZ7NASk1vZFR4dvDdFM880bsz1WU5ZaHGndZXvr9XDq/EokAXQ4EraN8nWsFImdPI3
         v4b5zVhvZHNXG264cE3NgadWsJE4LQvf1/WYMKVy+2wZZyop5pDKBSZwcrEzRumxOJSu
         WSokiX/hojtfhfDk5TQO8o4LGHvj9z9sicpASXORObIhNKQ+inZIsGV1AqICGfJgM0tv
         a46SzTO/ja7HDQlzc8vIeQbSN8sfxwxO73HG0hXhR7bC3+1R7H9fO2cG5wpv1sEmb0qK
         s84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142301; x=1730747101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQjlvFoSlOQywYWnOKYjYYhcX5fYzytgN90VcymOg+Y=;
        b=gCFEFMq8PpPoPNiK85da1yspobLa5z3aNumemGK8+6gtPrxrW4FjBiciXjeY7JPPTm
         nwCay2OlhRphIoZUUPTv6bNMCIPQUXH2ZafrOPcmgl2putORZVN0LgL2gW3CTq0v4c4s
         womRVFJaVfmHxXRSlqMQ34cloW/bJIHkXP9nu8euefuMMdI87iw1fuOeQITeKp5V0Ki+
         6YHzq2bzCjA40ooNrkAsCWzEDROb0vwSqzDxwq3kL9kTyuSuclOmy9VGnm7EvlULjDQd
         zbpKqUweubHUW27aR8JBWYGC+wURnY+YsJ2JZnf3GlrnQEFJfXpOzn+sm+skaFwijfHZ
         NFtw==
X-Gm-Message-State: AOJu0Yz+EobFqEwNos+wKt5WFA6Fp8MiBehk2TWelAQhRp/hcFZLSXP8
	GlPWI0kTs0/n8qHMsBc6yHoG6VM5gX9as4uRn+uhZnB9AJu5N31jJExA0w==
X-Google-Smtp-Source: AGHT+IEN/Ddhmd/0fnOZw8tHGqmnNKA3Zf1A9o0CjfTghjbY+E5GQGtJYYLTJSAdSqopCZ1eGk0e8A==
X-Received: by 2002:a05:6358:2820:b0:1af:1b14:791f with SMTP id e5c5f4694b2df-1c3f9ebd70bmr343566855d.12.1730142300348;
        Mon, 28 Oct 2024 12:05:00 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:00 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 11/22] libipc-signal-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:47 -0400
Message-ID: <20241028190444.10522-12-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113301

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
index ca49b304c..43a6ff652 100644
--- a/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
+++ b/meta-perl/recipes-perl/libipc/libipc-signal-perl_1.00.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=16;endline=18;md5=f36550f59a0ae5e6e3
 
 S = "${WORKDIR}/IPC-Signal-${PV}"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RO/ROSCH/IPC-Signal-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "7c21f9c8c2d0c0f0f0f46e77de7c3d879dd562668ddf0525875c38cef2076fd0"
 
-- 
2.43.0


