Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.1269.1591987022516307422
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 11:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id u17so7917884qtq.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 11:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=jfV7FJcn6Or6ZK5Q45UxyuirL2q8b2kPOevb9fRh0BY=;
        b=hF8EQRc9nLsfX35yR6qoWkhMeUt8zYiEMDFNfqP4VEnZcFK3MbGdSCy/ILt5qmf7YW
         YrsxJQVRaDYRdD+hlRi8ZJ+j+6tVsmLqAAdN8kQW4eHkGyazOxHqAcPorXLPGyrkHOYy
         Ps2DSudWZsUiAokAkf/rwNFOOl0tP5GAWHX8djIv+TC+MIFSUs1aBUB8MF9XT4oBL4Cd
         eximpJMx6jOFpAUj0Wc0nb1scfskTiprKW1c18nvs0r9Lm5qjK7JQ14wAKxzMlXGcw07
         +b23CUXxTBtoI+gT2U4RSBWiduM5EH0KCDDjACS6JGuDSOtZgSv5bVMeX+HTf0yTSuBP
         U/bQ==
X-Gm-Message-State: AOAM532luqwSgeswP/uJUTZ/UtaS9hQJ1tdceQK83H4kVNWKAIkMpw21
	xMUWMsdJXrznr8bgYsqzdCowwDPUaaU=
X-Google-Smtp-Source: ABdhPJx4gzjAAubsasm2mNLTdg7720cuwdw/+uxIBCFj4nYV2KtXpipJrnRdNu57wmpFO08MRR6Zig==
X-Received: by 2002:ac8:538b:: with SMTP id x11mr4341823qtp.84.1591987021467;
        Fri, 12 Jun 2020 11:37:01 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id x43sm5434241qtk.70.2020.06.12.11.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 11:37:00 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>
Cc: Domarys Correa <domarys.correa@ossystems.com.br>,
	Khem Raj <raj.khem@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport meta-python PATCH 13/22] python3-snappy: Add recipe version 0.5.4
Date: Fri, 12 Jun 2020 15:35:58 -0300
Message-Id: <20200612183607.108989-13-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612183607.108989-1-otavio@ossystems.com.br>
References: <20200612183607.108989-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Domarys Correa <domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a6fa788675ac7f5921b8fdf1ddf29dc7a3f78c93)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../python/python3-snappy_0.5.4.bb                | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb b/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
new file mode 100644
index 000000000..1836473b8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-snappy_0.5.4.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Python library for the snappy compression library from Google"
+DEPENDS += "snappy"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b3090152f53ee19f6a7b64b1a36384fb"
+
+SRC_URI[sha256sum] = "d9c26532cfa510f45e8d135cde140e8a5603d3fb254cfec273ebc0ecf9f668e2"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "python-snappy"
+
+RDEPENDS_${PN} += "snappy"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

