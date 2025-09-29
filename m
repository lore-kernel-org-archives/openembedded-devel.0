Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA317CAC5BE
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:45 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.52848.1759151075568931904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LLC52WlJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b2ef8e00becso493484666b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151074; x=1759755874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tKPfJAm28ebmkI8h2p+KxMY3Je18w6zzD4FsDUKadGk=;
        b=LLC52WlJ38giAh7vpFTiUCG61Alx3qcDQy0UeeNhDOU+P8IUsFYQPnS6KMu0tPtlRa
         96pBgR2YiNCMDUi1o6wh58YcBAw9nI06h1uLAHtRLETozy9XnOfSStWKtofIoM+aQbGd
         iMyA1AbTT2mWJpVF9d9aRRL80Mf6dmZi7Vv6qQ1DqWebGoQlZ2DvfYlPg2+GKkwzwdLR
         8Qr44+jwpXpRGpsk4lYKBb9w2a1vz5o0rl8MFQuS4RkhujsJTvA6BXL+StEvo0xLj112
         A33DDZ9HIUV7sUZU/NS/moXW0fFkwDIDAJaJ19gYEtPQZE7jm5oEJLENo8Xi58+75bQO
         J/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151074; x=1759755874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKPfJAm28ebmkI8h2p+KxMY3Je18w6zzD4FsDUKadGk=;
        b=bzQHmxWeoPWjkQFajxgyu+WkdJkyBScn6sTEFYqJl+XGhX9UZq/OKW/yBHsAqq3ZGy
         ZnPVW69gBXjDX4YNIDMiXXUts6Ixg1vYxMVsnJISMcEwHuJfWLkeNnP9k4GfDBTqmDao
         qrhAiIdxMz2sR2AtgpvbZm5/mmGTWRfma8Wr3pu3TX4UQfLc4jUG93OAFMWDf1iZZDOs
         NVrhlME2rbvEQKjhUMNIGEfgxCBEcENo2pShvIU1SyumoSAfwrm3xBMn/ZRAIxTUeD/D
         GxgkR+rZK1L+M3XfEYyDFP0on0Qq2qBRwhpeewrx3TNIe2QI/thMSEfUtuVsslOelCM7
         zR5Q==
X-Gm-Message-State: AOJu0Yx0ReOn9pvL/UmRjR6EWn6XHr//p/eYBHdnmdIQT5vACHRQjl7g
	TeAB/c2TB1qtHxLTIMAOxEf7E93tVYd9NwYQTkGDon6Id/GFIjsugL4M194nCQ==
X-Gm-Gg: ASbGncv+EhZOg90hJf7ZBce0elCMoo0Txv/dTmrHDBGuGWVE/eQ2H1QZij58d/2ZYsj
	hwxxm+2uai135H0A1794zVBDjQlfbYBQiZZTnYkFJQFmQ5e68j/MtklxpmGpaGYt0a+R53IH3yx
	o5G/cqJvinjUqQiMg9ovwKwNu5R+BHno6x7oAzkD9EOeTtui9PZMSGiF/K195k5F18q5vJGxr17
	2r5E1rQc+2wOmp7T/RXZ9vMdCZZopqea+uUiHfq5t7VrVi7WmlzPVA483makzwKiz+WEQsSz4Oh
	x9eYZhWOHV7jSAgJ3okzXul1V1sNpQq6RYT5zdPMoULyHYXQYXG7FLzXlFJG+l1tbf0JZ/VBHfU
	mFf+5tKPfGt48vR3TGHbaUsMN9uDEVqA=
X-Google-Smtp-Source: AGHT+IERHujCs7oMcX01AlmGZ3ATyUEZ6SK0jfGuWnWiF0m4tUrwT+OkZoqgDVI3ju7DZ6EKkbOJiA==
X-Received: by 2002:a17:907:3e16:b0:b0d:416e:2892 with SMTP id a640c23a62f3a-b34bde1c106mr2087846266b.32.1759151073670;
        Mon, 29 Sep 2025 06:04:33 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:33 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 07/22] ssmping: Use debian mirror for SRC_URI
Date: Mon, 29 Sep 2025 15:04:10 +0200
Message-ID: <20250929130425.2912077-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120020

From: Khem Raj <raj.khem@gmail.com>

Original URI is not accessible anymore
Drop md5sum

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ceb91603415c6e059d866666574dd1be5b93867a)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
index 0531ffe640..307120dc75 100644
--- a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
+++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
@@ -4,10 +4,9 @@ SECTION = "net"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://asmping.c;beginline=2;endline=11;md5=1ca8d1a1ca931e5cfe604ebf20a78b71"
 
-SRC_URI = "http://www.venaas.no/multicast/ssmping/${BP}.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/s/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz \
     file://0001-Makefile-tweak-install-dir.patch \
 "
-SRC_URI[md5sum] = "ad8e3d13f6d72918f73be7e7975d7fad"
 SRC_URI[sha256sum] = "22103a37eaa28489169a0927bc01e0596c3485fc4d29fc8456c07fd2c70fca6d"
 
 CFLAGS += "-D_GNU_SOURCE "

