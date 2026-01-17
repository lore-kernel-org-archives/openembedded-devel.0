Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E3EC98313
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 06:37:28 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3921.1768629183938555164
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 21:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aofGcHVz;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: jackson.james9803@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5eea6f90d7fso1963782137.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 21:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768629183; x=1769233983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAm8G9jf+DdobL1dEZ+4XmxRl+XS+YCiWfZg0CFRUKU=;
        b=aofGcHVzsG62ClctNhHCddPtYO+2yvhi2qMCI0X5smw4yZyAaQimTTpr7sS0Wvm+UF
         zx68/14HZQvDOfLEDby3ujSO9jxmArHbjk8LTmXwVc7iGsyImboEv5lNKyYxrKu3IZlx
         BiGou2Rj3H2A8nq5xPI0LwQIPV2CLuTg96B/cgd/iYDotKcpf0XlEFWAcV5f8Yr69HJL
         D7shyXdiHwGIo+cvpD52jOEesQZa4ZlCp60XRCXzDFlTY0+HcGN/3Ef31DKnQ6OFazYK
         j9H3Og4HNy35tfQ36Wx9LbfKgX06H8TQR9Qd2xgSOVQqrWLDk/r6XHSOOu9eOCCYEZT6
         dDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768629183; x=1769233983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAm8G9jf+DdobL1dEZ+4XmxRl+XS+YCiWfZg0CFRUKU=;
        b=synFoVd9zpijAqFadwZu96VNV73mXC6tb91Hky+DE3r0nkG/L1/XvAu2Aiocte+1hW
         t+Zn2uH8RULf1Ov/2Vs6u83yzAmhXVNNhrdFUT9LpH/ie/7DGGnAHEWE17R7wwe9dTPl
         L2sJsEOYAXghph0tWw9DWONkiUZkUvFVIZ4iyDPcmAWY9psgvfoScqGSq7qYtGxpiLH0
         O723ngVzKsP20J39NWuONFdZUCjjMo0vZI7G8dsdgti6RQ9AFhYayBHCYx0phEvzLAiz
         KijKhJ4Vd18CWQMGvH9BKUumoohCz+nWZcjA4feFX0+8xYBJm2X/CaOkAo2Y6FZAFd56
         liVg==
X-Gm-Message-State: AOJu0Yy0TTd+bDcaFoYzeOTsfuoih3Qi5yh9sV/FewntnuD65NQi4IwL
	IIyCRIleNIQ38Ujbi5jDMxWRnjzOZlxzIu8sbHh0WUAToQbsKn0vsoHeC6YXzub+
X-Gm-Gg: AY/fxX7ViOWKSuN63+nUZNuAS1KTLIRMq3ZN5RTF9jG+iutrB0O74QAWJ4TdW09J9+4
	jC2sBEhXU7GFPs+hUzXorodFJ+PSa2fCAQIslgArv0gNhOtKo8Tp7ZgdOZ2/Th26ZE0lRm2bxhK
	B/XLZhyMmWo/jrYx6OoMLNXFzxVo31X5lR5w0vAWlvVx+RtcTtNiFUA8e1/IbVxaiVLshKOaslu
	9AuwMu7OYbDWHkvZ7FHiOi97/GXbKjoT++DCwN3T2z7pfJJDIEbe3J+3TXnmvXrZ7vTZSuzPFRd
	U5OEN9YqzPz1c34NRkP0/Ji+W+Rj/ryyqGCHW85xg18QFimfYROba4c8u64HLLxnH/45Ubwyis6
	p7DQuuRg7Xm+tQ3/c2o4JE/Rn4+ySLKflSoJ2kxuRHzWwFCVGef5U7/v6rMkW/H7LPLPVpZwahT
	WjkyepOLbV9zuDnlI=
X-Received: by 2002:a05:6a00:8c13:b0:81f:3cd5:2072 with SMTP id d2e1a72fcca58-81f9f7e6a27mr4987051b3a.3.1768628689590;
        Fri, 16 Jan 2026 21:44:49 -0800 (PST)
Received: from LL-868L.kpit.com ([49.206.128.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa129199dsm3458202b3a.51.2026.01.16.21.44.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 21:44:49 -0800 (PST)
From: Jackson <jackson.james9803@gmail.com>
X-Google-Original-From: Jackson <jacksonj2@kpit.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] tcpreplay 4.4.4: Fix CVE-2025-9384
Date: Sat, 17 Jan 2026 11:14:21 +0530
Message-Id: <20260117054421.2653962-1-jacksonj2@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 06:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123543

There is a NULL Pointer Dereference in ports2PORT when the user passes ill-formatted
portmap string to tcprewrite with option -r or --portmap

Upstream Repository: https://github.com/appneta/tcpreplay.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-9384
CVE: CVE-2025-9384

Signed-off-by: Jackson <jacksonj2@kpit.com>
---
 .../tcpreplay/tcpreplay/CVE-2025-9384.patch   | 38 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch
new file mode 100644
index 0000000000..c7333bb723
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch
@@ -0,0 +1,38 @@
+From 570c908c496b420562ed7142b898811cc8c70d3a Mon Sep 17 00:00:00 2001
+From: Jackson <jacksonj2@kpit.com>
+Date: Mon, 12 Jan 2026 08:39:56 +0530
+Subject: [PATCH] CVE-2025-9384: Bug #894 stop on --portmap syntax error
+
+src/tcprewrite -r 1:2 -i ping.pcap -c ping.cache -o out.pcap
+src/tcprewrite -r 1-:2 -i ping.pcap -c ping.cache -o out.pcap
+
+Fatal Error in ../../src/tcprewrite.c:main() line 86:
+Unable to parse args: From ../../../src/tcpedit/parse_args.c:tcpedit_post_args() line 189:
+Unable to parse --portmap=1-:2
+
+CVE: CVE-2025-9384
+
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/pull/946/commits/f6e6ee460ad9fe01e24a1579166b3f7a8c2158a7]
+Comment: Patch refreshed
+
+Signed-off-by: Jackson <jacksonj2@kpit.com>
+---
+ src/tcpedit/portmap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tcpedit/portmap.c b/src/tcpedit/portmap.c
+index 5fe1779..1e54728 100644
+--- a/src/tcpedit/portmap.c
++++ b/src/tcpedit/portmap.c
+@@ -104,7 +104,7 @@ ports2PORT(char *ports)
+         from_begin = strtok_r(from_s, "-", &token2);
+         from_end = strtok_r(NULL, "-", &token2);
+         long from_b = strtol(from_begin, &badchar, 10);
+-        if (strlen(badchar) != 0) {
++        if (!from_begin || !from_end || strlen(badchar) != 0) {
+             free(portmap);
+             return NULL;
+         }
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 866661b4d1..d389e26922 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/appneta/${BPN}/releases/download/v${PV}/${BP}.tar.
     file://CVE-2024-22654-0001.patch \
     file://CVE-2024-22654-0002.patch \
     file://CVE-2025-9157.patch \
+    file://CVE-2025-9384.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.34.1


