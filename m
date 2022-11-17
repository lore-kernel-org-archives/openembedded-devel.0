Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5057CC433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 01:24:30 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.4423.1668648264641343774
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Nov 2022 17:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BhW7m/6q;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso473429pjt.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Nov 2022 17:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=biQ09r1WJAiUdGq3+FO4FIHik0Sz31xSGMx0si127Ys=;
        b=BhW7m/6qUGvxvAAsFwor5zuf6S//GfsO5Td4MgRBOU2QiLPqxgypGOogkgN/30+gRM
         1L3EEzS9T69qDwjamzp3Ngyc8gcZn821zA7oEhiEg4YEnxrCg4HWyRLWR6YQyhHVnC7z
         DyQ87LEmqNQK22AkiPluVMMKnXjWGwy3aepAoChTW5UhT678vN4+wLjQfwXfHBQh6aql
         PL7qIEzBt11iNGmOmFqQKMpCY1BNThycqZ4pyKDNa1gRo62EPZVVvWj/bzqxCD2R3ydf
         tczTcyL6EzF7FjOe4dO+Hg71pN/qyf1RFnPPqtOYQ5Rb9Q5oxCH4anIx3hFyq1GX9HGI
         6Zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biQ09r1WJAiUdGq3+FO4FIHik0Sz31xSGMx0si127Ys=;
        b=DOnqh9yx1O0+GRv82/aG8zWica/uSrRiWanLrSwC3/d5oG5LWJl4kl+IkrJjdERwnu
         eQzkKyLt2rNfu+O1xTrgjuuOE/uxSpGFQkD7JA4U/K20XY6UtkfFkE6Un3oGWENM6XVX
         88zphX/L6yi0tTq4r8iUZy60asNbOY3w3SNvG6Uclqla73O2Yei0eibQTfjiyXhOyx2f
         14egs/MijW477TV376Fla3jbn8hI4oNbQzohTMaO01lC8/Sg0bIxHB9r7A8y8nSjEMjU
         6X+PdhUgq7HL7JjUrBz38U/D1s9+xyTDDA1ItgSL6SHVPDcrwKOykvRR+vKsjzZlbfHG
         KAjA==
X-Gm-Message-State: ANoB5plGQxPbO/Rev+4y5Ro7SZJoP6zukUuY1euhQFrMjQYZK0wa7FBk
	/91S0uKgAxp2jb5guJJ02uq6FSuUhqlOjA==
X-Google-Smtp-Source: AA0mqf4PcF3JHj3vtmXMNAtFy6jba3zZc/4QTT9pMTj5+63Ao+OH4GGfSLBq66+jvDSRRrrsu+OKdw==
X-Received: by 2002:a17:90a:fd85:b0:218:4953:58a4 with SMTP id cx5-20020a17090afd8500b00218495358a4mr6493577pjb.57.1668648263545;
        Wed, 16 Nov 2022 17:24:23 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:769b:872a:70d0:e38a])
        by smtp.gmail.com with ESMTPSA id iz17-20020a170902ef9100b0016f196209c9sm12909374plb.123.2022.11.16.17.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 17:24:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][PATCH] libio-pty-perl: upgrade 1.16 -> 1.17; enable ptest
Date: Wed, 16 Nov 2022 17:24:15 -0800
Message-Id: <20221117012415.1506049-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 01:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99601

* Fix RDEPENDS for a minimal image
* Inherit ptest-perl and add RDEPENDS

1.17 2022-11-11 Todd Rinaldo <toddr@cpan.org>
    * Switch changelog entries to metacpan friendly format
    * #29 - Fix printf format conversion specifiers in croak to support size_t on all platforms
    * #11,#30 - Tty.pm: pre-allocate buffer for ioctl but leave it length 0
    * #28 - Use $arg to match @ARGV in Makefile.PL

https://metacpan.org/release/TODDR/IO-Tty-1.17

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...o-pty-perl_1.16.bb => libio-pty-perl_1.17.bb} | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/perl/{libio-pty-perl_1.16.bb => libio-pty-perl_1.17.bb} (60%)

diff --git a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
similarity index 60%
rename from meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
rename to meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
index 0f1c71b70c..684788f199 100644
--- a/meta-oe/recipes-devtools/perl/libio-pty-perl_1.16.bb
+++ b/meta-oe/recipes-devtools/perl/libio-pty-perl_1.17.bb
@@ -7,12 +7,22 @@ SRC_URI = "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar.gz \
            file://0001-Tty.xs-Do-not-mark-strlcpy-as-static.patch \
            "
 
-SRC_URI[md5sum] = "5ee30bf7c76f00cc69f92388ad776e2a"
-SRC_URI[sha256sum] = "8f1a09c070738adc695df903f2e7f74308dd8d991b914c0bc390a0e6021294dd"
+SRC_URI[sha256sum] = "a5f1a83020bc5b5dd6c1b570f48c7546e0a8f7fac10a068740b03925ad9e14e8"
 
 S = "${WORKDIR}/IO-Tty-${PV}"
 
-inherit cpan
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-io-handle \
+    perl-module-posix \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    perl-module-test-more \
+"
 
 FILES:${PN}-dbg += "${libdir}/perl/vendor_perl/*/auto/IO/Tty/.debug/"
 
-- 
2.30.2


