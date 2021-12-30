Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F92C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 21:31:33 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.3806.1640899892857862776
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MOwEUo7N;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id w24so19008129ply.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Dec 2021 13:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zj6RUUQxF3hb2+FdEKgSc1JN3oh2pyLNhXyGuX5ElEU=;
        b=MOwEUo7NMEtEw6x26v1DKrr1Cs0wB3F7FehTLO7LQDqBMcV9T0PV7JDeArQscn/JFg
         rbS7Zw/2yh8RN7tjBDozJR21e8JMyHGlhajjAuR0/nvxr5IGq200TcSSpfuxsrD5WBxA
         vFfkR+21uOGilLSK/YFt0221YU8Iz0ByHrAJh5kCNRr1/Q0wkJ33u0l5lMlG3ZyCQRwq
         HnFZFfGd5SBeYVxLorVcNYGVPp9oZn31qk5ImUhmK0TtPLFslKS4L6rais1UPXLY74VD
         IyuzRDWBka7N6+hHbBDqoz64ZFt6OKyKMS6caVSZoYg/O7cOonj2oUKISEFqa627JzYe
         65Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zj6RUUQxF3hb2+FdEKgSc1JN3oh2pyLNhXyGuX5ElEU=;
        b=tUABZDlDDKG4dsFKDU99mwoD+xCZGtDnmqOR8/s4LJ3KZ0jv4QR9bn/oN+bdNWviQS
         CV9MrJSzIehYhFhDzUQvczyZ5I8+6F4wfETSJARBtOTdn1YuU/9pQkJ/WYMf8rFMxigx
         fa+1eb/5X4LlvBi0Of5xpRoA4IXdo4p0uFYP9Rz0hxj1wQ6OPpO2BbCL6BrKVIrM/hF9
         LSqddbfUyfYJQg+USo4IaSI3OHzAD7Cggvd4/hweyBwI94J2IhnWnJ8kE0uMnLxHhNDT
         i3VSlI3EhT91MyCneyh4zAJ9Stqsb0nTtQrNdQ+3iFkHfJ5EouC1prr81NNFyVDbBZU2
         nEcQ==
X-Gm-Message-State: AOAM532ZIWdwGQXpMJFJyCvLUo2LSFSCezn54sZeoCCWeGgTJwPKj7PG
	JMAzZYSsMmqOBsXCHdh461yKmTYeK1s=
X-Google-Smtp-Source: 
 ABdhPJyKkwiYHbw+qifw6/QdCb6Za6CYwtuGmrWrTfNqi7RcbGtfwpL6M4I2JWom3byEXpSt8zbSbg==
X-Received: by 2002:a17:902:c947:b0:149:92d:fc44 with SMTP id
 i7-20020a170902c94700b00149092dfc44mr32599536pla.139.1640899892051;
        Thu, 30 Dec 2021 13:31:32 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:a625:8af4:d190:e823])
        by smtp.gmail.com with ESMTPSA id
 t27sm9348384pgm.52.2021.12.30.13.31.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 13:31:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Honister 7/7] libnet-dns-perl: upgrade 1.32 -> 1.33
Date: Thu, 30 Dec 2021 13:31:23 -0800
Message-Id: 
 <55cd5fa4cafe974e4e4ed28b2827530693947b1b.1640899794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640899794.git.akuster808@gmail.com>
References: <cover.1640899794.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 21:31:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94576

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

License-Update:
  change "the above copyright" to "the original copyright"

Changelog:
=========
Fix rt.cpan.org #137768

	Test t/05-SVCB.t on Perl 5.18.0 fails with deep recursion.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 347a9d7456fbc705c58113adf397025a0cd12e24)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{libnet-dns-perl_1.32.bb => libnet-dns-perl_1.33.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.32.bb => libnet-dns-perl_1.33.bb} (93%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.32.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
similarity index 93%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.32.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
index 7e485bece5..2c7d793a7b 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.32.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.33.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "http://www.net-dns.org/"
 SECTION = "libs"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=27db37b42cd1a5173a53922d67072bcb"
+LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=de95b6a896d5f861d724ea854d316a0b"
 
 DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "b890a7b44d573f27cc713caadf1e12eaaa4478a6504d1157194df614316b5b50"
+SRC_URI[sha256sum] = "5a40e7cf524e4bd2c33cf03b82b47d5308b712083aa5ee180b0b5af54c71fbd2"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


