Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.3836.1594353675422178081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 21:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nsrxAg19;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id t6so1937307pgq.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2020 21:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WfVh9R9A//HG56kFC5wtwgcVIpLqa2l3+biXeG3wAJs=;
        b=nsrxAg19EZNRSxId7oTayOYgqaYW4ldEOvoqfGTg0mVG1tq4nvU1ReATkpxY+oeI7u
         fyYlnDdo2S57cQYHcJMaUhkw1qwG0h+oYbPPgLCD7kSLofPBq76JQW5OCR5CNmYCSFHE
         LL7d2HytdOr21myNzqLEiRnmVTCSCBXhCJPcYFebMXnkmuofmRylY70SgsUC+9wZPyrk
         BAfNCMoU0f5cIGippvG5QsII+NuPJsNhNWukjgcF/R9i97TNqhs+QcOOUEhuaj+rOhEg
         0v7gJQ0pgGyr09FsFHSAYjvwRmvY8U65/F3dyHScyGaeO+DN6fu5V77uJyKDvGiOUokt
         oYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WfVh9R9A//HG56kFC5wtwgcVIpLqa2l3+biXeG3wAJs=;
        b=XLwIAc12AsUFbfpC7/eKZk+4fbaRBGeU9ZgreOV0ivW4stb9DAN19a9laBAZKpGI/S
         is8ZefBdiCB4WAqVhy1HASd5rE5QB25S3szChS4IdQPjWF34ZKZRVignfPXYnQ+VcMAd
         xON/lkO/4e0ROORs1fwjlCue0Ejz+DuBboe4jNOKhgldjROCglfWt0NTxno4e4Qr/fvT
         X5iMcLaek3qVwRxUbw8JjVcwySXEjMRLI1CFyy2QtAZdFKtKmjptvjqY/5Xd/FaIIcOf
         hAVOvCmABd0b9PdMvsE4nMrQQGxuPU2jCUiQWU5lJ3YGwQor2R0ffea1xYE1yiE5Hydn
         TAIg==
X-Gm-Message-State: AOAM5329wEPp8/A/kVZ+4bJPZwHGDIzT8dDjzXonKl0t8tW4hju8ezPV
	r8uBmXNvEOHN81imtCoG8vo1dI2Qcl4=
X-Google-Smtp-Source: ABdhPJxMUkkCoSZAqrUfAdQ6ZSBV6UZ8C+PFOiq10WcZCH6ccLe3XFsd/maxLuThCKPTfuAaNAvq2Q==
X-Received: by 2002:a62:7845:: with SMTP id t66mr17227945pfc.5.1594353674789;
        Thu, 09 Jul 2020 21:01:14 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:396f:c9d9:1d67:d8dc])
        by smtp.gmail.com with ESMTPSA id b21sm4101405pfp.172.2020.07.09.21.01.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 21:01:14 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/4] python3-natsort: add new package
Date: Thu,  9 Jul 2020 21:01:08 -0700
Message-Id: <20200710040109.22600-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200710040109.22600-1-akuster808@gmail.com>
References: <20200710040109.22600-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-natsort_7.0.1.bb  | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb b/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
new file mode 100644
index 0000000000..e20cdf0fa3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Simple yet flexible natural sorting in Python."
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
+
+PYPI_PACKAGE = "natsort"
+SRC_URI[sha256sum] = "a633464dc3a22b305df0f27abcb3e83515898aa1fd0ed2f9726c3571a27258cf"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "python3-fastnumbers python3-icu"
-- 
2.17.1

