Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.9154.1596906254653844788
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Aug 2020 10:04:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SP0mwGDJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id u128so2817198pfb.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Aug 2020 10:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xr5ejcyLXhDab2j1WZRZaTjDFTW8/tWbzWRQuTW8xJA=;
        b=SP0mwGDJOWrpBeKo1Yv8dG9uvYAVEG3u/QFwM3jhWi9pfFp6gZAd93NMWV7yJtAFg3
         7Wmi91PlxuIznYSWXI8zy49zJdEcXIMT1gISyamDTwqe77vQpPq2Ttp1iIk5msFssi9b
         bg/e7GHOL+bJPoKRFZXlTlg3ON5slk0+tlRg4a/f6jFI4GS5DrqnwenoUXLv4UCzaLdE
         NbysmGvLFcYpUcVDCpA9U+0kPT+6CcD0wSraHiIReFtKKb0nsdpOnfWZVa6ZSJHrcPIw
         JWpAHo6dURxJskjVjEMQO3nWFlP2S/6dHNhSEkg40mBelMDCveynNOUf0lxmFYJyR7rk
         fIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xr5ejcyLXhDab2j1WZRZaTjDFTW8/tWbzWRQuTW8xJA=;
        b=I9O8qcfBBVUDyf8XraP95H0gYbsRF8g78+nHAm2fRoNtgJR5soGma9m8U7u7mCFT9x
         OqgSUDwWbYPKg5x+J4mVfHDkNRCRW6RVzVM6lYVnzZgAC0nqQvzAy4rBN+mbc8hIsAfn
         B9Jx2rjuRJdAA9mMNbgaIsqJXzDAmYjt5hQQi7MfRMykzElYrtluxozpWsgu12VuwL+S
         jb6+zGh9jiFwz6Yd7iCevARh9+GcnMmObQe5r2fknH3UVtPQ611IM9jsuGjDbinlgkRb
         nUHdLp4LjAUCjd4mw+m5OSwJ9bsgmXvaW2Htfssaxx8LqccrOf3oSeHJqivkq7LRWPtM
         BliA==
X-Gm-Message-State: AOAM533Lj5DzXj+z9WHE4z8NVR6kg5kRmSL0c1ogNH+JsbujEQYhfs2H
	Bx8t7MvjWFbJcCGtJGHjcopE2X3Esis=
X-Google-Smtp-Source: ABdhPJxpHnoVvlaoc9GFzVQh4cdw+G8EbynPtfHY/q2vWjlBGp55cc4bsshGLz5JXPYbR0p5WTQM/g==
X-Received: by 2002:a62:7b89:: with SMTP id w131mr17457976pfc.284.1596906253887;
        Sat, 08 Aug 2020 10:04:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id j130sm14280225pgc.76.2020.08.08.10.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 10:04:13 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shlomi Vaknin <shlomi.39sd@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 4/9] python3-ipython-genutils: add recipe
Date: Sat,  8 Aug 2020 10:04:02 -0700
Message-Id: <20200808170407.2326879-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200808170407.2326879-1-raj.khem@gmail.com>
References: <20200808170407.2326879-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shlomi Vaknin <shlomi.39sd@gmail.com>

Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-ipython-genutils_0.2.0.bb         | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
new file mode 100644
index 0000000000..587aea1f05
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ipython-genutils_0.2.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Vestigial utilities from IPython"
+HOMEPAGE = "http://ipython.org"
+AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING.md;md5=f7c3032c3ac398265224533a0a333a35"
+
+PYPI_PACKAGE = "ipython_genutils"
+
+SRC_URI[md5sum] = "5a4f9781f78466da0ea1a648f3e1f79f"
+SRC_URI[sha256sum] = "eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8"
+
+inherit setuptools3 pypi
-- 
2.28.0

