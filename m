Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1744BC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 15:45:14 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.10076.1634139912852724995
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wIZZmPLc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id e7so2716929pgk.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YBOwrn/su1/bzQsdNKa56u+jowgTfPLzJvOhqXPtoCs=;
        b=wIZZmPLcOpO1lP5Cqjna47mVXIcjxcGH7kYX/umUvDuLSSlUqEJsHYDBgrHKuN95EZ
         tmGkVtQmz8CaZVWo78qaEz1UMKp+N6RwgbZ3OwresAzzaVtccb4rRaEulXRUQu0hea/A
         4v50A2XrN3MmcB4WsAMPeS0IR2ufNzc9ciQXOtnEV01D3gooqWnCDquETRJah1gqVI7O
         KqYT1sNSo/qkcz6dU3l/vUgGQR+KBWk8aJnBDvke9QKtruHvh4JRe1kGfc7CrfirNwft
         fmApKTYqHTWelry0G9RHfB+z1VEz4Fq6ZmqGUMutALW6DGjkF/jLb/KmVFcClnpIHF4y
         5tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YBOwrn/su1/bzQsdNKa56u+jowgTfPLzJvOhqXPtoCs=;
        b=J1Mx8rV30UD6eAP/h8e0a7m0g/FgN2vHwfyeisNQpmSdT7wTUwekWz6YFV4a+O9vua
         HUON0IreUHYcKSSmi7AKJKFzVRCsm4UgrGyW8ARzhsMDly2JnLRAznOjgEvvDZ0inth3
         qbtOTZLGNk3bQFJfTgdvjoJOIUtZbZmkFf5ou4wy+S1p7TSp4k5wfSNzTBagnhMJ38JJ
         2IC9gDcIpEHZMNgElMiC2yascsoMkrv5giPkBqowbvB0ylsV+tDTd2s1KJCbPLl8VHuc
         Xt6RhdE04WI54D4w0BuVYc+sjepSCAjjL8vGS0x1EB7R+yNvaU5hkwaWzYh4Gvu4PrBb
         VoLg==
X-Gm-Message-State: AOAM531zp2ToOGDcgdINQc+YNyL4k54hGGz4j39wP1JjBRdqyr4XI0xN
	GAQdcvZ/qiXL4AkR7ewFksUAPjq2mn7FiVrVAj8=
X-Google-Smtp-Source: 
 ABdhPJwGdRbHTBfDMIreOXqMiexwzvubs4MrUMvUoIRxdz6avnaFQ9EQWQYqdnEXWWNJreOAU1vodQ==
X-Received: by 2002:a05:6a00:23c8:b0:44c:d139:f3a4 with SMTP id
 g8-20020a056a0023c800b0044cd139f3a4mr84204pfc.31.1634139911946;
        Wed, 13 Oct 2021 08:45:11 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 p9sm16542751pfh.162.2021.10.13.08.45.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 08:45:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][dunfell 2/2] gattlib: Place pkgconfig file in correct
 package
Date: Wed, 13 Oct 2021 05:44:48 -1000
Message-Id: 
 <154437a77a6595011fc25ff91a31eb7873eebafd.1634139781.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634139781.git.steve@sakoman.com>
References: <cover.1634139781.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 15:45:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93284

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Fixes in OE-Core added some pkgconfig dependencies back and this flagged
that the .pc file was in ${PN}, not ${PN}-dev. Fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e9b3476ad9964210d5cdbce4d11b31b50738a4b6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index d79dbed87..f2da88aa2 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -29,4 +29,4 @@ EXTRA_OECMAKE += "-DGATTLIB_BUILD_DOCS=OFF"
 inherit pkgconfig cmake
 
 FILES_${PN} = "${libdir}/*"
-FILES_${PN}-dev = "${includedir}/*"
+FILES_${PN}-dev = "${includedir}/* ${libdir}/pkgconfig"
-- 
2.25.1


