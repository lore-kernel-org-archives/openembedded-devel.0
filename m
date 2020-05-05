Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
 by mx.groups.io with SMTP id smtpd.web11.9498.1588690542257034880
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2020 07:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SdUCbQvz;
 spf=pass (domain: gmail.com, ip: 209.85.167.68, mailfrom: wickbergster@gmail.com)
Received: by mail-lf1-f68.google.com with SMTP id z22so1620999lfd.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2020 07:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdPBTKys6lI+1fVZ8ZOqfrHr5YtIFsbwAdvfEc5ZT2A=;
        b=SdUCbQvzxLhxhVBRVhsSF2OyCbIbmPaHnjkmd1nzE0FzGUHj1CPDdHw8qpdYlNVS26
         i95ul8ihJnBcQXN1tz9vyzTnB0QF/KlyxKFjmo9BKlPOQixhwCMgV4cst03Q3887zjMA
         8+aH+Dg5I0jDM2UAXB685TMCrnq0Gm6nAUzPy5QlZjxFq5q6y7uEB1H9LTDu4hgWgGhi
         JmUEzYYLi2rvq3uGtOONV8OBhSXbd5NaJU1Y5U91WjgYc9JaUia5K/8Ku1XCjYpGY7Cb
         3aJOxxlmBmdAA6b/4QJbqgBodnb30BU5ccXBmCd5aksPD3jUUAOOAOxVK++8aCU8X+2q
         IWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DdPBTKys6lI+1fVZ8ZOqfrHr5YtIFsbwAdvfEc5ZT2A=;
        b=YHg6XSCoEN+2Uk9RE2FFzWWdkztyvFjQ6KPWuTEn5P481pNlOAZcz8MqbCvujyU1PN
         FHcjcBSEBplW4boypoyGtCDDSPV7h+x7paVH8k9jI9uyA49zRR5ZNMiSA4/aWiGMemDp
         0umutFSBFoKzkW5AwTRV3Ba91FdRb352m42/6lmV8pNQW/ol1lTW6Nd+3oCqcd80vdTK
         Se7FV23GVTRCS9xSYRrjHaxqTjvqvSAm8i6UzoR5EIkbp4HnN+rwJS3HpZFBjLuc7Plx
         B4zOL+wvT7Dz+3YQoftBRqX/+7baobL+I9xIfTr70EfIfDp6uQd1PHJ8XVJZoVCeTkif
         zxpA==
X-Gm-Message-State: AGi0PuZVsWwXde/J1CvlrD8g3iRjmpv5ZCuWraJMKkbrHnp3R6Pqf7JC
	xf1swceSWzkXdtslJd8zoVCvRc94kiQ=
X-Google-Smtp-Source: APiQypK/TX0rtvb+xCCRErMlrHB87yGgzM3o3A8P/TtEXqXrpQEN9DdS6ku7oMfhYFk1SxGsGoUU0g==
X-Received: by 2002:a19:f610:: with SMTP id x16mr1958671lfe.79.1588690540172;
        Tue, 05 May 2020 07:55:40 -0700 (PDT)
Return-Path: <wickbergster@gmail.com>
Received: from localhost.localdomain (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id y21sm1876525ljg.66.2020.05.05.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 07:55:39 -0700 (PDT)
From: "Alexander Vickberg" <wickbergster@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [meta-networking][PATCH v2] tcpdump: Fix PACKAGECONFIG for OpenSSL
Date: Tue,  5 May 2020 16:54:43 +0200
Message-Id: <20200505145442.2477988-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes building TCPDump without OpenSSL. Current version does not
recognize the option --without-openssl.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
Changes in v2: No changes. Resend with git send-email.

 meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
index 05fc99bdc..94543dd1d 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.9.3.bb
@@ -27,7 +27,7 @@ inherit autotools-brokensep ptest
 PACKAGECONFIG ?= "openssl"
 
 PACKAGECONFIG[libcap-ng] = "--with-cap-ng,--without-cap-ng,libcap-ng"
-PACKAGECONFIG[openssl] = "--with-crypto,--without-openssl --without-crypto,openssl"
+PACKAGECONFIG[openssl] = "--with-crypto,--without-crypto,openssl"
 PACKAGECONFIG[smi] = "--with-smi,--without-smi,libsmi"
 # Note: CVE-2018-10103 (SMB - partially fixed, but SMB printing disabled)
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb"
-- 
2.25.1

