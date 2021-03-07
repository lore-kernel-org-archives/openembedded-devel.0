Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.18205.1615095819420233760
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 21:43:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TyHIfOj+;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id y67so5112207pfb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 21:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CxNUpnFBMfB/KH6BMMsEFyibvi7DF0aMlvDtRLQsthA=;
        b=TyHIfOj+xy7uucjWfHptElRWady+YFrFJ5W8HRUS2bOaiKI3zFwePghJizUDx1bYJP
         B3YAVsMMdmZQqo44yjNNO76MfK8XVPp6qejGPI43D6hHaJNoHw66NKlqKTc1sS7xtZMZ
         3MLmIAkMCjJG+T/3d9im4mD9F0dxwB8Byrf3Ur7awUkC6OCUh40r9UaSpxDi1bkiTu4b
         coM8rMeTHFyMbiX0HsiTkrBZomkoEu4RpMZYEhXtTuaGcwFYAIFB7stiSNuUbVZaM2nY
         5hLH+6okArAL24ik2G5COhPkD7oxYIAytEaRUXwWjXzLZX8teum3H3Y/fceZCCqSfPZy
         qd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CxNUpnFBMfB/KH6BMMsEFyibvi7DF0aMlvDtRLQsthA=;
        b=Oljx+eTFgxw94pZtw1plup75IsJH1UPKQvZZl2HlIjdBtJ2SLsVYoZYx/uzJt5MVYB
         6H88RkQoOFHilTJDiE0MTcMVLjjRlmYj+qfgiDWWIK7dlHoaKJnY084JTNe9t12gz4ze
         JkmvTscluisleMBUpRzKv+Xx9O6ZVKmTWTAyjkJKT7JX6cfgieDvOW4Y0HB4mQwymQfk
         v0o5Zcz26ohQ8MQndc/I4/Py3Awaq34zsjbtN9Dl0o7wiwDH4woMpAZnoxsMEsOA6zBp
         fIIttbe7mZ/IKT3zaaWYQ/vKbilJcq0Y40HfmzrFtj0/j3E09TSFZidhUiLtc5DQlP/g
         MxVg==
X-Gm-Message-State: AOAM533z8QuZMEHBikts8LUxrfhsqNYmTHXegDLRLqqvTXQPxWYERBlU
	dlzJGn5dNDYosNm6/oHS53QpPYFO1l9P/w==
X-Google-Smtp-Source: ABdhPJxG6JTZ2wu1fRGPJ3zG1XbeIVKr5YhALhV0jaifKnuWMROPlZvHw7STn1mZTLnUaGB06I2MFQ==
X-Received: by 2002:a63:461d:: with SMTP id t29mr15183261pga.192.1615095818778;
        Sat, 06 Mar 2021 21:43:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id e185sm6796810pfe.117.2021.03.06.21.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 21:43:38 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-gpsd-py3: Added recipe
Date: Sat,  6 Mar 2021 21:43:33 -0800
Message-Id: <20210307054335.2332899-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210307054335.2332899-1-raj.khem@gmail.com>
References: <20210307054335.2332899-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Create Python3 recipe for gpsd-py3.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb    |  1 +
 .../python/python3-gpsd-py3_0.3.0.bb             | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index c1271d09dc..4512f839f4 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -144,6 +144,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-gmqtt \
     python3-gnupg \
     python3-google-api-python-client \
+    python3-gpsd-py3 \
     python3-graphviz \
     python3-greenlet \
     python3-greenstalk \
diff --git a/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
new file mode 100644
index 0000000000..35485ba7c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gpsd-py3_0.3.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "This is a library for polling gpsd in Python3"
+HOMEPAGE = "https://github.com/MartijnBraam/gpsd-py3"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=10;endline=10;md5=c2d9994c57f0444e39f1dab19af50254"
+SRC_URI[md5sum] = "041ce56e8879e2104b4d54c8119cd529"
+SRC_URI[sha256sum] = "2908d3bd78dfb6720ecfe22f97e139b5a4a198f38df3a77215cf644a33513192"
+
+PYPI_PACKAGE = "gpsd-py3"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
+RDEPENDS_${PN} += " \
+    python3 \
+"
-- 
2.30.1

