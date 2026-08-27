Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B399C61DBD
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 02:54:04 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28404.1787799238916060770
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 19:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c/4Xa157;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1782416b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 19:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787799238; x=1788404038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l3pU2VmUfCwo/FEMdyO34xjjRhuOodXl2oLp49GAemg=;
        b=c/4Xa157l6gQ+1jxS8ehg+EFvZYo8NdRapirYflK/1VU5TJ30Jo1KV7bF5nQQ9sO48
         B+iUvSFALcJkN2JdSk0efvL39TCr9vDrXGpi4km0CYeaq/ZTl5+uBuJ7/3HFTFP2koKQ
         GV74DaHvpPPPK2JwSrwrQua2lf2/ZGaiD9gyX7XXL7ZL92m182Acny0N7zlDqlzfoUcq
         nHa+xC39UeI+gIZzvgrPl9XU5aROrX7Wl9urWX6iqndeqBKTZrEhYYXMWcNT3TZX3Y0U
         /nUzsB0cPEELT1u6FYaeYrmUTCN4cDikGreLr3fSjBXuEw7jEfzRwFxxDu/0h9qKI4Us
         /t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787799238; x=1788404038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l3pU2VmUfCwo/FEMdyO34xjjRhuOodXl2oLp49GAemg=;
        b=kzAz6matu0mJuHHdXuq7a3ussrAmW73994vSPyKEF1rm1A6us+Aui77XcyKb04vLnU
         SZ9NsmeeLqHRz97dJh6UZL/6uuhjt0+IsafpHX3u/fzJzzw5ZKNZLkqK3II8YnxEnPG0
         WR3Wrmwn+HPnm0NyyxU9nrR0jiuh1EMFt9oyqNm2DzdP3Nvd2znzXH2e6MlCV8W9qimK
         lzjbANOjGkwlpfrWvhN8b5NChYTwOfkfAwhOGr/5vDjWiRMX0S8gz56xlXcmpdgp7Q6+
         7OjDIaXGSlIm884tDkosEwCXOpNlLdk/4ZBX1S06QqWnpp1NjzAAdN3mC8Jc4w+BAWmY
         US1Q==
X-Gm-Message-State: AFuF++lp0C3KOrdhDQj2Iufer6ymq2UYD3eBbwG6GiJdzbXqKukcs6Nm
	oqrAaIHPrrtOcqrNZwNS0KOs2A14x1+98W+qGL2KqoixpPi1jTa3/2lLYC6jHQ==
X-Gm-Gg: AR+sD12+GxQnq2IvO1hsmrXtU5W8ELjBaZAFfQSnRXIc3UsIcC7tmX0J/b3Fgf3fzbI
	3B0+K0WoNIML9U0clKwxGcuEt6dnvX8gA5jOCw2OBW5zWFbt8ySFufeRokNLnyfTiLJ1TeaCXyh
	u3dx6NvEchXNmhroDk+/Im74A8uViWdqBpSyxQS3S9wq+tX2UiG4mGeG/s7h1sN1iBcjLKEblAn
	WY69qVPl/S0DhelMYdHYhHxQO4en+sDnaSFxFz9ZnGMOss12GlcdI9QORhqFu9kjM0NRG+L51f7
	vWq22xOEYR+Z8Eq892TD4+GBu8NXNKvuh5CEY448KQLbUmnUg0LmFee8zhgml98igbSk8c+mt3T
	cj4TGZcyy8feD7QkTFeWZ2M4AlzUkxTAjbmdb668TMO9d1gbJ6N4DI2rWjk+ybk/OruBMwqHVgk
	Kr3y0td6dsUYe/ACBCi0G2isrF9ZdPIyN3aQp7dYUQpfb+6gEWJ0UC5sepW+MM43zVGaj7n25s/
	j1NX5AGaKM=
X-Received: by 2002:a05:6a00:a87:b0:84e:4d6:78fe with SMTP id d2e1a72fcca58-85371fa5967mr20161242b3a.3.1787799238232;
        Wed, 26 Aug 2026 19:53:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8556db7ab0esm5787b3a.48.2026.08.26.19.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 19:53:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/11] asyncmqtt: upgrade 10.3.0 -> 10.3.1
Date: Thu, 27 Aug 2026 14:53:23 +1200
Message-ID: <20260827025323.1433982-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
References: <20260827025323.1433982-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 02:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129531

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/redboltz/async_mqtt/releases/tag/10.3.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../asyncmqtt/{asyncmqtt_10.3.0.bb => asyncmqtt_10.3.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.3.0.bb => asyncmqtt_10.3.1.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.0.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.1.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.0.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.1.bb
index 0e1e155356..ffa559e39e 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.0.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 CVE_PRODUCT = "async_mqtt"
 
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
-SRCREV = "7129d72c1b9adf159bc506206df3fb422bb9fb84"
+SRCREV = "0adc511b85358397d8ebb27c10f1ab62da3e3e05"
 
 DEPENDS = "openssl boost"
 

