Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.1964.1586021372471460483
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id l22so9167006oii.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8mNAelFbEDYr0YAPxUL3G2l5jY3MXLHl/mdw1F0QP2Y=;
        b=sSHvTkJxiW1zmTobEHRpsYNgMHRGzwlJ5AIxGwvN2sYmfQwGJ1jVeRpp+yzpU3rw7i
         RY+6xFT/B+vnrX2/Q0tgKlfYvnd14GaJyqIS8zQUpqTotRhLYECdKRtwvHG0A6daJNLg
         F3y82H6hkelMXRceKi5zP9Wa/IXHCKgTuFb4cS2DnzAcb8wplLw+sTiY7LXlwuX1iSuj
         dQopUkm1X1zWPITGnxB4hVzHl2eC8jqZisLKP6KhlK0QtDl6rtYtPYXitLU+aC0gjiK5
         ECab8QlKEcO3DdN16coXQEgHGcL8c1W9UC/HKl/7L7bopgo0uiF37gtlKFRwJ0PrssHO
         o/IA==
X-Gm-Message-State: AGi0PuZ3vpfNMQCERL5tRPIo5tZ2fqgVnaBMxxID52LnUs3QVWt8KUKS
	qpX5+uQYL3cA3HaddsDQUfCoPAkCYgA=
X-Google-Smtp-Source: APiQypL8rQ147FM+lxL9kD68UYaYALc0gkpYLcOfeoG1wO5VOFDVSSx2kp61HHUCYL+aEaVRJulJbw==
X-Received: by 2002:aca:5b09:: with SMTP id p9mr7476445oib.57.1586021371465;
        Sat, 04 Apr 2020 10:29:31 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id e22sm3068964ote.32.2020.04.04.10.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:29:30 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 3/7] python-rfc3987: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:29:07 -0400
Message-Id: <20200404172911.26978-3-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404172911.26978-1-derek@asterius.io>
References: <20200404172911.26978-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-rfc3987.inc |  8 --------
 .../recipes-devtools/python/python3-rfc3987_1.3.8.bb   | 10 +++++++++-
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-rfc3987.inc

diff --git a/meta-python/recipes-devtools/python/python-rfc3987.inc b/meta-python/recipes-devtools/python/python-rfc3987.inc
deleted file mode 100644
index 9cfa07da55..0000000000
--- a/meta-python/recipes-devtools/python/python-rfc3987.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
-
-SRC_URI[md5sum] = "b6c4028acdc788a9ba697e1c1d6b896c"
-SRC_URI[sha256sum] = "d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92b39c7a253d5ca733"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb b/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
index cd1536b36f..80e2aa5bc2 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3987_1.3.8.bb
@@ -1,2 +1,10 @@
+SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
+
+SRC_URI[md5sum] = "b6c4028acdc788a9ba697e1c1d6b896c"
+SRC_URI[sha256sum] = "d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92b39c7a253d5ca733"
+
 inherit pypi setuptools3
-require python-rfc3987.inc
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

