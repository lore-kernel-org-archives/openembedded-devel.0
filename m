Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8CBC433EF
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 02:17:12 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.2751.1642213031121710707
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IOCv0+NC;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id
 a1-20020a17090a688100b001b3fd52338eso14718777pjd.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 18:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2IXUv3G+er8KfVzdPWrN1+eKU6eGf6PuVkRRuBoKT8=;
        b=IOCv0+NCnjdrFnxN18QeaqW3swwiZov8kGyCveU8WddHsKdV7zzLm89g/6z0aBILp1
         YDIlTHFBpZ3JDhC1sKPkrcTtJgZK5f0kooDmybxsV7YK2qYQUBo/xVnRWJrBpab48rqj
         9H8h0jb31byoasSxCuwPzuAyqsEl0iru1FtUXfB8V+m12sl6tfsJuq4h2ED1cyrSjTEv
         Diqn0VphHChGxo/nr+pNFi+hkcpAzM2l0SZ87FxI+R+x9kuAorBp0B4xtTWj3qfvoE80
         hkokK0lFSsHr1jz7lPHWZ4YaHU1aCC7sxXWquLcEqK9BxhUx6YtkVrxDM0cCAlZGUkZU
         87XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a2IXUv3G+er8KfVzdPWrN1+eKU6eGf6PuVkRRuBoKT8=;
        b=mSn2zoLK8+7yzSeFMh+xPDehc50+OEaAFEYFFuzPHD2xjNDNMmw01L8cZJMt3HTmtV
         Iy8iTqeaVkl3qcb8jPOp29ql7HXDbDPkqUnMrSJMgwmIG68caeFq4SQAsZatvoNQ7c//
         VfJp9502cGBkLSlaadA6yoRCBh3k8lFcA7v0aK8zNn/G4gRceylfDauqcoEJhrv/8bzF
         DQmaGF5FVJ05b+zJuPuFVB65XWI7sfpciNg08R02eKRta2YQBl9wr1Rkzmkj+z0/BNZe
         06lqlQgpZTvEPoFvqABxFNGoG+g0tZZarHxiQoNjvmEAIHPybC9FtR1F2RlB/26xR1t7
         /Ytw==
X-Gm-Message-State: AOAM5335BWIq6ov2qGqFOiBB5NYA23HmwdKvpTgKBSvyhgL7LjcQ6eJP
	A8BDZx6/U8Ft2LiuvnSI2ar8JdfsDGXWig==
X-Google-Smtp-Source: 
 ABdhPJzyEuCS8bOK7V9jPLDoxbMwbbkgdRu3KrL7fR/iS5A2j0ra1x5gBZUa0GvdVN8G7KPD5jlkww==
X-Received: by 2002:a17:902:a50f:b0:149:bc1a:2c98 with SMTP id
 s15-20020a170902a50f00b00149bc1a2c98mr12630397plq.35.1642213030163;
        Fri, 14 Jan 2022 18:17:10 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:a77:9acc:1e05:f39b])
        by smtp.gmail.com with ESMTPSA id
 b12sm7311113pfl.121.2022.01.14.18.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 18:17:09 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-oe][PATCH 1/2] tiptop: update download URL and HOMEPAGE
Date: Fri, 14 Jan 2022 18:16:59 -0800
Message-Id: <20220115021700.1948700-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 02:17:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94851

HOMEPAGE is now https://team.inria.fr/pacap/software/tiptop/
Download link is now https://files.inria.fr/pacap/tiptop/tiptop-2.3.1.tar.gz

Use HOMEPAGE url for UPSTREAM_CHECK_URI.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
index 8334bc47d8..13aa92e116 100644
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
            "
 SRC_URI[sha256sum] = "51c4449c95bba34f16b429729c2f58431490665d8093efaa8643b2e1d1084182"
 
+UPSTREAM_CHECK_URI = "https://team.inria.fr/pacap/software/tiptop/"
+
 inherit autotools
 
 EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
-- 
2.30.2


