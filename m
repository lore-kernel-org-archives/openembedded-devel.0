Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8BCCD3442
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 11:17:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16090.1778066226912493455
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 04:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CMp87N+E;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b150559bso43471155e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 04:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778066225; x=1778671025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxd5XGhMvoDVMwzfJJ+axHGKYuhrq/OqTvzua4Smmwk=;
        b=CMp87N+Eeu3+mjefK0ACWa77EOltsP4dUal5/6BdDeK3zwK4HNr0rsdb0U2lcdAN7a
         3k8qJW6LHYhAAbeaQuNnlxGwTERj/I8JMx81lybvH4jV5awLEjZ9gI5RbAVjkOcIqYuY
         whc2Ib1v15pbQltxE6eV0Mux4eNo1D6KdArlPYKOwzVkcVV+rULEuIgsceHXNFMHkWU+
         8Dm/5iL0G0uFwwvQOjSFjlABpYNaXBwTPNS9RcSu6HkZBxk3VREy7wtta1+3ugYCTp3V
         GTwFH/7ei/uAi6dKa1qlKkY01eqXL04q7j1XNkj1+VLdWpu5J2HKAC79CzCigEqoksG+
         pEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778066225; x=1778671025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qxd5XGhMvoDVMwzfJJ+axHGKYuhrq/OqTvzua4Smmwk=;
        b=Ul7EKkQLjGGNYiXuDYuotxxhTNIBVHm1zM8xTnGHZfrM3mS21ZPc2/K+7nxByTiR5W
         O0dmVfxLuF4YS3FghZ7WgC89/dliaUjfEBLu5WgStV9OevCiur05NDuvyptJ5FnbVENE
         RqacWAaX5RU8wuvadqEAw/KplDjBYkQ4H0FozpT5CvF6VELTbI9DqOZAwk7yiFm8i7jl
         7GGZ6GsRWZccDT3WV6hqKKBfFF6eMSgxr2YzyN9j/sZwfidW0xyPjpKlADNZlxXZUfIV
         tvK6+Ydrst0bKaiPHvP7BlsPR75UKVQrN416PuX+coZjvkl8pey89Ya06xV+/nk5764p
         QpHw==
X-Gm-Message-State: AOJu0YyuJgGd4m5wC3zXuc8g332zND60o7MuBGgrnzGDrNK3uHeWG7GL
	P+usvpgV9QhlVzPjSeojoAoIaf++MXVczdEcjxRdBuMt4MGheSf7uULcD4SLvw==
X-Gm-Gg: AeBDieujJJCghJxQWTPZdDFbzhoZ8ax+0yu0QQEza/4P03pS7wBPI5flVWCmQStsmOC
	OJD48aWFzJHVFWtIOM7RrFsJd7H3RGcstX/1nHhe8age/q+QKyoUJy3JIcOpj/wr8oN86phJDLc
	gr3V8qcJ4ME2jRXMclU7ksOvjFjKxkvjlNcBtslDgc8MTjjp2ELdJi3/xunrEPRzKvhCeDF9APV
	9jc42YO8tCS7c3QjRm78yI0J9VFIoKGeZf907BB2JD0UD1z6GcEe97uuYpnDlGARU2VWKtQhDRP
	zycK55WnJgdO+zAvj3Z4wwFEl2TTkQQ6RpdcJbHfELRerUlZ9iOjKN7qqylp//IDk49QRATkACf
	khXsV59wvOP0W/553qUfZkJR3Dv+q3I0XM0jjkwh9G1KjwokNrpcoKqUNFFE01jcdGhhcqRnc/v
	pqSgrzugz5ZoQRF8wXzJKQSaJ8EBGLU345MifvhDLSWRocyDg/+k36hkKquyyXfN5iFSHud1ddv
	r+/qxv1/VVaQCGpSJm4iFX1nee9LLY=
X-Received: by 2002:a05:600c:811a:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-48e51f369c3mr53080865e9.15.1778066224576;
        Wed, 06 May 2026 04:17:04 -0700 (PDT)
Received: from toster.lan ([185.228.162.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm75272475e9.0.2026.05.06.04.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:17:03 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: jose.quaresma@oss.qualcomm.com,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH 4/6] libcamera: change python config
Date: Wed,  6 May 2026 12:15:50 +0100
Message-ID: <20260506111552.2782-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506111552.2782-1-jose.quaresma@foundries.io>
References: <20260506111552.2782-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 11:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126801

The python3 can be removed from PACKAGECONFIG depends because
the python3native is already inherited.
Also rename the pycamera to python as this is more generic
and can be used to enable everything related to python.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
index f1e138c4c7..64e8973d53 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.6.0.bb
@@ -27,7 +27,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[dng] = ",,tiff"
 PACKAGECONFIG[compliance] = "-Dlc-compliance=enabled,-Dlc-compliance=disabled,gtest"
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[pycamera] = "-Dpycamera=enabled,-Dpycamera=disabled,python3 python3-pybind11"
+PACKAGECONFIG[python] = "-Dpycamera=enabled,-Dpycamera=disabled,python3-pybind11"
 PACKAGECONFIG[raspberrypi] = ",,libpisp"
 PACKAGECONFIG[vimc] = ",,"
 PACKAGECONFIG[virtual] = ",,libyuv libjpeg-turbo"
-- 
2.54.0


