Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67A8C433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Feb 2022 17:55:23 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.1120.1644083719962380774
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Feb 2022 09:55:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dI+euzb4;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 r64-20020a17090a43c600b001b8854e682eso1358576pjg.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Feb 2022 09:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89+ukca41Yd1FynlLH3OXgur34EZthaT25AgpIv/dw0=;
        b=dI+euzb4IfUJF3aceII8XYVq4cKbKlYo7d6M6gfJIgd7n8zwlpDXdT+T0jYIu9qjaG
         +v1SqCTobStJMSiWNVquRoMZ3C0SWUQF60ckPAbqyK9k8g8RVn0Ad00TbvLYEsgAGDoz
         wWEtliWsRNbKW1TNd3XBCBotetK1jafqYydKt62N0jB/JK1FdOOtfK6k+53c9A5ZHARH
         glw7WY1Y77qfShS33Zm1RScqlwmBJdNNzvhow+Ud5s4VYncjtkhTaYgteucZCxfabrmz
         uBA9XA2ptHEK8nUkWPKhwoDYJipx6VWJWmg3yw0Hl2nz6tmLIblywjpghx8od5aqsPia
         qjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89+ukca41Yd1FynlLH3OXgur34EZthaT25AgpIv/dw0=;
        b=yT95maKX8tCXQDsAveqRf51d2yNXHFSgWH/cgVFlLCRWztQFcn20Y71ISeX8sgdvLr
         XdTGSdJC0dz7sgV3EG136nUmovoYfyx6QPW75IsboMHZr/nKtlFLlGHXkVPPBoP038Wb
         r1yQc8AG11DmXWiJaWn35aQiVEkZ3rB1p8nAiMKsA6Ofy/kKK2ENRP+SWDpU7rp9UjHC
         r42GAiWOOlgF+o2+TaMrAKJ8e2dt2oK2YQrdko+uyiSVszjF5cUyx+m951ljRDVwa5Ci
         7D+E/TOvRST4Lwjn+f7UMrE1Aj8wWhAAoZRKb3RKA9oZfcpanKOAmR7XYtGOJHAuHm3B
         SEsw==
X-Gm-Message-State: AOAM532iYEkb9wXq9fTsxMg2ePm3Quk5yBt0fq0EjcIvLTLKlsfIPs4d
	AFN0k2mvkbtT7gU3mxOMCWHa3hSOFEk=
X-Google-Smtp-Source: 
 ABdhPJzy6EvFSip+4t9lafEZhmJfg9E2Hs7jRMfDwFxN4Hh6C1ocejv2U9JPEtAvMHxAoJhMY+dA8w==
X-Received: by 2002:a17:90b:3808:: with SMTP id
 mq8mr9819256pjb.225.1644083719313;
        Sat, 05 Feb 2022 09:55:19 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:c500:ff16:ca75:f2cc])
        by smtp.gmail.com with ESMTPSA id
 pf8sm1140677pjb.20.2022.02.05.09.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 09:55:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][honister][PATCH 3/3] tiptop: update download URL and
 HOMEPAGE
Date: Sat,  5 Feb 2022 09:55:15 -0800
Message-Id: <20220205175515.1767488-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205175515.1767488-1-akuster808@gmail.com>
References: <20220205175515.1767488-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Feb 2022 17:55:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95231

From: Tim Orling <ticotimo@gmail.com>

HOMEPAGE is now https://team.inria.fr/pacap/software/tiptop/
Download link is now https://files.inria.fr/pacap/tiptop/tiptop-2.3.1.tar.gz

Use HOMEPAGE url for UPSTREAM_CHECK_URI.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3a723d762bb77d4dcf6061c6933caf0d2a9104b3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
index 31d0dae25c..b4e5fd4d73 100644
--- a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Hardware performance monitoring counters"
-HOMEPAGE = "http://tiptop.gforge.inria.fr/"
+HOMEPAGE = "https://team.inria.fr/pacap/software/tiptop/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "ncurses libxml2 bison-native flex-native"
 
-SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz \
+SRC_URI = "http://files.inria.fr/pacap/${BPN}/${BP}.tar.gz \
            file://0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch \
            file://0002-fix-reproducibility-of-build-process.patch \
            file://0001-Fix-build-when-S-B.patch \
@@ -12,6 +12,8 @@ SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz \
 SRC_URI[md5sum] = "46ca0fdf0236f02dd2b96d347626d2a2"
 SRC_URI[sha256sum] = "51c4449c95bba34f16b429729c2f58431490665d8093efaa8643b2e1d1084182"
 
+UPSTREAM_CHECK_URI = "https://team.inria.fr/pacap/software/tiptop/"
+
 inherit autotools
 
 EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
-- 
2.25.1


