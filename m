Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A61C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 10:30:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.27002.1679888942933239530
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 20:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aFpuCITA;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id z19so7166459plo.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 20:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1679888942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LxcYL3UQWg6Iugl+iSyDR1F6ip3MVFVEVdAKS4yctDs=;
        b=aFpuCITAQ7JQXrsK1TqjvlsDhtB2bP5X85yxaTnXysqXoaG1wB3ZCEicldmHYjpoAZ
         RBuxJY6Nri8J3hH8s2GpO8G+vWELaKJnN6boyRFtXEdUVGfTuT8o6+1GHjNZNmmgpbX0
         qpR7DL6M5vLdBjcxpCxOO5thHuMxYGTHojkFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679888942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxcYL3UQWg6Iugl+iSyDR1F6ip3MVFVEVdAKS4yctDs=;
        b=inQ9HK/wvkUWTNvYOswzb+8R51LavBE+qrC8ZzOHAtbAzj7lscZXs0mTWwTrQVfokq
         Faoq46x3ck0PBML5QHMH4a8MPm1Hq0NHzgKn9hPa2xbTjwMpNg2evf2AgRHcJkvM/hWt
         23MdZV06YAfvviCzLRnxbYO/CzOqNfb7bxGvo+xjPAryd2jWAV6x78S15kbG9VvpFe66
         m2MvzOxMd5rrH+8tIoWp8q/Vv3crOFeCwjvxMfcY2t938Oek7Sa11Hx4e7oG5UziTd5P
         0FpDwh1TRBB3dZiIkoG5o13IbXSSTD+TKbIKmgwqAHAgYG3Z18Cdwt2EWhUxfe8poIY/
         tDWg==
X-Gm-Message-State: AAQBX9eDxzQGJA/BX8n8vbdDytzHyhPyh+9OXqFe2DZbONDzWsirNiUO
	oNuFVQznCQUh07Ew12RnAuLYP5AI+kugGDJvYEc=
X-Google-Smtp-Source: AKy350YZnn2iGTr9YM2Ac75XwYwN4wCW9P26q8U3Wsd6Cw4JXASRKheQn62co9qmnfXkYPZteNMhlQ==
X-Received: by 2002:a17:902:ce83:b0:1a1:ad5e:bdb2 with SMTP id f3-20020a170902ce8300b001a1ad5ebdb2mr13107829plg.57.1679888941843;
        Sun, 26 Mar 2023 20:49:01 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([203.212.220.124])
        by smtp.gmail.com with ESMTPSA id bf6-20020a170902b90600b001a1bf30cef1sm15048424plb.46.2023.03.26.20.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 20:49:01 -0700 (PDT)
From: "vkumbhar" <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][dunfell][PATCH] dnsmasq: fix CVE-2023-28450 default maximum EDNS.0 UDP packet size was set to 4096 but should be 1232
Date: Mon, 27 Mar 2023 09:18:34 +0530
Message-Id: <20230327034834.9047-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 10:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101777

Set the default maximum DNS UDP packet size to 1232.

http://www.dnsflagday.net/2020/ refers.

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../dnsmasq/dnsmasq/CVE-2023-28450.patch      | 63 +++++++++++++++++++
 .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2023-28450.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2023-28450.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2023-28450.patch
new file mode 100644
index 0000000000..dd3bd27408
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/CVE-2023-28450.patch
@@ -0,0 +1,63 @@
+From eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Tue, 7 Mar 2023 22:07:46 +0000
+Subject: [PATCH] Set the default maximum DNS UDP packet size to 1232.
+
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5]
+CVE: CVE-2023-28450
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ CHANGELOG     | 8 ++++++++
+ man/dnsmasq.8 | 3 ++-
+ src/config.h  | 2 +-
+ 3 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGELOG b/CHANGELOG
+index d1d7e41..7a560d3 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -91,6 +91,14 @@ version 2.81
+ 	Fix write-after-free error in DHCPv6 server code.
+ 	CVE-2022-0934 refers.
+ 	
++	Set the default maximum DNS UDP packet sice to 1232. This
++	has been the recommended value since 2020 because it's the
++	largest value that avoid fragmentation, and fragmentation
++	is just not reliable on the modern internet, especially
++	for IPv6. It's still possible to override this with
++	--edns-packet-max for special circumstances.
++
++	
+ version 2.80
+ 	Add support for RFC 4039 DHCP rapid commit. Thanks to Ashram Method
+ 	for the initial patch and motivation.
+diff --git a/man/dnsmasq.8 b/man/dnsmasq.8
+index f2803f9..3cca4bc 100644
+--- a/man/dnsmasq.8
++++ b/man/dnsmasq.8
+@@ -168,7 +168,8 @@ to zero completely disables DNS function, leaving only DHCP and/or TFTP.
+ .TP
+ .B \-P, --edns-packet-max=<size>
+ Specify the largest EDNS.0 UDP packet which is supported by the DNS
+-forwarder. Defaults to 4096, which is the RFC5625-recommended size.
++forwarder. Defaults to 1232, which is the recommended size following the
++DNS flag day in 2020. Only increase if you know what you are doing.
+ .TP
+ .B \-Q, --query-port=<query_port>
+ Send outbound DNS queries from, and listen for their replies on, the
+diff --git a/src/config.h b/src/config.h
+index 54f6f48..29ac3e7 100644
+--- a/src/config.h
++++ b/src/config.h
+@@ -19,7 +19,7 @@
+ #define CHILD_LIFETIME 150 /* secs 'till terminated (RFC1035 suggests > 120s) */
+ #define TCP_MAX_QUERIES 100 /* Maximum number of queries per incoming TCP connection */
+ #define TCP_BACKLOG 32  /* kernel backlog limit for TCP connections */
+-#define EDNS_PKTSZ 4096 /* default max EDNS.0 UDP packet from RFC5625 */
++#define EDNS_PKTSZ 1232 /* default max EDNS.0 UDP packet from from  /dnsflagday.net/2020 */
+ #define SAFE_PKTSZ 1280 /* "go anywhere" UDP packet size */
+ #define KEYBLOCK_LEN 40 /* choose to minimise fragmentation when storing DNSSEC keys */
+ #define DNSSEC_WORK 50 /* Max number of queries to validate one question */
+-- 
+2.18.2
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
index 8db57edb79..f2b8feac56 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
@@ -12,4 +12,5 @@ SRC_URI += "\
     file://CVE-2020-25686-2.patch \
     file://CVE-2021-3448.patch \
     file://CVE-2022-0934.patch \
+    file://CVE-2023-28450.patch \
 "
-- 
2.25.1


