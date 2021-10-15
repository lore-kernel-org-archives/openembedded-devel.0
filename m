Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA85C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:08 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web08.4294.1634338567390270255
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=2MGWvrU+;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id r19so46567677lfe.10
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aroTaUFQp5RmZs98QQlnEg6HmROsEX1OJxjih5f3kw4=;
        b=2MGWvrU+wJ14GtvlzZKMKKbDtULpR0T3XPlGDg770DJdzCPx1ejCnWxyy8/l4i6xju
         Wv2EWzD6dUpXCqPCQcbLgu6pILXGTzjIT+NQg2JudwLXRYwnEP4nzwOhEu1k/aXsiac6
         QBcY2574sxjVpvJ3pG03d9ey3gin/ZwJxlS9UbRzh3U9sjVowBAYyJSg4V41UQ0DXw2l
         rJckiMm4TdTpXL3mEz5PwlfkeMeGD0R+1i8dXW5OUHcToZRivcFQq5+544iHe9//3BEi
         1tetoFycZI+qbW2DSK3tYF6YRymFCXZdolgdVplUwox/ChLUSYC0b5QLinhIc+b0+EMM
         qfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aroTaUFQp5RmZs98QQlnEg6HmROsEX1OJxjih5f3kw4=;
        b=fh3fqJiKTUvhvije3tW3tMp4sAfhJKQb+cKsjiM1s1cndpDU7GxZmznqwAnLWz7yYB
         ogv2kUbeFSlvpUQX2kc760Vj1nsXHvpPlvYobJXNPGkG1jgFDhd4ITNwj4l7TnvPRd/T
         GtKeoUgRb8WJGylSW7NnI6zzlYOdQCMUKrubmiTwAB4DZknvuey+0/D3IiWb4UQ5IB6u
         BdigZs2849yWX+ixoTxUGE8xdnjAR2e239RoDhZDkwhE7/oy+mN9aBrmE9htodcG5WoM
         65F6FjlzlpNeX1WQNaNMmVAF2PRvUy/FA5emaPovDCCKrKM09GE8pUGFpfM+HMXGPw8H
         OEjg==
X-Gm-Message-State: AOAM5304x7hv2zmWG2zqf4rDObaUIrrV7w+abWHi7VZD9/8c8lqlFzDe
	GFRPw9JbnIfUAnkqcS7sibyCcYKzZonsZnQo
X-Google-Smtp-Source: 
 ABdhPJyaqJqZgc05eMNrhKYpGmTFGOiPziEOnM2DAC+tur47dYzWrpbAZjgaUW3cT6aJXs9sT0so9A==
X-Received: by 2002:a2e:b611:: with SMTP id
 r17mr15490662ljn.336.1634338565459;
        Fri, 15 Oct 2021 15:56:05 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 c20sm655372lfi.182.2021.10.15.15.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:05 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-regex: update to 2021.10.8
Date: Sat, 16 Oct 2021 00:56:03 +0200
Message-Id: <20211015225603.4162250-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:56:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93347

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-regex_2021.8.28.bb => python3-regex_2021.10.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2021.8.28.bb => python3-regex_2021.10.8.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2021.8.28.bb b/meta-python/recipes-devtools/python/python3-regex_2021.10.8.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2021.8.28.bb
rename to meta-python/recipes-devtools/python/python3-regex_2021.10.8.bb
index e375b5b28..e7978970c 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2021.8.28.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2021.10.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=f0a3e4a2554ebb89c0
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f585cbbeecb35f35609edccb95efd95a3e35824cd7752b586503f7e6087303f1"
+SRC_URI[sha256sum] = "26895d7c9bbda5c52b3635ce5991caa90fbb1ddfac9c9ff1c7ce505e2282fb2a"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


