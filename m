Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.37908.1598598665516731750
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 00:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=fy2XoYXV;
 spf=pass (domain: smile.fr, ip: 209.85.221.68, mailfrom: jugurtha.belkalem@smile.fr)
Received: by mail-wr1-f68.google.com with SMTP id o4so293947wrn.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 00:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EFQTZio5blMgcWAfrr2sxzIPjPXdIrQf+pEcZo9pAWM=;
        b=fy2XoYXVOx8oeGVqzMPvwynETxRWAACRzFHMV1aZH4hmMmWYSUl8Azf/+/rWfe3JTX
         KJ6/HEk/lGG3HKDHommyAaR88zzYCNOshmcS1F2QjpcK/iz/9Ky4ArEJ5fc+5HkCbHRY
         O4VzOOIPCAdwsTHke4MI8X/j+CpC88ko/Wrxg4yVa15w8XC2llTzZ1lX2X9gbbcZB3+s
         gmur1zqQ5K/eEG5o++DuHcRzyH8eXMKmvWa3CPsFFqBaPLHm86t0qvFaqmpp9Vrgw+5D
         ZfRPlCS/TDMzXeasXfju0DIHrIE/QZQKx8o8adIHCTOYy0gtW6YhGgkx1MBzJa0Y7KA7
         ljRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EFQTZio5blMgcWAfrr2sxzIPjPXdIrQf+pEcZo9pAWM=;
        b=V8dcLMDJaW0CP7vYHLB8MSQAdwG6UsRqDkrJolZoqa3WCQp7h/IIleR/XNLqy3P5jQ
         5N0ZTcRiP+w/HgNkEkRUgjFNBZ4GfXKaWJeFDYQ+EOvX5hwwWE942ndlJHeZ/k9bd3K8
         mcDAofKVL9h0klzO/SOHdOe/36NGJwIJwBO7T+eeBl+M6IvVQgGOJ4zWeQj92AgBr9q3
         ZbWtRI9Eml74X8Y/YBpQ4qHwJshpsaVOsn422XIiVNSA5d5EtjcuXXnh0gT4BDHUzIcp
         h1ID0Q3YUMkg/qODIE6yIZo1xIw9ZOHYmIJElM6QlGqYvTt4ScgDgTKOpwG4lrKEKqNf
         C0ew==
X-Gm-Message-State: AOAM533G4KDtQfXiibQKAmI3Lc8ygR3GYgFOuT3GUrWiyMT5a2/E4xmV
	VTOUjbZ6IzhxLY7VZB1dDs06rYb5FH/Zgw==
X-Google-Smtp-Source: ABdhPJwn1ro1VOnNvMIBWnYzTc90bjU5PCo9z3DWz0uU3zPqSPYQsGqnFHDNUUybylVK/QzpPb0wWg==
X-Received: by 2002:adf:f106:: with SMTP id r6mr124199wro.106.1598598663655;
        Fri, 28 Aug 2020 00:11:03 -0700 (PDT)
Return-Path: <jugurtha.belkalem@smile.fr>
Received: from P-NAN-SUCRE.numericable.fr (122.57.26.93.rev.sfr.net. [93.26.57.122])
        by smtp.gmail.com with ESMTPSA id s20sm588621wmh.21.2020.08.28.00.11.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Aug 2020 00:11:03 -0700 (PDT)
From: "Jugurtha BELKALEM" <jugurtha.belkalem@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Subject: [meta-networking][PATCH] recipe/ettercap : new ettercap recipe
Date: Fri, 28 Aug 2020 09:11:00 +0200
Message-Id: <20200828071100.7407-2-jugurtha.belkalem@smile.fr>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200828071100.7407-1-jugurtha.belkalem@smile.fr>
References: <20200828071100.7407-1-jugurtha.belkalem@smile.fr>

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 .../recipes-support/ettercap/ettercap_0.8.3.1.bb   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb

diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
new file mode 100644
index 000000000..c641c265e
--- /dev/null
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -0,0 +1,42 @@
+SUMMARY = "A suite for man in the middle attacks"
+HOMEPAGE = "https://github.com/Ettercap/ettercap"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit cmake
+
+DEPENDS += "ethtool \
+            geoip \
+            librepo \
+            libnet \
+            libpcap \
+            ncurses \
+            openssl \
+            zlib \
+            bison-native \
+            flex-native \
+            "
+
+RDEPENDS_${PN} += "bash ethtool libgcc"
+
+SRC_URI = "gitsm://github.com/Ettercap/ettercap"
+
+SRCREV = "7281fbddb7da7478beb1d21e3cb105fff3778b31"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_SKIP_RPATH=TRUE \
+    -DBUNDLED_LIBS=ON \
+    -DENABLE_IPV6=ON \
+    -DENABLE_GTK=OFF \
+"
+
+# Replaces default encoding set (ISO-8859-1) with UTF-8 in ettercap
+# configuration file installed by the package.
+# It ensures that all characters are properly decoded and avoids
+# any fatal errors while running in text mode (-T).
+do_install_append() {
+        sed -i 's@utf8_encoding.*@utf8_encoding = "UTF-8"@g' \
+		${D}/etc/ettercap/etter.conf
+}
-- 
2.11.0

