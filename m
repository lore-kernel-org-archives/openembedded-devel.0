Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663A1E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:21:13 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.154124.1734708066599009427
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=MahATl2n;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166f1e589cso22574155ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 07:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1734708065; x=1735312865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7R1VDwnMrNAEkh2ZH2iY/PqQEJa+h/Ok6hgvU5excBM=;
        b=MahATl2nZ0IcgjFE8eMYxD888kMuAv9rmo5hGn+LWBbdZ9RBpp5m7os0mW6kwP6IkJ
         CK4fyKA64dw2VwRfCz8l1FvgCM0txrvl8hOT5tWcYA5hk0BlGff2qrpVy/vW0UcKdk7m
         jBcvQnNsTweOVCDxfAUJhZUI1lQTACzswk14Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734708065; x=1735312865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7R1VDwnMrNAEkh2ZH2iY/PqQEJa+h/Ok6hgvU5excBM=;
        b=bHs8c4lAvA3CuG/53MnabxlPWfgjQ4JvVfLrq/NuC9XO875cTFN27PF1xBFt/HC+t2
         pe3rVtdy9pR6Qg/jP+wMS2m9E5NhqpgtMD7AAuPD+NXVNE0W22GDVNr1TZa241hDXSem
         /Chxz6VYJ4cnrtZERDdA7wcSvoJeNRKxubkqpyWZgUpTvPjhsyay4WJXXe89nCUFN+z8
         fdvm4ZS2aqVfmsx08Jr5IYsacCJVzRavlLMcOZA/t09XdilRAj4lZArot+0giBTMoYIv
         MxmpOTZm7MuKeLeGXeV7zqhXGa9+4lBbLQ3WFe3GYYogPs1S0t1fmeUsxmteTmvWiePa
         cm+Q==
X-Gm-Message-State: AOJu0YygQqmUm8btPpMIv81Bp3PftvzXcjr9StdnspkayBBRoAbex260
	gnvNxTLuHY8gAFcQayqu6oaDYvw4k96QuRxQKyZ/GCUSTuAtoAyFiw7GRyVJq7upAM6XNIk+kh5
	7A3E=
X-Gm-Gg: ASbGncuje12vMUWDvM2Ze/FQco6160g+7QYbrgKZTk7n14LjQS50N1Vh8XOXGV+Guog
	kIaffmQmh+kNIG0lXqCvtlgtckOuIHP2uz7Z1K3Dxmr54KwqvNaunJ54Ycqg8DOgaZb+SBLM9Ir
	69B1ITyZE0776yf1dhWPzgQ8+YOGDJSPpsTGWrXN+dwG4Omgg+C2iWaCYgBcXxS+7eZ6C9Mow7u
	sN3IhWruti3oNv4nsF+8RvJ1HZTUAgLZa2RaK7UZh0i540D9mRh5RCwcpulRZqK/HW1GXw=
X-Google-Smtp-Source: AGHT+IH7z2AlJcCOZ3rxJ6dy4S1zPcfRhTj7DHVO8LvHaieDvVXV2ZMXbu5eC1fgSLhzs7TZZ0NEcA==
X-Received: by 2002:a17:902:ebc9:b0:216:7cde:523 with SMTP id d9443c01a7336-219e6ed39d6mr51782905ad.32.1734708065564;
        Fri, 20 Dec 2024 07:21:05 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882f:7af7:716c:47cc:4544:7388])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d47sm30276045ad.55.2024.12.20.07.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 07:21:04 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] php: upgrade 8.1.30 -> 8.1.31
Date: Fri, 20 Dec 2024 20:50:54 +0530
Message-Id: <20241220152054.3329816-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114435

From: Vijay Anusuri <vanusuri@mvista.com>

Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 and CVE-2024-11233

Changelog:
https://www.php.net/ChangeLog-8.php#8.1.31

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.30.bb => php_8.1.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.30.bb => php_8.1.31.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.30.bb b/meta-oe/recipes-devtools/php/php_8.1.31.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.30.bb
rename to meta-oe/recipes-devtools/php/php_8.1.31.bb
index ee59322a5..235fec516 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.30.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.31.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "cb1625e5ac49b91037477e3e7767bb0624343971aeb992f4791b618af571d23e"
+SRC_URI[sha256sum] = "0b39828b345151caf1b795d9f4b923c9887231776c33076dfc9d90a44390d0dc"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


