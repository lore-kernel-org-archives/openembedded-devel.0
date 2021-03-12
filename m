Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web09.1130.1615568978343731970
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 09:09:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=FMPeGHWF;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id f26so7675748ljp.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 09:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnU/Gu/lSKYjk972jryXcQp2yoolHTTYea6PlPqKDrk=;
        b=FMPeGHWFWRxXsbDxqPCcUPyEoGs4jLth0o2RcYn8X0yjGfWuaIDYgArDQA3o6Z/Usg
         EiYVWHc0VayY11cDKIWfzVtpyClb57zfHt9nz8zzYkoI9cgUlfuEbPS/7n6wqzEbX1jY
         rJC0yy/gtS2ZtQqRMqsUmQ1GEZMssg0qr4GpAEU9tvmdBvdj8c7OIA6aOrrcordAzEQM
         uIxz+gYuYLdL4JBkX0xlna8+ISOF7NRe+bm+GBDhhbpZzmHITqNLP1EzEHmljAFy2Gr7
         7LQ5F6Ta+1BK34bqKmnTtCSPED9ZuqiCg8LKDsFCdVQckEY/hIKLteuvDOn/KXUv1Nl6
         EFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EnU/Gu/lSKYjk972jryXcQp2yoolHTTYea6PlPqKDrk=;
        b=ljXq+nWjrefAxqKIhduN2+uNTpisX0XGJie9p4gbDhCDmYI1aUWbzcdyiNs6RaR/Zx
         aO17KaXBcbW8h4Kw4svt7aQ2cV93hJ7vTKp+Ss0wsd5srVxivMTz5zOefhF9cNGY5IcW
         7wSfs2H85Hg4JCCGOtivad+CEnRTe3ukF4kNhdq3MjHcVN43KNorlIU+6Iz9SQ9BUQcP
         HxcPep2/BW0tB6ZHWjMFHuQc5oXB2HWKl1a92RP2rO5rL6nMBkACPijmYKXAVYtO8LNN
         6f8xroim82BKZqW+U/BMRRIYEhYwYpyPOWv8e8uZsiXxlG7Fe4g/VeG2v4InhbBMiZUc
         OiwQ==
X-Gm-Message-State: AOAM533ef99pksjdP1ILLUGgkDF8LP9CWMukvSPGPTk3dIRKGN7mP2VZ
	sXmmtf9MwBCepD7Qg6QPNX0evNKs+Lwj73lv
X-Google-Smtp-Source: ABdhPJxW6WkqS9Nok50XOKcNhaxaYjvFR6D8sgJGKAeHNTUulvMf9A/I7wAGo0xtjwRlAaubEFf9Gw==
X-Received: by 2002:a2e:988:: with SMTP id 130mr2996933ljj.380.1615568976120;
        Fri, 12 Mar 2021 09:09:36 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id f15sm1751995lfr.51.2021.03.12.09.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:09:28 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-sentry-sdk: update to 1.0.0
Date: Fri, 12 Mar 2021 18:09:15 +0100
Message-Id: <20210312170915.567739-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-sentry-sdk_0.20.3.bb => python3-sentry-sdk_1.0.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_0.20.3.bb => python3-sentry-sdk_1.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
index 13ba1e6fa..22b9f55dd 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_0.20.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.0.0.bb
@@ -5,7 +5,8 @@ HOMEPAGE = "https://github.com/getsentry/sentry-python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
-SRC_URI[sha256sum] = "4ae8d1ced6c67f1c8ea51d82a16721c166c489b76876c9f2c202b8a50334b237"
+SRC_URI[sha256sum] = "71de00c9711926816f750bc0f57ef2abbcb1bfbdf5378c601df7ec978f44857a"
 
 PYPI_PACKAGE = "sentry-sdk"
+
 inherit pypi setuptools3
-- 
2.25.1

