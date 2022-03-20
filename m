Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EDFC433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:44:59 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.16330.1647765898993750330
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IdyLNBDi;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id o23so8237911pgk.13
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i+e27b3nC5ZvfNmRhZRad8VKAHOXkNMI6qw24xCER2Y=;
        b=IdyLNBDio9t1OuQZ3qkVVSWge73fzkUp+1ddsn2NvWovcbVamgGbNy1eV04wPVJL82
         +Ie/ZonDdk0xxUPQgZcNWwu5l1p8vg7lufnmFAKk3UDmveKrmj8sH6kYFYQRGM4sxYQn
         Vfi/1X59tWvKDzT737NoZmt8SZXKJXDV1QPvzolT/tZkd4uKmoAnRHiURS1qG4o+00T3
         MjLhb39ZpZp1EeFdCD4IcjYRn0ZozuZSbR5KBohgJlip2WTMvlMyeF5/hHGtEEqyaz6c
         KXqCK/ff6ON6OUs72WmKsIjqBFSWB2dcqWol+h6U3g/iOInwAHI17lLq4dEBoWOuV70L
         Qghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+e27b3nC5ZvfNmRhZRad8VKAHOXkNMI6qw24xCER2Y=;
        b=hhmG8ImONijR8WCZx1qNvSKLvlj4QG5xJv2aAiOcz+GSlM8uiYqQzi9bgAJdcy/Plj
         b61xMyk82FjY1HUa+m5NkZjcYB6Oyu5V0wott6TGB9qwi//A6708sMz6wa9GuPa5TcBb
         inQBSph/XREOf9LRCW3cmDbWc7P10dY18LPpms8Ao84eNaqFyGCSKQo8K9KRSsx+aDEX
         GZo1PvifTE8GguIHdvvUMiahKcOS3GzzFedHyKiYcrawKE/ez6QJIFrbZEFIQMqhS8hr
         WiNbkqD7ptC+m6UArlPIKjW8dWGA8CTJTDScNNe6Bd7lQxKPqhR8HHBDJyJjmQ6suOz8
         eXFg==
X-Gm-Message-State: AOAM533q4h8pT2HGvohn9POiwYB4Zr8n4H/bN7zkjoR6idIWb5Zieg8M
	l8HeIJRL2nx/Sr/6UQ02oVDWNRh8jhWOYg==
X-Google-Smtp-Source: 
 ABdhPJxXVC5rU4/xO6O221DV/9dHYp4AKmqXS8mlVS535i/1fRvIzuuFr/g+ds11U0qyKj6r0bQ0dQ==
X-Received: by 2002:a63:2358:0:b0:380:e306:f0bd with SMTP id
 u24-20020a632358000000b00380e306f0bdmr13997513pgm.594.1647765898311;
        Sun, 20 Mar 2022 01:44:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a056a0022cd00b004f7eaac852dsm15896497pfj.151.2022.03.20.01.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:44:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Hongxu Jia <hongxu.jia@windriver.com>
Subject: [meta-perl][PATCH 2/2] io-compress-lzma-perl,io-compress-perl: Do not
 mark allarch
Date: Sun, 20 Mar 2022 01:44:55 -0700
Message-Id: <20220320084455.878607-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320084455.878607-1-raj.khem@gmail.com>
References: <20220320084455.878607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:44:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96083

These recipes are using target perl install during build so they can not be
allarch, the issue becomes evident when libdir for target the native
build hosts do not match e.g. ppc64 where target libdir is usr/lib64
then the do_configure starts to fail because it can not find
Config_heavy-target.pl script which is part of tatget perl install and
allarch recipes seems to assume libdir defaults to /usr/lib when
accessing it.

I think it can be fixed by perhaps building the missing perl files into
perl native perhaps.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Tim "moto-timo" Orling <ticotimo@gmail.com>
---
 meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb | 2 +-
 meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
index 9655176a86..3b8ce8d02d 100644
--- a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
@@ -19,6 +19,6 @@ RDEPENDS:${PN} += "io-compress-perl"
 
 S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
 
-inherit cpan allarch
+inherit cpan
 
 BBCLASSEXTEND = "native"
diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
index ccc78d0078..c00d8945b7 100644
--- a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
+++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
@@ -19,6 +19,6 @@ RDEPENDS:${PN} += "compress-raw-zlib-perl"
 
 S = "${WORKDIR}/IO-Compress-${PV}"
 
-inherit cpan allarch
+inherit cpan
 
 BBCLASSEXTEND = "native"
-- 
2.35.1


