Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DEEC531CC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:26 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11213.1784859263661072854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 19:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WCskMQO2;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1322685a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 19:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784859263; x=1785464063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYx1+p/qz0WTdPzZRG4+r+0Pqdh6h9GUrZY61z1JFGs=;
        b=WCskMQO2Pd+wpmQk+RozrBFRHsrDLTrSQ5UmM6Ck8JkCro57wTNI+xuO2c20xf7P11
         qAVy2psjBtjikL0i5sOv3rS3eOFCLVBTU+CbEjHCUVYyIypoRnnkY6BaM0hGQhfRn0EY
         Ld5nr/HrnK3yNeim+ZBwmamUu/p+v65Sf3D+Dyz2le00MKs3W/t1esxxDrssCjDWSUnc
         ry41QLsiQOhV6W8BhDYYDKXZOO/C7tXoyhaGur+XCJSaugDk5QgHN1IC7cB1oelrJ84Y
         vZ0d8Sxm7uITfffdK4Ming2ivr8Aup/e0nPnzIrZI6dO9Z4NYVuNyCy/uVyQyrXdQZ/t
         F3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784859263; x=1785464063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYx1+p/qz0WTdPzZRG4+r+0Pqdh6h9GUrZY61z1JFGs=;
        b=PznhErH6zYL4bGtI4qxYwT6GjyJ3dyOuCeoFK5wLlRfIu0a+wIGv4S/AWW+qYUh/3t
         bUiXkz7A95sP8Cu1ViaM/AujihYmZigdXJgb2UHeX2MLRNXz2LvquLgXPdJ4qa8wfNxy
         zEUURtDQGeVKbqwFMW9A3WCGJ3vUabpzF1eYE0K1XZA4tL6AP/9RkVBiIKGoCjuiIPxi
         Mm3Evq1C1Yl4VL0Q4D/f6REIA0+iJ1JmWPeoOhI4vJvz4j4g+WvMJeQotL81wuqib4ul
         riKgK6g8obc9RWBDaoIc0US9CmybUwlQbfHErUgPgooRSbr/sM/9h7r5hBiaU+u3Qcw4
         APcg==
X-Gm-Message-State: AOJu0YzfuY6qln1oD/dUcgutdrW59Jlfa8oK/bDy0miwEjnAcg9hx2Jb
	7mhqVWazYua9BQ43UgolFHSTOuYZQIGQAyZmPz3tYsfh5hv/AhYrUw8+mmpbDw==
X-Gm-Gg: AR+sD13WCqnpjiI+RoysLREco/P9wZf5Fqn+xTbZEosyv6UVZ/qqSGqtIwsqwTyOB6f
	/2eydb+/ny+5n5g+nmb+tVnLEBJRcCFZUYTImVqEI2bSLsSvGVhBMwxGWXByE77CX7Tro6SRToE
	gIA0u1Pm8ZCBXTD6zRBd1RgbmPzyLlmlTjrIQNNuzNnq4XooeZQlSJ6vpKezK8U0q2kp9k/aBEa
	1EcU99NaTrYwBwjqBEhaW3p/oK1mbIhWuLdDnFN/8dHwQ9q5N+QKpKiIFnTupDPa1mmN3Y/p+wU
	1JF+QGYA92eq6fKBlxf2QfSL3WJq+ZjLo10NaRyGS3VT7Bz7AINraT6GuxJyLdtU2rwlxLN6R6I
	R1LUla8twoo04BKqOCX2fJ4rylE4zFjtmYNUOkDIUJazzqtbICm6SPrtOl7YJK+jiBBzvZExVqX
	Z4tIr66wEChXwyikU=
X-Received: by 2002:a17:90b:1b01:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-38ec64f272dmr6127301a91.13.1784859262956;
        Thu, 23 Jul 2026 19:14:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1300401fsm26824794c88.3.2026.07.23.19.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 19:14:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 3/13] gensio: upgrade 3.0.2 -> 3.0.3
Date: Fri, 24 Jul 2026 14:13:57 +1200
Message-ID: <20260724021407.2840261-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
References: <20260724021407.2840261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 02:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128425

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

- The major change deals with the radio code.
  afskmdm has been renamed to fsk (though the old name is still available)
  and can do most and FSK type of modulation.
- HDLC and convolutional coding gensios have been added.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gensio/{gensio_3.0.2.bb => gensio_3.0.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/gensio/{gensio_3.0.2.bb => gensio_3.0.3.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb b/meta-oe/recipes-connectivity/gensio/gensio_3.0.3.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_3.0.3.bb
index 8baf66b623..0e89562452 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_3.0.2.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_3.0.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     "
 
-SRCREV = "57320144c7f3a3ba3d00435a966aa811e219e374"
+SRCREV = "183b8926c7b7ffbe68e1710bf32f741dcff58f51"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=master;tag=v${PV}"
 

