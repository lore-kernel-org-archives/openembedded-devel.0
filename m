Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.6899.1588079381612878299
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Apr 2020 06:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=MfaIxpxN;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.195, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f195.google.com with SMTP id c63so21666366qke.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Apr 2020 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=14vNG2epo6Ztv/IW5d7VpfbDe9ZJqPLC1YwIrHa/MmI=;
        b=MfaIxpxNcClLgt6DYcPgyxkYfu/mtuxPVGKMnjTl2V/xBBg56y3UYeQq9Kd13VDpMW
         wMGRA5Z7rBu4htE8KsLG7uQZBR1lgLWOZ1nrKBUoAjHvNy/FQO+SZ7FV8lAXPI+auv5P
         j04THzsJoWVGdixhhoFYWb1FBTH0IUZ3Nx+ayS6tHeQ+XynTHId8P2p9S5QJhekJkvWw
         GaOhxW2ouUzq8eo+f+YRpqj9rTEuI2XNfsS+t41lUOU+euj/nUv5v/RBkSmCgZUsqPLa
         H/9FgfONKuoMqOBK5MfpSG/m/UtBjXzevXwfbkuIvJ9XnZ8T9efR5p9dkku7vF5xvNRj
         9Tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=14vNG2epo6Ztv/IW5d7VpfbDe9ZJqPLC1YwIrHa/MmI=;
        b=Qk+WLzGZV2Q1NdNc9Fmzqk7a6jks+MDo7ReON4QHnzkukpn9B5vwVED3YLVUhMNocH
         i/7Q6RBkYqAoWEGYLwuF0ZbRJ/JxDed3qBsvKozCUnKSwOiIo5lyt/ODLgxRG9cDVef+
         YzKjsLvFEKJJM2tFWPNAVATpTwI0LPt0BlTxhy80JvSuBXJxUKw9oOvBISAvlFFDrpXQ
         ZvnvMl6KxH3dwHXFqR6N4tztTJUuO1/tByoG47Bg5XmUaloXs0ir4vWKHPAF8qq5NXe8
         s+oJayRTfBOsQ9birqX7KJ/2envIMDAe5Su0Th0EiOp9BCHv/urE2gt+CR83LpR9iUWk
         ZnZg==
X-Gm-Message-State: AGi0PuYTZM47pjpyi52jFJJh8qdGyvK4inrLVQ241wKs93JyGUohwr7a
	/pkJ9GlhzLp9DKObQfAWHCzyDH7TBao=
X-Google-Smtp-Source: APiQypJNcJNyu+ok2t2Z5avMHtW1dyjbIChvJZg43cGji1KejpDnOPlxRQHCBpd64Qg6R70eT1mK1g==
X-Received: by 2002:a05:620a:22ab:: with SMTP id p11mr28590724qkh.373.1588079380600;
        Tue, 28 Apr 2020 06:09:40 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from localhost.localdomain ([2804:7f4:c193:1cf5:44ed:61e4:a25c:b4f0])
        by smtp.gmail.com with ESMTPSA id a13sm13203103qkg.129.2020.04.28.06.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 06:09:40 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [meta-python][PATCH 8/8] python3-nmap: Add recipe version 1.4.1
Date: Tue, 28 Apr 2020 10:09:14 -0300
Message-Id: <20200428130914.17398-8-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200428130914.17398-1-domarys.correa@ossystems.com.br>
References: <20200428130914.17398-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-nmap_1.4.1.bb                 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb b/meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb
new file mode 100644
index 000000000..80384845d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nmap_1.4.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "python-nmap is a python library which helps in using nmap port scanner"
+HOMEPAGE = "https://www.nmmapper.com/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+DEPENDS += "${PYTHON_PN}-wheel-native"
+
+PYPI_PACKAGE = "python3-nmap"
+
+SRC_URI[md5sum] = "64a382c870e14b53f2f52b7455996321"
+SRC_URI[sha256sum] = "9b64c5956789f4cac9e8ea2e0de6763dea1cecde1a20ae50a4b4dc5ab0ab6e42"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "nmap ${PYTHON_PN}-requests"
-- 
2.17.1

