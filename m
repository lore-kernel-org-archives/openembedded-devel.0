Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.10174.1592494089682723355
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nwPd1I+g;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id b5so3050451pgm.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=CWoouYYI3O0SE0jsNAc3YYiSK3SD/xsWdY7N+VJ7hjo=;
        b=nwPd1I+g045h7ido5R6h1LVLvq2MKNCqYDgI85TO1Wygllda7Vgw0WsCyK7P7xaq8+
         cDl/Yn7jWYnotT6O1klDGfy+kqqaw1szHT/PvTBBbhoDYgBKKhlJmQMii+kMHoRWhz4O
         eNP6Jp7jryO7+BJeaDWyfcDB+vYqgV82Lx0G82Y8MHWGlNo3vlubSRz6GG2hxcHUeAwm
         iQsRIuvkIaoA9mHLJVhrH20G/DzFUI9Sp/TBcxr8EJt7pOd5MAEvSIABN3MaWbtpeM83
         NAVgfEqNfs9MRlKyizy4AnBKTcR7M5HHsctD8Fa3P9bGqGWWlpsw8lUZahCERuunal4u
         swxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=CWoouYYI3O0SE0jsNAc3YYiSK3SD/xsWdY7N+VJ7hjo=;
        b=osRaIJ7IDFJ/Wbbfeo8fEZ0Bmrlb5KsYioV8SlGzwQauNvCblsECdJuTaoH71YSZ/c
         FzkYMs5sAv9XvwHnvOAk+5fUErEsJRF+0u8U0jEsLqySRCIf8c/POV/2BKi5uKvPZy4d
         ic8rDY6rkKnNowXMxk0igI35zlZBVHkIqTm7JmXusJRq8rG2fpjRwSmbUUcyaQfzUq8H
         qmWA16gZC2org1RXjor7Yjc+gnsnv+CCDBG9pclgjvz1KWFUflBzfKI1pCZu64Js7dOQ
         m3fcx4yKTqSgtY+uHw+eRNAdv452AgipnSDljjadiA/hsxzDb7EOKdTVZ6av7MVr2d3u
         /t2Q==
X-Gm-Message-State: AOAM532SaMqUKH8Ine92g6YpNBLFZHIyQ27xWv7yXnYHwvquOeVX8M2g
	C0Rqk+WJ6SyuXFY9Q8HZ4NSgvEY+
X-Google-Smtp-Source: ABdhPJygpakLfgtnbhLJvslkW8MP8S9QoMD1W1+qCyk8OG8qjSmQySHmspRF9eO3faMjfDKm9wc0NQ==
X-Received: by 2002:a63:3e09:: with SMTP id l9mr3873976pga.235.1592494088841;
        Thu, 18 Jun 2020 08:28:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:88de:dadb:4f45:bd2e])
        by smtp.gmail.com with ESMTPSA id u24sm2800356pga.47.2020.06.18.08.28.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:28:08 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/7] python3-configobj: Add package
Date: Thu, 18 Jun 2020 08:27:59 -0700
Message-Id: <20200618152805.13075-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618152805.13075-1-akuster808@gmail.com>
References: <20200618152805.13075-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-configobj_5.0.6.bb   | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
new file mode 100644
index 0000000000..1b85368105
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Config file reading, writing and validation."
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
+
+PYPI_PACKAGE = "configobj"
+SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
+
+inherit pypi setuptools3
-- 
2.17.1

