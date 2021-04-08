Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.7551.1617887029644234150
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 06:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dM98yIIr;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: voa.aquino@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id f12so1297260qtf.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOOVkyInpkzNKwEaeAlVT0rTK7H8FyeN+w17Fz0/d60=;
        b=dM98yIIrm9IrJeXV6L6u9+eNf+KEoqlX7q6Tk+TAVz/2Yk7AO7JkEMqsWRUA5MWuBK
         vsv9206J4bWJXOouh0D7jvc9ZhXdZroDIN4ELSVxCdx9K1ZCCZ8Z8jtEsWDVzm8D+T01
         JYLRXef7Z7KzPllKCSVMxmjEBwK9Riu1es+QIbAna7Y5g7Dn96Pzlr2Uer2dHRi54PNv
         CYLCC+1kLiHP01SMNvl0pgjcO7taa1OKHdu4u6ZzzZaRmJsSrN1PsbVSTDGTvuUHCERc
         lS70zGnuCeZy2YlRrTFCE5chcbVjOKCdJ6KQIBWri4723Ye8dCvVTlCyByl1Km1XqIRW
         4zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mOOVkyInpkzNKwEaeAlVT0rTK7H8FyeN+w17Fz0/d60=;
        b=Snungm8/0qsfzMqA7qTJ8HLMczMtJOEvd8FJsw0ZXypqEhOTOlQhDgG5/aDFDtih6C
         egttBUOWrdMHovAmuIDjR6Rf8V7bCgOIM6sV9Y7y36Ol/AgCsm0veTTxUZRhmLfHNZb+
         /Qhj3Cz3DCx7o9zwrzg3wcztRWI8RFBgRuwB8D+b+Fgu9EU5dQ6zdotinR7sE1aqQXTM
         U3PXExgduca2S2+KA0Lz/zaGypU2VVaUkxtau6jiBn6qyWoLm8M6qCjDyOXQj6YGUgV5
         LXoy7RkblA/xJyakUdc9XOAQEwjc7eMTsZ+6QYAUMn27XigjOa/cpCpDHkaRqkNDAUGt
         SW6w==
X-Gm-Message-State: AOAM531RGPeCvZ9QTkzJLL0sQojPMVE7/cRcyHOCrt0oaaMWeu/jzN8n
	t70+6XRmqGUBmKZKUasoEClZeq9xGDbNGw==
X-Google-Smtp-Source: ABdhPJwJm9h9bcMzev0GUhv8cdsABqUauVtxkyM50YDMy4wnThxxqCWS79o5WKQWh7n4+dFNMXqn2g==
X-Received: by 2002:ac8:777a:: with SMTP id h26mr7242056qtu.318.1617887028363;
        Thu, 08 Apr 2021 06:03:48 -0700 (PDT)
Return-Path: <voa.aquino@gmail.com>
Received: from monster.lab.ossystems (200-180-244-11.user3p.brasiltelecom.net.br. [200.180.244.11])
        by smtp.gmail.com with ESMTPSA id r63sm284407qkf.23.2021.04.08.06.03.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:03:47 -0700 (PDT)
From: =?UTF-8?B?Vmluw61jaXVzIE9zc2FuZXMgQXF1aW5v?= <voa.aquino@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] modemmanager: upgrade 1.14.10 -> 1.16.2
Date: Thu,  8 Apr 2021 10:03:24 -0300
Message-Id: <20210408130325.3753732-1-voa.aquino@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{modemmanager_1.14.10.bb => modemmanager_1.16.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.14.10.bb => modemmanager_1.16.2.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.10.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.2.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.10.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.2.bb
index 2045e2a86..d1ba8e43e 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.14.10.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.2.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4ea60b375a761e17e7bb095bca894579ed0e8e33b273dc698b5cbe03947f357f"
+SRC_URI[sha256sum] = "efa9a963499e0885f3f163096d433334143c4937545134ecd682e0157fa591e3"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.20.1

