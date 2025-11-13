Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B78CD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:21:05 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17725.1763014856385917476
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:20:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iC9aH3fQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so504640b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014856; x=1763619656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tLQHLYdzab08pAfQhc/oGuof69HDVp3P2DaSjDfUf8=;
        b=iC9aH3fQP+4dPaya2AwKmC2OuKqNLw47RfdEdqjEJTY/hNtbX38irh+q4ojzkpXVcU
         fqzKxYrDM6YTpTUBdPVOgeLkjCd5qUHMNoMqC5SFt6u2DXekTpBU6KZ7tfnLwOKD6nmd
         wZR3f19EhG3G5fQWLksODFoOUwVapenZW6FNdW2QoOnnOWBwttso35xMJbEXqNV2aW68
         1IZ8X6jlVRE23K5ZGhXo+fvYDmpcjZ6ZHymAMa8MwOkLnossWyqradBjU+e7t9T08z+A
         njIbHUsx8aqT8t+jlTPO9Gswls7Hmnmg8XUe1umsu3Rk9d8aSz+DuYAcF0zkxCrR/9S/
         h/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014856; x=1763619656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tLQHLYdzab08pAfQhc/oGuof69HDVp3P2DaSjDfUf8=;
        b=vVQcSIojiMWPpz1IZWMKocgZP2+Gmqbu69sHfZl0cN4zCD4/eQixmf7M0g96wIOp2v
         Z2kGVBjoBLn02EZDPnePUCz01CY4AiuFmkhhZw3vyfhjc2TQYHayYVGxFAqYNgjC0RUD
         L+hhP4iiXmxgby6IrI0VZgFxHcDKn4peGlY/xD+G4zaYZ67fZKyYmlARppEmbQ2pUK6N
         OH1fnmhzTQ0vG50Z0wKV6QelPHhum1GQB6pqOETdMIqiZOltIej/+5ZtJn6lex0dU189
         LODTE6+oQYeDtDuz5eqQc6Pp1OVId+6GaOFP1y8xemIQ9ChdWmEx+IY/kwM6wlvgzLt7
         qTyA==
X-Gm-Message-State: AOJu0YyikAVrQ+NbuWc4iaUhBhwcguanWrE1zPe9aioh+/QveeIkQXLN
	p41c08EIppw8u+8NgphVIh0Er8zxTv5b2NaZFi0Sq1+mZJo48t5C/vP2myXA4g==
X-Gm-Gg: ASbGncvrOXmMo/xFTZwJZfakncPXm0kmaQf5IHWwzDgNDoH5BbU3NfAMq7Bckste8Wr
	R5fZUJyXUu9JsRupG66I3F2KS6k9jJhtEyaezxHSgkQJHvxUZ61jZzhYcVeQxcYa8l7dLbicDSX
	PNdUut5RAfmil/N9Rlnc8wrR8F+LM80WWwg6iyNJup7ghy14TJKZKvEwJEvteKYyplfFjh1m4YS
	PDLh5BLISkcaFfpxjF3DthhjvCref458IMF4hCg8vQjKMcrt1bbCtlKcRbM+qPghou084SLxGFk
	5EgQWTBlP1SOw0myGF1Ui1fmyjmsMsQ6zN345Y3we9np77iZOXfwn+IcDEkq4VXPTYxDss8ZOin
	wF+cZUzksg95FRMdMOhuOyW9Va/+8m2CoJDZ6a3RxGi2o1TBLYDA/moW3u6sAaeBbNVGnXx1dEK
	UuTXgfk83KSX6QaQ==
X-Google-Smtp-Source: AGHT+IEmWuFVpTzamo8PNgjSWIPq/oCKXzSFf1ELjSa585qI/tx2bN8g7fIuLX82DgIIUlTtldlxWQ==
X-Received: by 2002:a05:6a20:3c8e:b0:343:64dc:8d3 with SMTP id adf61e73a8af0-3590b21702amr8129892637.31.1763014855617;
        Wed, 12 Nov 2025 22:20:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:20:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 29/38] jasper: upgrade 4.1.1 -> 4.1.2
Date: Thu, 13 Nov 2025 19:19:04 +1300
Message-ID: <20251113061914.3756301-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121627

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/jasper-software/jasper/releases/tag/version-4.1.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jasper/{jasper_4.1.1.bb => jasper_4.1.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_4.1.1.bb => jasper_4.1.2.bb} (95%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
similarity index 95%
rename from meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
rename to meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
index 393539e227..5f6ad067e0 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=mas
            file://0001-Fixes-401.patch \
            file://0001-Fixes-402-403.patch \
            "
-SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
+SRCREV = "ff633699cb785967a2cb0084d89d56e53c46e416"
 
 CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."
 

