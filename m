Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF426C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 10:21:57 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.12427.1711621309681572252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 03:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YQT8jMJO;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e782e955adso738643b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 03:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711621309; x=1712226109; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oRLFxkyXz70Cx4Eo+88QNtKc3lI5OYLDpxG3GFpeMAA=;
        b=YQT8jMJOwdwHNyEumuuhBrl3MwygtizwvAtUIu27cr/B3HKDXZoRdFJ93GVvGOT62A
         tGUQqXbM+kPNRJnxiDoq3BPAW1Obz7bpp2t3+MAXY8+MOWmAbiuPS9BC5PmMx35T1/9W
         jw8Z5cevwdW5gwlqLEpk9ftYGao63vH2eersA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711621309; x=1712226109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oRLFxkyXz70Cx4Eo+88QNtKc3lI5OYLDpxG3GFpeMAA=;
        b=ApzYmhkTxfPspj41X7Tczfp86xAPL8L9cD/fmc/4REshioBvixjvxwJs18NDKgCpkM
         ur4P3T2OmQzF5fWxMeSxVc3XoLFoFEgTqPXGbP139Dl9lavcWVxvCkQXEC5huwZZHIFe
         wREbHH9XfY/Gs0zpI9k6ml1qEp/WxHBhUHc5ARK0gADOsPtbOw18JvA7fuUULgXkK7Nq
         ru0SWg67n5WgdzRyXPWWHDco3rocGJSRUAq3kEqtagY4yKAoxNz4xEIAnT+GGxdbCqQ6
         o6QJXX7KwmDmVeaV3ItQ51UVJDRc8x4W520/sM5YCv+OzqDcsfduv5G2TqVbTwx2JXEk
         3Krw==
X-Gm-Message-State: AOJu0Yy56VbzTvX0zBTXDq+jXXBDpJLszXsa/U/8fI3FYEBCZESpjp7P
	A7/l0wdTXsor7uJ8J287WhFSFuL0tEbR+af3xWZU32WMZG4tQED64cB8HOGknIJU4YziAhlGIQn
	W
X-Google-Smtp-Source: AGHT+IF6g2jef+3lWUDg8s6hfn6+5n0eXSo1jNpnULUCMPkhkIjGkcvWgSPDDKjCn6ray4dA/yt2LA==
X-Received: by 2002:a05:6a20:958f:b0:1a1:87b5:298b with SMTP id iu15-20020a056a20958f00b001a187b5298bmr3286972pzb.21.1711621308646;
        Thu, 28 Mar 2024 03:21:48 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.84.27])
        by smtp.gmail.com with ESMTPSA id o8-20020a170902d4c800b001e0294f17b7sm1193334plg.1.2024.03.28.03.21.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 03:21:48 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Thu, 28 Mar 2024 15:49:33 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-networking][kirkstone][PATCH] wireshark: Backport fix for CVE-2024-2955
Date: Thu, 28 Mar 2024 15:49:31 +0530
Message-Id: <20240328101931.31732-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 10:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109659

Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/6fd3af5e999c71df67c2cdcefb96d0dc4afa5341]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../wireshark/files/CVE-2024-2955.patch       | 52 +++++++++++++++++++
 .../wireshark/wireshark_3.4.12.bb             |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2024-2955.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2024-2955.patch b/meta-networking/recipes-support/wireshark/files/CVE-2024-2955.patch
new file mode 100644
index 000000000..347943d42
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2024-2955.patch
@@ -0,0 +1,52 @@
+From 6fd3af5e999c71df67c2cdcefb96d0dc4afa5341 Mon Sep 17 00:00:00 2001
+From: John Thacker <johnthacker@gmail.com>
+Date: Wed, 6 Mar 2024 20:40:42 -0500
+Subject: [PATCH] t38: Allocate forced defragmented memory in correct scope
+
+Fragment data can't be allocated in pinfo->pool scope, as it
+outlives the frame. Set it to be freed when the associated tvb
+is freed, as done in the main reassemble.c code.
+
+Fix #19695
+
+CVE: CVE-2024-2955
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/6fd3af5e999c71df67c2cdcefb96d0dc4afa5341]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ epan/dissectors/asn1/t38/packet-t38-template.c | 3 ++-
+ epan/dissectors/packet-t38.c                   | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/epan/dissectors/asn1/t38/packet-t38-template.c b/epan/dissectors/asn1/t38/packet-t38-template.c
+index 7b856626865..526b313d054 100644
+--- a/epan/dissectors/asn1/t38/packet-t38-template.c
++++ b/epan/dissectors/asn1/t38/packet-t38-template.c
+@@ -325,8 +325,9 @@ force_reassemble_seq(reassembly_table *table, packet_info *pinfo, guint32 id)
+ 	  last_fd=fd_i;
+ 	}
+ 
+-	data = (guint8 *) wmem_alloc(pinfo->pool, size);
++	data = (guint8 *) g_malloc(size);
+ 	fd_head->tvb_data = tvb_new_real_data(data, size, size);
++        tvb_set_free_cb(fd_head->tvb_data, g_free);
+ 	fd_head->len = size;		/* record size for caller	*/
+ 
+ 	/* add all data fragments */
+diff --git a/epan/dissectors/packet-t38.c b/epan/dissectors/packet-t38.c
+index ca95ae8b64e..5083c936c5a 100644
+--- a/epan/dissectors/packet-t38.c
++++ b/epan/dissectors/packet-t38.c
+@@ -355,8 +355,9 @@ force_reassemble_seq(reassembly_table *table, packet_info *pinfo, guint32 id)
+ 	  last_fd=fd_i;
+ 	}
+ 
+-	data = (guint8 *) wmem_alloc(pinfo->pool, size);
++	data = (guint8 *) g_malloc(size);
+ 	fd_head->tvb_data = tvb_new_real_data(data, size, size);
++        tvb_set_free_cb(fd_head->tvb_data, g_free);
+ 	fd_head->len = size;		/* record size for caller	*/
+ 
+ 	/* add all data fragments */
+-- 
+GitLab
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
index 41c363ad3..75c353283 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.12.bb
@@ -29,6 +29,7 @@ SRC_URI += " \
     file://CVE-2022-4345.patch \
     file://CVE-2024-0208.patch \
     file://CVE-2023-4511.patch \
+    file://CVE-2024-2955.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
-- 
2.35.7


