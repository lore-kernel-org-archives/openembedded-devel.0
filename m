Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.13606.1612652672497113029
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 15:04:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=AG4nXp8/;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.195, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f195.google.com with SMTP id s18so12062489ljg.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 15:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G6WelXyucsOEcyaYUM1qnLIm5okaepqH7jt6KzIcUNU=;
        b=AG4nXp8/T+2qjs9h7HudTEIQKvAhx3rvlJ9JwXMsOlFFpGkz/jlawXy6nyZoy9kp+3
         AL38PvKbCL3ZCCWQeK6BERB3yB5y+NHKWjuqW3dbqw53UlRExWawNOQkH2yCDIs1RDxx
         JYlCO8RTiyxrhoZp3hVte3KCNnJkqzuTd6j4OMNCIQRF1UdAmV8jPBKPf3/ronXztD/8
         fRMBE2LiryJW8FQ/JniD2eIO7nYC2Czt1Vs7OVmuoOvwL4zCOr0DvqT7SCPqVqcMaMVA
         NbzfZhMuNtH8AFj/HHiUB9C+6+PaZGbbv+bGjjbowahrbC7l4rIq+OBz632K6vfozI/A
         uTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G6WelXyucsOEcyaYUM1qnLIm5okaepqH7jt6KzIcUNU=;
        b=NRfEGkM8tifPI9LZc8aYa2HEYgt6qGR8ejrYyrevKhQXI0TJ2bNxnPkdVAvgT2ZN+a
         SlHD6crXgEq1kO9B3LarlZKzc7g8B3grLKTcsMkO9l3tkNJcXqKkSMm4GM/F2qFABtwh
         K8dFZiYes+eHVTUQHq2TXEK/FA44LYjWTDnNHWdjzEUTkPxXKaX+ciGrDMwDGazX6qFw
         UPlAXbPgt/2x9scGWlDdWe7NXQR6c7zNfScpZJorsmGxoL/ymmyCiUP/ppXqJJ7xUZX1
         HsbFDgJfm8YatunUtvBNGeuenGJdQlzPfPVK9iyZa2p/o6ytYbKKG/EIK5bbuOPmuJoC
         vkpQ==
X-Gm-Message-State: AOAM531LPrmX/wuI5m3nfjLJ8kB70y7q8f+LVlxYSKX724u8ztV9RzLQ
	g3jqA2G8R3A1wwni4efRNBl7KrdcXQbnnsRW
X-Google-Smtp-Source: ABdhPJzz5FcT6e1V3dfTHOqUgrnBhdwDILR71uYE0XdMUAShhsALRIhcUI9aLCAqlmFv+HVx8HKkGA==
X-Received: by 2002:a2e:b80b:: with SMTP id u11mr6437023ljo.361.1612652670575;
        Sat, 06 Feb 2021 15:04:30 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id v29sm1499166lfq.230.2021.02.06.15.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 15:04:30 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-flask-socketio: update to 4.3.1
Date: Sun,  7 Feb 2021 00:04:28 +0100
Message-Id: <20210206230428.4106796-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...flask-socketio_4.3.1.bb => python3-flask-socketio_5.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_4.3.1.bb => python3-flask-socketio_5.0.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
index b8631bf50..4c5d0a3fb 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.0.1.bb
@@ -9,8 +9,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[md5sum] = "d7992b0b4aaf473b7eff21fc14e8d1b2"
-SRC_URI[sha256sum] = "36c1d5765010d1f4e4f05b4cc9c20c289d9dc70698c88d1addd0afcfedc5b062"
+SRC_URI[sha256sum] = "5c4319f5214ada20807857dc8fdf3dc7d2afe8d6dd38f5c516c72e2be47d2227"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.25.1

