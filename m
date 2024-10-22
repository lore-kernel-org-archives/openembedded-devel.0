Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E5ACDD0F9
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:21:31 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.21950.1729612093418392770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Oct 2024 08:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aYww288K;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e5cec98cceso33899617b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729612092; x=1730216892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Dn5n4BlYnD10rRtMufubmCliRgUbIwkfHayvG5MBXc=;
        b=aYww288KMWwqxKEQ1P5v488E3E6qJuCCsHQsQh0hP3viJ7fjpnIebBuaAR6J4szxU8
         Z7v/lq6axmPOvdwyhkrNadx6q8WD3JbEt7dhSSJoy3pkyy88BHsBgmFXI9M4MNl+8yMX
         uANTDh9FPVmzTK1Y55JBruHj50f56v58Ccy5Y4FdH5V7sqD/Op2whL9CuPqdOv0YzisH
         nX8UvENxA83wimRSuPtVI1YGaO4vRRFRe3qnkytXFHUOu8srQP8cSTfSjoOkp7DkF9bN
         JpBydcsN83rKaHYY+GIJFO9K+tcEzZNDwJJflzhmS/iZR51Go11uwzYC9TCuJsrbbd1W
         j/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729612092; x=1730216892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Dn5n4BlYnD10rRtMufubmCliRgUbIwkfHayvG5MBXc=;
        b=Tu1nI1K4y7lhfI0MHpYMxSDrf+efuMsNsXO/Wh6hmp6/dOm7L8I+VTsMqq4g//POGz
         q4BrMqFWR4roOEWIVznmIq1FYPoN8m1Oswxh5FUnDh8xOa7iESBeGIuzf4BfikA6ob8e
         vlZOBZofJSfwk6b1uMsFheU02SfI+2RfZ4VJ+jWOgRXufem/XAkmmb3x5Ml2eiwIiTDt
         rt9ga7AtKZ3b330LUaI3AfAlfnGfQbG0XrQ+j89P7bzXpgaJOT6qwL4XxCj2PTv1p+mP
         D98Z6CxvkynIOX91pGmJAKkM56/fB/HlOaxCLw4da9nEC4HagUyGuPKLmQ0JDBlvuZKR
         z90g==
X-Gm-Message-State: AOJu0YxHhcFlKqeQCExccQQCMQFwJspQd/lpLutjzziVTQpAyeH9a+/p
	0wWBU1BQ/oTma5y8xvLQLqEL4BkijkovRan3qEbG4U9/mQvSWlamb3Uwmg==
X-Google-Smtp-Source: AGHT+IHI7Xp0HpPfn7n/ECKawUSGgT4niuhh1ujq3tBY6bsSlpRufULYkrM9ANZfXnmq9/hNYXFfsg==
X-Received: by 2002:a05:690c:6e01:b0:6db:b5b2:53c with SMTP id 00721157ae682-6e7d82b1ba4mr34553697b3.32.1729612092020;
        Tue, 22 Oct 2024 08:48:12 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f5d085dfsm11187407b3.123.2024.10.22.08.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 08:48:11 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 27/46] libnet-dns-sec-perl: Drop unnecessary SRC_URI md5sum
Date: Tue, 22 Oct 2024 11:44:45 -0400
Message-ID: <20241022154729.20331-28-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241022154729.20331-1-schonm@gmail.com>
References: <20241022154729.20331-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Oct 2024 18:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113118

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
index fe7bb3326..37b5d61f7 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb
@@ -6,7 +6,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://README;beginline=165;endline=192;md5=6ef523fa09e8c272675839e21de16bde"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/W/WI/WILLEM/Net-DNS-SEC-${PV}.tar.gz"
-SRC_URI[md5sum] = "ffa55a9898192c9d4c623cb1357eba9b"
 SRC_URI[sha256sum] = "37a47d4def72d7338f3cc7cd807ec19bd9e2ae638ae656fa536cf0314801989e"
 
 DEPENDS += "openssl"
-- 
2.43.0


