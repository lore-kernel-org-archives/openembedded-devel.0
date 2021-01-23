Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.11406.1611429927935006715
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Jan 2021 11:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mnFkwh24;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id l12so8335356wry.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Jan 2021 11:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7ZkajDBDbpyy7cTo03ACIctCCW3E1Xq9rCwY1DajIw=;
        b=mnFkwh24xiF11PPMFElpZIxn0844UXCJySwjJ5GRn0vN2PvG4pTPof3BLVPTpR33jH
         lC1jRkrz2Lir4UY3XMtZufy5LxHlQbsn7ab7Sj/splsNWDk8lElJgEbSk1/wv9Zno+2p
         fZ/rlXbRf0zAjFyqtDunCj2PDWVJ2Rokhnsa0RLeSFeJ8gch4NJKDzy5zo6jZ/giXPbj
         dXtUwifJpGhuqLfRFV/YTrHUbpdvAUquSEUXgJ2AOD2/7DAnsACDdGeUZROdd46RZHz7
         SImP0DzbvlgkxyJzEUBOpnokC3jqL6UClHvWALB3HKu3mosQbKLxhDATJLOo4NnboACE
         fN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s7ZkajDBDbpyy7cTo03ACIctCCW3E1Xq9rCwY1DajIw=;
        b=pWri25xfs7TihyTJFSt3nkmIjlOQD6gCNQYXxx+34H78at4TsTAnjZzMPi64rhcFxj
         5t9WJwCDz1NRmieePE/uIaK2bMCdZTulFzwqQL3ubo4l7nrb7cX9Z5yytjwyFR2gzyTh
         T9AhZg05dKDP4jw3BXZuwkbQmpeS9k1lrTtG7MgF8T+z8v9KTMfNErjZwHLWd3ryGA8b
         VS3VrMXfG7aVy/WYeZA/yl66inwRr7WzuKwqBVCxLUnBHQGWV3Azpi5UmBzeo+LhPGRp
         t5P6i5vAC8uLHbSP6lMb2NX710guued7mHM5ZXnjZmSegPXNOlVBE9J1yid/sOL4BbYB
         335Q==
X-Gm-Message-State: AOAM5339re8ijj5V23NtbWhOxBPq4y+NyYSAp82rFQHAI+xud+DqqN4g
	4rMVy3S7ugsxrGlwJicMdThMBlaCXwL3Rw==
X-Google-Smtp-Source: ABdhPJy2TOsLbeDIydDT/2irL8Rwf6gVsvmvvyXF3+YF4BGHlMf+V1i4ylvb7FMTmDS3G2LniIWOTQ==
X-Received: by 2002:a5d:470d:: with SMTP id y13mr10166115wrq.309.1611429926496;
        Sat, 23 Jan 2021 11:25:26 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f38e5532665fa05402b8466.dip0.t-ipconnect.de. [2003:f0:7f38:e553:2665:fa05:402b:8466])
        by smtp.gmail.com with ESMTPSA id n11sm19159740wra.9.2021.01.23.11.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jan 2021 11:25:25 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: trevor.gamblin@windriver.com
Subject: [meta-python][PATCH 1/5] python3-mypy-extensions: Initial add 0.4.3
Date: Sat, 23 Jan 2021 20:25:09 +0100
Message-Id: <20210123192513.2663547-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently it lives in:

* meta-iot-cloud
* meta-microcontroller
* meta-ros-common
* meta-sca

Seems important so add it to meta-python

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../python/python3-mypy-extensions_0.4.3.bb          | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
new file mode 100644
index 000000000..83ac5362d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Experimental type system extensions for programs checked with the mypy typechecker"
+HOMEPAGE = "https://github.com/python/mypy_extensions"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0fe3219e2470a78c0d1837019b8b426e"
+
+PYPI_PACKAGE = "mypy_extensions"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8"
+
+BBCLASSEXTEND = "native"
-- 
2.26.2

