Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84C8D10384
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.6198.1729801152413926243
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PRcPHfiE;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e7e1232648so13483287b3.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801151; x=1730405951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EUJOznKq5Pta1AshOZ/0jZ/P9Hu6lLWoQS7a/ISDU2U=;
        b=PRcPHfiENsSdgBBvjGmNJ3dNNM6vr5ob6vc0FvgdRO4skZndO7WyoKWMUTIYtrJPxf
         4YrjV3oUyFAV3T8zm7M/RMeCMlrrsF9/AN18JNaNf/16gjZVYjVVyeQGAYIUxbrjswGl
         bh+o7HNLbXjccMwET8ox3Tjw/5pdySLcG1FlLE8r7Gt8sH/GlSKrX+oWnsdJI/Ag84XR
         KLxL853AozyIN083vgEsXvTAh04yrVsK0EBzSOQa004dHV7SdJYBRTlVtg0GUtbHxG96
         4cGcPOCmmjx2KRC4XmYF7/4+EcJsg9Puw0He68v5YFQ/niu3a1tcNxq/u6GGi2ds5hV5
         Xh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801151; x=1730405951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUJOznKq5Pta1AshOZ/0jZ/P9Hu6lLWoQS7a/ISDU2U=;
        b=UHxPFmFWbaYJt8PTJ7v2kyT0Y1sV39E3U0EPSXxB/lILXzn71splBF6cWYQxYL1cpQ
         GvV82MHhh9x30I4IoQ6bQdWqxKsapgICrcw5AHhk5iG3OHrzFcDWcJYCGqLZrK92tCfo
         7MvBbSTI2FoQ7QJMNCYB4hX69t3cNrj+3BuglchPSEMdFv6AsZMe0ZW6i/fjK2M/iSA9
         lnVMo66jr/0V+NrKAkPtbI4Csi3IEPy2F38/+bzRE+cEPketpnC9DT+OMGg/S2oeJYO5
         67yPSaTWziZ/F8CzaxE1jiz+46xcU8OYWDZ8AegK50c+9Kssk7uFyQ8DYZg1PQ3JQQGX
         8udA==
X-Gm-Message-State: AOJu0YywUlST8wonLSPRAxBRDHJmtV9pm012FyQMz0KUG6kfVQt8tB6J
	L+MDuTngnTdUZs69LEgeKhIvtVOa2R0SAQb2hvPK2hIYCDSv56QYvqPv/w==
X-Google-Smtp-Source: AGHT+IHGglVuwlMhpgTFRFFA8i5Ks6NzDK7mGCot/+HGD3WgHyWti2xC1gZA5X37xPeiyDpE2oyXHA==
X-Received: by 2002:a05:690c:60c7:b0:6e2:ada7:ab3e with SMTP id 00721157ae682-6e7f0f4e81amr20211507b3.30.1729801151075;
        Thu, 24 Oct 2024 13:19:11 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:10 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 28/42] libnet-dns-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:47 -0400
Message-ID: <20241024201806.440273-29-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113206

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
index 7b411f09a..de979cf22 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.47.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "This package contains the DNS.pm module with friends."
-HOMEPAGE = "http://www.net-dns.org/"
+HOMEPAGE = "https://metacpan.org/pod/Net::DNS"
 SECTION = "libs"
 LICENSE = "MIT"
 
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=252;endline=269;md5=de95b6a896d5f861
 
 DEPENDS += "perl"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "fec3dab10ac82dbac26b1ae2e367909256f420835d96cda7dc1b508e29938f0b"
 
-- 
2.43.0


