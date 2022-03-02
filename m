Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE02FC433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 20:00:08 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.2356.1646251207959822048
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bLMfndNC;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id t11so4509962wrm.5
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 12:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ZcEOcGFgMVLfRdX3rRzPintiyuesdbmdZ/5yt/p1tY=;
        b=bLMfndNCEBFkDiMlVNuMbeM548giHGoy0naG5xDoAWcZaQCeSQ8chQqb4ae/122r8B
         HqN8GUTz/ejQccGIZExbYx2i+BaEHSwmsQkyIQGgyJe/02lipZKY0EdjUQa5/S+cruxm
         fj+EQohraRXBo2xvphW5Gmoe88S5hH7LT7yMBuil1SiwNgaknp9rKRgWLHuasfY38Gkl
         sQXTUYu3xj/N62VsI84JiMyXpBArvZgJiVF+XxVGVRrEYKvhJVVp14j3I4u12wtTRjZI
         dTpDt4M9wXFNVOmfynp8M1ULRFIEDentzY8iMQ6N4L2d28ZKZtvFBux7XKknfXHiSsbr
         tUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6ZcEOcGFgMVLfRdX3rRzPintiyuesdbmdZ/5yt/p1tY=;
        b=XLkFlPcjLk1LXOkCbyHhnHGmCxbpNcF7yvuiCK5pOXICmNV6J0PCy/iJrG2IabEh1R
         uuwtRFTLkzgpCkDeNg3CIu09he/1Aafsa+t/dVyEQfHKtZPah9YSIkD8/Q8aj2SZxZWy
         BcrXtb/EUuSXQ3sUt34tH1SSYLuhjIu5H9pnZgLC+Ji9aE4Rq0S23LYH4AyacAXDpakk
         bOVfBtXx0tMeMwfylTNX0E+VAnZeZS7R5jE+EuVSJNwsslhK2tPTC7QQd4T5qmWDCQuA
         Rpzp6JtoFBhBwoofduUOcLCYtiCudOFJYya38bs1DS/pu8RjdxJ3VGgeS1ZfKqSNoEx9
         6CLg==
X-Gm-Message-State: AOAM531W94EkS3Y+xxpAiQy1S7Kgaf78yv9OBm5kkavbAgwa+Q4B6u7E
	No60WLjSnd6GkQ5yfJPQdaecKHn9Agc=
X-Google-Smtp-Source: 
 ABdhPJwmZoJlYtfkqbyhps4BXeeyJXoVYggQf4xRCBrStNkbIVrEOCOPt4DCFjcJN+Fh4ryC1Wt70A==
X-Received: by 2002:adf:c047:0:b0:1f0:1192:669a with SMTP id
 c7-20020adfc047000000b001f01192669amr6875405wrf.627.1646251206244;
        Wed, 02 Mar 2022 12:00:06 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 q124-20020a1ca782000000b00382b3260778sm4415373wme.3.2022.03.02.12.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:00:05 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-networking][PATCH V3 0/2] networkmanager: switch to meson
Date: Wed,  2 Mar 2022 20:59:43 +0100
Message-Id: <20220302195945.3818037-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 20:00:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95705

Fix the build regression of libnma.
vala support is required by libnma.

Adrian Freihofer (2):
  feat(meta-openembedded): refer to nm-1.36 branch
  feat: add networkmanager

 meta-openembedded                        | 2 +-
 projects/poky-oe-glibc-sd/conf/site.conf | 5 +++++
 projects/poky-tiny-oe/conf/site.conf     | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.34.1


