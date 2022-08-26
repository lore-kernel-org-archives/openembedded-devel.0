Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF61ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 06:12:04 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.33783.1661494317731785312
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RppaiUux;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 x14-20020a17090a8a8e00b001fb61a71d99so7140917pjn.2
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Hs6awJQag4vmY7WRWTkw9Ghv29dAmpd5ufLYdnhs5wA=;
        b=RppaiUuxFrTIBxDvJTdRv5PEzZFcNOLYT5iWr+tXJuzWXeImRr/waERUJaluj7fLin
         I0a0vgS5gG81hSNRlf7NAhFeAlajS6zodtDLtephntUPjunqku5ax3p1vtZvLoKcD6XT
         +H6VGkrdVz4avP13UAIlaQcQHh9IWpIffQRJ5H/O/8blVhLSCBp7z9ydUBat/KhYY+2Q
         hBTEn9VGNmURcjdH2zBIu8ScEYrY8+wdUDd44eDL4y745HbvZkzzTbVNvFGnoxlmyH8u
         RN/Y1iWT2u2edxWHDxDGm8TT9ojKqABXVYPCd4egu5kQH4TEjRi3kEPqVbtcUEKO9KyC
         vzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Hs6awJQag4vmY7WRWTkw9Ghv29dAmpd5ufLYdnhs5wA=;
        b=VftM7B9IfHu+ia/vw1WInaieEr6drUpH2oPA/F/IhyXT0Y0Z/EzVjOAKBKfe7X67Gc
         hg92h9v7kgyrSVgNgHJP/0mWFEIaw9cR2LgQmSb/zUiCS0mWfCo6uQLFdU8UuC7mYxUi
         oysK3HizPM5Glx0l/M+NekRP2VaEyiw5yJyD117SLXNB1y4GoNwxdXMR4pBDF1OkO/F6
         VzVrJhtq1qmPqGGLDDBJ2/GplsgdG/SrK1SyF4f2dYFth3GkFbExmsi2+NbtErCG48lc
         +hOj9gC/iYQXegDNiCpbC7s4Mb3RbGYc7h7nja6d4UORP+bsdDECI3wOCYqkrA8Of/iR
         wShQ==
X-Gm-Message-State: ACgBeo0MNQXYF9z8lYsnngp5cGqYi5NL3DL2X5WwrFAisopxXs2Gnj0R
	moQOhyLmgdvjJkqw9NFR6PnKfyTwgLvJ1g==
X-Google-Smtp-Source: 
 AA6agR6fMg+gCCvH0yWlsfVycnJ0XyPXuBpvr6B/DQ7XrZ/unk22EWwMtVJBoCenBOmQs4FoLfMTcw==
X-Received: by 2002:a17:90b:3b41:b0:1fb:5376:fb06 with SMTP id
 ot1-20020a17090b3b4100b001fb5376fb06mr2697422pjb.240.1661494316919;
        Thu, 25 Aug 2022 23:11:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::6b6a])
        by smtp.gmail.com with ESMTPSA id
 q5-20020aa79605000000b00537a6b81bb7sm755903pfg.148.2022.08.25.23.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 23:11:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/9] libesmtp: Define _GNU_SOURCE
Date: Thu, 25 Aug 2022 23:11:46 -0700
Message-Id: <20220826061150.3030485-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220826061150.3030485-1-raj.khem@gmail.com>
References: <20220826061150.3030485-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 06:12:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98468

Needed for strlcpy

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
index bf1a12d48f..164c8c2612 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
@@ -30,5 +30,7 @@ EXTRA_OEMESON = " \
     -Dntlm=disabled \
 "
 
+CFLAGS += "-D_GNU_SOURCE"
+
 FILES:${PN} = "${libdir}/lib*${SOLIBS} \
                ${libdir}/esmtp-plugins-6.2.0/*${SOLIBSDEV}"
-- 
2.37.2


