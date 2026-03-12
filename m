Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F70106ACE1
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 19:21:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.970.1773343271502185969
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 12:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5usgS/u;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso10936845e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 12:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773343270; x=1773948070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z+crvuOsS0xt+1nT1HY9zylexgrf+K8pA6Dxzno6XKk=;
        b=Q5usgS/uIUfu9BYhvvPmWci9C39pbMQkNEedAwTZ9XoYgbLTHoK55uBYajfygoiFM+
         XvdoG4lO7/oaUE11Hex/rPL+QMFCnkeKLTyuUH+0QIXi1GupMjWn/3LSYVViUp/KUOZ9
         Aad2GNo/PEa1aPa9Lx3QOcL8MoueIIvltnce6Z/y6YlV462WXAQWokbCNQiB+0gbceJr
         HOLLycW7FL/kE7mbx+qVgvHkSpyPoglf2XNzi9epoBhMCYTpp3FRTmrXoYJyM0ZeLLH2
         zDGrZ5aOVI8Yi9v1xx1MnzJX+krKUTT33eKZvGWpbO5iDCcmo85H2z8xSoKlQWOebWNA
         tAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343270; x=1773948070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+crvuOsS0xt+1nT1HY9zylexgrf+K8pA6Dxzno6XKk=;
        b=vfjxl2HCsQNRGBxmigYnLslXIxjEf0sXA7ovOEmfya01SF84X7CBnWq7230Z6wJLH1
         QJwPGpOUKR3+QRmaTQAi2YHfQ/Bm7YXTYx8O7KuiyuHmCKkxtMbm/rdi6slQ/GZEEXYR
         RTmJQExsue/JdN90DDLohvd32L8Zg4xhhbZuiOiJdmbnjt7wazxSSxmj7cvMQBnU6oXo
         wBNIIYdLn9LV2XDSL8Yn6zw/CmYuRpEgx1JmUa+9paEziRenvn8zhb+xMSqsxBlscqSN
         xenjsSLHjA1ydg1bWDQHyrdrfHUKpLDlhR12fUl4NWaqzYE+4mh5dUkjXhN0Keb3o6Rs
         9cnQ==
X-Gm-Message-State: AOJu0YxEVihJH8WPN+TQlk5syX6d3SL/Zei9VNNh2/Acjxnzbu5cX0dD
	O+bkrdVVPAu7p5DitIKTN8/3wjXGLmenjklJuhjZUsCQ08eq0sCFwC37V/qNbQ==
X-Gm-Gg: ATEYQzxZG6W5igRbfn7TFxUPF1Ia3f+ohLqj8M7RbKEigSU8s7Wxw/9poyuvpzH2EOH
	Zjl7WZysAkKGutUW0E33nf5f9mLoFCwzVbswER9zTW2UeXidQEuIb3biF2lyK7AQm5osqX0/+4l
	lbh/JPG30vSE0MS5RZakrEilHb4O4PsbWPOn4v7r6kY7X9/3/kzCE9jmzBF5eE//785ksSGVaGe
	CWNJv+KRVcJ7rYD6a0yqCXvIaEhMz2X5Llm5fIkPII1VnbsQrR5FXAW6y9r8hHEadxqJAn04flV
	BWE4rEpPnZgQZAgLGT32UGzNnLvfTrZ9t16Pt6VfU+t5+5Kzi0W62oJ40+XYUORLWuYig1PMiqB
	1JZ+tkUcdCLx82eF/HapLfN5waW/w+ba/jw6DCIVPklZKS1W302rbBdOoYD1CHpvMxfWxxp3edX
	vLHNgRDqZoOaODLQTIeLAp
X-Received: by 2002:a05:600c:c162:b0:485:35ee:f836 with SMTP id 5b1f17b1804b1-485566c94a6mr8661345e9.2.1773343269331;
        Thu, 12 Mar 2026 12:21:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm310271045e9.9.2026.03.12.12.21.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:21:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH] hiawatha: upgrade 11.8 -> 12.0
Date: Thu, 12 Mar 2026 20:21:08 +0100
Message-ID: <20260312192108.2681082-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 19:21:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125173

Changelog:
* mbed TLS updated to 4.0.0.
* Replaced strcpy() with strlcpy() and sprintf() with snprintf().
* Added OS sandbox.
* Removed DHsize option.
* Known bug: mbed TLS v4.0.0 doesn't compile in Cygwin, so building
  a Windows package is not possible.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../hiawatha/{hiawatha_11.8.bb => hiawatha_12.0.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_11.8.bb => hiawatha_12.0.bb} (95%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
similarity index 95%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
index 720c292026..9c9aaed807 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.8.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
@@ -6,12 +6,12 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-${PV}.tar.gz \
+SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service \
           "
 
-SRC_URI[sha256sum] = "1376763750fb9a88a780bac6aba8707bc2a78f8ee089c62d433e50216a5183bd"
+SRC_URI[sha256sum] = "942dd76e0b0369188612020cbcc92c19e11ea9e844f5dfaef4e9c7ab6892e247"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"

