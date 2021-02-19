Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web12.397.1613771776303705877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:56:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=tyXmPa/7;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id c8so29151662ljd.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z6iOojpGK/oKYpyiGnLifyvmeT03LCqG6vi6mngZL+g=;
        b=tyXmPa/7UOt9qFbJE88QUFucaZdLSptxASDQOSCxtHTccGqYDWZltdZ1DTVUQD8LVi
         DcDguSehA5TFwoxdTBHIg9+ZQTVTr7eRJZiTj0Ty6DtXZEAa2XqzxVDOMqzzL8iEBP9n
         EwzMUtz09aqsIjaPeckfgCdnlYGwwdT5gY1ByhIwbTjw8vrhvgI13svvZcj7RNW0mSlU
         zWsmjeRHttS8ECzBsM+W/zL5rEvvrnJQA5va+YYhCRKiH/oGy9gtmq9/gpJSIgpoQg+l
         ryKElzLCR0SEB0uAepI3Lykh1eEV73OvkPL9p9BwXTavrfaFQNXInNTm9icTMKaykdIB
         +/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z6iOojpGK/oKYpyiGnLifyvmeT03LCqG6vi6mngZL+g=;
        b=h6Hkb0N6CD26CrUU1WHssHmB20drPILqynULsMH/bdhnRiI20Km+IPDKKcNGeeo6sD
         AsqR/DLu74REPHazu3KvKnI49RdEOWWq6i3pKJoanX7CmUEQiE8nLr4bsDdDCn/TJuav
         J5pNuAcAUq58xXjiLkI6RhRnx/r+FXZWOKLBoCACyI8pgzeM2kCETDLpBesvedVi6wW9
         +DkexFRtJNryYkh5jd2LlwXOx95demaElkuePQAe4gGt0Dwswjr0XTZKovpnHp7/h9ij
         uztQPv7xu/SAbApN7S/TXekdOvkcsans/PkJCzdchBQcxf1f9NwailmgfOW7J6zEuuFd
         74Rg==
X-Gm-Message-State: AOAM531vNSkskzrrBEymEkuR5ZQaXG0DYdxVgaAasjNTGVxs5nPT70f9
	ld1KwoBEhjQLrAMXKJVQ8JeBaTNlF75qkDzS
X-Google-Smtp-Source: ABdhPJzVJDMT/hZOh6+wjN2b0RRpTAfsPSwAGMa2q2PyS3XCuRDcj4S72ijsfcEkpBWeKfqhiBuiEQ==
X-Received: by 2002:a2e:bc0c:: with SMTP id b12mr6938475ljf.201.1613771774358;
        Fri, 19 Feb 2021 13:56:14 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id q4sm1037216lfn.199.2021.02.19.13.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:56:13 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-astroid: update to 2.5
Date: Fri, 19 Feb 2021 22:56:11 +0100
Message-Id: <20210219215611.2368885-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-astroid_2.4.2.bb => python3-astroid_2.5.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.4.2.bb => python3-astroid_2.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.bb
index 677cec7ac..f69d85015 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI[md5sum] = "b54e1325995d3a9abd84bac91d4d5867"
-SRC_URI[sha256sum] = "2f4078c2a41bf377eea06d71c9d2ba4eb8f6b1af2135bec27bbbb7d8f12bb703"
+SRC_URI[sha256sum] = "b31c92f545517dcc452f284bc9c044050862fbe6d93d2b3de4a215a6b384bf0d"
 
 inherit pypi setuptools3
 
-- 
2.25.1

