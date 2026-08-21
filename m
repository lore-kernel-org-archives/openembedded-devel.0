Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9F5C5DF88
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:36:09 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.690.1787286960755963171
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YdNtHJXz;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc61541f8cso19362225ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286960; x=1787891760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tk5ifKVbh/qaCuMcHtK7mQGXemVZ/cjrxS2yUOScy08=;
        b=YdNtHJXzttHvc9e/oni+wUaZhuLJFIeKaFbv2SUGrEF7OUe37BKvCEl+8fCjl2GNpY
         9+EX1GMXQGwbuHA9v4yhV7o2RP99TmOjca4ZYdZRRJfcmrJD+HDhqmNMOxr7olPOo6RB
         2IfMIJU3JV2S9HrlCDNWGlNe9r4OujXIG2IuNUWDZN7qaHBdVFEiHe3dGIhoOIEAnN6n
         BmbZB11Es0dP3ooR8TUQ897UqvtfXzJtAt7HoUFI+kHW+7uii6zsef6z0+JNjBMGEd9H
         585uDWCiUWzARU9KwpBY+cxNb8/MEDCbJvfJmhEJvhN/kUqXWkY+9lEmhWucz/oiLw1g
         Gguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286960; x=1787891760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tk5ifKVbh/qaCuMcHtK7mQGXemVZ/cjrxS2yUOScy08=;
        b=eKDzVvAfq0gPZEvKXXWW3qPwV/4B/qokosCliLob8ceblY3HSME37G2eVvGSk+0+Mf
         IQB1aBjF4147KhI09ctVKwuqolXVCL7SR6ZYLjXcEQM1tc68sOypu7zxGJG/MszrOHse
         +KzQdEsX81ixVXHLH8pqQImeFnFz0WuXhz1TTghl+5dLVVSfp2hk1YZnR3hQF50cyveR
         9lMvVLmBF6CwitOj/2IQiYduqXCJd2Ruxi858jyR7iFh6NwDIx1qhN2wFxQIBw0dpCOZ
         owX7xLppxodfAYWHxbteyQDOYopCoV/w7LskZb9PJL9SIN7P54khQIuP/+vs64eSMxQ9
         UTzQ==
X-Gm-Message-State: AFuF++kFNZr7QEUdnR+de15mN/7z6irgGPdyD94v5E8pKVpzlg13SPuR
	/J63+oANStyFD4L8atdyUWrkAYagAmmlME9kI6m88vQo9cl7hI9VIDGr0yGpgA==
X-Gm-Gg: AR+sD10qvTCBgzESISCQ0NI0KfYM5N2pwuaWV8VZQNZbkZG8C+OhMo5A0M7hEPGLyFY
	J9Fl1b6u1j24ewCPQQjKK7eSNMy6/89kjSjEPmlQJDfI9QQt9r2XAxkInYNtFYZ8CMLbhQtFMVr
	YhJLcUvcqq7qJvhAYdCoj8pBpvn2+AhzbLxTI5peRrqjaL9yBeNkFWMz10brBRXl9LtBeWeFGUS
	BcTpNvzRvvLCvE5ejW+pKxdkRQwathiZxfcZ76+XXl6jnaY3LYGSYCubg9YqOw0UxDymrbIJhlh
	KH5SfBpjIutezJ0GD+XAR8gyWBDShfZg1ZS/Q4tqyG8py+eZZMsKPic6lqWQe4bvq42d8pF+441
	hRBxTVWdg/szb25UzElzm0aJ5xF8tjDO2xUweo2NoCstEamIK7a7/Guse43lI/940K+YHKBwp6Z
	vNa7U8+2PQBtDd60UynMKDz5UA0RNrXVTfUyen3EWiKkJYZpzXOt67hZfvzhP+b23Lb8IRUJk3m
	8bqp9Eg
X-Received: by 2002:a17:90b:2646:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-395a04e6e66mr15071235a91.6.1787286960101;
        Thu, 20 Aug 2026 21:36:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:35:59 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/15] msktutil: fix UPSTREAM_CHECK_REGEX
Date: Fri, 21 Aug 2026 16:35:20 +1200
Message-ID: <20260821043525.448011-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129406

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version msktutil
...
INFO: Current version: 1.2.2
INFO: Latest version: 11.28

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/msktutil/msktutil_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/msktutil/msktutil_1.2.2.bb b/meta-oe/recipes-support/msktutil/msktutil_1.2.2.bb
index 3d9322d831..14df6baa0c 100644
--- a/meta-oe/recipes-support/msktutil/msktutil_1.2.2.bb
+++ b/meta-oe/recipes-support/msktutil/msktutil_1.2.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://github.com/msktutil/msktutil/releases/download/${PV}/${BP}.ta
 SRC_URI[sha256sum] = "51314bb222c20e963da61724c752e418261a7bfc2408e7b7d619e82a425f6541"
 
 UPSTREAM_CHECK_URI = "https://github.com/msktutil/msktutil/releases/"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS += "krb5 cyrus-sasl openldap"
 

