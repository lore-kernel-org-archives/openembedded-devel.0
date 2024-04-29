Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77EDC04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:08:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.18141.1714388923751897874
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=qQzW6S6z;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.221.43, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-344047ac7e4so3009526f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388922; x=1714993722; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XKjqLbmT1X2DqsL4BJ9tUlYfMebcY0cIGXhdZklG/0g=;
        b=qQzW6S6zI+9RAgDcrtELW57AXtt9N4rGMlmlLcd90d5HWRpQ5UWTKYJVkvSbTW0x9R
         zUHSkg/WJeP7lRWz+zLyynrnAK0C8fHajp4cZsGeQlo1D8AFIMy0L+JyFZitI3/H9Bz+
         QHNW+LI1ynNRa0CmzudW5xpRvHITdecx3whVWtjfB3eTct9KHjSE0XP7PeO5ZIkO6qtV
         QHZBL30/ecZcjxXxRKfWS23cgvtsxCwa+lSEBvH9gCOTRlmY7sI+UVNgzf0Jtfy3EgUf
         CpYJ8v+xqM5VGrzUqq95P843vMRBtRoG15KiuzoQCHpVws7poxYod3CeoBgcSzk1MaMG
         gTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388922; x=1714993722;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XKjqLbmT1X2DqsL4BJ9tUlYfMebcY0cIGXhdZklG/0g=;
        b=miXIJo0vqBk5GPSPhsZhM6PpS9+Rf3Ir+by3g5PALQMTcPHo34nHRQjWJ5ra12/OCD
         Q4gBD2O6egm5dftLQ+ohH9F/GYi2AWOmbHQbwRmsPHLK5XcrvHeSq9P6HqJEtUje6VyA
         wkEFwVfHtW1Znvm/CoRcv36t6xST7a4j74ZTYaqO+6SnGadUlngEdxh+kKfYiK/USLMo
         kbiU9XLMllQvv6QY7w0d9UNKEAacviXbW+eGRcshXkv41n79IkhoqQ0z8PwtQIbrgWFx
         Qq9WbETU85qxgZFajrLmJgOSwZOBuFT+JhD6GI3yBfzFV+RbOTilASsX+p8KU6mHf9sa
         NhWA==
X-Gm-Message-State: AOJu0Yxnzb93x1XztbBaVsKNHx75bbzXc/WQkn9pW092nhnipUcnjjfz
	CtkCX7mzcMk0nc/J0vy5oBjh1BvcrXCF/gi4ekVlVZ7nBGg+M0g5O6a/TAJaBIjNFds8L2DJtc/
	ZemA=
X-Google-Smtp-Source: AGHT+IE9m87Yy3cDC9IgucKuZZUp45kCjMYFQxo1Wy4Y113P9MO/FAWPT/ykK+Vfe2Y9yiNXzs5TUg==
X-Received: by 2002:a5d:59a2:0:b0:34c:b1a9:7fdc with SMTP id p2-20020a5d59a2000000b0034cb1a97fdcmr6132178wrr.15.1714388922229;
        Mon, 29 Apr 2024 04:08:42 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id a16-20020a5d4d50000000b0034a9b75e272sm23920926wru.45.2024.04.29.04.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:08:42 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 1/1] sthttpd: Update status for CVE-2017-10671
Date: Mon, 29 Apr 2024 13:08:35 +0200
Message-ID: <20240429110835.55086-2-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429110835.55086-1-ninette@thehoodiefirm.com>
References: <20240429110835.55086-1-ninette@thehoodiefirm.com>
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110175

Current version 2.27.1 is not affected by the issue.
Affected versions: Up to (excl.) 2.27.1

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index b40b14851..0a618c16c 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -57,3 +57,5 @@ SYSTEMD_SERVICE:${PN} = "thttpd.service"
 
 FILES:${PN} += "${SRV_DIR}"
 FILES:${PN}-dbg += "${SRV_DIR}/cgi-bin/.debug"
+
+CVE_STATUS[CVE-2017-10671] = "ignored: No action required. The current version (2.27.1) is not affected by the CVE."
\ No newline at end of file
-- 
2.44.0


