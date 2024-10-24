Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22041D10395
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:25 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.6094.1729801160057893914
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fE6LSwEa;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e29047bec8fso2063424276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801159; x=1730405959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QibYLqeB67Hf77T/nLDQx/OyQonm3kLAbXk/YyBUlc=;
        b=fE6LSwEa0iZ54S8ufk8eDvafpybr3Js2lhBHX22AfkFi2P1neaomVwmY5ni1dwqwnU
         MIKfwB8tRc3EXP2kYMgr+QEJUSZXPnodS03hGZZZH/1MCVFxKN4j9Z+gbHw5HOPAIiF3
         hS5nxMqA9K7lfpyE6/Uk+JQMWqX25SCTU723ctiRjY2J/DLzpKk6tMUNFoJMmi+1r9Mz
         YiIZ6DPVLQhZUq03V6RkU7RTCm2iTnqn+qLvRSOMOe9kthwVTkk3qoqpTzwRUyxDq2S2
         r5f0irEtEJUurPe04kfpMoFhH8pXRxdhQeMhlnL8sJad4xelhrA50k9KzYNfigzanZD+
         wj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801159; x=1730405959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QibYLqeB67Hf77T/nLDQx/OyQonm3kLAbXk/YyBUlc=;
        b=tnrIqK5irM/09CIRyL6TynNW3F5co28e9eqQUN6/gCFzMtgs63xPdGgMrPZFGFLr1p
         Y1K2/MzuhZCDZ0yxKC3wl05EU5j6+Q+zuVwEYHwzuzbjXRGav4mqHo6sHWcw1NHYBYHt
         pcrTku77bDULWH23VlwQe9H64kTEEoL5oFT///n2ksfoPSKayLbPUZYlrWogbGY+3X+R
         6YLbEL8PEtxr028M9eV7lf7SPIhTPoGWh57MRtqfT+tDN+0TpdeCtHiPqLhJcGSeE7F+
         Prh/co8OwEROHTaSW9PQjTAayjPS1D2LytlHQE4wGkf0bhe0iKwnBWjRp77CF/sECWMx
         ELJg==
X-Gm-Message-State: AOJu0YxvES2TFeBXhntnZrnkYSJu1CPL4YMJylpoCnOH5+PHvhqcCOOU
	rsg4YQRQccgGpPdXbHA7scjQHttZE4fvgWTn8cPeRPi+bnxzQ54+y83JwA==
X-Google-Smtp-Source: AGHT+IEakEe3zIzjCo5fkg8/+dRaz0gjiN+EkgGdbCdNovy3m1r/+dEpf2qR2IRiQy9CipvwID+AVQ==
X-Received: by 2002:a05:690c:fc5:b0:6e2:b262:bebc with SMTP id 00721157ae682-6e83432ea82mr29116027b3.0.1729801158674;
        Thu, 24 Oct 2024 13:19:18 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:18 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 38/42] libtext-iconv-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:57 -0400
Message-ID: <20241024201806.440273-39-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113216

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index 88125845b..d242630d8 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -8,11 +8,12 @@ Settings of fromcode and tocode and their permitted combinations are \
 implementation-dependent. Valid values are specified in the system \
 documentation."
 SECTION = "libs"
+HOMEPAGE = "https://metacpan.org/pod/Text::Iconv"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=6;md5=fadf2919c7128e887d26b4d905f90649"
 RRECOMMENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
 
 SRC_URI[sha256sum] = "5b80b7d5e709d34393bcba88971864a17b44a5bf0f9e4bcee383d029e7d2d5c3"
 
-- 
2.43.0


