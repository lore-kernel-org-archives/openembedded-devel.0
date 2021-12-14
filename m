Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EA8C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 13:25:29 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.25504.1639488327417749656
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=FMP29mM9;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id m6so25008824lfu.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xWeZCyXhIM5GT5LC8wiMlTAoQm8MiJXuBJX0GEKsKJ0=;
        b=FMP29mM9Bj/3STcXLZ5xp4R3Af7487kWSNHqwe40XCkuwhBnO+Hpys3AVpTXHhCKaf
         oTkeccsiNXt7j8SbFh2l+/EhKkML5wgoZLiIku1elcfaM9Om8KL3orVJqM0QojKHDCRN
         ZNbD62nrPJDoNIk7YCQ8ZoC5HwwG6vYrzU1ngq6yTCLccfmayqZaoo9Z3up0tsGkr2TP
         3EkzeKAa1+OnhqJIEINXwvZREzTC9QudAlBs98mBkwrh9A1oDF5JDFX3AaohJ+6gty8i
         8o72FRcZFrFRaSFy4XzE6tbFU2RzVr7+d7VfgFswwjmb2+yAs8mdjFDTnRd28RHfWm6t
         +QsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xWeZCyXhIM5GT5LC8wiMlTAoQm8MiJXuBJX0GEKsKJ0=;
        b=YfHFFcPvKFw7V8c4jC5ZFVV5msmnJqds/607Wx+l0AQftdijaoiP1APS+/J+cEZOe4
         DowNl1jrR12/6/yI4onNZsw3gfscnRK37tRe3ycsWhhSggmIJ7ghZQoSwsAdVeH6xeRq
         5L94bCWosBVFNh46lVT3NtXcnfcRvj0Lv7FI8bBuj7P5OKUwzDcfBAycRw+7zjRpeEgP
         6GtUvLxY7i/CIgt56y1sD9w0hSO0J6mVD6LODiSh5qfywEQyS9gz5N1rsxUYDMb/E9YP
         kbUgqJT8IWIV8aGwNcoyTkMP9vNjDmLnXO1Jn9+3HMtvrg7nxLr9X4GkMLd2U+XHf6QL
         VrOg==
X-Gm-Message-State: AOAM532BFcFcyiiVCU9ylGvV5+LzZu26JOLGIgPaTDrnWQYPH5nA3/RQ
	QTtWO3uy2/7HGXZBv/f5UNI7FTA5LRBOs2h/
X-Google-Smtp-Source: 
 ABdhPJwk3DYMsebGyec3ZTTiqZC+h7oykuNJVsIMgsl8ptYOtEKwlfyYJDRoin5jDVupF2heaGrUuQ==
X-Received: by 2002:a05:6512:3682:: with SMTP id
 d2mr4864067lfs.442.1639488324922;
        Tue, 14 Dec 2021 05:25:24 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 d4sm1824427lfa.294.2021.12.14.05.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 05:25:24 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-lxml: update to 4.7.1
Date: Tue, 14 Dec 2021 14:25:20 +0100
Message-Id: <20211214132520.1095414-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 13:25:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94350

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-lxml_4.6.3.bb => python3-lxml_4.7.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.6.3.bb => python3-lxml_4.7.1.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
index d5594847f..cb33fcc3c 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.7.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "39b78571b3b30645ac77b95f7c69d1bffc4cf8c3b157c435a34da72e78c82468"
+SRC_URI[sha256sum] = "a1613838aa6b89af4ba10a0f3a972836128801ed008078f8c1244e65958f1b24"
 
 inherit pkgconfig pypi setuptools3
 
-- 
2.25.1


