Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B3EC433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 14:09:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.205.1635862167326567058
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jTjmziDC;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id p18so13063096plf.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+HMICmukdamlFXoAeOr0G69pHgX2FZtN0VGd+0x2nhE=;
        b=jTjmziDCsAu3X5rl7KS7c5nbtPIu+tK60/t9cyN23dlGwSXN9I7gHFU4S0EgiFycb9
         gwx7DkmVChWCKupbkFKdDt6Y4tOB7JuYgjPhgl86OQLlW7DbpPNjHGwBY+eyhu80PEN4
         NzG1f7uD/g5WqhiPcgXzIZEc8PnRz2yled8ObVVny72u0yNZyvzqpki3Xj/sVk2nuXhY
         8PMm4X9qWHXoVkwXJ+i+WGj0KIo9hUH2W2/eYXJqdzM2e7wX4mmRmdbKqQQOPw4+Nb4a
         3Q7IDQHX5KfW5hMGG9gsL7r3wK3svBbXD5Aj0mcRncQ5yiZxDuDtW8nbasBr4m4o3sWY
         SMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+HMICmukdamlFXoAeOr0G69pHgX2FZtN0VGd+0x2nhE=;
        b=OrGfRXBqYiktF8Ef5yAEhncUl+Wmk3SfI2r+UEPJ6rfRtEhEpM9D/vKkEOT+vCH7EL
         wyQYUjEl4OJXJqRoOetVNMe4i6OcauKcx4wSXEg1KNqdMPdixINfzaRSfQfEmdaMvgPw
         hFwfJpz+idayJ/fs1gfj5fHkbHWIBliqI1NUyT5uNGRmMolOTZuJvAih+nAA80goCdyi
         V7syIDtpEmAaY92K/wMvE3L/ZWwSiK/ZOGGAHS8x1/RKJbCsvW6FD2tFLaDPa5VMRSZ0
         XjcwlW8J+4GvZKtHyXpKPS0ArPFA3Ic4niGhGQVOOSDqJ+B7bO3DjKKb7s9xX4uGgV9c
         J0/Q==
X-Gm-Message-State: AOAM532zuw1NRWaqXPlhyySrKvPff7dSQzmeGhDEvFglvbX4fmI8KHiT
	xXEgUrkVlZKsLaAnnHm9uTeaqXhPTqo=
X-Google-Smtp-Source: 
 ABdhPJw6LoEPayVl8Ad0U6EI4RcmmatB3ti6wYIGro7wkKtUp0GUXikfljZUW6b2o2GUvr8G+03wNA==
X-Received: by 2002:a17:902:9694:b0:141:ea16:aecb with SMTP id
 n20-20020a170902969400b00141ea16aecbmr12545364plp.62.1635862166657;
        Tue, 02 Nov 2021 07:09:26 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:e13:25b1:763b:6129])
        by smtp.gmail.com with ESMTPSA id
 g37sm16340029pgg.89.2021.11.02.07.09.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 07:09:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harknott 5/6] gst-shark: Define SRCREV_FORMAT
Date: Tue,  2 Nov 2021 07:09:15 -0700
Message-Id: 
 <5254782010237e8602ed248b9f20b153daa2a811.1635862049.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635862049.git.akuster808@gmail.com>
References: <cover.1635862049.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 14:09:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93775

From: Khem Raj <raj.khem@gmail.com>

Since it uses multiple fetch URIs make it explicit to define SRCREV_FORMAT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 196a12868190a707939673c5cd37ab91eafbf7e6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-multimedia/gstreamer-1.0/gst-shark_git.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
index 94d05def3e..4ed89d45db 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gst-shark_git.bb
@@ -14,7 +14,7 @@ PV = "0.7.2"
 
 SRCREV_base = "50e3dbd3b131de2a39d3917576e8f834631ec46b"
 SRCREV_common = "88e512ca7197a45c4114f7fa993108f23245bf50"
-
+SRCREV_FORMAT = "base_common"
 SRC_URI = " \
     git://github.com/RidgeRun/gst-shark.git;protocol=https;branch=${SRCBRANCH};name=base \
     git://gitlab.freedesktop.org/gstreamer/common.git;protocol=https;destsuffix=git/common;name=common; \
-- 
2.25.1


