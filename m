Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.23222.1615134963577076897
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 08:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=Cw1ulKzT;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id f1so15577204lfu.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 08:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+sqPpen3ENd2xQNHWkTuiAtT1YnDsE7CV1BY2fFKwnQ=;
        b=Cw1ulKzTU5uS56sCrOTnNYbj40peUVBkM5QEioXDZoZmEcNV/KSjFP2iylXkJ5tq4W
         6bGk6rQwXBxvYhSx+1X1rAG0d1rlm7tbyk5uSx8dGG9laSN3Z/gJ6tAThglAI6SFchdL
         EAi3UZmkf5JT8pu29PeiSWZH/Ja9hu1QF/0j/lk+O463sHs8ozXbkDpWRt10h5etZuFK
         2UNgxkYPWtwnPojS+C4SE9buHnezxtMpQ6SbnMKv8wVEmYMpIqc3tFVDmc2yxl8lRlpB
         NgloHDzQVxpIZwv/7Ong27GD2CWvbSGivR2CdKhVBusLLwDyy/17ASYNYVM/1wQBLD3p
         6GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+sqPpen3ENd2xQNHWkTuiAtT1YnDsE7CV1BY2fFKwnQ=;
        b=J9uQTfFzS1v4sSTQJ/K+FCfxBYrTkTqamC1kg/I6a06EeSSDJKD0aURDlaXPI85SJ4
         /fjI+wNjhFuN90u2Jy7JxBkF/cu5lu2qLyGJnAz84uNXlEQ2Pm6sGW9Kduh8nFyqfUz8
         T6UX6pCyH8A1Tg9iNN8SJ4u1wFkhgF0gFgSATmAZYwpcgkiR7tVB/VGzKgiadSEvo1AJ
         wLkzk6WfpJO8y4JBh1eavoWOncG3Y48fPW2poPtqGjZPNsie0QoFBxGi9inWhqi6ixHx
         eCKkqIGGqmLW536EJrBMTDX4j16Clm68Oy9mN9QBfFWbWOb1VuGzOyIViE7YvnreXrhJ
         8wGA==
X-Gm-Message-State: AOAM531+NZePeiAp4kYMr92XADHrYh4X/FXdFZD1Uy//+0f0gFqHYqyr
	ghYPlwNnhM8+2QthGYHYt6J8SGgihaZ90A2j
X-Google-Smtp-Source: ABdhPJxkFfnmKWjDpeq/cA8bDp6+MGhLu9UuMqhxmughCkiPwSzZadGChReCwOe1YkkbtSUXNIZVFg==
X-Received: by 2002:a05:6512:10cb:: with SMTP id k11mr11932184lfg.572.1615134961147;
        Sun, 07 Mar 2021 08:36:01 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id h27sm1082619lfp.120.2021.03.07.08.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 08:36:00 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-websocket-client: update to 0.58.0
Date: Sun,  7 Mar 2021 17:35:59 +0100
Message-Id: <20210307163559.978268-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...lient_0.57.0.bb => python3-websocket-client_0.58.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_0.57.0.bb => python3-websocket-client_0.58.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb b/meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
index aaa92f3cc..a5d7d901b 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_0.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_0.58.0.bb
@@ -4,13 +4,13 @@ websocket-client module is WebSocket client for python. \
 This provide the low level APIs for WebSocket. All APIs \
 are the synchronous functions."
 HOMEPAGE = "https://github.com/websocket-client/websocket-client"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c4c4a98fbc4836b81c8c64d6ecb01fc1"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c96ca6c1de8adc025adfada81d06fba5"
 
-SRC_URI[md5sum] = "8061820da5e1de26a6a1a6996d4eebd5"
-SRC_URI[sha256sum] = "d735b91d6d1692a6a181f2a8c9e0238e5f6373356f561bb9dc4c7af36f452010"
+SRC_URI[sha256sum] = "63509b41d158ae5b7f67eb4ad20fecbb4eee99434e73e140354dc3ff8e09716f"
 
 PYPI_PACKAGE = "websocket_client"
+
 inherit pypi setuptools3
 
 RDEPENDS_${PN} = "\
-- 
2.25.1

