Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.37971.1598598663803312626
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 00:11:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20150623.gappssmtp.com header.s=20150623 header.b=ahJLFjz7;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: jugurtha.belkalem@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id t2so265564wma.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2020 00:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=8z63JV4n/23P1zOyRMkCe+lNvj9258q1vA8+YomU36k=;
        b=ahJLFjz7Ooeo1KNZydV6uPHOpBkUfJ9a4wST1Cy81edmqgRkpB7daQZbzItgpUMCr8
         U0Dl9Uvpt7Vfe1sUIh9EooctosAJINSoY3lmt1lE8BDzSP4b3yeBQFdHj4egZ6csg6JD
         IxgqeBsP2sulEC4Ga0QdabuZtsoq4NJpMYeuqG1YzjoA1hwm5KN6fZgJiOYzRqJUbj9i
         zyYGXjPXUTJEAFTo18SbYfnJ1Nd/97g8OQFPpyfszGUGy9CksfcCEOpTkV9jsah8PMAt
         nRzyjWSiH/l1iYVHZL0Sg16xTS9DmiUraMgjGRAZMoZptyEobvkBfmu5JlEWE2czJU6g
         AIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8z63JV4n/23P1zOyRMkCe+lNvj9258q1vA8+YomU36k=;
        b=Y+0OV8mhpKFffJkU9+SZayv3O4rS2Z7Cc2VxWnmcwhTHiJQj+85FkGyx01g0SLRHcB
         fbIDb3fzxUKKCANKxDyb+eWtyvweVraGK05dXB0LR1UlfEnRyIAXat3gUtEeu/WzJmKD
         QG9tzMlf0dRv4zJuBJJzlLH4uVb9mwQFhORTOSQXk6XXD2YZDM3RFxJCxPbBXkQ7ameL
         0vC1F8MeHT/rCw3aYyxac2pePnEukjDkKnI/QGyF8KHvpPoaF9G9e2N99oAnv4FzDERI
         cDLZFM73rfcEDpQs5sz30bcwBsScC0KbZ+w08Do/3CksjYgI7MqIaIOypXEXne3OL7P/
         0g4w==
X-Gm-Message-State: AOAM532sT/b23kdnYlS5GcQyAdQFr7+JNYhK3NvOQSTFrQcZqgizUysi
	I+fCeGzvtveu3SinLVW2UNHWhl0GKwGo+g==
X-Google-Smtp-Source: ABdhPJwta8hbBw/fUGvcBvEmPbMkFtGqBb6CTqYJ9DmQDQ4rcRUxTLiIFh5Sh5ZEA8nFJkCuD7DSrA==
X-Received: by 2002:a1c:2543:: with SMTP id l64mr190743wml.96.1598598662104;
        Fri, 28 Aug 2020 00:11:02 -0700 (PDT)
Return-Path: <jugurtha.belkalem@smile.fr>
Received: from P-NAN-SUCRE.numericable.fr (122.57.26.93.rev.sfr.net. [93.26.57.122])
        by smtp.gmail.com with ESMTPSA id s20sm588621wmh.21.2020.08.28.00.11.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Aug 2020 00:11:01 -0700 (PDT)
From: "Jugurtha BELKALEM" <jugurtha.belkalem@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Subject: [PATCH 1/1] recipe/ettercap : new ettercap recipe
Date: Fri, 28 Aug 2020 09:10:59 +0200
Message-Id: <20200828071100.7407-1-jugurtha.belkalem@smile.fr>
X-Mailer: git-send-email 2.11.0

Ettercap is a comprehensive suite for man in the
middle attacks. It features sniffing of live
connections, content filtering on the fly and
many other interesting tricks. It supports active
and passive dissection of many protocols and includes
many features for network and host analysis.

To test ettercap :
$ ettercap -T -i eth0 # Text mode
or
$ ettercap -C -i eth0 # console based mode

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

