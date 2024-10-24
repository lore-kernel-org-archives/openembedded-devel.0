Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBFBD10387
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.6087.1729801153427534886
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+CaOTME;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso1543062276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801152; x=1730405952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KD/OKAFNYcCoNDuak9I719uuanyfooQzq69O52aX3Zs=;
        b=T+CaOTME+P0Mq4FxmEHn4VbuEmEZYrSq0sB33oSfK91ZcV6B11s0+DcCFHR8xAbvzT
         KvTNdAirzdWRXwQqDyWz1t6LDvpisRf1OZmWsaigfWqxGrov4b7Jevl+ip/vnmaGZcai
         93mcUN925jdsFpsD6Itq6E0Sxp6sM203XS+DYDnssFaeO8GEBmpkSazQqyuHjwQQw4vH
         ojF+GVp71QoiRpPnASiy5uiwTg7rXLavv2esYmAGY7msgMkILJDg0F+9rZYyi8gyyPMU
         DCVd+du2xJQs7Lnid0djzBh6H/9Z88vrPtnm964/I6yMzpCCPnHcjZ6rzttY2m2jAmxu
         ut/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801152; x=1730405952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KD/OKAFNYcCoNDuak9I719uuanyfooQzq69O52aX3Zs=;
        b=TDnr/7cE8pjH6KrtQj2wr5b/tfuYCT6J6HOmaO1jwLKSNGgyH2noEUFDUDylk5TIDJ
         fTQ6N2UU2O4oNN+w7l018hJoQga3G5z3tuWvQ31QIYqYAnl3A/3LykfX63ysPJx1CEi/
         DvUk8TN89xk1PY8toUAEaOx3K6Yi7iq68PKG1OO3BWbH79eKoo6TSaydzxoJVzaDVkYa
         tVXVwZEA0phqvMqZwZYnB1nuT3uy7alDnnoJFoSULWdnnqOVEsJrOYqcwjekMaI5PFKW
         D/+a9lMtewJwusuom4y0EzFDuPOZ5gYc0lDWUZ0cikzeF4zpRT3X9O6yXlnZ7eviMdiL
         bPsQ==
X-Gm-Message-State: AOJu0YxzzRjsAc3wZsL0u4sXnSIfbZsNiak6JKxYpXnD9MIfrrZa3jwu
	qjRDLel55/Trhs6oAygChGd4gnxqtwOe4jeei6JJ4uGfTIK0O9lOqNpBFA==
X-Google-Smtp-Source: AGHT+IGuy1R+nMdNvrt670QW3N3JSEpza2Iavk6gX7ob+54Xe6ccktlYzS0yfOq64yoHM7vlsf+EyA==
X-Received: by 2002:a05:690c:4513:b0:6dd:ba9b:2ca7 with SMTP id 00721157ae682-6e7f0ffbd92mr73277097b3.46.1729801151775;
        Thu, 24 Oct 2024 13:19:11 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:11 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 29/42] libnet-libidn-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:48 -0400
Message-ID: <20241024201806.440273-30-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113207

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index a22b63809..de85e2664 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -6,13 +6,13 @@ Turbo Fredriksson's PHP-IDN. \
 "
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-HOMEPAGE = "http://search.cpan.org/dist/Net-LibIDN/"
+HOMEPAGE = "https://metacpan.org/dist/Net-LibIDN/"
 DEPENDS += "libidn"
 # We must need glibc-gconvs to enable charset related functions,
 # such as Net::LibIDN::idn_to_ascii().
 RDEPENDS:${PN}:append:libc-glibc = " glibc-gconvs"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
+SRC_URI = "https://cpan.metacpan.org/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
 SRC_URI[sha256sum] = "2f8acc9442b3866ec7dc63cd449fc693ae3e930d5d3e5e9430fbb6f393bdbb17"
 
 SRC_URI += "file://libidn-wr-cross-compile.patch"
-- 
2.43.0


