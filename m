Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 722E1C4332F
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 20:36:32 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.11207.1635021390903231774
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=wJiQNqrL;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.41, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f41.google.com with SMTP id x192so1368520lff.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZGtvuYf9Tk3pIYeRkpnLdTFfEodhXDWCd5u6a+C5vM8=;
        b=wJiQNqrL2fTM8+H1C4si8F6cUyCd4dCtQGXZBXtp/j4sPxpJgmNN9I5Kha/mO4hdCk
         v5zSnC6Gs79tFZBgD1m/iVOVIFLlPqJQZlvpM5nZcFgJpWWFaLZ66K1N/rfeBakgdoSD
         tN9zDiOMSndicM1Gfouv4rcbfXEo44vDjFET0gxZFN+VrRrPw7NEZAADTXTEeEZ6kzY0
         1U6t1jPYly+nOOgLbGHwBSzF+oEwL4HetsfmsbnNWu9MZVGbKD5FhKk3WrC5IZDhwlhg
         mldyWwkUGUgC8rfdZyjzCBLMJksTeAa9HP+HkOkZCWZ0u9yxBshVTgUDFZBq/ezQWvI0
         scMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZGtvuYf9Tk3pIYeRkpnLdTFfEodhXDWCd5u6a+C5vM8=;
        b=te8HwurbBnPrItWoHHO1nVsnW4mt9yJe/BWt46/NF7ym3af2+2etRPoEYPgZFlteim
         RrJV257/3mnveMjo1+1fvB96UXM/ZXcDAAREYi+OWaCw1BoOEJwpM8uW2b+m7dExogSw
         S9Vwzx2izUgZ5+AxuKXr0HExlUtc9zQlVKLFIAz6ZKwYLs/y+9wWJSzPCWHfFPTctCaA
         8ZNxhcVj/yQOVuC9jj7n6hgN0EO9FKjXuwMOvdmlIK7XkkR7gPuco0YvY7GQ+tyEmD6X
         BznxUmeGSertIx30MH1h90vvmjp+EcH7E9JuRGYUv61h/ipf+Zkhahu+xbqHchbMUuOl
         lpmw==
X-Gm-Message-State: AOAM53399+xDkEWZSjbk1KhhBIYPSa7io18YUUCt4hFaZT0d1yYZhoEw
	HGF3MTfdyhEIcM76o9GfhJvZWwr4KydUr3cC
X-Google-Smtp-Source: 
 ABdhPJzAcj/QB1hOMwweMV+CntjlWkjWUBzqskHil/K31tAyREMYtjmx/D2jatusLjhx9tZwJxfZOg==
X-Received: by 2002:a05:6512:694:: with SMTP id
 t20mr7729462lfe.168.1635021388869;
        Sat, 23 Oct 2021 13:36:28 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id u1sm549958lfs.21.2021.10.23.13.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:36:28 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-python] python3-pybind11-json: update to 0.2.11
Date: Sat, 23 Oct 2021 22:36:26 +0200
Message-Id: <20211023203626.1657023-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Oct 2021 20:36:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93550

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...3-pybind11-json_0.2.6.bb => python3-pybind11-json_0.2.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pybind11-json_0.2.6.bb => python3-pybind11-json_0.2.11.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.11.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
rename to meta-python/recipes-devtools/python/python3-pybind11-json_0.2.11.bb
index c56c70ad3..838447120 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11-json_0.2.11.bb
@@ -2,7 +2,7 @@ SUMMARY = "Using nlohmann::json with pybind11"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e25ff0ec476d06d366439e1120cce98"
 
-SRCREV = "d1d00888bc0eb7c50dde6cff1a5eb4586e620b65"
+SRCREV = "0fbbe3bbb27bd07a5ec7d71cbb1f17eaf4d37702"
 SRC_URI = "git://github.com/pybind/pybind11_json"
 
 DEPENDS += "nlohmann-json python3-pybind11"
-- 
2.25.1


