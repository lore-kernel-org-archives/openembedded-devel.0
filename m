Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.1372.1591987041788629708
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id c14so9902800qka.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=lR88mbUH2WEnPRtCFM5WdOsVt+OlDf33wjFMduswX4k=;
        b=l1EuAyJjuKxWFdqME+DZiuRzXtiwjxqE/h3JsIIBUh0Bvm7wk3NWWM3Vkpj6zx4IxO
         n4sJL2lv+85CbxSPA3OeZYbECRfoipjYtmAfmVBEJ+O9yS9x0wi0nXDCMa56V1vqngGV
         9byudaNeaFJdRTmVPtdAsRyZcqi56g11Deofto60bf7L+/bJZc4Dy0E3DLwcfSE61ALL
         78D+snDaYqeZtE4+/1EETPNkBqGJthY3w4ClWAcrTFSCRjktYXgngnqEvXTFJn9SOe1v
         p4A4d+8nj1B7UjNpC3xeB+8LDNFk0mUIVpbNyUuFC2JKNEvL1JsMq/0N4Tsg3/uvUGkt
         gkNQ==
X-Gm-Message-State: AOAM533KKzn0ufltYF2ECHyT3O5rp0zvzej9LU5OpFgHBWPN9iDmXj7l
	4UiYkXQihNbWteuDxlt3xClxP1M0fto=
X-Google-Smtp-Source: ABdhPJxlczMaQ+xvBtYT+1MpKdE3Rzcu+gs77RgfqGIwNeCdox89h7VJQdDZ0hRrFeYVbb6/Us4SSg==
X-Received: by 2002:a37:9684:: with SMTP id y126mr4462725qkd.348.1591987040659;
        Fri, 12 Jun 2020 11:37:20 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id i71sm5028440qke.75.2020.06.12.11.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:20 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 19/22] python3-pytest: Update 5.3.5 -> 5.4.2
Date: Fri, 12 Jun 2020 15:36:04 -0300
Message-Id: <20200612183607.108989-19-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
(cherry picked from commit 530e54b7bf6eb6002e42144203fc7adf55360cdf)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
2.27.0

