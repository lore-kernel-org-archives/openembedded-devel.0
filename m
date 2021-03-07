Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.23402.1615135188968235064
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 08:39:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=FJSCjl3Q;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.51, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f51.google.com with SMTP id v9so15629037lfa.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 08:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ra+fqvjXWM/5WZo02myQ9Vd8roolJOdaBHB0/dx0UqM=;
        b=FJSCjl3QuJqbEcOGNxjkkPdoevh0yUsHwePMIHc1kme4CSFwSeBkfholD6N4KQQ6f8
         /kIxngfoijuIlW1lYcszU/4sExySuP9l7p1vsI2Mz8urJpVVkigHEJ3jEd2EkaRv/tOY
         hJpZwqiDeP4zS/dJ+FUFf/UNcMEskv0wqx+P44U5i85HuX9b5IINZOwBR+zDl9zJNUvh
         /Zer8BXbkhlGubQgJ+MCjEOltI0yOKElv1uV+KXAE5CKpRVNDdNck3/gSH657PUCSpIH
         H5tyQG3aqa8QxdOdMtB6NmTz+5bh/q+h8LmZz8JVzT+bjBp54mJCN/q+A3M5c//BnOBK
         sIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ra+fqvjXWM/5WZo02myQ9Vd8roolJOdaBHB0/dx0UqM=;
        b=R7T46w7R1X+SkLyPtIlsi7ISZtkNVZQfG8ODH9LSgRI3yWOB4pqNMnK/D+JXBxIwTT
         Rjrq/jZAsOVgXUaiplRHqQU7fxODYKu1hlJ01EpZ2448SDaQidDRxplMH+oA8b+Cagnl
         EkzFoVxUFY9mtXUk+FZ3BYdQdZZEQDlK+VI09LNYVhUeuktApcYkFauFawHo9J+PeyvN
         MJRdxPvSVhgTdT5jq3xm9I5divSkQJg/oo8yqXUPk9ETduMdlSy3zz7oyhXZAAMxiZSi
         XwQIe81g9NiLMxBoPpl3lN6RjiTptW0HOq0AjpYaPej0I2m4UzvsFIHXeobuzznQuHAT
         4aqQ==
X-Gm-Message-State: AOAM530tmCVfdR0nKv1Ru1pMAbbe/gOk6chGqhz0kwgeSOFy46mAir72
	3rXyHs/BRsP4094dOAY9Auy1zgtpH/rYzQk5
X-Google-Smtp-Source: ABdhPJxUGfinRB83LmJ67mvQeUuWfohIPIanCEQdgksjchh2sMjXC+EugmuQvt9Ao9A8S2z+vQSVuQ==
X-Received: by 2002:a19:c14a:: with SMTP id r71mr11779488lff.358.1615135186948;
        Sun, 07 Mar 2021 08:39:46 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b31sm1138610ljf.38.2021.03.07.08.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 08:39:46 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-google-api-python-client: update to 2.0.2
Date: Sun,  7 Mar 2021 17:39:44 +0100
Message-Id: <20210307163944.979682-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...t_1.12.8.bb => python3-google-api-python-client_2.0.2.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.8.bb => python3-google-api-python-client_2.0.2.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
index 1774f962e..38aa349a6 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.0.2.bb
@@ -1,8 +1,9 @@
-SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, Moderator, and many other Google APIs."
+SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, \
+Moderator, and many other Google APIs."
 HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[sha256sum] = "f3b9684442eec2cfe9f9bb48e796ef919456b82142c7528c5fd527e5224f08bb"
+SRC_URI[sha256sum] = "48686cceb0dc8cb8b9ee1920ad7c0d9b499ef4fca0ca51c1c69f1e462a628011"
 
 inherit pypi setuptools3
-- 
2.25.1

