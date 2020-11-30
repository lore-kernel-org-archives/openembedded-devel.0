Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.2239.1606765217789412760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Nov 2020 11:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ie63kwBx;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id m9so10715544pgb.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Nov 2020 11:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IfUqXUqDWwZTzh/kmjIiMlxGsB81esSX3E+Ol/cMlLs=;
        b=ie63kwBxM6CJoUsqj65Cl8mMPAygFyEs09m+eBDNZ9FU/n2LpnLI9RVxBiXyA2meLU
         2ezCG6Co/vofJVww3pF7sgCeKqFgyDflpvAUkblqzA008Ko1c1av47I9mz7ocQLLoGb+
         VrdHV+aN4kDGo9eLHJqV0vv/KU/YT43jpO4AK7Rfg12R9zBC7RUgx9J9WdCmCxEko0v5
         9X4+Odi9xzPzeWDnO0YjvO4K0mKQzQIQoFn1UEolfybo7V96zaCdWALb/e/yhI4yM9wF
         k37r9VITRjXdpaomqbI3OGoD5v6e6MLwXDSqBP6dipdVjFr202G6oGirOrnvdmFGYdb9
         MkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IfUqXUqDWwZTzh/kmjIiMlxGsB81esSX3E+Ol/cMlLs=;
        b=Tw5MD5rPIoHoLrkZdXF/gdoCtdfCYalFFX0HKxuNybjhzCB32sVvD82DiUeo+5uKwB
         fItchzAelPJ6+gbsStU4kKkqoiZw86f3+Q8xeGW1mgRzEhSsskSmGah7fYojxK2cGE61
         z1orKyl4whUwvtOXy+cMb2TZrKo1bHbPF3nujMkRHCAXIM8xCMjlHq+hVBMBCCXLgM1v
         aH2YvBfNKy6RpL57UE6/iXbgODlEOF1IDwDj95HZOFQjdwnmrBXts8rgV4F3HKJIbPBJ
         JbRxcjiEpqUS6BhjafM6BZY4GJW7brLxLHyF8NOXwDb4anYCdvsRI9Ki8tiQZPfMPC4z
         HaMA==
X-Gm-Message-State: AOAM532tw6Vh6C6o3/0MTEbbwVFjP167De+Be1GvfHWSWshi96FdfrJi
	7aDWs0mgj7r1kTpYGKK7j2Zeyc6bR/oW6A==
X-Google-Smtp-Source: ABdhPJwY3WbNO6RT8EAOB8aCNslvU9P1UjN/ypiGbGd5UDxUYfa9e1H6Bx2+mVqtMwXF2h86bHdjKw==
X-Received: by 2002:a63:a62:: with SMTP id z34mr18755302pgk.193.1606765216998;
        Mon, 30 Nov 2020 11:40:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::49d7])
        by smtp.gmail.com with ESMTPSA id l1sm210811pju.48.2020.11.30.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 11:40:16 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Tim Orling <ticotimo@gmail.com>
Subject: [meta-python][PATCH] packagegroup-meta-python: Remove packages moved to core
Date: Mon, 30 Nov 2020 11:40:13 -0800
Message-Id: <20201130194013.74677-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These packages are not in meta-python anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tim Orling <ticotimo@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb    | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 024503d5da..bf46896f1c 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -27,7 +27,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-asciitree \
     python3-flask-sqlalchemy \
     python3-gevent \
-    python3-attrs \
     python3-aenum \
     python3-gast \
     python3-blinker \
@@ -56,7 +55,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-asn1crypto \
     python3-async-timeout \
     python3-absl \
-    python3-atomicwrites \
     python3-attr \
     python3-flask \
     python3-autobahn \
@@ -151,7 +149,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-keras-applications \
     python3-idna \
     python3-sympy \
-    python3-importlib-metadata \
     python3-langtable \
     python3-lockfile \
     python3-nmap \
@@ -170,10 +167,8 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-lorem \
     python3-javaobj-py3 \
     python3-passlib \
-    python3-pathlib2 \
     python3-pexpect \
     python3-luma-oled \
-    python3-pluggy \
     python3-lxml \
     python3-precise-runner \
     python3-padaos \
@@ -251,7 +246,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-natsort \
     python3-polyline \
     python3-ordered-set \
-    python3-packaging \
     python3-parso \
     python3-pycparser \
     python3-pycrypto \
@@ -267,14 +261,12 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pickleshare \
     python3-pyopenssl \
     python3-protobuf \
-    python3-py \
     python3-pyasn1-modules \
     python3-pyscaffold \
     python3-pyserial \
     python3-pysocks \
     python3-pytoml \
     python3-pytest-helpers-namespace \
-    python3-more-itertools \
     python3-pytest-tempdir \
     python3-pyflakes \
     python3-pyrad \
@@ -301,8 +293,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pocketsphinx \
     python3-sdnotify \
     python3-pycodestyle \
-    python3-pytest \
-    python3-iniconfig \
     python3-speaklater \
     python3-wtforms \
     python3-speedtest-cli \
@@ -326,12 +316,10 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-trafaret \
     python3-urllib3 \
     python3-yappi \
-    python3-zipp \
     python3-texttable \
     python3-humanize \
     python3-strict-rfc3339 \
     python3-supervisor \
-    python3-toml \
     python3-diskcache \
     python3-requests-futures \
     python3-matplotlib \
@@ -339,7 +327,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-xlrd \
     python3-xstatic \
     python3-tzlocal \
-    python3-wcwidth \
     python3-ntplib \
     python3-u-msgpack-python \
     python3-python-vlc \
@@ -383,7 +370,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-requests-file \
     python3-requests-toolbelt \
     python3-ruamel-yaml \
-    python3-setuptools-scm \
     python3-socketio \
     python3-soupsieve \
     python3-textparser \
@@ -429,8 +415,6 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-dill \
     python3-cerberus \
     python3-cvxopt \
-    python3-sortedcontainers \
-    python3-hypothesis \
     python3-jsonpath-rw \
 "
 
-- 
2.29.2

