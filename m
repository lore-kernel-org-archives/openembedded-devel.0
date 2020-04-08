Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.10468.1586349385840625062
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2020 05:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PPVnFjvG;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id r26so5275463wmh.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2020 05:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=exe++TUtPI48Gx4ISe9noDbpPNCmb/srXFeHRs2Offc=;
        b=PPVnFjvGKUrEkRQI4KMiQvIwvei4RLFEOcEMAA6PvBd9vKzwIfX3iM/0kQxUWE3qEC
         9i1kgpumaWhLKIRAAIk2fE8kH+DEEEHQWa8YinMJXc1Xkd7W0GeBxi9huR+BT1WUcoXy
         AuDxdaMlLJLjwvbaAeU69ivf6+JhXRbQqPW1S4tAxK0hyg1qTW8EwRtvBEnHOlY6yLZR
         hCTYwmvEszqxU4ueX8iQTsVUE1brrZAPET/lF7y24NVOkZBZQI8x5mfVAoDspCn5jgZr
         fvWkcohAEQyesEJyAMnuu6ND78DyIDvxE+PIA4HrITRTz/F3U89B1Ro867/gJk6ZBg98
         b1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=exe++TUtPI48Gx4ISe9noDbpPNCmb/srXFeHRs2Offc=;
        b=h4c4FiKGLzfgyiRtqHX2luAVAR1p68ZK2Zm/bu+2FArjdNv2KRHH7JlQC/q+3JigHk
         ZvhQeL5rrlSmENk1yZsCgffUf2F4BVMwdhNPjwarYO7Ie+e0CPOiO2V8kX0s4qa9G3S5
         nqcSIZZWz9oaVSDvo/yiGt8zK8wUZeY2JMzTne1N2Rxz4FJSgqrYqusHpDp2ioFSITB+
         akiZEifQ+2hi5G9AfneJABZTc3iSg8dGuQ0qFCRbCtm2TPCw45o98LzkcTMbbReWbrDR
         +u/uPpxSeq+d7OBAWB4Q1fw3rOGjkHLTJQWP+BxUj3sLdbMeSYy1dBSG3bWeJarn8Eyg
         jpqw==
X-Gm-Message-State: AGi0Pub3A8baFPLrcCjEvLM7VxwHktXgHRXxl60lODXir1ZpmF5NheMI
	DrCerXFCfGCSP5nFDXTdesk7ZPmjkzQ=
X-Google-Smtp-Source: APiQypLWENONQa1+lT5xtd7KKOdZgUtlv4BbFZMDZWvBOpyw8pxwGKskxuLtfYA/4jnAr5NDnXiUgQ==
X-Received: by 2002:a1c:7f8e:: with SMTP id a136mr4612651wmd.33.1586349384032;
        Wed, 08 Apr 2020 05:36:24 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from localhost.localdomain (dslb-002-205-007-153.002.205.pools.vodafone-ip.de. [2.205.7.153])
        by smtp.gmail.com with ESMTPSA id w7sm36107582wrr.60.2020.04.08.05.36.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Apr 2020 05:36:23 -0700 (PDT)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [oe] [meta-python][PATCH] python3-arpeggio: add new recipe
Date: Wed,  8 Apr 2020 14:35:51 +0200
Message-Id: <20200408123551.44845-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

Arpeggio is a recursive descent parser with memoization based on
PEG grammars (aka Packrat parser)

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 .../python/python3-arpeggio_1.9.2.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb b/meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb
new file mode 100644
index 000000000..802a5b2ea
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_1.9.2.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Arpeggio is a recursive descent parser with memoization based on PEG grammars (aka Packrat parser)"
+HOMEPAGE = "https://pypi.org/project/Arpeggio/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=33b8d1ba459a2fa4d801acfd1d1b7ceb"
+
+SRC_URI[md5sum] = "39667a626217c670bc634444be6e904a"
+SRC_URI[sha256sum] = "948ce06163a48a72c97f4fe79ad3d1c1330b6fec4f22ece182fb60ef60bd022b"
+
+PYPI_PACKAGE = "Arpeggio"
+inherit pypi setuptools3
+
+# setup.py of Arpeggio needs this.
+DEPENDS += "${PYTHON_PN}-pytest-runner-native"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.25.0

