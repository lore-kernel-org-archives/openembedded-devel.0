Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2943CD98DC
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73364.1781278462647047442
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2026 08:34:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cxV0x8pF;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ac357c55so10369675e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 08:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781278461; x=1781883261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nd+PpSfl4HXWCdGj4RzjhsTWEXb6e1OqZ4W/RRPA7Rg=;
        b=cxV0x8pF1/LxvWqP9ThtMhy9ClM8YBDpb9UeDNz/g/Jb4I211muKkQiJqe6nKlTN/R
         dhF//kGXQ4cq+GzQbDJrzYABo5vqzecAG0j/GHDoEezM3N38SRoMJC+N9FVH8zcpyhDu
         15I7DnVk8fhoknWq+m+w0hLNFJVtyIwoZQtT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278461; x=1781883261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nd+PpSfl4HXWCdGj4RzjhsTWEXb6e1OqZ4W/RRPA7Rg=;
        b=Y0LipzXln3R036Yi6Hz51rJ7N/AA9G3HHV5G5LFxZsFKL8heEMt+7c4kdbziPbX9Ni
         BHxCjrPpvppiiOJ0E+8EsIcFmOscVkwEi/X3CQL1kb6XAdkGrqyIYz2TNFppL7Ri32QR
         dg8PInRj9ZAdLQREktzVl/9ZHCeSl0jFwP559wON1nNYhSqEz3hQEG5yUbFxA5mos5BY
         18s1TRxPnWGBeU69J541jvNSsfpmh4MocsqrfIjGn0kab4h2OuwCTRE3cNP/hPQ58JIH
         JZwI6xMa9Ce47/LQYMTgZMCEZStFCwDfM7IV++qGvQY//ENAqM/IkuINydJfeXi+xdCP
         dK0g==
X-Gm-Message-State: AOJu0Yw2KZFiNVqzEDPrlzCYlebMfdljLoE/MVAORFRuKIuindip2gmg
	aLYFP5sxDdqG3O5JzlkOe7+uXF+Lm+rkzz75+5ZkeMel1RcGgXlS0GdS8nraignbE7AA7b8VDT3
	u9vhi
X-Gm-Gg: Acq92OEDUigR6aAYqaM1jZnZSPukMIXwUa+DqL5nJHQviOVeYhtC02CS7SXNxP1vduO
	MX9w06WByAhTD5NC4biedgqe41JtuIGdfzxP/vuN3HA0AMlEMW3JsBCt6q6lLku8juFlVju4IOM
	50ErCWecvoCyyxS6HfNK4Mij0+cDlAMpO1/gM6uoRE5LGU6THOW543P5bbnXYrdsyEPNgbMVS4a
	t4R+xDH1/mzJybFOZnpeVTPCxYpB6AThDm5KEkWSn0qSiUtcA+NhtcJKJHOZTVquSXBGqcc49Dy
	b8HzKQhS3XjGkO4jDKFD9WTL2yLGRAuwK54dkPe9qD8TdF3jZ/u1pqzzkUdD4uO1g3oQn9u/knp
	WUw/Rx9p7Uvk3k5ASkG6sTFaL7SB1N5wQLyUZYJ/W1tIeNIddjYqpMUqlFBVUzkRyCKyIHpeENP
	ZNAhI6ziJyGd6i1DFzC4wMAn2HCYWv+xyl3Ne6nfEbr6GZHZ8=
X-Received: by 2002:a05:600c:4595:b0:490:c7dd:7cc2 with SMTP id 5b1f17b1804b1-490ec4fbaa9mr47460725e9.24.1781278460688;
        Fri, 12 Jun 2026 08:34:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea961f18sm61187095e9.2.2026.06.12.08.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:20 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/8] python3-faker: Upgrade 40.21.0 -> 40.23.0
Date: Fri, 12 Jun 2026 18:33:59 +0300
Message-ID: <20260612153404.3213552-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260612153404.3213552-1-leon.anavi@konsulko.com>
References: <20260612153404.3213552-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2026 15:34:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127545

Upgrade to release 40.23.0:

- Add French social security numbers with Corsican codes
- Fix typos in docstrings and comments

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-faker_40.21.0.bb => python3-faker_40.23.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-faker_40.21.0.bb => python3-faker_40.23.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-faker_40.21.0.bb b/meta-python/recipes-devtools/python/python3-faker_40.23.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-faker_40.21.0.bb
rename to meta-python/recipes-devtools/python/python3-faker_40.23.0.bb
index 7c44c5cbed..dc9d52e706 100644
--- a/meta-python/recipes-devtools/python/python3-faker_40.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-faker_40.23.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/joke2k/faker"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=53360c4126f7d03b63cb79b0dab9e9e1"
 
-SRC_URI[sha256sum] = "2fdee1b650a723a54432db9c6dfe17cfa29d1adc8bd60520444a07698524ba4d"
+SRC_URI[sha256sum] = "f135e563f1f95f19346bb680bc2e43570bc43b7893e566023746f51f32c69dfc"
 
 inherit pypi setuptools3 ptest-python-pytest
 
-- 
2.47.3


