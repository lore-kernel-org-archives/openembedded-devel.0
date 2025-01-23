Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4642BC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 13:40:21 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.10501.1737639607245407084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 05:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JatBKpi/;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so1425823276.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 05:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737639606; x=1738244406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=17LzoMaCQoxYpmrTbUTNJNksxCWV9yzCMJpsxKHpkYc=;
        b=JatBKpi/8DPXJMSjqmt8YlKvYPVzZWvJKWypnfr6Q6zKg91yc6Psh366DO+hdsnLgt
         ZoAOKhGPxN8jfNJYc5dnnk9Yb1DnJJ2dPMSzy0Npg5ljf5/bDS+TOgiJ3LTPqHZn9UAW
         yGahq7nOka/H2FmjdgV+/HzI6fsOEq59BQ+BqxxHMVBkLLoKUTqG4pl6CluFUHDWfmlb
         AKJS8rrkJNfcZcfCwssVzyH6FRzwLCUE1s6ZEUpqoVeu0a8YM6YSUCnCs1gC6jOVsuAX
         eqjVy1qRQGrbCsV+oEmG739xDC2IumPDyMTEhFUJMBcuExJqyl9Eh34vUpBB1rtWzSMJ
         hb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737639606; x=1738244406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17LzoMaCQoxYpmrTbUTNJNksxCWV9yzCMJpsxKHpkYc=;
        b=A8AtcXg8ynpUukZ6A49/hRR+umGZJw+rMyj60GGQW0x7bWX9k6fD4Ym7Wt7XgFzp2s
         ns9EBNHiiphDpDt8u0l6CJbvk/sfavNpI666kFnPVx/ZfV/uHPIy3chUQJFefpGsTOvl
         lUC8FyY7KqxsrdkvlV7GtRrMqz5hoyNiqtYnHCY4drVoYqLiT+GAbyoaTwv2my0xoaDv
         ezjoj9z/6zzTrBpRcJTFyzMbOwu35wtqO6GCr3mXk3vxdZq0zqL3UQKRNPuYC40NyR9k
         qMsldLHLh5H6CATbFP/qzJ4JBGM4A7Gpe+7d8btPAI2139GCZtWwikdXndcnoMfO2QR1
         9XoQ==
X-Gm-Message-State: AOJu0YwQRazzRJy6VrLUZ1zor0Xg0qOkdz92R8+zDRityV7nTiDYdgY8
	2JLgbuQlHRn9W+TTKPRD1bzvn7VwKGeZ40uRmZKFM9HD6OXIqzPH+ziUhgUM
X-Gm-Gg: ASbGncta5tgPdyJoGCt0wMukNQoFlXeES97yXnoARKUuGKqNtS+PBbwAa5pIh8868Ru
	GmqaaTu70fWnmDktyeCDQyqLD/txQ+G5C9dXpvxBCDCpQXJbZgLysomwOMUFwdLnruL9sg9g8RN
	Xotat9RadZorPKuc+saC+3l1as/X7I+mqUrQcCxSbtc9l/4TTUd6z+4v2ihSYJMurPVaVAoRbN+
	kwOlSNzqDU9zglhpgSE+X7oILCMD4qWMSjQmctz+F0ZmPe2nl1ywIbNRsYtJtiH2zbxk1IsNymD
	sA1mDoHmDnx/qkvFKZsuLOFaL91nxSj/6rXNlL4=
X-Google-Smtp-Source: AGHT+IFpvd2EIee+3BlDp3/vr3bdi62JAhDKs3xZDGgy+aanlhbxYGJzuDkhZpJELJEoqFM04r1TXQ==
X-Received: by 2002:a05:6902:248d:b0:e57:cca4:2688 with SMTP id 3f1490d57ef6-e58380808e3mr483793276.21.1737639605644;
        Thu, 23 Jan 2025 05:40:05 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e57ab313b53sm2482192276.31.2025.01.23.05.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:40:05 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] hiawatha: upgrade 10.12 -> 11.0
Date: Thu, 23 Jan 2025 08:39:56 -0500
Message-ID: <20250123133956.21170-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 13:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115033

The https://www.hiawatha-webserver.org/ site is defunct.  So move SRC_URI to use
https://hiawatha.leisink.net/ instead.  Update to 11.0 while we are here.

Changelog: https://hiawatha.leisink.net/changelog

    mbed TLS updated to 3.0.0.
    Dropped support for TLSv1.0 and TLSv1.1. Configuration option MinTLSversion removed.
    Dropped support for HTTP Public Key Pinning (HPKP). Configuration option PublicKeyPins removed.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../hiawatha/{hiawatha_10.12.bb => hiawatha_11.0.bb}         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_10.12.bb => hiawatha_11.0.bb} (93%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.0.bb
similarity index 93%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_11.0.bb
index 1111ef6f5..51177185f 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.12.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.0.bb
@@ -6,12 +6,11 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "http://hiawatha-webserver.org/files/hiawatha-10/${BP}.tar.gz \
+SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-${PV}.tar.gz \
            file://hiawatha-init \
            file://hiawatha.service "
 
-SRC_URI[md5sum] = "d9e282be06ed456207726b7ac0df9d48"
-SRC_URI[sha256sum] = "61bf41146c51244769984135529fcffd0f6cb92be18dc12d460effc42f19f50d"
+SRC_URI[sha256sum] = "d6fffbe6938951b62f9e02b5382a810fdb83b1e1328f5333c1c733342a890b4b"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
2.43.0


