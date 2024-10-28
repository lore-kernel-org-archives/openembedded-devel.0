Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747DED5B847
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 22:15:16 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.117.1730140101293057090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 11:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELDetrkM;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2e41bd08bso54976097b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730140100; x=1730744900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqT5VbfTw9fZjWFeyiCx+vRUHgMwudsWOXjFaOq9w+4=;
        b=ELDetrkMAu5z7VZKg5I6x3Zjx3PWBtxTyrMz3JTfVYOPhbmSDF+F3UROOylfU84nRK
         fAGHnFqHb37/08L86YgySk0XQ3f9VtGwOEn2tLi2xDZfECv9OVzjB8lq/g0BECmoVM+p
         0R9eGZE3vKNj9aFnzZN0N+AmHmD1fL8SfBEKxXaMuX/YBaZ3SMMUeQ0TO8mrJR6SO2Gr
         vX+9EwedusWiIAtYjefKtElhdUbHyZ7nLskmh/cI0IzM+jEBYJO3KM1lwElvuGYgUjq4
         fGskq/6jfjuhjn11j3pn3sGYk/s4+a0X5AIJQrev/dJKBxKv/UXwQJBBRO63CYTMVqWY
         /QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730140100; x=1730744900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqT5VbfTw9fZjWFeyiCx+vRUHgMwudsWOXjFaOq9w+4=;
        b=wlicS8GJPEfk2ZRZ6VAcm9WsxDbz+q4l0MpFg9cACuiPruIvwsNKdXuFgNtOJ24quy
         rTg2tXufKXuSrqi8YXEjLL7DX2yZ+ucXwYM6RoFSlRQ3DcBDDUqrscM7GC2PNjAvLNG/
         Kd4Zvl6jIa4ekh66ZIlVa3WVUxdprlETAX9rpV7V8ZjekhjXaC6jHQb745I2CwrXpRWj
         8lmZk5az4udk/7rsrA8Bu99faIBc4T3gXw5HTiplDNC53QtDLN9h6IVZ+hJcFdKqZFlZ
         L+UDNLOBryPs5PKS3VgVtVq6JCcWLW5dftMi/Fn/QjRCPIm1ccZd/OG++OEH4ngnxiEn
         E4Fg==
X-Gm-Message-State: AOJu0YwvA2q9LGay3jhptTFjWp69vVbOmVQ4ByA0++1NJVok3lcQzBSl
	GF9skRCvqt8eXUAnJwtpIiPg/PpDJ8F/Ha04qN8XBIJZXlbWFbFERRNY2w==
X-Google-Smtp-Source: AGHT+IFLrt3iwqdU6EPFVX3C/IsBmdL0gCgBac5BUENobfrFCkyOLcBD0H3OVK6f0M6upUUlXGsfag==
X-Received: by 2002:a05:690c:708e:b0:6e3:1b52:d8d1 with SMTP id 00721157ae682-6e9d8a6eb96mr98760227b3.24.1730140099928;
        Mon, 28 Oct 2024 11:28:19 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c770cfsm15493397b3.99.2024.10.28.11.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:28:19 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-perl][PATCH 14/22] libnet-dns-sec-perl: Use
Date: Mon, 28 Oct 2024 14:20:30 -0400
Message-ID: <20241028182749.5058-15-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028182749.5058-1-schonm@gmail.com>
References: <20241028182749.5058-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 22:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113282

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


