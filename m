Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF16C433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:23:31 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.11749.1639668209971498852
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NpX+qyGO;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id r130so23939999pfc.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7Cew4CQAmNGxpcjsmFThAUbiyw0uKuQK+cRvak7MoaU=;
        b=NpX+qyGOfc9LhdHwI9kkHNRom0XuGRKDUDDNh0WbwxnzXkWSbjxmv4orfI0DSj1R/h
         9LwQVRDP/EXSipvqy+INuo0x2CAcrAngI8NSXlg19hEabgR7H5sEbQhszk1EhJMjYHIt
         RnBajboZxq1FgPWvHqhHwGzRV3GHgjA46szNAuS+sRLbmNa4/7FklAXYCWwzL56G7RJM
         SKZWWoe+m4BjzmqpOpOzk2yV3OZFuDkHos/iS4XSbyFR8WvbUanptIiJI297UPY6Hfuv
         +lXEIbjGoLQll+mziyIftxmYCcbBJjOfASR9iUbzL3M/axHUeKC25ikihZrsNXJ+n1OF
         C+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Cew4CQAmNGxpcjsmFThAUbiyw0uKuQK+cRvak7MoaU=;
        b=THzg+5ZVhRL8JI8eCXzDNa6XCSQLz65nWlfqvcBOf7auxKDiZJ9lv4v8YbzLpabR0M
         YnzguKVtmZysUFE/aWAhcxcYRaoLjx0bvqMCEMJbKipfaJmd5F18DxW6kJedH8DCVvMq
         Fpjm7WHcdhY41l4eFRMFCTwmbljHZGHHybnJ8f1n4iZiaZhRuXatMlOprdtj6PaI9+Qh
         hzRXTuU9z/sKvUzAskxKqOsNMnveyl+aKHtLvVhSk8K4S36xrFcURYb9rLIxY+u2794q
         C16ezz6MqA9/Q5/OnE958sBKtJ1ZLsZPQlwYKm6/o3x81Op6MTA0rA/ICikYD4Y09E1j
         0Tzw==
X-Gm-Message-State: AOAM5307buulfalsYCVyNl8rZk8VNQwnG/CE56ByqYLMri1QrxdGdaZx
	5RmCQLK1/6dQdkLwzfnfYKz7zKRpAfc=
X-Google-Smtp-Source: 
 ABdhPJyRajhzmxTLZqRoIRi7LsAyf35IIxxPYA3eNMchUMFJou1CO1iWh5Y4QlUa9Wc/f0Q2fq13/w==
X-Received: by 2002:a62:9109:0:b0:4aa:fc4d:9c1f with SMTP id
 l9-20020a629109000000b004aafc4d9c1fmr14636188pfe.34.1639668209304;
        Thu, 16 Dec 2021 07:23:29 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:7d7:ca51:b150:8ee7])
        by smtp.gmail.com with ESMTPSA id
 k15sm6795703pff.215.2021.12.16.07.23.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:23:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [honister 03/18] imlib2: clarify license
Date: Thu, 16 Dec 2021 07:23:08 -0800
Message-Id: 
 <ca687218bab10139cdcd4869cf4762fce2218cf8.1639668121.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639668121.git.akuster808@gmail.com>
References: <cover.1639668121.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 15:23:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94388

From: Ross Burton <ross@burtonini.com>

Imlib2 has its own special license, so use that instead of MIT & BSD.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d085c4e1d29345bcc5f32f54646be381aeb83908)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
index 9e4daddd53..56d41cd394 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "A graphic library for file loading, saving, rendering, and manipulati
 
 HOMEPAGE = "https://sourceforge.net/projects/enlightenment/"
 SECTION = "libs"
-LICENSE = "MIT & BSD"
+LICENSE = "Imlib2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
-- 
2.25.1


