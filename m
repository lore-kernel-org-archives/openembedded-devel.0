Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06EED5B15D
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:15 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.1011.1730142304040744461
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mkPzWU3n;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2e3e4f65dso49379977b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730142303; x=1730747103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvpnJBRCwNuT0j0WsH0diuXVIsz4AFl1ytLXmrAWa7k=;
        b=mkPzWU3nltbnZtaBKo5dGgB8D5GPV3Uq/LnlwopBpvRMQ63NB+Re7BUHDeEE7EuYd/
         tvJWAFPMpIXCltnxmvcb3xcpEoecjD63o078fYLzo96gsCF/yXu1gmONkxZRJxVp/ZHA
         +4cE2dCUTrqdvNpLtra1rHPlY1yqLsf9zESAwpXJqZ9xWsRZ2ribyST4PdWhsdBYurPc
         IWY01vdSLQPMPcYxE9/pTbV/xjiH9TRY4HKLc4P8mdxu0eKWynHCGQ7KMs2cVmozNNE3
         egt/oKbULEiaMGI/AfQ+DdLeCgcN8InjqSIftxqDYeaLxpcQafCW4KPUxpTVOfS8JWMe
         UFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730142303; x=1730747103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvpnJBRCwNuT0j0WsH0diuXVIsz4AFl1ytLXmrAWa7k=;
        b=FIe1PSD/55Smx7BUpzLUoParns2dtFZBivI6kDX24dMwHBiEuul/C+MEaQTmB6XHvS
         aJIgI6wKrmmvFXPTivUA3IcLQUmcz8UJcY73ZCyDffSCZKA5xnffiCpU1yLQg0t2vFD6
         B8tWuNUwKbJDGgqwITyRG7lh7YypObl3rG1JZsb1aoySnYNWOrVzEAOfC4SvnBo65AMm
         dRJbT5bxYbQnuX3wXReZpzhbXBq49TSoZqzcBhVjgGWNZBCROKJUNqMQnpjgkTo8clpl
         kP/YSMPJxe1S+tGo5y3B1Gif6Y5sE/bYpewHBP17EVDaIXH3i/1mpnz0hWRSQhiVCmwD
         tiwg==
X-Gm-Message-State: AOJu0YyJ6j+asNWsUKWJ43W6gEE1Of6Yc1aiifCMPkf/jgCYehHBNOoB
	Fr63a6KG9PPCQXNY3Uxs5ywi6SZOhzmCy9Omzbe/2zJMIailX6i8Uj23yQ==
X-Google-Smtp-Source: AGHT+IHJyjX249l51kuyF8peyoV1GIylOOkUw+97yFEaE6NwEnAFxw286LhuHCZXidVW/QPl26O1uQ==
X-Received: by 2002:a05:690c:3506:b0:6dd:b7e0:65b2 with SMTP id 00721157ae682-6e9d8a6f784mr96755387b3.24.1730142301554;
        Mon, 28 Oct 2024 12:05:01 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c187e4sm15557237b3.62.2024.10.28.12.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 12:05:01 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH v2 13/22] libnet-dns-perl: Use ${CPAN_MIRROR}
Date: Mon, 28 Oct 2024 15:01:49 -0400
Message-ID: <20241028190444.10522-14-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028190444.10522-1-schonm@gmail.com>
References: <20241028190444.10522-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113305

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
index de979cf22..e83701397 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=de95b6a896d5f861
 
 DEPENDS += "perl"
 
-SRC_URI = "https://cpan.metacpan.org/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
+SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "fec3dab10ac82dbac26b1ae2e367909256f420835d96cda7dc1b508e29938f0b"
 
-- 
2.43.0


