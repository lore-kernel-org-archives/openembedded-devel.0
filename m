Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web12.374.1613109242506245808
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 21:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=NMb6hfs4;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.66, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f66.google.com with SMTP id p21so11488797lfu.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 21:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UFTjINg/msj4myVOlNFJh5NNYI1oGGYREsmC5+D2z6s=;
        b=NMb6hfs4Acn6B+C/tr3Un1prggnSKtOtSd8jbuEO6q7g9llFYyHXLTf+bOz03PZwnU
         zWKFv3IXSvuT+Fj/SZUeD5V7IjaYN2bHyB3rTXEN5YSnMvzUN4uvrZnCjpzk/BdZONjq
         IXcoM8GXy7wfqJrlnAFpRnklQJnvQ/P8kur70u5k8Dj3ynTSBs579SS37AaImFqO1nHE
         sy0m01biHAwE2q4lrf7akZhaHdYGeKVVww67A6Y9DNM+dlsHZ7TbuUzd6iz2bPTyNDPV
         3ooJPHu+YIh0MunB/MzhDNX5O8qdy2tKcfkbItnpkwS6JPgvAh0UVMrLuhEFXU5StJyo
         ZCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UFTjINg/msj4myVOlNFJh5NNYI1oGGYREsmC5+D2z6s=;
        b=seAPjb/Wz6N4kEqeUHHBWCAsR0/930saq7E333g6L8HmPCa9C5P2mhC7/Usb2ljXfE
         8uDHSSetPXW8L1DeMU9TnYUnrbEPhIl+vfo9yowiUOleUXKVeYAT1Mk757KIA3JECdLe
         BWkSu0pceY0zzlU9W30qggNPTXrnpGHD+kKTvu3ajszl4BuuD/9aDiqlTj8+7VKmQMZY
         6oLcl0ckSKjvXE6VwvY93k2RIp/3LfePITbMfNr3AnYRDFkM6XC18VAAvRcT5D17hpvH
         g6duRr0Gcf1QVN0lqvzRfWnkhPy366h/GxYdGZ23KVsbNjpec5P5NBIjYB++2PfGY8f+
         seIw==
X-Gm-Message-State: AOAM531tx6J6+JlFLqQJs9Ar0a8ywycj3pLDQa5JAkXIW2fzqhYtOqkE
	oTItyNN86oarW8ecnQa5sykHzBXjPcjqBtG+
X-Google-Smtp-Source: ABdhPJyirogPBEPmQyai2igIQHBGy+VJFaAlXW85bjgl/RdLZVE4ld58BtiJKzjGXSmJYIOG4M3uHw==
X-Received: by 2002:ac2:4114:: with SMTP id b20mr757016lfi.180.1613109240013;
        Thu, 11 Feb 2021 21:54:00 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b14sm864391lfi.164.2021.02.11.21.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 21:53:59 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] hexedit: update to 1.5
Date: Fri, 12 Feb 2021 06:53:56 +0100
Message-Id: <20210212055356.2398938-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../hexedit/{hexedit_1.4.2.bb => hexedit_1.5.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/hexedit/{hexedit_1.4.2.bb => hexedit_1.5.bb} (89%)

diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.5.bb
similarity index 89%
rename from meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb
rename to meta-oe/recipes-extended/hexedit/hexedit_1.5.bb
index 3e7fb2a07..3a7413d8a 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.5.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://github.com/pixel/hexedit.git \
     "
 
-SRCREV = "800e4b2e6280531a84fd23ee0b48e16baeb90878"
+SRCREV = "baf45a289360a39a05253949fb9d1b50e4668d8a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

