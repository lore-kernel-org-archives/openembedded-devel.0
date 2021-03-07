Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.23357.1615134443396717714
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 08:27:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=u5SkMb+B;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id n16so15567205lfb.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 08:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZTHd2nP9zLZYFuQht5MlV3zqL55hrzpAgkniXj7I0I=;
        b=u5SkMb+BRIGHS1ahq1JTiIqEpuBy6AdK8j3VlmR/B8rbzok7TSehDd3GmlHwe+JwSD
         yJemVTM4+xdoYabXid9SO8mEFcSSLYBmMi1RJIuE0HBkR5Do1IxDANzVsrTC7ygT8N04
         orkhsBkOC86XV4H4mp7OZVmqiSg0Zv0AKJp4DUHt8jm2Qr1tPw+mnn8ZadhOKSz3/Pr2
         JZgbxToTPMOXxHPG9P8a6cfuj43Q6z9zlZJmht8wX7YCJBqKUrJifyrqC/jOqeXXV7xr
         u5x8I+7dY9+2zaaLOVwgl9/UPkg5zHqP5hPgUp6lsoukfXygONCdB6LeY2jjvzhVpG/O
         PSkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CZTHd2nP9zLZYFuQht5MlV3zqL55hrzpAgkniXj7I0I=;
        b=p7OOQ7PDvxy6sehi263JFzMW4NTGQOGfO9CuiZaGRJTj4ns5jXmYZ4hMddA5P+/iRs
         ZyBpEJ9o1w4wfpMlwJlNpDUiZEvQXSLMBBsVpVLUX2yt3Vw0d5Ee2bmkKTzy1cI27Q3w
         rZQx6ZQRBD8yU2KIVzgpKNxmmLXbltyOmOPxVYNjFeFhqYFkMPzpd2OMoAR2Dnq9Jn4E
         FgzcGvx311Ri0ooPD3R3HRn2nDpwDEjX8+DqZcMbdayZ2+zyyKnhQT/0n4O2fr1Z00qh
         v0oNVqcCYRTBodwhee56REr8+I8bguYbTFFYVqsRGdXtyr4Uq3z15Joow/qnQtiuuHey
         T4rQ==
X-Gm-Message-State: AOAM533g0kgfCCE4LmRz40zfhXyNIyOmL10xdXwqaLD82VmwGq7aJkr0
	oX5XnZL6AXw1qsg3PFKoaAFRCCHZLqytdeVm
X-Google-Smtp-Source: ABdhPJwxZrOiLDmShc8mwb8asqWBJ33iyNyq5eTH6pQMB4NynBxLk3c8TbD2aFAk4ivOA15pXDRUsA==
X-Received: by 2002:ac2:4151:: with SMTP id c17mr11293990lfi.416.1615134441225;
        Sun, 07 Mar 2021 08:27:21 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id d7sm1045501lfg.303.2021.03.07.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 08:27:20 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-bitarray: update to 1.7.0
Date: Sun,  7 Mar 2021 17:27:19 +0100
Message-Id: <20210307162719.975146-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-bitarray_1.6.3.bb => python3-bitarray_1.7.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.6.3.bb => python3-bitarray_1.7.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
index 16beab551..c91b7443e 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "ae27ce4bef4f35b4cc2c0b0d9cf02ed49eee567c23d70cb5066ad215f9b62b3c"
+SRC_URI[sha256sum] = "e31b472ac92e04ea943723cf781ec168e15049d91a3052203defb81652d2b086"
 
 inherit setuptools3 pypi
 
-- 
2.25.1

