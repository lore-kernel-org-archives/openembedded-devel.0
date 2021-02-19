Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web08.358.1613771660348929716
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Feb 2021 13:54:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=PKPrP8IP;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id c8so29110644ljd.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Feb 2021 13:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iudttTjPWeLy4bIGgXHO4vFvx1+ISpBZOeou61uuek8=;
        b=PKPrP8IP9SxKTycg1Gk0TUzEYEtx8wGQwo4iiYBMMk2wfTybfg7eC1ShqZZXt1PbUl
         ND13B28e76DCWXoJJVoiN+ehEDlXUfCd1p2bpSG6lhWfBumQwMTjmJj+g/dwrehleVYj
         1aabuu+Si8Mcy3SsCsWqhsuw+JlC/wa0beSTCJKIqLvxkTUOa15s8oDqHRRPdr3Wex/M
         9S/bdY9MCOSYBymkveBSFWjmw9PMZwarEb+vjSTBoEGYz1VjUWIzmCF5c4jvhepY8BN8
         hbofs1PAKsC8Vb2v32I9rmlIXRKX+l42ubsFofN6lfzVi1pDRXzFDapKK0/TnooLvgEr
         ojgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iudttTjPWeLy4bIGgXHO4vFvx1+ISpBZOeou61uuek8=;
        b=RMvhhlE8X+JKnyFIG/dNfzrMxGbz0jrIam9AtPtPvLxVKiMEzQtCKVrBCSyJLk4Pdw
         aZIuAGs6jog8iBJ38tPZBa9NKq5lZL9mq0ldMN2KQ5721bHfbuFc9/7tExHOvojS0y3D
         qbCWllMEiJDB8Y4xvdvpgw4t/6+NON2XlbcrWJLD2bKK+YkaPQ/bLP7jwe88To9O9Oos
         3XI9HcycJMiFHJrCitP3msBMQfgmmmLFUDpZgg29Mczg/46Ip8lgs6wYs7WHzc0tCvIN
         2fe0W5XbKh6JSGdt69pjCgZLrdsMMgpnQY3BNzKC6UVY1hl3mhHI+rYlyF9wIbjA7MSO
         JwSw==
X-Gm-Message-State: AOAM530wXoaROgQ3kCTkAnnbt3qCFCblo9dAA7NprSeV73LhxZV5kMAs
	jEIksb0g/2+CUh5BTSS6/vsrfRzTYNMEnXfj
X-Google-Smtp-Source: ABdhPJz+cW4T3lYv+uSekzZwvR307N7dns2diy3Z1onIAC3mUoJPPxtrd4co3njUDe0do3Wak3Zefw==
X-Received: by 2002:ac2:420b:: with SMTP id y11mr6480928lfh.215.1613771658253;
        Fri, 19 Feb 2021 13:54:18 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id c18sm1035326lft.258.2021.02.19.13.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 13:54:15 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-tqdm: update 4.57.0
Date: Fri, 19 Feb 2021 22:54:12 +0100
Message-Id: <20210219215412.2367782-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-tqdm_4.56.0.bb => python3-tqdm_4.57.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.56.0.bb => python3-tqdm_4.57.0.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
index d4baf6f22..50133bdad 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://tqdm.github.io/"
 SECTION = "devel/python"
 
 LICENSE = "MIT & MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "fe3d08dd00a526850568d542ff9de9bbc2a09a791da3c334f3213d8d0bbbca65"
+SRC_URI[sha256sum] = "65185676e9fdf20d154cffd1c5de8e39ef9696ff7e59fe0156b1b08e468736af"
 
 inherit pypi setuptools3
 
-- 
2.25.1

