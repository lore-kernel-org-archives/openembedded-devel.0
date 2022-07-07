Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8E9C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:08:43 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.3505.1657184920235033833
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZqcNNgNR;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id dn9so26001220ejc.7
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4sEdz63h0bq7d8oAwBlHzjJgg/gKpdP+6+bDgKZwNUY=;
        b=ZqcNNgNRRsB7+Ie23g9iGdEOBks99vt74LCH3NSuy8wttDnjqJEA1o8OGJ7oMKB+xn
         a0ihUNdFsuhgMFobnS4nIYJAqY7n9mhkmVAzorvIjEJ0SbaW3e6t6TTDixsRei99SIRT
         YQU9Rq1ZhO2M35aVPFeAEka4njvKDcQ7Eq541ob+QAmnMmuqF7jKzDRrhB8N0PX5NGT0
         +NtH9IYRhVzp7O9dPn/xUQ2Jpuxoiqo3rzqBW2SxR0VdBSolpapqYYhWHH+2UDOPZmRt
         53DUKSKS1j0z0W4br2G2z6ESh5xclMawdZ3sXOL5IaumRfI42wq322OcXfVlTrQLaoty
         qydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4sEdz63h0bq7d8oAwBlHzjJgg/gKpdP+6+bDgKZwNUY=;
        b=HWZktsq8G3Ny0NxRRs9TaM458s2I/VWzOsP5NMdQzq3ee++t0bAcEcpTQGxSJl8/aH
         fwasOzqW9L+a9uKYF4M1VbxcouXpLaTlxKTlSWWzDQMEwWUtClW4aG5CRUxat2nxAR1L
         R6QIJqnh7a5cpFx2TqdG+WxM9AMukbZ6ZRxmpVGajmnGfTI9Bkb1QUY/gkt5TzD/LyNh
         QpGzJvffuM1z+34o358k4ceNFyhjIEn7Ic6u7dvu2dMVwhIOZLV6EyFjcrrvA6DFj3Y0
         bn9TAitwkzVJDWBhxauX+KLFAgsS2JymTcwb02iPk1lFOpARmjVjCOO5L73A82yencLH
         w5vQ==
X-Gm-Message-State: AJIora9Pl8UgtjwVFFCNOo8kigcNKhCAWpootTuppqlUYnTZ0id/s3uN
	3ja0aQrYVkFtdkIJWaQWphCskm2pFvlK8cZu
X-Google-Smtp-Source: 
 AGRyM1tPbQaJYIaTlj9sFZXALfjpBx2OGVBoPVT5mfkGoKAE2tSp4CNklwiap6gSJKEZ6rM1kfT/iA==
X-Received: by 2002:a17:907:8a28:b0:726:a02a:5bea with SMTP id
 sc40-20020a1709078a2800b00726a02a5beamr45254299ejc.175.1657184918489;
        Thu, 07 Jul 2022 02:08:38 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 o19-20020a170906769300b0072b13a10477sm350542ejm.108.2022.07.07.02.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 02:08:38 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][kirkstone][PATCH 0/3] networkmanager fixes
Date: Thu,  7 Jul 2022 11:06:50 +0200
Message-Id: <20220707090653.2513017-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 09:08:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97765

Cherry-pick some patches from master branch.

Adrian Freihofer (2):
  networkmanager: improve dependency handling
  networkmanager: minor fix rdepends ppp

Javier Viguera (1):
  networkmanager: fix build with enabled ppp

 .../networkmanager/networkmanager_1.36.2.bb   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

-- 
2.35.3


