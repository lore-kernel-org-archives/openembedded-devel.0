Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 386BDC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:51:48 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.14327.1677084698767639906
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 08:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a0Ft2Bku;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id bm20so7887333oib.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 08:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFKMGrVzoUkNCgLLMkBxKQnEW4PsTZamGiYyCU7TJrA=;
        b=a0Ft2BkuwKFjyIfOKOnR5cmluVRkvYU7kV4kJu2PYZ3KmGUIRThPWsQ5NCw3LJ8nHo
         NtWCAUhE0wJfjIlT1GA2VpRYt32EVBL9+UZtdTTGj1WVTcrQn71paNRkK8DuSME9KUTR
         hT602E5eyCWOQYhSYnnZjXANC8J/jItsVspar/N1Y9b7KLQiHHnAlPJ0vVzb+Eizsgq8
         KipCQ/gTX4si78GWulddII39qipCcT4d4nfBC3p01FsJjKnY0tOhfp63UXD/0Jz0YBde
         yqBr5HEIWFvuqgMeTHSOJ214sZ2w0S8RFF+uz9LgG78KBhxIiUcQ0UDnh424+4koAoc/
         kRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFKMGrVzoUkNCgLLMkBxKQnEW4PsTZamGiYyCU7TJrA=;
        b=VbxxR4u7gxSaAQk+KjLDohTPHGLilQwiQL/s0G5TdGqkNwZqcB6TxsOBuJ88y3hkIW
         uW5raPp+fKsbUeFy2ggSu4fALuHqC0mtFu64KbkjofoFNi34Yy+wTmzGeCIWpKJ6SSbe
         hQBPd6LBzFq4hmFjFc1lq8ZYX0h9FVQs4/K7LeodtKpsm9SSKavzff96Hca0hi15dQga
         RloVPOuBSNYY3sDtEo2tYttibfMPKpGHLZ520ExSnrIpK3X2QGn/5BZvb2e/kxTbRs3v
         u72StjOhZpFBBm+a9T7Qz2XZqcE3ohPohk7EJFWL4RRTt8V4ccimOJnhAZa4GoYzJsVF
         4abg==
X-Gm-Message-State: AO0yUKVx6wmTjx0B7Y6PwVAK8rX5G7UwKrqM9Fo6YGjFkxsCQr648s48
	g3gZg9a99kKRLcESKfXMpxhvtKtces8=
X-Google-Smtp-Source: AK7set8CKPnWw8uBEKAt2dw7VJajmWRcpjBvSfraH2Ypif8UtSGxPe5DowQl238+HsE+U3sIssW4+g==
X-Received: by 2002:aca:1a08:0:b0:378:2279:9f14 with SMTP id a8-20020aca1a08000000b0037822799f14mr914520oia.26.1677084697547;
        Wed, 22 Feb 2023 08:51:37 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id o132-20020acaf08a000000b0037d7e30b452sm2237033oih.27.2023.02.22.08.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 08:51:36 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-oe][PATCH] libvpx: Enable native support
Date: Wed, 22 Feb 2023 10:51:34 -0600
Message-Id: <20230222165134.1489732-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 16:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101218

Enable support for building libvpx as a native recipe

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
index 9c04c2a34..e9e3e9364 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.12.0.bb
@@ -49,3 +49,5 @@ do_install() {
     oe_runmake install DESTDIR=${D}
     chown -R root:root ${D}
 }
+
+BBCLASSEXTEND += "native"
-- 
2.33.0


