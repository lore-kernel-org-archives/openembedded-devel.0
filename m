Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42D8C38A02
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web12.21858.1649623396083910659
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=qfJiZ8LM;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.176, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f176.google.com with SMTP id h11so17846386ljb.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yW2ib/oH4FD9urnrhnxqJIH4YfhB6C5BOtN+Z7ipAbg=;
        b=qfJiZ8LMTG4cwz9taDj0tm5506GzgJE6RzDPHgFIEGCRHaRVVo21ehvEG0HLmrKhJ6
         tbGeOr1nhyY9jVBi+YVH1eZwaDa/G00A1WE6ItNDNBeWAEbzMNyfVxWS2zwgDuXIGcA7
         OWLlskxpFTtt3kobYdXXVMZqOXr5I/bwZOL4YPURovJNot2VChrvMvVzfXHg1tWX+GdJ
         birZaDJfMf1ddDxHTLEJ+liUG2nsdITW28KBXqEmKW1xJt71HmurVY+hs5Ac99rvlP0Q
         jmVXtRExTxgEwT4r9J7d5PS1+Kf0EbksCPZEZbW74/wuqeu2QosFGMpqkR2XGfhA2IIQ
         EETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yW2ib/oH4FD9urnrhnxqJIH4YfhB6C5BOtN+Z7ipAbg=;
        b=aiLfpKPyTOqYuvcRXzTJFKRYvbwfsnLLraMmey4XX8Ds8bQH44RAfU2sVFCgCXmtbz
         NQig4PzYIC/C/FscqjIYJKKIQj4RYdxfxMW9An+PPjHwHcHIjvrlWJbGloe9F/H/K3ZH
         cnTLdRbA5PSqYfvdVvVTZRzVphY+tPvYvgV3FdJx8Fl807uzkHTVTZPzwBIwWQ/v6Y+e
         239NVrNsNQ2nRRW8Xl5KdzyagwOxUoGy52gcmHnHeuLRcRg9VV/7zB3IcpPTI9n0bYIg
         FYRgIg/s6p9XiCmvUyWGjxt0qsxXdlzFc4GrnBoyN2JhRkfMh9DRzjhBp25Lbel64bxd
         4uuw==
X-Gm-Message-State: AOAM533trLR1sm1hq2ZXgWCkGsi2E5ZGesqiLD32MgiGInmRsvH7WKz4
	zXclu2reXXekxXhhmiK7yPH9W0szJrL5AxKq
X-Google-Smtp-Source: 
 ABdhPJyuxX6/Sbq/Syug9slixadg/5DZW2MZyWe8GSz1jIquNcSw0MmckLIoZlyIlrX3m/Yw01IMKw==
X-Received: by 2002:a2e:8186:0:b0:249:9dc2:9ed7 with SMTP id
 e6-20020a2e8186000000b002499dc29ed7mr18478607ljg.406.1649623393916;
        Sun, 10 Apr 2022 13:43:13 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 k16-20020a192d10000000b0046ba99878a6sm28751lfj.17.2022.04.10.13.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:43:13 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-ipython: update to 8.2.0
Date: Sun, 10 Apr 2022 22:43:11 +0200
Message-Id: <20220410204311.4046215-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96523

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-ipython_7.30.1.bb => python3-ipython_8.2.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_7.30.1.bb => python3-ipython_8.2.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_7.30.1.bb b/meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-ipython_7.30.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb
index 6b829811f..35af7dd4d 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_7.30.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "cb6aef731bf708a7727ab6cde8df87f0281b1427d41e65d62d4b68934fa54e97"
+SRC_URI[sha256sum] = "70e5eb132cac594a34b5f799bd252589009905f05104728aea6a403ec2519dc1"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.25.1


