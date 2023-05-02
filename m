Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BA2C7EE2A
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 06:20:08 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.122291.1683008402334308058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 23:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rM9mSiLu;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-63b7b54642cso2467973b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 23:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683008401; x=1685600401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s684x/YJdCM4SXB2WI2KNGrWLvcAWdqDxt9cmegPamU=;
        b=rM9mSiLuA1x129HsifBIeg1UIwPoYSJibXsyP0F1HLnZrBlNKg0AtVhOI5CrwWIJjx
         Nqc4vMzpvAn+YjwU/GQ2Osbuo2mVrInePNai7cu+bM79cL9VL2l/3zEHRf18OYGaVckT
         Ws3zPvNZxIcsHJHr3ZDRu69XXoimOgxVuJcJvHCnpwBBRymH4e62oo+QqwSfI2JaEKo1
         xpc0p+vwRrCHJYZJDaj+hCK4PSejuF3abR2sDC3lUrvP7GAWFAQnMno74uafdIg6RDhy
         EpYzHJi4stJZd65k2Kd3tr5+bwlO6kq68yGdd8Mz68VrZ3JwJYvI8s9D6SYtyF4xJK0w
         g7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683008401; x=1685600401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s684x/YJdCM4SXB2WI2KNGrWLvcAWdqDxt9cmegPamU=;
        b=Sma8JJx1Ck96M6aXSdQ0bBZdrrd3xwNulZHAyDB0qAqI3ZwdOkYmverJjRsLiljf0L
         ZgYqpxYTW/yAynbgkPzqDTDcTKIiYlJ2l/Pq/LakfijbsL/skDwqy6tQUi6kXEomaGmB
         WQ6huf0fpVYfgquFwUSNPwuc5GZPuDSJXWZzttVZFTBssJJlCNJnGiZ2RrAPQ1g2skua
         E4y/y+OOXiQQZFjaku1FdVo8YhlwOLFRcEzHfU83t6FkTX3d8yyPQhL4I4FDGqPsz3md
         kMM8lBYsYgWVXYyPcrIq38G0zleU6WzuOzLWtdOzfRyhRjKn9ylkII7z6c9M7pWT6UEx
         3U7A==
X-Gm-Message-State: AC+VfDyHOLGuwv2BcZgWlbUg1r1LTlHBzlSxYUk79zQOD3R6y4bP8IHS
	dV60oMST2BghJrk4FTR2u2WST3F2DTn3lg==
X-Google-Smtp-Source: ACHHUZ6AzsYwBRjFf4aQ5IqwExBNaOqtCCnfC124LMJShBMeACQmD6jB4F05yiZnTpgR4osSrdUHxw==
X-Received: by 2002:a05:6a00:181e:b0:624:7c9a:c832 with SMTP id y30-20020a056a00181e00b006247c9ac832mr23950340pfa.8.1683008401436;
        Mon, 01 May 2023 23:20:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id o8-20020a62f908000000b0063b5776b073sm20735612pfh.117.2023.05.01.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 23:20:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 08/11] debootstrap: Update SRC_URI to point to valid URL
Date: Mon,  1 May 2023 23:19:51 -0700
Message-Id: <20230502061954.3782607-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230502061954.3782607-1-raj.khem@gmail.com>
References: <20230502061954.3782607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 06:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102254

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
index b2a204403e..3e59af8e2e 100644
--- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
+++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
@@ -4,10 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "gtk+ dbus-glib dbus-glib-native imagemagick openobex bluez5"
 
-SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz \
+SRC_URI = "https://ftp.osuosl.org/pub/blfs/conglomeration/${BPN}/obex-data-server-${PV}.tar.gz \
            file://obex-data-server-0.4.6-build-fixes-1.patch \
 "
-SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
 SRC_URI[sha256sum] = "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142adc448268d3920094f"
 
 inherit features_check autotools-brokensep pkgconfig
-- 
2.40.1


