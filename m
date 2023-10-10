Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8F7CD6914
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:34:06 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.87284.1696930441099714198
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=d78CVNA/;
 spf=pass (domain: smile.fr, ip: 209.85.167.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50435a9f800so7074391e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696930438; x=1697535238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5U+SpJFPqRzh716E+5k9uzXO3pVCFa0UdTdvhr1Hs0=;
        b=d78CVNA/D9H/B9lBibv32Y3mqrsXCVEUZE6kkH+bR7K3V8lIgFGy8vNLbCur6cd5e/
         qnOMaJHMYfhkgxpPIwHm6NOmWOM0B3QSgxXyGGMyaF1oFk77fgMvyv7OZ3svk3F0YaoZ
         6yLfTAnrZTlHPI9hsVFxITbMxFVNmPFZeS2SMXFc62YXTvy4mRa9KZBOv0EeIeRhjXqh
         INKIyIJD4XBmHgVWzCXVfcsrTZ745Y241BOa2H6UMI/qgKCDAzedQtjicaK6J6QKRX4F
         nrRBYM/RNwhum2m/UtasxYtj4/u24G1Zc/U3W20LXwCd8isaUEb5mk23YNPa36pTE5LH
         kz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696930438; x=1697535238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5U+SpJFPqRzh716E+5k9uzXO3pVCFa0UdTdvhr1Hs0=;
        b=CJH8LOSgYbvRqLnuAwfi4WwwxzXkrVXMdYx3a1oHpW+7RBScgGqGxCb0x7HOaI6a9M
         ICKLfikfiylme/2LSka/isbxUjynhYMWmz16kxBNzZwuqvV+9teUmECvO5SoaUUY9xi/
         tMdhvVZhO9EPrT2bmue+pn6C6XlIN1L/GOVXEhHXfh7BJCqIoXgnfz6mo2Zf7O3qA2fQ
         /rPLlfxVdV6pMQTEx8xvCKid/KAWojw/rZz1KcRXn0UCK/zpNYKsNckE/Dzo6PXr6Mq3
         DQKAYKI5v9OPHMBbNeFgyTrKvHmkYWcDZbWVPK6DzSTLM5UCJ6JI0aJr5aQhxtmirxaF
         Wffw==
X-Gm-Message-State: AOJu0YzFC+0KUtox67194x9ecW4YhcqbDWOq/DPZjz+hgsCoqUMwhqIP
	D7P+0QHwy9YUoyxBvKr8X8p7iK3Q+Hj4x3FUx+E=
X-Google-Smtp-Source: AGHT+IHdOMjGa+EKTYqWYxgiujD04c5R06r+4UYPMaOwvu3onpqMt94PUWrLCfczrXLhegLUmRo9kg==
X-Received: by 2002:a05:6512:3e28:b0:500:7f51:d129 with SMTP id i40-20020a0565123e2800b005007f51d129mr20255416lfv.34.1696930438607;
        Tue, 10 Oct 2023 02:33:58 -0700 (PDT)
Received: from p-nan-fatho.home (2a01cb0584747e00ad7461ecf2f04d44.ipv6.abo.wanadoo.fr. [2a01:cb05:8474:7e00:ad74:61ec:f2f0:4d44])
        by smtp.gmail.com with ESMTPSA id y14-20020a5d4ace000000b00327cd5e5ac1sm12140651wrs.1.2023.10.10.02.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:33:58 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Fabien Thomas <fabien.thomas@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-filesystems][PATCH] meta-filesystems/layer.conf : Add meta-networking dependency
Date: Tue, 10 Oct 2023 11:33:41 +0200
Message-Id: <20231010093341.73947-1-fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 09:34:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105396

Recipe smbnetfs depends on samba, which is in meta-networking.

Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-filesystems/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index 318e99262..4f13bd911 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -13,6 +13,6 @@ BBFILE_PRIORITY_filesystems-layer = "5"
 # cause compatibility issues with other layers
 LAYERVERSION_filesystems-layer = "1"
 
-LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
+LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
 
 LAYERSERIES_COMPAT_filesystems-layer = "nanbield"
-- 
2.34.1


