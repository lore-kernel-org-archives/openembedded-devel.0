Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E975AC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 23:23:05 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.7013.1684797776960920286
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 16:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Rlz89tFC;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d2b42a8f9so3684230b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 16:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684797776; x=1687389776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opAguh7XFAJLT5jwBO3uR4BxUVx0m4ibNOduLeDnQbw=;
        b=Rlz89tFC31UnQOcV2B+WeLylNZOh+6qJd01fX2NVVj9KoueZ7/ERpG0BGePocQc/zE
         UFXdyUMpxR/+24R+izS51Z4CPgq6pKoVkBQpS4JwbKU2gMo58B9ZYz0ySJUthjxh5ft1
         kmqs+SphSNz9yG+rVrkDnpyFsg4YjIR5DmT6YOwlQYbeMPFMA/Tb9qJcJLY9p9iinQH8
         zCgZLPAgWm9O4q4tubRwSLWmGMakFTNI9ratWnTpK6s1U4esGCiLGVpJLYpGwRQcNAsx
         /hLchIOa/X9YHL8cVmgPifhMo22NNR9KGYCLrCaBv5at8s88X4Qx5S2xXZIQB0VtccRo
         bCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684797776; x=1687389776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opAguh7XFAJLT5jwBO3uR4BxUVx0m4ibNOduLeDnQbw=;
        b=LT7fflybUIcHXZnJxCBWMm2QGCrPIPa4tMS5YE3IoulQNjuQ/kyEWUmZ/dbIC6I/TX
         rlJk7ch/CgdoTq1wUDntlvwagkuYxjco9JZCvGvIyX7/y3buVFwXJ38jTVtih/3jyHAS
         6O/xVZEdRcNbTuW4DNzv+XTHH1sre/gyvcgcUiPyxThEMawqZZSc7/cgaYZyMmfySGNQ
         u0SzHaael5b+YLa0DKs/LniL/Xo1GAhpaFf5iG8/2t5jYCHCRmVzm7c633aTYugIwdUE
         xSR9Ls6mauwxRe9f8ZXEFOkYUi02ZDTmk/+s+dX11wAQGsbf9b6N4DqkBQ9Du6eDqNj4
         YvUg==
X-Gm-Message-State: AC+VfDwosGAhk4ZUezvPKQu8G/m418Jhqk+I/uxrgU2j6QpujnjXqSdd
	IE8yfzrDkRhzaetGJdZ8VBgQykmKE9E=
X-Google-Smtp-Source: ACHHUZ7kNs5CmaYBQwFH+ljWLrraQOAVzE9fjRcN6gvwvA0oJLDEPCdrZoRYwkMkzqoGIfO53NOXLw==
X-Received: by 2002:a05:6a20:918d:b0:104:4b5f:1d0a with SMTP id v13-20020a056a20918d00b001044b5f1d0amr13049391pzd.53.1684797775804;
        Mon, 22 May 2023 16:22:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id x22-20020aa793b6000000b006439df7ed5fsm4621267pff.6.2023.05.22.16.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 16:22:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/5] oscam: Upgrade to 11718
Date: Mon, 22 May 2023 16:22:50 -0700
Message-Id: <20230522232252.3475281-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522232252.3475281-1-raj.khem@gmail.com>
References: <20230522232252.3475281-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 23:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102713

The changelog is here [1]

[1] https://trac.streamboard.tv/oscam/log/trunk?action=follow_copy&mode=follow_copy&rev=11718&stop_rev=11491&limit=500#

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-dvb/oscam/oscam_svn.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
index 7c09e39d66..25ada0ad00 100644
--- a/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
+++ b/meta-multimedia/recipes-dvb/oscam/oscam_svn.bb
@@ -8,7 +8,7 @@ DEPENDS = "libusb1 openssl pcsc-lite"
 
 SRC_URI = "svn://www.streamboard.tv/svn/oscam;module=trunk;protocol=http \
            "
-SRCREV = "11491"
+SRCREV = "11718"
 PV = "1.10+${SRCPV}"
 
 S = "${WORKDIR}/trunk"
-- 
2.40.1


