Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.3357.1596226732720259977
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 13:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j7Dxp4NF;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id kr4so5996492pjb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2020 13:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jWtsV+yD5K8S7RiU1u0aTZBQkEn/dn+E+UCDn33qn3I=;
        b=j7Dxp4NF593WRsETbDYI2vULEq8jba2cnDc6vlnswKiD6PdsEZg9/D+OFdpXm9kgzz
         FpaSmwEALp1OmmIreOjGvxE4ej/N8m6JAOO1rMXNacDg+LTDzU0F3lLZ9XOqF4MdMEyN
         HjY0ZAbv/uAW42L852Ng+OkWAd6VyHWax9i/Ubx7NPF8fcCmJA909qZ+fboSrQGbOEOS
         /dL5hLHgfw5VPSxsNUwqIHKY3zHLy6ni8SZ82npMw5zdYuHiWPWyAcy0+MxnyYrOd170
         OLLB4SERjkWW9p5uawIlO2ubNGJcM6L+8DlzcmZZFoow/PgePpR9++XqW74CcVP5KbEh
         hxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jWtsV+yD5K8S7RiU1u0aTZBQkEn/dn+E+UCDn33qn3I=;
        b=Zz0q3IYgFbzIDfdxyXXWZmszIFSAclt9/YIsHvZgWf9km0Bc6zlQeCF73LtWb2vppZ
         MsyChqWdAXffQKdwnUq6zggGVX525EeZWWc9vyz3lF7Wcb7kj0ul+0Jrhw8n1fcWFvwO
         3ru6KjAcHKaPZ/omuDpTuOCePVb1l0AyuoVkxmcKKYQNcGCf+dqRtMgtwjnbchOdqhOt
         BzdVkTJDTf618AbX2JmCBmCkc+NAxhXsnS/K9HZcqBy8qQpG+qDXtC8xo9+cACHitVI8
         lPAb6cyaQoAWlbqIcD28HsahZ7QQtB7jrQwN9Zcnb5qIjRX6lboOnX05sLYth2TJwQ7A
         jFqw==
X-Gm-Message-State: AOAM530dWttxP0qj+tMT7UyoypJW9A+aEO//m2+ZKEzBK+ZT8LhPPsZY
	h4N16gK4I0Evq47rEBgLby5IVnTu4AA=
X-Google-Smtp-Source: ABdhPJzDImOqYgZ4R03VqHia1mY4Hh0DQrTqbTk8ly8G4n6E9ilurrdHsWbObDe/+3yNcTI0OqxkKw==
X-Received: by 2002:a17:902:6a8b:: with SMTP id n11mr4973331plk.264.1596226731977;
        Fri, 31 Jul 2020 13:18:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e841])
        by smtp.gmail.com with ESMTPSA id s8sm10973727pfc.122.2020.07.31.13.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 13:18:50 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-paramiko: Added recipe
Date: Fri, 31 Jul 2020 13:18:46 -0700
Message-Id: <20200731201848.484776-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200731201848.484776-1-raj.khem@gmail.com>
References: <20200731201848.484776-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Colin McAllister <colinmca242@gmail.com>

Created Python3 recipe for paramiko.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-paramiko_2.7.1.bb               | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
new file mode 100644
index 0000000000..0ead23608a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-paramiko_2.7.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "The leading native Python SSHv2 protocol library."
+HOMEPAGE = "https://github.com/paramiko/paramiko/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
+
+SRC_URI[md5sum] = "bf8239dc820ca86dd3c3226f4281c35f"
+SRC_URI[sha256sum] = "920492895db8013f6cc0179293147f830b8c7b21fdfc839b6bad760c27459d9f"
+
+PYPI_PACKAGE = "paramiko"
+
+inherit pypi setuptools3
+
+CLEANBROKEN = "1"
+
-- 
2.28.0

