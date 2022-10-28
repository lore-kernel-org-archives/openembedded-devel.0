Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76E3ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:12:36 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.652.1666969954621103082
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Oct 2022 08:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TdzsY+14;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id s206so6460111oie.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 08:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAwee2DvIZh5cMqpTF8+K0/lFzVSPn3VrkLSzd0fDzo=;
        b=TdzsY+14E2x10UYIZQtcsx4GIDXF9V/yHgMgZpkOZezSTSdKsWOWHAFCm9QxzqNSMZ
         1dkPr/bayUtzMEid4Hqa1GTSgVVlLuJO8BcUd7bimMuTHkOG5IuWiROvBGS3+DDPo38O
         Rejt8XRfv5GKlRbUC7Vs9TXr7UIAUOaMd+OGyGrIrhkECNb4MOmWKN6ZHqyGhTeTDS6c
         YXhl8Y6FeSn+/muz67IglT9YvOgpG9s47ja0qKs28uLajRZii5aeAhVBjNIDFlzZVxXz
         JvPiSaNSipkiX8bP8XDO4N2SXjCaa6OOZ0ZFkHtbFV6Xa55HI9ic54BdhDHSW+jd405s
         quzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAwee2DvIZh5cMqpTF8+K0/lFzVSPn3VrkLSzd0fDzo=;
        b=rOS0A6w0CQdYiwqhq4vp/ON5j19TtlZb4jQu5q4qBzCJ67qW43TQwujjcdtQYFW5Oz
         VyZJV6nr8ZEMAdicERoCavxaAx2ic8/dFVe7pSzjiwuTHPBch4DD4rdS4KOkFMMNC44P
         r3m81PKfg/qQ6lcUXXnCqAAYBXF1TtrT7M6QCG/vHdbHGE9lzj6oGhXrMAxNQMqO92lk
         NLCu31XN0XpxxftvaefQkOqxZd0kY9UzdgMaU+PwiZp8a2MJN+X+q84hZP5zIpgMVuNp
         IbPQw/UvWICyPPiu5ELd2lA3qOe8MWpRjIuE6t737N3v9wTPhl3QxKOqdaSIo8i5Deq8
         +qcg==
X-Gm-Message-State: ACrzQf22CuwZZVE6axGtuDLmcvoAPHahr9nb2SoMCIeVhZZAAP6HQ/Nk
	hpQVMatJDhhDt2glqV8u1sHr3ORuDNs=
X-Google-Smtp-Source: AMsMyM4VxlrCEPNeomuEtEugvrZlbhAf70WWf3g9R3IAy87NX7u01JZ5Luxa3AtjJ6bhd1KyD0FJ6g==
X-Received: by 2002:a05:6808:2096:b0:354:b901:97e6 with SMTP id s22-20020a056808209600b00354b90197e6mr8779609oiw.80.1666969953562;
        Fri, 28 Oct 2022 08:12:33 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id a16-20020a05687073d000b00131c3d4d38fsm2216151oan.39.2022.10.28.08.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:12:33 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] iniparser: Add native support
Date: Fri, 28 Oct 2022 10:12:23 -0500
Message-Id: <20221028151223.808155-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Oct 2022 15:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99336

Native tools may link against iniparser, so extend it to be a native
recipe also.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-support/iniparser/iniparser_4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
index 2810a4f65..f9e153016 100644
--- a/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
+++ b/meta-oe/recipes-support/iniparser/iniparser_4.1.bb
@@ -22,3 +22,5 @@ do_install:append() {
     install -Dm 0644 ${S}/iniparser.pc ${D}${libdir}/pkgconfig/iniparser.pc
     sed -i -e 's,@baselib@,${baselib},g' ${D}${libdir}/pkgconfig/iniparser.pc
 }
+
+BBCLASSEXTEND += "native"
-- 
2.33.0


