Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52338C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:55:52 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2480.1667361345506405732
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BrCkkgbT;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d24so15415465pls.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 20:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFOTgTvQLinQPGi0hMa4Ekb1HMYiAaR8mfLPP/FiDTA=;
        b=BrCkkgbTaFjPfofCASHfKRk8uslXbWguVPKhUAsspMuAwN2W2wkgASUqOCFd2j4lzm
         usUUoaaJTeRVXMjgkcBKfs9ZjHQvbDMhA2IxDRJcpnCz8+MY+09NJsCSHdJpy+4myQQ4
         Lr7AnqxOwvz3z3B/Tj8iedeLBGOvJ9eFFU7ecL19qiVR/Ax4Nt2tLsdtGH/4Xx6bIxKT
         FAN2o2U4JOxEHwdTnScZoJDldUe0MxIW9VHe6Iqjlerj0pW5Rh1sKH3UT28fRROaw8mw
         0HVe8iEOx94c+gtEHpWab9yz9sbF9KBAKmVe5Klx/0UQO8sai1ql8a7ul5hOAggL4pug
         Toiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFOTgTvQLinQPGi0hMa4Ekb1HMYiAaR8mfLPP/FiDTA=;
        b=VuUPIz4Cu/ltpVc7KshGyFvNhTttgq4caKLMVhvpoY9Tjjssnkwx4LWUohcXANqv7F
         a90c9YOtXOHfjQxRRarnP1wIUdqhOwSjqMDSQ8FW3bJlxE4L8+032wr8uz8NGg4SJEdI
         v045/MW6IR0aawk4iTak7dfEY1Diw3a/nqapslWLFeICbbf4w6bSOuAHmsHY4s4fZmYV
         p4agj6q+Zu33BZaIYk+L7gJWC6RhY4gjy+53mb4yGVCyFtH9t8ZL3yFXTkGxC7Pq7NDK
         rDLSih5TfltYPzjVTJvYWe9fPxqYvoHJKZctY/jGIblCO/pCkXkAm6DphxRoVIik9UEV
         Dh4g==
X-Gm-Message-State: ACrzQf2Tj+Y+QN29tgWD7JAi4qPkfkVR+f3shQKNACYhiHvOD9QAmRXs
	CqCL75XSBot2B3eL9+StLxSpA9d+wfTkZQ==
X-Google-Smtp-Source: AMsMyM6ot06sWgjXr8anEFMsG573WeLXbi3VjNrOcnFPPL1zlZydm7oe+FanLI1XV6xllI1TADDFSg==
X-Received: by 2002:a17:90b:1097:b0:213:9716:20b3 with SMTP id gj23-20020a17090b109700b00213971620b3mr27411657pjb.72.1667361344350;
        Tue, 01 Nov 2022 20:55:44 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id c2-20020a63da02000000b00460a5c6304dsm3514585pgh.67.2022.11.01.20.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:55:43 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-perl][PATCH 4/5] libio-compress-lzma-perl: upgrade 2.096 -> 2.201
Date: Tue,  1 Nov 2022 20:55:27 -0700
Message-Id: <20221102035528.3967640-4-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102035528.3967640-1-tim.orling@konsulko.com>
References: <20221102035528.3967640-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 03:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99404

https://metacpan.org/release/PMQS/IO-Compress-Lzma-2.201/source/Changes

License-Update: Update copyright years.

* 2.201 25 June 2022

  * 2.201
    Sat Jun 25 09:06:51 2022 +0100
    3287f4e9f60e1bc04cf73ef66a73423e08e29acd

    * Add perl 5.36
      Sun Jun 5 13:37:53 2022 +0100
      130eaba57953355c04b0c9a4945530416f05c6cf

* 2.103 3 April 2022

  * No changes

* 2.101 20 February 2021

  * fix version numbers in meta files

* 2.100 7 January 2021

  * trim whitespace
    8980603bdb827e60bad8f039c94cc55add63a031

  * Avoid indirect calls
    871231f020e064978af9e2a0fc3954511467534b

  * fix typo
    7f580a0df76ff1dbbac76b72dab45aa012cfde47

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...-lzma-perl_2.096.bb => libio-compress-lzma-perl_2.201.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-compress-lzma-perl_2.096.bb => libio-compress-lzma-perl_2.201.bb} (71%)

diff --git a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.201.bb
similarity index 71%
rename from meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb
rename to meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.201.bb
index 09ed161d2e..327cc7a969 100644
--- a/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/libio-compress-lzma-perl_2.201.bb
@@ -5,12 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/IO-Compress-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=2d411393b876fe63f9f1d546363f1a47"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=8f4f1603d6e92a381ce2f595ab3cafd5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/IO-Compress-Lzma-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6c1b70740605b8073e4fbb5ba1e7bbdb"
-SRC_URI[sha256sum] = "2f29125f19bb41d29c4b5a2467e3560b7bce5d428176a046b7c8a51609dce6e8"
+SRC_URI[sha256sum] = "e0714dd35624654ba3d8e245ac980bcd07d995989d7acc90a46146f62c4ec761"
 
 S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
 
-- 
2.34.1


