Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.14195.1589552219525784083
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 07:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=jZCQH49k;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.193, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qk1-f193.google.com with SMTP id f189so2653428qkd.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NGAuvfKvJ2MzZPNZnWdRR/1OxhrRsNW3qGU778aB7+g=;
        b=jZCQH49kuz5b1RZXFRcxY4h69RT0ZPCTDhws8vMUOxkzbP9+NYIlnnfVlKl1jDD6Ka
         b4XcUAWLNnGVa+omD+4shAqsUpHftivrT7mW6yMiVmPJGpqLVngnjapFtoPU7IKgvbWC
         jw/nIdpLZn20R4N72IW9W7HM6hxnYgytG5KHq7jdxuvjgnNnHt8/ztvps0Cm+y+5DB8V
         3Hszx6Y0a7U8UX6MOQmBUrEeNYuyRspQs5+A3bunxMZUfEERdQbRea0yo2sYIg6xzsrt
         HCP16LQYjQ7536VvpS1JVriUNaDdmVXGHcUzbbAGV1OKDfExU2Qh51R0oVsr3n2nEVBS
         Oa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NGAuvfKvJ2MzZPNZnWdRR/1OxhrRsNW3qGU778aB7+g=;
        b=giu1aWxahT98uH9k+A8QuQxfh9+S5rMvYAOv2okW9PLFpfE5rjQ6oWoc2H4mgYInYM
         O+TwQbFJ+AW+M5WYWYtpAaNBjfgdUnP/m22cTaZSY5Ggqt2xoRlXaEYnvIe2TJBrYJWL
         GxExHBOdvUs4nn0sg5mP+QzHccGbW8ndnGcbtYhZCjcPCoFgBVXuZQHKAMcIb3BXjDd2
         gguChmwMJDWO47LAFGzbRNgjeR7sQ6E8Dfv61cAdUpo3zDYoLXFZHAJAA2GPRckSg0zb
         bZKyVIu6gUYWBptZCKEdhhATjwn74dztwr6sswvK4JrF4LHKC1w9x54C30BkE33/gCbo
         4ezA==
X-Gm-Message-State: AOAM533MkbG8BUO2uL/KvJhXyq6TA4OEFwzzdVuWJuFeuAKYvNopET8P
	ZXJ3yM6fLHJgHCF7uVD6rtznAY8Dcyo=
X-Google-Smtp-Source: ABdhPJzrI92SeaHVILiA8nBAS+u6+z2PEpZQB/dLsN4shRcvqo0rWmjA2m2dVFjEbVejqJKERH68Pw==
X-Received: by 2002:a37:270a:: with SMTP id n10mr3530458qkn.288.1589552218560;
        Fri, 15 May 2020 07:16:58 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:5434:711e:b23:e7fd])
        by smtp.gmail.com with ESMTPSA id m33sm2170749qtb.88.2020.05.15.07.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 07:16:58 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 08/11] python3-u-msgpack-python: Add recipe version 2.6.0
Date: Fri, 15 May 2020 11:16:27 -0300
Message-Id: <20200515141630.27789-8-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515141630.27789-1-domarys.correa@ossystems.com.br>
References: <20200515141630.27789-1-domarys.correa@ossystems.com.br>

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-u-msgpack-python_2.6.0.bb       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
new file mode 100644
index 000000000..6d2e0e0c3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-u-msgpack-python_2.6.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A portable, lightweight MessagePack serializer and deserializer written in pure Python."
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9eb4691bcb66360acee473a8cf75f594"
+
+SRC_URI[sha256sum] = "754edb07eaee39a9686a99823892e3a1be4e0948d9cc5c717946750c27643c9c"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

