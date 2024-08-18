Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46F7C54722
	for <webhook@archiver.kernel.org>; Sun, 18 Aug 2024 22:56:32 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.198864.1724021785945933607
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Aug 2024 15:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZVdNaz95;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-710ffaf921fso2356228b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 15:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724021785; x=1724626585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP2BK9TGjBT1YM2s5Ub8sNDANOVJOfrF50Ts30a2A/8=;
        b=ZVdNaz95PkWLNl8QmwJ1m1Fh3MqwyJAtWSxaW1K0nDfBqRAB32mb0I6eOfWxoRNloa
         2Aprt5lSh9mKSuplliA+EcYWeAO3kESvOLAj1pOykRSflqDTdbqy2kpw4iBRpL+AS5xR
         qF1C/YNZK3KQYi3Sf+Me1W7OB52Q/6KPnw0QNR1P6Dw9FSrjtuQ/dGTlAaSGTQe1bDuP
         ZzxstAwEGpSM2kEPgOGtu+Bzbd39r4hE8K85TYZx67JZ04NLwDqS56vrZeV4iQyl3I5c
         nCRmJcTFtBGwewruGwJvVR5dmHByigRw+FDr7ybXxHzCoUWJFwMkTv5Tc0SAvannPQbU
         9OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724021785; x=1724626585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lP2BK9TGjBT1YM2s5Ub8sNDANOVJOfrF50Ts30a2A/8=;
        b=B56gdIjQu4Zx33AgTTb9HUIO0p8H8s8iyTh7L/ZkGx+V78p1paLfm1bVEkarvg6M3l
         K2SG072XD+HXfsddYee3KhpDSg/77F43uQU70vB8cO09wqWZhDZIAxcMng3F7A6fhc4o
         xpH1dnKnga6SHqW+PyjsAK1HaKCb822w46gIEprBUlKUZJnnekwb2KqxqEaLyvgZLLLi
         8SKOohLq2nWNB5vzjbWmfU2wqPfe2ImC5rq1vIinbwxstFcZupVAHHPo9697uu5/Bmkw
         RX8OLKEV1jWX2zIb27Hja47s6QRWIQbZ2RJH4X2psLCvx4AWjS5tgNOUB4UfbynrWKWU
         8hSA==
X-Gm-Message-State: AOJu0YyzSZwzTb+G/HXVIOaMe8e6md/TNkC1lgdd4UKKuqXzKU1Rm50M
	FIYJtPwSV/3B+S3KswMYwQD9P3SMLQ635WYoFJBwVpsNUVa+D0vZt0KaYQ==
X-Google-Smtp-Source: AGHT+IEWiasS3l5cYFqcuv0JlxzGuLTMPALUFLcqd1lHGc98rgnQ90PtsG2Vz1jRqDEsQXYc/2NJlw==
X-Received: by 2002:aa7:855a:0:b0:70d:2438:db48 with SMTP id d2e1a72fcca58-712770960d8mr15088296b3a.15.1724021785066;
        Sun, 18 Aug 2024 15:56:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9149])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61c6730sm6564146a12.26.2024.08.18.15.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 15:56:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/5] ippool: Fix buildpaths QA error
Date: Sun, 18 Aug 2024 15:56:18 -0700
Message-ID: <20240818225620.2226473-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240818225620.2226473-1-raj.khem@gmail.com>
References: <20240818225620.2226473-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Aug 2024 22:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111841

Pass OE's CFLAGS via CC since the Makefile disregards these flags from
environment and has it own notion of it. This ensures that flags to
rewrite debug flags are passed down correctly to compiler.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-daemons/ippool/ippool_1.3.bb | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
index 7947ffe457..90e7814a0f 100644
--- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
+++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
@@ -42,7 +42,7 @@ inherit systemd
 DEPENDS = "readline ppp ncurses gzip-native rpcsvc-proto-native libtirpc"
 RDEPENDS:${PN} = "rpcbind"
 
-EXTRA_OEMAKE = "CC='${CC}' AS='${AS}' LD='${LD}' AR='${AR}' NM='${NM}' STRIP='${STRIP}'"
+EXTRA_OEMAKE = "CC='${CC} ${CFLAGS}' AS='${AS}' LD='${LD} ${LDFLAGS}' AR='${AR}' NM='${NM}' STRIP='${STRIP}'"
 EXTRA_OEMAKE += "PPPD_VERSION=${PPPD_VERSION} SYS_LIBDIR=${libdir}"
 # enable self tests
 EXTRA_OEMAKE += "IPPOOL_TEST=y"
@@ -52,12 +52,7 @@ CPPFLAGS += "${SELECTED_OPTIMIZATION} -I${STAGING_INCDIR}/tirpc"
 SYSTEMD_SERVICE:${PN} = "ippool.service"
 
 do_compile:prepend() {
-    # fix the CFLAGS= and CPPFLAGS= in main Makefile, to have the extra CFLAGS in env
-    sed -i -e "s/^CFLAGS=/CFLAGS+=/" ${S}/Makefile
-    sed -i -e "s/^CPPFLAGS=/CPPFLAGS+=/" ${S}/Makefile
-
     sed -i -e "s:-I/usr/include/pppd:-I=/usr/include/pppd:" ${S}/pppd/Makefile
-
 }
 
 

