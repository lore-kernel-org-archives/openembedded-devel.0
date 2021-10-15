Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBD5C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web08.4292.1634338565387587452
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=eIWMbzKd;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id n8so47472715lfk.6
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OtOBDzpa4CH51tZ8yFwGgqUh/Ll27URSg5piiKWKJUo=;
        b=eIWMbzKdXrkxbe+3FPZM89scqS2/NiY8QZMoayr0UuydywuqrAJc+PrTCkIxSIDiJk
         4VuVuUlXPRdOcUXCImQRNaKxO0g+NHvokUPMXDNtZhFYKt9ObRpGrce+dVnYBRlE6RzW
         N3iuspEsfm3HcDgLk/aOjcDoXatAcu+7TBBd67Wza3PL9sGPI1sXicXEADYjWCQmjftE
         GKXinELhRlysENZ399Y0oGnFaXDe7ZkVDfwGwY8zmTTi64RaYJrwST1fiVY4qB1t3rVG
         538X16DVRNgqZwyTLH5C1C5fzLBDmBXQ57hnGcxGOokqF6u3qMMb1AKTZmqKXRnF8Hyz
         P6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OtOBDzpa4CH51tZ8yFwGgqUh/Ll27URSg5piiKWKJUo=;
        b=FMNnySn582D4JMd7gl7wK6jS8uZx928b/QkVMDy3IHJS52Mr+CHkVag1sQp+JnhzdW
         C9lUk7XP6jlWsN0+A0GBY2sKwz/OsHG7zQ1kxxl7nahrA8KnbLAw4/gzR0gonOw7rJAP
         RaqsIQjduRPzJTGH8aGaC9rYNmJafq7h+X6n+wiuL0tUpXdCFPqFEPgtrxkST+hH3lIW
         0wgZlJxFKYF0W2rxjH2UVclc7S5uNUze+KSJ8xq3kClVR+LIV9/ElM/uvWlBjswPduog
         tDfEfedgQeA7iaF5Wf/PLcGCcqYvJoaVCGn02FPAQRkM4dp4UVWOGqdZAXHl5EZZ4atH
         FWww==
X-Gm-Message-State: AOAM5336fAjKrpedMz/NjR69kHfPvIy0orMTsrPfKaBiO3PpoOZYbvv+
	PoZg+A1NydRABU4bJDbb3kZdWYl/dg8TkKtw
X-Google-Smtp-Source: 
 ABdhPJxdvkmsFLAQz+I/yu2pliPmVaZhZUAV1Pewu95WZ1ul5CXtm+6UZW0tWyczImpE2mbq7gjupQ==
X-Received: by 2002:a2e:4942:: with SMTP id b2mr15619991ljd.176.1634338563475;
        Fri, 15 Oct 2021 15:56:03 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 x195sm654382lff.28.2021.10.15.15.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-sentry-sdk: update to 1.4.3
Date: Sat, 16 Oct 2021 00:56:01 +0200
Message-Id: <20211015225601.4162193-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93346

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...{python3-sentry-sdk_1.3.1.bb => python3-sentry-sdk_1.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.3.1.bb => python3-sentry-sdk_1.4.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.4.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.4.3.bb
index a7810ff0c..c5614a381 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.4.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS:${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "ebe99144fa9618d4b0e7617e7929b75acd905d258c3c779edcd34c0adfffe26c"
+SRC_URI[sha256sum] = "b9844751e40710e84a457c5bc29b21c383ccb2b63d76eeaad72f7f1c808c8828"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


