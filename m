Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCC0C47085
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.14008.1650769814792109878
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cSmhcovM;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id n18so19594096plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k3k9RHpq9jsoQP1LX188xnl5NvNzT+oNdVEwSCLJbGQ=;
        b=cSmhcovMrVVOmSCAhzJcvIkHQDzaQhq5kZRNrChyaXL5iFrGuctRuoI4t5iKi1yjgl
         OlEDF7BVfWiH6yJZg50MubGaLIvL6tugISjfE13RAKDTQ0qp+pyNwMeC7QzJZZgtoP51
         ykx19jHxWNVqt2OrnzKWkXkpN3ftrAscE9rRnLLnw4ErVkY0jcLFaCURRJ+4zmy/bO1N
         a4Of7YKGth5B0PyXSwVyOce5s5AfEutlDaTmLCW/4V2yhWmVBfHn2NALdfjpuhPXPlgb
         PzFTAZT7ttSgAGt6wB/cDBq+BIEJ9pdOqkXUM6c7m8QuMylK3DCv+BohoHCuJdxC25nM
         XyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k3k9RHpq9jsoQP1LX188xnl5NvNzT+oNdVEwSCLJbGQ=;
        b=h4RIc7Q5yYVuFczrP1TPtB3oNc3ICzrPA6fOE5JD1UFDIj5KddsQDmiWdNvlDWBp1m
         pGIH4i9nwKPz/T0kGGYTn+0oMcQhyEFJkVxsdB9jXq+v3+2s8Jn1MXzOA7KJXyvASETV
         MgWKyM1nvnGSasrHjn+w1HiPGIS63V2SR0ZeFM23u/5K1DTdRfEvdsijuCOdYNVeJOUO
         FaUh/SDVC03t8iGXnW6dt3XmDagLXHA7zizXkhKyjUL3P4fQKWB1pGNqyOFr97qahkWL
         CriHoX+PWp8dCJzHJI2Nt0PeR+CAEkJXKxnOMutFheXMBKGM6hArBNSxllOaycy5MiWk
         sv4A==
X-Gm-Message-State: AOAM531J2HF5EH1f9ZYDVHjGMYclJ3USAFOz7lseJc1dAOmGXs4Gz1br
	9vQOztUWTht/Dk7skLoYCf+OH+7Il18+XQ==
X-Google-Smtp-Source: 
 ABdhPJw+ltaYrEjnGHnTpv1xsqSPqH2khlgBGjHSRkahoW2PWFC0w+/TCW/wE3t5lcynCh1Lz1PwXg==
X-Received: by 2002:a17:903:240c:b0:153:c452:f282 with SMTP id
 e12-20020a170903240c00b00153c452f282mr11584014plo.88.1650769814127;
        Sat, 23 Apr 2022 20:10:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/12] scsirastools: Fix build with usrmerge
Date: Sat, 23 Apr 2022 20:10:01 -0700
Message-Id: <20220424031004.3209576-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96746

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index 66620ea5ff..d3f2bd678d 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "e7b997e75decb06a650c42c35cd63d0c94c34e39cf133c723337b0eeab
 inherit autotools update-rc.d
 
 # mdadm Makefile has CC set to gcc, hence override CC to ${CC}
-EXTRA_OEMAKE += "CC='${CC}'"
+EXTRA_OEMAKE += "CC='${CC}' sbindir=${base_sbindir}"
 
 
 do_configure:append() {
-- 
2.36.0


