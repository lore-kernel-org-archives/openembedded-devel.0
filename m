Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.6375.1585117699652923932
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2020 23:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lh1UYFdR;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: nick83ola@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id a9so1157271wmj.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2020 23:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rTN0QSeASInoDIRhMxfpjKg3J3AMbT6Zj0Uul9i7C20=;
        b=lh1UYFdRAEgar0pnlVEpvTOKDU38L2YxhtFeDn5vL+/agN+2zwjt9avPzX/WwWKLrd
         lc8i/U0BT/rM2AtCoSLtvY+eCCJHWXGTeQgkJeKhUQi2M1176zTi+HTsYATvKuDEtR11
         11Yjo+/coFlRrQnOCawpCN7Yln5CLF+ab900/39roVe/QpUhGngdrPRiyeaogFXPNwcc
         d3XN9Knk8MoqCO33hxHJQb0ACKhyKz6SDjo0YdXMUeCkavJVGoHx1YBFuLYmHCPrb9r5
         2H+PTeHwaV+Bz7WAIfwBV3vZmQf34RmDf9vho7FfuqVfgEPrst+TeDMokix2O9GzWU0O
         j20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rTN0QSeASInoDIRhMxfpjKg3J3AMbT6Zj0Uul9i7C20=;
        b=o7GdpNoyA/Rre4WBBembIJ8ZoPYJRL6ei26kOZNHXNxURW+GSlxivmUzKQ0nmz4UNj
         4lfnqX2Hrg/DeO6iKfZAwMZisrMBjUeqbkrYkIZyApUnjdrMMMueX2Pit205N1l7nQet
         Zn572YSpavxXjjdOmKMkUI6q4WSNydYeeGYR+cS9sZUxaUfITuUoIS8m3S9Fw31AdtEr
         3jb14/CAg/cwpwtmQ9w0iFYu07P/KdQ7IYP6ZP6872vXTQrn/0gITCVxHBZMQCB6xeDX
         dYUQLfAsmxLK1DPWio+TbvP9uF4S/0BaXw4+MpbMCW86TSbKLhwB1lwslqfMIkl9B4S+
         xYYw==
X-Gm-Message-State: ANhLgQ2gs9lcI5UbOBi+13j894gtT65uQD7bNwxN1xhyfzLbwBAVzfCL
	Vb5sPXANJmtsw7Blc0ApYE6w6Vu8+Qo=
X-Google-Smtp-Source: ADFU+vvaNSGwXTyYzU4QWhWY98U+F6kYRWxgd6MG6hGL6maEHoLlFACirshnEb0NzT1jmMwqEDFaLA==
X-Received: by 2002:a1c:a5cc:: with SMTP id o195mr1750319wme.169.1585117697847;
        Tue, 24 Mar 2020 23:28:17 -0700 (PDT)
Return-Path: <nick83ola@gmail.com>
Received: from nick-beastie.garage.tyco.com ([79.97.95.10])
        by smtp.gmail.com with ESMTPSA id l64sm7781477wmf.30.2020.03.24.23.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 23:28:17 -0700 (PDT)
From: "Nicola Lunghi" <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Parthiban Nallathambi <parthitce@gmail.com>,
	Nicola Lunghi <nick83ola@gmail.com>
Subject: [meta-python][PATCH v3 2/2] python3-matplotlib: update to version 3.2.1
Date: Wed, 25 Mar 2020 06:22:09 +0000
Message-Id: <20200325062207.15318-2-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325062207.15318-1-nick83ola@gmail.com>
References: <20200325062207.15318-1-nick83ola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 ...hon3-matplotlib_3.1.1.bb => python3-matplotlib_3.2.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.1.1.bb => python3-matplotlib_3.2.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
index c638e27b1..f6d8c53d0 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.2.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/matplotlib/matplotlib"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=275;endline=275;md5=2a114620e4e6843aa7568d5902501753 \
+    file://setup.py;beginline=250;endline=250;md5=2a114620e4e6843aa7568d5902501753 \
     file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
 "
 DEPENDS = "\
@@ -18,8 +18,8 @@ DEPENDS = "\
     python3-pytz-native \
 "
 
-SRC_URI[md5sum] = "f894af5564a588e880644123237251b7"
-SRC_URI[sha256sum] = "1febd22afe1489b13c6749ea059d392c03261b2950d1d45c17e3aed812080c93"
+SRC_URI[md5sum] = "6c018a644a88120886cc7211f7c826f0"
+SRC_URI[sha256sum] = "ffe2f9cdcea1086fc414e82f42271ecf1976700b8edd16ca9d376189c6d93aee"
 
 inherit pypi setuptools3 pkgconfig
 
-- 
2.20.1

