Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.121525.1597964221971535853
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 15:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VRJSusGf;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: mfitz.payne@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id t6so97779pjr.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 15:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kIJplTw3fOLIeDICtnNsky1XkfgYOvzQU9NE2Ae9dDo=;
        b=VRJSusGfGANt7zAam1uWKqOxVBpQX8DUW9GcyQSDPmOJJsB05ojTAkDwVdzACjF+A1
         6P6S/PE8FoKZE+grVc++WIIKkF+FaZKw1j44ioC7CwHJUOzR3dTylosFir3+07LdH5Xu
         vhf83V74R8LhMqosmKGwyXaapu+F/D3DBcXkAcUDwJzv5sJq2V8TXUJ8G/32TsgsBkaP
         Lfhk41kOX+XXVkleaIHn1yNhPQthhnvj1J2/zmUrv5+1OVzwTvczS9XNXCUoDV+sxkgn
         oGIoMAuB7DCBAlwkTRpi3jBux93K+sO3b6YN1HzNJgFEKtKAG+9MGn4Hgc2RrtiUF0HP
         FzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kIJplTw3fOLIeDICtnNsky1XkfgYOvzQU9NE2Ae9dDo=;
        b=HwtdXDhqE9iAxMYhZgl0ZWiuiI+nvZmoPR/lR56QN82MeZ/8SlqNpCTSy45Jty5A/U
         AZji8084Cqn2CRCncWXiBnzvVg2izoDVU9eFUUQip30tAZwdIn/sAEXh5Xc39pdmHCRi
         /c9nrkiAl2i4ynIIMN+aWH0OY3ZTQ/vLC4TVnGpLznu3WoULtA0e0AXBE8fKnQA06Tr8
         J8Q076AkO1CjxuyEYr6EIEIdsF3N3k7rXG1tKVmRdTj+zFtrL5CO6AegkOMht5BTGgdf
         oOUhn/GVoLjExxXvZ6GIyskdJMQSi2tk+KMv3WNrpewPaRzCt0ltQY3622/++IcjoaJs
         i8cQ==
X-Gm-Message-State: AOAM533se/ELXwMyMTHwXDXyjkJm1tmvH37vz8E5s3IPWl7+NnUAZW6q
	sGeBvnxld+e9u8ruXz8aEwQFjLCsu7c=
X-Google-Smtp-Source: ABdhPJwgZXjgAzwJztqdKrhDd8YMrRA36OQHD+cSjXmYIdir4WMnJTpn/Zsv7iWyrrddr3kFOIxDBQ==
X-Received: by 2002:a17:90a:e94c:: with SMTP id kp12mr17817pjb.115.1597964221176;
        Thu, 20 Aug 2020 15:57:01 -0700 (PDT)
Return-Path: <mfitz.payne@gmail.com>
Received: from localhost.localdomain (n175-36-189-13.mrk2.qld.optusnet.com.au. [175.36.189.13])
        by smtp.gmail.com with ESMTPSA id u8sm39007pjy.35.2020.08.20.15.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 15:57:00 -0700 (PDT)
From: "Michael Fitz-Payne" <mfitz.payne@gmail.com>
X-Google-Original-From: Michael Fitz-Payne <michael.fitz-payne@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitz-Payne <michael.fitz-payne@digi.com>
Subject: [meta-python][PATCH] python3-greenstalk: add recipe for greenstalk python package.
Date: Fri, 21 Aug 2020 08:56:49 +1000
Message-Id: <20200820225649.200821-1-michael.fitz-payne@digi.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greenstalk is a small and unopinionated Python client library for
communicating with the beanstalkd work queue. The API provided mostly
maps one-to-one with commands in the protocol.

Signed-off-by: Michael Fitz-Payne <michael.fitz-payne@digi.com>
---
 .../python/python3-greenstalk_1.0.1.bb               | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb b/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
new file mode 100644
index 000000000..9447c1836
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-greenstalk_1.0.1.bb
@@ -0,0 +1,12 @@
+SUMMARY = "A Python 3 client for the beanstalkd work queue"
+HOMEPAGE = "https://github.com/mayhewj/greenstalk"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8f98432ba1fce3933c556430fd47298f"
+
+SRC_URI[md5sum] = "3374649586a8016fecaf0ce5ecf9985d"
+SRC_URI[sha256sum] = "0c9f2af79ac8ea526891ae8d7e9500341a0f657465a541d6eaedb35ff70f4fe3"
+
+RDEPENDS_${PN} += "python3-io python3-core"
+
+inherit pypi
+inherit setuptools3
-- 
2.25.4

