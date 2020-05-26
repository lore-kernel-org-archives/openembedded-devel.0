Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.2641.1590520821034621183
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 12:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=m020sPCA;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.194, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f194.google.com with SMTP id w3so16338739qkb.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 12:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=VPoCe97AjEMEu75eLko0oA2QmNMfY9WF1yT9iF9Flz8=;
        b=m020sPCAG8HX6i10DjyD+vwwo61xYvdLxAa3+ocvQ96UXo1xlHlhh5ylLf7XSxulRB
         1x0NOlxsMJ8idhhKkKi6TgcInnSNQzdiFAfibnj9hPWuCieKBgRSi4ObP1e7O7opzlPn
         GfxttN1IRNPhdBTAdC7GckGrG9gCckNioxu2lIP06IGaYqjeDhpN/opqaTKgwcA5HPZC
         p17QLSLuwmECaztm8UEFuDgGdmdF8B6JkzbMfCefdKXGnL/dvup7Sad9NlKaw/iSFh1w
         db5NVXa1fec7dcBl31x6TRU0UaqnUBuhAeDUZgXtD6NoxneWXne7Qn6idEN5A/y+E6vJ
         9s8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VPoCe97AjEMEu75eLko0oA2QmNMfY9WF1yT9iF9Flz8=;
        b=B4+UpsZiqeSNUBML8kcnKp9dATq4vKjIoblaEHXQspemf+QlKc2jLsS5FGIklldDCd
         eJ8xgwH0RqtPzFqSMhC8ThPPeOYQ7gsCvQGhchF4YZc0H0XlfCBDkWzcO++UM9K8jfl2
         9dZ8aLuoU9ujUt5aAWOuLIQHM3qGc4Pg+spvyPV8sAjCbunD8KdYfX24R800sTtnNQgh
         gFFptxECt+oHqFo6Qs/irhvQzTX38hescbC1b/07x+x/D1DFcc9amwiw/VvcpAkqryHb
         P9y5VC7sInC/Fl4DE3s60YL9f5xRxgxQndVgemSppeH4ps9RfTInVOH6oicM95SIlGrQ
         AECA==
X-Gm-Message-State: AOAM532HRJfTkQ4IM+CUucmvPhwuN1yinWkhg2F/05Gvyfeewqv6Pd6h
	q1SWepU0AKF7TOi88QvQnZ5J/exvBVY=
X-Google-Smtp-Source: ABdhPJwo+2c9MTn3GejKYVrdOo/a2m9ZcuogmMN/1fzlPOuKv+SgyYDZMDlX1I6jJqmT8EmCBNtT7A==
X-Received: by 2002:a05:620a:2284:: with SMTP id o4mr393378qkh.24.1590520819980;
        Tue, 26 May 2020 12:20:19 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:d122:133e:cc4c:c1a0])
        by smtp.gmail.com with ESMTPSA id c197sm434453qkg.133.2020.05.26.12.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 12:20:19 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-oe][PATCH 1/4] python3-pytest: Update 5.3.5 -> 5.4.2
Date: Tue, 26 May 2020 16:20:08 -0300
Message-Id: <20200526192011.17024-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../{python3-pytest_5.3.5.bb => python3-pytest_5.4.2.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_5.3.5.bb => python3-pytest_5.4.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb b/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
rename to meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
index 8dad13a9e..9258c21ca 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_5.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest_5.4.2.bb
@@ -1,10 +1,9 @@
 SUMMARY = "Simple powerful testing with python"
-HOMEPAGE = "http://pytest.org"
+
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
-SRC_URI[md5sum] = "d5ef453f723be46d93e0795f3be86c88"
-SRC_URI[sha256sum] = "0d5fe9189a148acc3c3eb2ac8e1ac0742cb7618c084f3d228baaec0c254b318d"
+SRC_URI[sha256sum] = "eb2b5e935f6a019317e455b6da83dd8650ac9ffd2ee73a7b657a30873d67a698"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
-- 
2.17.1

