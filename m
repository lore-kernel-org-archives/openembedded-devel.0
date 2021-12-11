Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E985C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 18:58:29 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.25377.1639249108296231953
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=lKEHKzUz;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.50, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f50.google.com with SMTP id k37so23860778lfv.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WP7nVzvn+Tbjtxu3n0D+pAPtmXW3UQydAYikpW8bo4Q=;
        b=lKEHKzUzbXDRhFDVDmnWrVGo7yVrWBbkhxdzt5PmwJdUVXk6/WLeLkWZn9fJOGhZoV
         VQ+ws7fmUM7AcHqfejWqW0jD+ipFw7CWWdPFc6LTYupCqasDHo9IAKQIFZuDrSTY0s+t
         EtpR5NAok+2qE9zZrep0SG+kRzqNO+x74iQMV1vGhk/USzVpC5vsCaMK2snDY35DUamA
         pRtn3m++KX1xI59TyKcl5HjHyK/8fRMXKUJhRF71wgFyHGe9Q476TzIMZ+itZO5hEAAI
         adpY5MMejPQeF2bSgq9Pr6xR4Q2GAanQjVE05OLqbuYevdY8lOcy7/jYWE0HwKFECAXr
         u+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WP7nVzvn+Tbjtxu3n0D+pAPtmXW3UQydAYikpW8bo4Q=;
        b=FfJDYhuFXavZoZ/R2wAUlMiJnCjWB6HDWpQJO26qkHhe+vDjtJ7QniJJrbEe9FprrW
         ZVj5JtAzmuq7CMSEFJNSUqn4zZ+bEwmUW3sKQZPvZKGdLAqMoUTTnECdvgV6bMRd2nEd
         CroiB+KO3rhgaB1NXjn0hzkTBbvOMTNgXSjaIUiPiwwH3qV6QCYWR6syx7Z6ikydmy+o
         H1U6Xi1mdZwAQulZc6kOIzuNjeCMSKdF9g39wXLw/YtQR+cZNIDX6JAfKR1T4FS3mmAm
         xvcsSya9mMxzrYJYKOH0ZX7vFSqNADy+75kmehDcZZvpRy4OiV/5yOrVoZT4vDOoXSgq
         7OGg==
X-Gm-Message-State: AOAM530C7PdxIeM71mLBqKSTVABEZ1DyAp0PqpGK6CrabDnumBd7uiLl
	q9zaEf2rhBih+1v5TZ0XkuXh1N9ccUzHGOSX
X-Google-Smtp-Source: 
 ABdhPJylAtIEPYVNmDvisAFcgIWvMXEyvjuof1Tshouc1dLm3QBdwtGTY0douZCJPhxKskG5tOoqaw==
X-Received: by 2002:ac2:4c0b:: with SMTP id
 t11mr19790986lfq.520.1639249106367;
        Sat, 11 Dec 2021 10:58:26 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id q6sm731910lfr.76.2021.12.11.10.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:58:26 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-graphviz: update to 0.19
Date: Sat, 11 Dec 2021 19:58:24 +0100
Message-Id: <20211211185824.2546382-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 18:58:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94293

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-graphviz_0.18.bb => python3-graphviz_0.19.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.18.bb => python3-graphviz_0.19.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.18.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.19.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.18.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.19.bb
index 200292d66..593cdb4e5 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.18.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=87cd8818b7e63c6a9c580034e80d7521"
 
-SRC_URI[sha256sum] = "0f04e5f939d3a839b524283d590e941892c56e75e60e0f5238c431264f490022"
+SRC_URI[sha256sum] = "b42554a1c47f24a9473b7f4e380d17b228586a067c97ea69d5354d6074be8dfd"
 
 inherit pypi setuptools3
 
-- 
2.25.1


