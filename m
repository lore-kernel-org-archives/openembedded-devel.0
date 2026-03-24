Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8C0FEC0FD
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 19:32:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5647.1774380762286177061
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 12:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QtVnnEZu;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b2965d4bso3079994f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774380761; x=1774985561; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJ8aiQ2xasCl0lj53J5xMx3pmYGMdeK9+ACsZi0+oZI=;
        b=QtVnnEZuEDWXXIKFXr4uuMH3zu1VYkoEc91sEozwdjovH7ZSYDJxkSSfRUDVlyT1Et
         D6Y2wREsKKRdMuVMa1qFA0Tz32niDlKIlI238310T2grgc298G4eC4ods36eP5D3z5+P
         12PsJpiBiTDwrBxsKJfkTLzb/AX4ldgjiWWLfG7uV0fwmHbE0HJurT89HLc4nsgBy2s+
         eUoqpIF4DW2JqNgRz5iW+YwfuUrzG3vg8tl6Z8BsBgunH59EVYkjkzbZTiovnXKrVv22
         GtAGBY+c+elGaNSSZyU59+++cAu5yB8Q70tG3rWaeOPGLGYYtoY78Nf9EJFvgXqw/szu
         RZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774380761; x=1774985561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJ8aiQ2xasCl0lj53J5xMx3pmYGMdeK9+ACsZi0+oZI=;
        b=XLrplJsTo6R5/nzjOC3ExSFIIOW849W4rQSygBNyZd4CrkhijqZ8zAzyFTgA/UdH1V
         RJ7isdj9WnYCkRj4hDiQd6QmDIgjDg82FOFPB6X3BRTQjmHn+7DmSXw7+J8djy4KcMS/
         mUO556STqLuN7I/YPuR0rWYHH+BU6D2T4OkznFyUPbREfs9VsKv6qzvtXGzn+7tliZ7Z
         jq/G5kK3iGAL1CTEJdzTi44NqVWT88Vg9XNFuZkdl6odRCRAMsPKoPoTIxXYE52VJJSU
         v7FPMlTdeXWLTFsRkwsnjGfzFOE2a7LlYhsN3rnEbrAY/WrI0qAz5NWLZLuxm/0FDM++
         YVUQ==
X-Gm-Message-State: AOJu0YzIOVVuuqaPoV2IyRT9jlAmHdU+lzYytEHZutaXf7EsICHtHIjV
	PpI8DLzJO7INWiNC4JwDxD3YVM9PW4/l1NhZ9Lb7F+wjNxtoxNjI2vvVwGjueQ==
X-Gm-Gg: ATEYQzwf3WePTsjBqnd1Wvx+yEvHgO2p7B59Can6eceUiso/r8rjkJUkbiJ7O8CIQoa
	5pUU5P+Ol3/nuJB9HiGPqSyab5iCYN6pUC7JKc7VRzs4zTRiQhCeg2Ywc0gJdmgdS5IwGaZ6ePh
	CKapz32UCru6O/+mswTABPnPZEgZtNWAWfNuJF4Lhf610/5ijIssJxxE4dTAhhAxdgam+H2W2Nw
	BH5lzZ4b7Noq6hVfEFIvUtn1517z8pVO0dc/iIzn9vmPRmDB4mTMT99JuiaIki8voGQ5d8xrPhp
	tEHnD6l+69WO0OY0S1jWazJ7+qNm8dWme+lmb0L42BilBqbWpzfY+bw15wNtiebYYWpXuqBr3Cu
	DPi13vy82EJ8CFcYrP7sAGFxbsoFZ15pjfzvrIS+xjDJkzADRQD+TlO2VrCxhsXxJeV/beMRLim
	zRyRCtz0sv42gJWDDx2KXo
X-Received: by 2002:a05:6000:609:b0:439:abcd:b317 with SMTP id ffacd0b85a97d-43b889a49f9mr1065812f8f.14.1774380760344;
        Tue, 24 Mar 2026 12:32:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b647036e0sm41297950f8f.21.2026.03.24.12.32.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:32:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] imagemagick: upgrade 7.1.2-17 -> 7.1.2-18
Date: Tue, 24 Mar 2026 20:32:39 +0100
Message-ID: <20260324193239.3723517-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 19:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125587

Bug- and security-fix release. Shortlog:
https://github.com/ImageMagick/ImageMagick/compare/7.1.2-17...7.1.2-18

Also remove the obsolete CVE_STATUS assignments - all of these have been corrected
at NVD, and they are tracked with a version/CPE that mirror the real vulnerability
state of the recipe.

While at it, also corrected the reason for the remaining CVE_STATUS assignments.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ck_7.1.2-17.bb => imagemagick_7.1.2-18.bb} | 75 +------------------
 1 file changed, 4 insertions(+), 71 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-17.bb => imagemagick_7.1.2-18.bb} (37%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
similarity index 37%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
index 2a1152087a..49bf257cd3 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-17.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-18.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "3f2f629405c62106d3569547c03634bc46fcd07d"
+SRCREV = "d4e4b2b35a573fb7d96bc64ff1a417415bbe0f4c"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"
@@ -125,73 +125,6 @@ ALTERNATIVE_LINK_NAME[stream.1] = "${mandir}/man1/stream.1"
 ALTERNATIVE_TARGET[stream.1] = "${mandir}/man1/stream.im7.1"
 ALTERNATIVE_LINK_NAME[magick] = "${bindir}/magick"
 
-CVE_STATUS[CVE-2007-1667] = "cpe-incorrect: CVE should not include a CPE for imagemagick"
-CVE_STATUS[CVE-2014-9804] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9805] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9806] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9807] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9808] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9809] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9810] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9811] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9812] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9813] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9814] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9815] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9816] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9817] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9818] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9819] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9820] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9821] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9822] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9823] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9824] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9825] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9826] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9827] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9828] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9829] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9830] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9831] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9848] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9852] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9853] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9854] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2014-9907] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-10062] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-10"
-CVE_STATUS[CVE-2016-10144] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.7-1"
-CVE_STATUS[CVE-2016-10145] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.7-1"
-CVE_STATUS[CVE-2016-10146] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.6-8"
-CVE_STATUS[CVE-2016-5118] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-7"
-CVE_STATUS[CVE-2016-7513] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7514] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
-CVE_STATUS[CVE-2016-7515] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7516] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7517] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7518] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7519] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7520] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7521] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7522] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7523] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7524] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7525] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7526] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7527] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7528] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7529] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7530] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7531] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.1-0"
-CVE_STATUS[CVE-2016-7532] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7533] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7534] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7535] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7536] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7537] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2016-7538] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
-CVE_STATUS[CVE-2017-5506] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
-CVE_STATUS[CVE-2017-5509] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
-CVE_STATUS[CVE-2017-5510] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
-CVE_STATUS[CVE-2017-5511] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-3"
-CVE_STATUS[CVE-2023-5341] = "fixed-version: this is fixed in 7.1.1-19"
+CVE_STATUS[CVE-2014-9826] = "fixed-version: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2016-7538] = "fixed-version: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 6.9.4-0"
+CVE_STATUS[CVE-2017-5506] = "fixed-version: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"

