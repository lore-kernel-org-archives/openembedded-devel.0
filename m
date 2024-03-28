Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90A0C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 10:35:17 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.12618.1711622111121605734
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 03:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kf4LM9xV;
 spf=pass (domain: mvista.com, ip: 209.85.160.51, mailfrom: asharma@mvista.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-22963f0e12cso402297fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711622110; x=1712226910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BVkmwRHi6SJBgv2N2wgHser3jH+vt5jLcrVQTbtr4l4=;
        b=kf4LM9xVm1gAqf/tAn5nlWM+dLC4rO94ODU+zYbj3EePR0yHwX/CybKWC6Z7LO9Knz
         WkFWQW3HhyvIOyKNPo6xj7IrcY1brssZX1AWG+85UGI9Qo+gqD7MlWUwbzSvQHReUtN2
         rHWLqqmj4bWR2RGNrATsLZZ+vEaiGbLj8ghV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711622110; x=1712226910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVkmwRHi6SJBgv2N2wgHser3jH+vt5jLcrVQTbtr4l4=;
        b=Oq3F2E6z6IC6hX/8qgyrn1WfSW1pjow220mIRTuNFlI+mk5y6XSQWA4uzNEum1JuSj
         E0hD29JGZ2p8r6NgyprTw+NS//lgeHk8fSeblNgyQoaxFC4RGIVv71eyzX56JhKwFw5D
         EaeJIDc5rq9DnpIvCpXhZyJMgcWG9FuXWtKYjzRR6soKDEH8vroj/OJPmK04drVh5fnR
         wp6E3FKDwUV/nHFmhOlAbyjWlAHMGq1gU7cDl+cGByif38A9uSMHaUJjfleZV+Dmr//M
         CcHSLJE3SNiUhEO+GbfVWicLN8UcDPuxa502Xh0IgV4rc1f50MSfTWfioKx/M213Eg9C
         dXqA==
X-Gm-Message-State: AOJu0YzA6fbpraxv55hLQAztu2492xdKffXiE4/mYY8UsWTQ/RPt2I59
	xBENQ/v403CA4FlLDoZCaySAKH8o664MDK0+EhHykqjyjb+nNt9ECBAD/cKiuy3S0CJ3QekPjEN
	+
X-Google-Smtp-Source: AGHT+IH/Oq6ZhZq7dxBbSdnfgH58PV40qQA812wgRQ+cWeBHtJTL2MWODu28tnrSP9ZPnOR/xGwURA==
X-Received: by 2002:a05:6871:a90f:b0:229:f4b8:2dcf with SMTP id wn15-20020a056871a90f00b00229f4b82dcfmr2369630oab.44.1711622109942;
        Thu, 28 Mar 2024 03:35:09 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c67:8415:6942:d0d5:ad4f:de86])
        by smtp.gmail.com with ESMTPSA id v17-20020aa78091000000b006e6a684a6ddsm1043304pff.220.2024.03.28.03.35.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 03:35:09 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Thu, 28 Mar 2024 16:05:03 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [oe][meta-networking][dunfell][PATCH] wireshark: Backport fix for CVE-2024-2955
Date: Thu, 28 Mar 2024 16:05:02 +0530
Message-Id: <20240328103502.1939-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 10:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109660

Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/6fd3af5e999c71df67c2cdcefb96d0dc4afa5341]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../wireshark/files/CVE-2024-2955.patch       | 52 +++++++++++++++++++
 .../wireshark/wireshark_3.2.18.bb             |  1 +
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
diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
index 8054cbb5a..6e1e23e1d 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.18.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2022-4345.patch \
            file://CVE-2024-0208.patch \
            file://CVE-2023-1992.patch \
+           file://CVE-2024-2955.patch \
            "
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-- 
2.24.4


