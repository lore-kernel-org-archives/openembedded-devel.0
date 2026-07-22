Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C77C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:18:38 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44516.1784715509472044709
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PfTuDfvQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so8865772a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 03:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784715509; x=1785320309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O31cGHpD/2M0zlRAMZfOcaBct/NE2NRmQR61Ay2JYgo=;
        b=PfTuDfvQe0sXkHTsZ1Kd9aLcCDSwEja8n3mhJLbpNi+8GQk1tXz3UfoyC+rrh+Wb36
         /k5WBdjDZZwm1d9vxuFfECFFtB8jGhjKGLYBBJdbKxv7kB941ufH53qyRUiXAHkx7F6D
         Sf42rp9nQFtmmneF/9NbrsUCqENTie81vq8Fd0O2dqYSYzlrde94gfDrta5Cd8dKwRVx
         +iBBsAm/Oz3jngDzxGgkPvf94ROjEtkvZSRMWY2MZwI39M2rBLBScAbehAb9bAQHDJsd
         Ugs2a14PXtuD6QKqRp012tYQNyEfml/3XDBs9D1hZtIf4NDtZ231CyfDgaMaT+l6KslS
         TF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784715509; x=1785320309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O31cGHpD/2M0zlRAMZfOcaBct/NE2NRmQR61Ay2JYgo=;
        b=GeGRlONAQ9xExfvhWInsR07VJzGQOQcaSezG90NJesINAPQ8leKNg6DFA1eR19LxWa
         tAGR60RCwD0FXmncEeU1xyHLwCSs5fxyxbcjUrn2sw3+LyYLghdF+e3Eh74AKn1bGgJ8
         sUVGGWg7wtlYb6h5O/clthYLBY+orzcax+6wq87iznP31Q9Td/zT1GW7oOzzv3Nh8t9b
         qT3yNF+cbpqs5S/t+7HEvl2kqdxmajKgrKxD7EtEOfuRB7tHrukbLyc/k+vfQWdEc8py
         aNeIKVWfhDfmVWArWi2TE9b93VFhF2W7OnsRp5DAMWaGM4UeLkPMFHuY+Mzry6TRtyo3
         uCFw==
X-Gm-Message-State: AOJu0YyR83xpDvH+Gqky+m0H8rragE+NBJqjuXpldJ9AcccFs26K8UHH
	R8q9/VUDXUSviOaWLS2q0O3fk5Yd3dGIG7+ngEjGp4mZxXVaNkKU9kqq5Z7yKOtK
X-Gm-Gg: AR+sD11b7y+9cU++C8Q98jiRSwkO//RYGwY0KVB8gXK6MhO9y2Y+24iegff/spA3alc
	WwxmM8FF0d72bMecWKBPjoysXEgM+8+E61cpgWiX79ssf3KxTEJtSohkNJFaxNzQbL2ot7bf+zq
	CLIiGJGjbKhwksdZ7lONJUzdn34BYRecpX7e8huvgnZQumYtgqtgAZChVDfeP9VIxIULIW4Bbdb
	ZQ4mC8zCWYbHz2/dM5Hv4ASUUgYtABZYj1YNvrZpQDoPsrYyB0RX45PyrVM3onJjRfkq3TMjxGG
	1XeczcxzeDkbc2YRp4vczG+Epd1SeyX1/zbyBamWHElBs7Wa5UVqDVHdJWEoAOelTmpMOrF/uX5
	Ghuf+CAIWma03/a0ER7slOJX8FlbY9zdj/mkwRUimsYDSIg9ht5UtMZ6RNCzALwVSoZ23FKn1qx
	NYKAblMX+lczeXzP/h//rhSHAU8Q==
X-Received: by 2002:a05:6a21:1506:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c3ad665a9fmr23875435637.16.1784715508848;
        Wed, 22 Jul 2026 03:18:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc9d932sm7808659eec.12.2026.07.22.03.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:18:28 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 3/4] apache2: upgrade 2.4.67 -> 2.4.68
Date: Wed, 22 Jul 2026 22:18:11 +1200
Message-ID: <20260722101812.625240-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722101812.625240-1-ankur.tyagi85@gmail.com>
References: <20260722101812.625240-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128369

From: Khem Raj <khem.raj@oss.qualcomm.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 23cdc4ca431e2512aa5fc3a0dafc3c2e8d264c99)

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.68

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
index 1a091d7eff..35cbc7000a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.67.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "66cd206637b0d5c446fa7dabe75fe03525da8fb55855876c46288cd88b136aa4"
+SRC_URI[sha256sum] = "68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06"
 
 S = "${WORKDIR}/httpd-${PV}"
 

