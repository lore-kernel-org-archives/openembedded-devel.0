Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0930EC6FA8B
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:03:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.5282.1663157008321976338
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WmlnPFwt;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id bz13so25359869wrb.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=O8zzhDrAGlZUdtTBLoPA1WkDS9nNTqVcJx2faWsmw8c=;
        b=WmlnPFwtaxifv0ZzFNIUAm9dqXiWSwTySo6DuoR/h3ZFgCDfk8xKujDvGmU0/Qo0FT
         CRtAqu0v6f7HuvyEr5coltDtfYMaUABdVjpu7dcoZHNEV5vFBbBxI9pX6g3tB5zKDX8V
         20dVCgpriewOlXhka2S+SpCBDU9CMTl4z7HXbbOYXW/oJGqNDbYbgqqa0lAuaN6OvJFQ
         jOI2XUMYu9S+lrWwL1zPbK3uSVyRy/PVaUohrJslQ98rEmT08289YSUqqWzHlmTWYGoD
         S9uINIfIrJdAZ0neebMuaj/fwMUkyKJuKbdiQCH/6GkoWxEZI2Ry/B1sbMBTUcQRlT/H
         7FtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=O8zzhDrAGlZUdtTBLoPA1WkDS9nNTqVcJx2faWsmw8c=;
        b=RLMNqujq1HFKkkUOEAaecSW8KFE/brkfwBGtsUSKZYFXEhShcQEKyVuPLweBBcvWs1
         rbnIz+YGh7EBfw0/eh7yu0vbvJbn/6sh/HCnt8C0oFJZ3SR3w3shRS42hUSRy3p6V4XQ
         bLMC6VZcu8GH9M+61iNxdPCOqXyp+XTOn/7c+1O7l7U26IGlTf3SpmZJ5dk3lOw9j4Ke
         hdfF3lCNcUNg1KJVHczyr3kgnpT+ysxcaK76wyVeNKGejKZargvfMSUQjTW4V/qk59WV
         H65LLqe+VJvD7BAV7cfo7mRS7UxXQql2m2HsBRypK/FywL9mQ6C5IzqGoq4v03vhPPLk
         wQlw==
X-Gm-Message-State: ACgBeo22CBaY3V8cDeKcLrliyTMyRYpIIJ5mgFpfMNZzmjgUn/RH9Kq6
	3fOT3EfK2vG+JU9BHxxbDCh4lxcAPKe4yQ==
X-Google-Smtp-Source: 
 AA6agR4482K7HpMy+g7LH32ZG5w1Hz5d4GoyTB/Yp4hgHATq3t66DtFmeefIIG3b9TU/RnQrhIiKWw==
X-Received: by 2002:a05:6000:811:b0:22a:2856:9418 with SMTP id
 bt17-20020a056000081100b0022a28569418mr19353209wrb.46.1663157006873;
        Wed, 14 Sep 2022 05:03:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0022a2dbc80fdsm13286233wrt.10.2022.09.14.05.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:03:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/8] zbar: disable python3 support as incompatible with py
 3.11
Date: Wed, 14 Sep 2022 14:03:11 +0200
Message-Id: <20220914120316.551377-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914120316.551377-1-alex@linutronix.de>
References: <20220914120316.551377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 12:03:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98797

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-support/zbar/zbar_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-support/zbar/zbar_git.bb
index 17084f830..3be1f27a6 100644
--- a/meta-oe/recipes-support/zbar/zbar_git.bb
+++ b/meta-oe/recipes-support/zbar/zbar_git.bb
@@ -24,7 +24,7 @@ PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 "
 
-PACKAGECONFIG ??= "video python3"
+PACKAGECONFIG ??= "video"
 
 inherit autotools pkgconfig gettext \
     ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)} \
-- 
2.30.2


