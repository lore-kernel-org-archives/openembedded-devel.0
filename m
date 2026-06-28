Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDB2C44506
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:05 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14731.1782634319495552016
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nP5L4WCr;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3619234eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634319; x=1783239119; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NANekouahei/3LeQRswD7WFEXqPf1kDMWAXu1SLBV0=;
        b=nP5L4WCri+926BiIwkgLUp2mUeYytyfBO+73fH0WB0YN4J1koqjAoAXLDDbef80t0U
         Bf2j8PJZPj7CcRe+kPShlDedrCydFsvQGUgejiT2aTzKRApuSNOG74gbLoNl4SVoNm3p
         XhbykIfNV0eCKyqO/q78ecDs14XLaTBzY36jw7n7EWatbjgFPfLlM/TwbcFUhazpGJEl
         2r/1A7sWkqCjsHyTETqey2P+wVarYuq1TV09J5TzDH21HivdF58pzE0dXYvS+V0W5Q3A
         pe08vAZulxEottNLa47GgzsULv3aXtiThcezSQ5XBdBrJtSAHgymWmiZh7ZFxwsi4Nek
         K/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634319; x=1783239119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6NANekouahei/3LeQRswD7WFEXqPf1kDMWAXu1SLBV0=;
        b=LZmAMHXALkMULKHopxlzpnqArbKW8nNT3br7CCegh0gVnRd0vTw5GVjh/p/DQF0K+y
         IMeEiMyUSfFajZfHpl3lHhD5OUgDzJUb2dZukg8i+xfIuvqNH4PKY+xpSpDrYE2MwwaZ
         m0u4lGPhFI/RW/tYiOx1bPyY7JxO4IUrf/rG6KqZePzEkD0BqRNBh/7HG0DqiyBm+kz0
         ESLyPivAKnZWhyiYYr6XiBtG8fbCKa3JqRsy7G3xYc7euwiFGA/z9pISgwg6i8oZdFhj
         +gG0CW+3TKum3E9JEdpCBpeZ9uG0BZfnE7SXlxZA+peJpfIJBegzolXmSIYWWuvTpVay
         3qLw==
X-Gm-Message-State: AOJu0YzPiYoalqGYrABT59euk/ec8q1FY0vtBVzsOOJv24qvk49pHheu
	QTpHL4O8VmZdxUGxcyE/I/ez/l+tIkIUnw8qlx2L0osjHD4z9JAyw+h8gIl6vm+xDQDDKg==
X-Gm-Gg: AfdE7cksJkzuEzB6jUgQ36jc2IY80z0epw4zpvOhOcEfc8EgXJbvhkAUiPKl3v8KjWK
	kiWUY7NkGHUNYZOmIqcvd1PvNgBUlqcZIS4JpsD7a5ZxjlgyAyGAmKHQe1j76IbIItnK/uEh7il
	CSpMBkVZB8QEGGF8H79/mVQZlHQcmt4heEIFnILSluRsQjW1KhU+xVqpxhJPtbdJwL+IgeiphZ2
	3cHETAo+2bEoz4HVsQzi3TqzJnUK/7QnUIiwri+cS2eWYujSm0sxy27uoV6CEv+DuRX4stwncjM
	5SioS1WAlTcars4OcqFjSS+TuHudk5UVWpGSFYNzSvVlHec0cSwP98CFCQ3Hh171XVziu08/jdD
	OLH7k6BsvHMB2e8NV0c1RqGRXUoE4cgqD1YFyt0QsUthKOeLcTUWc+BPffbxETkoxAQ12ycd9nU
	G3URnnlMSfi2Bq89y7AzfrA/+hWdPjJUMHJkS+Y1YEbNocRuHEQImNaJt7PAh3yxpF9jkTUM5p+
	ZNwXaHR02FSruyAqSpmaJT4GsQzgjDETFEuBcgE3MA5Y2aoubaME8MrgcunkKRBee+1JU5ySOzD
	XqaBOrpsznchAhhKUJZW8znnOEFkOw==
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4d:381f with SMTP id 5a478bee46e88-30cab4d3f58mr6011825eec.43.1782634318652;
        Sun, 28 Jun 2026 01:11:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 036/128] giflib: upgrade 6.1.2 -> 6.1.3
Date: Sun, 28 Jun 2026 01:09:47 -0700
Message-ID: <20260628081122.178348-36-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127846

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../giflib/{giflib_6.1.2.bb => giflib_6.1.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/giflib/{giflib_6.1.2.bb => giflib_6.1.3.bb} (91%)

diff --git a/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb b/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb
similarity index 91%
rename from meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
rename to meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb
index 9cb2a51879..7940023b6d 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_6.1.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_6.1.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
 "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
-SRC_URI[sha256sum] = "2421abb54f5906b14965d28a278fb49e1ec9fe5ebbc56244dd012383a973d5c0"
+SRC_URI[sha256sum] = "b65b66b99f0424b93525f987386f22fc5efb9da2bfc92ad4a532249aaffbab0e"
 
 do_install() {
     # using autotools's default will end up in /usr/local

