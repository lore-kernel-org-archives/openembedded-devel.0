Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B04D1036C
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:14 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.6180.1729801137658127494
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TxQlBiAv;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e9ba45d67fso6949367b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801137; x=1730405937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXx9fGYY/p42tYXZ0mrCn0HTMabPcd/89EJCEywL/T0=;
        b=TxQlBiAvDkNcxBeS6ZvEh0fVUlr+Dsbu7uzxGc5S2tC/IdoAnDJ5wDJDACc6K6HLs9
         GxGB2m8KDplKrVtiCOiTkKWeqmIpjSqF9yEjiu0XHAVXZzpNhmEU6dAMgpXChlqXR8hO
         nuHknaOxwWchNUbhPCSyAfu1/JKBAbAaNM4BPyw1Nwm1TUckTXIIxJ6gfDlb3q7K0Ahc
         vFrdmBmgef8mAke40VVE6vi/PaVLwDHRoe3Tjene5TrWzcWvVNsEa/Znj0QDynEjnTId
         l9An/Gifg4J9CndnArzFprxXOjdPqeiJchHXCx9b9tQ+eh5PXFlp//yavmqsYgpH+OAx
         JnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801137; x=1730405937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXx9fGYY/p42tYXZ0mrCn0HTMabPcd/89EJCEywL/T0=;
        b=lwMMO+KysikBLL8Ne4UfA1ofGBjiKu0FSoKjuHOQYQuxn4pfcUZckv995Mqh4etWbs
         2QTxgzfY10oQeNfxeoZnJGqBUbKy+F/iD0KDATWSb5wqCA0p3XwSVdmgVhtVdakBwqRw
         AOMUWuEP7/g6jjUdCD3sttgPpvJzvpQUlVPEPjg5vmEpPyfdmIDoNN8e5QYRqK562XDX
         3kWfQZqupLUE+DHJ18LGi/Z0kP+suqxykpfSrQ4Yj0r3fP+vhtwBDtOjWWiiV2JLM+el
         p453u5w8d7M8FZrFnV6gI74hhCcvv3Lo3mjOp2+k2Cvd4wAsS6URHf71P1fHEoIig980
         xKIQ==
X-Gm-Message-State: AOJu0YylJCpN6oGdnUAKzhC4/WRdpOYTE5j2uidXB8bZF/EFbeq1yAsb
	8daLUTNVkOalcptJUkAunizIBA11VXSclC7aKJvuLfw2ce7Qp0SKHR9MlA==
X-Google-Smtp-Source: AGHT+IFaVHovVwqKVCiv7G4lZw1KwRH9jro8Ni4q60Z1EUS2p3/4Fr9Dg1LxTgewc1WrC+hkTYZT3Q==
X-Received: by 2002:a05:690c:b8e:b0:6e3:d4e3:b9b7 with SMTP id 00721157ae682-6e7f0fa6edemr77254857b3.35.1729801136310;
        Thu, 24 Oct 2024 13:18:56 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:18:56 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 06/42] libcgi-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:25 -0400
Message-ID: <20241024201806.440273-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113184

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
index 94fb4393c..38c2e0fdd 100644
--- a/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
+++ b/meta-perl/recipes-perl/libcgi/libcgi-perl_4.66.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "CGI.pm is a stable, complete and mature solution for processing a
 HTTP requests and responses. Major features including processing form \
 submissions, file uploads, reading and writing cookies, query string generation \
 and manipulation, and processing and preparing HTTP headers."
-HOMEPAGE = "http://search.cpan.org/~leejo/CGI-4.28/lib/CGI.pod"
+HOMEPAGE = "https://metacpan.org/pod/CGI"
 SECTION = "libs"
 LICENSE = "Artistic-2.0 | GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=415fc49abed2728f9480cd32c8d67beb"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/L/LE/LEEJO/CGI-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "4697437688a193e3f02556e1d223015590c1f2800b40becf83dc12d5cc5ed8e1"
 
-- 
2.43.0


