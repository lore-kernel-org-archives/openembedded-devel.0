Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2A3C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:57:12 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.28415.1656611829344616802
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dBLZbkCQ;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id h85so19904376iof.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=du2GpsA9FZCP3SOHk7N4rFonbNt8NTXOKy/APpQnqbw=;
        b=dBLZbkCQlYSNvgz0x513T6X0o5cJC4oF2A4t4XFpRA0CevjsMTaJ4xzCyXfd4T10Oe
         127qytLP4Cp6u+i15KGUotQGTUviw5PpTYVCDevWltPPDxu2eJxU4zY3wYLq6QQqD5RH
         KNPAPqT71wRrrLuYI+3IcgVXkkIj7sjLMXynsJnXwZK5YPAj2mBTwf+y6L+bXvDXO4/m
         uo4++qokQWPR4/Ctf2Gs9PT3LOFL7XYs2zXgwDyIu5pTG1Rxq6PdJjCm7GeoCZ1G1Toz
         l5HJxSygrgkW+rzViHZIgC3vcWbmdoOEhcWKc5imrECckYXq/vIlKSq5dI1aH5SC8m8x
         yrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=du2GpsA9FZCP3SOHk7N4rFonbNt8NTXOKy/APpQnqbw=;
        b=ysA2PKVnXQfKukeXF6pw47eHov4JvijNsq8Wu7nEvIgNEkYpRn6yIU57PaH2a4ki4t
         vrcC06eiaDPtxsAvb7uePvKt8AmPuyrX6RjiEig/hXnYhmfnONerrOkldn9CQOAYj588
         xNGM+dhTY5yf/vWyM9ZO04MNNHoL6L0cNuDHyEiZXoc8MvKg5Xx/8qMGmp5CD+9qfHIT
         A9R56BdDqtTCHQi1ifW/A7H1dsS6Rlm3P0EwpQrgzxw+HKy6sFYXDpJuAhHtYN6HCLNk
         CwjuPXHyEY0FrIgmyLc7JU68AHQkhYn96VcLWT1MbapCxv5L347jzGR/st+MiJgrdJ66
         ewXQ==
X-Gm-Message-State: AJIora/AnHyCDjrtRqQHLPRQfsrAMtuRfM/upPS4BYjR0YenA/S4G9Xg
	CdZUidtRzFZm8iQztveTxsxupgz3+B8r8A==
X-Google-Smtp-Source: 
 AGRyM1v5aIUxwo6btL4hc8pZkkHZmbkyIU6tOYHRPhD1qPLn58GsenSj1sVN8oiGk4QU+1H2qvkkKg==
X-Received: by 2002:a6b:d309:0:b0:664:716c:d758 with SMTP id
 s9-20020a6bd309000000b00664716cd758mr5045727iob.157.1656611828512;
        Thu, 30 Jun 2022 10:57:08 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fea8:95df:9730:6119:b422:792f:b68a])
        by smtp.gmail.com with ESMTPSA id
 b28-20020a026f5c000000b0032e70c4e12fsm8956793jae.28.2022.06.30.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 10:57:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] libxml++: Disable parallel make in ptest compile
Date: Thu, 30 Jun 2022 13:57:02 -0400
Message-Id: <20220630175702.15954-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220630175702.15954-1-raj.khem@gmail.com>
References: <20220630175702.15954-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 17:57:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97644

This fails to build in parallel, perhaps needs to fix the component
makery

Fixes
| chmod +x dom_build/make_check.sh
| echo '# Generated and used by "make check"' >dom_parse_entities/make_check.sh
| /bin/bash: dom_parse_entities/make_check.sh: No such file or directory
| make[1]: *** [Makefile:1807: dom_parse_entities/make_check.sh] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/libxml++/2.42.1-r0/build/examples'
| make: *** [Makefile:1812: buildtest] Error 2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/libxml/libxml++_2.42.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
index f75568a1d..7347e30f3 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.42.1.bb
@@ -27,6 +27,8 @@ do_compile_ptest() {
   oe_runmake -C examples buildtest
 }
 
+PTEST_PARALLEL_MAKE = ""
+
 FILES:${PN}-doc += "${datadir}/devhelp"
 FILES:${PN}-dev += "${libdir}/libxml++-2.6/include/libxml++config.h"
 
-- 
2.32.1 (Apple Git-133)


