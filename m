Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15FEFF885C
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 13:23:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18659.1777209794684739482
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 06:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h0qe5W+f;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so109371105e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777209793; x=1777814593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3eMMfVPqe9YARpMhFOIk3XLXgxfZOPaC3gnduG8xEkU=;
        b=h0qe5W+fxrVQr7c6B0ILOXyh0/FUlriVmxWFRqjNa21A9RjI2YvWCzOaTXSwtzBoni
         mQoQgqQ3+Ww7JQIvEuJGUhqPp6dZZs/GVogGf46Gyp6eXafnW38AM+rgSYKV8RBCc3tw
         38sUoySroyY6KcXNj1+u1hw6/zTUB/BoSin+aPMmWOi7e9SjPbD3AfoPSF1QKJBlUGak
         uwO4eZnyF8JwoUIeZAVYG2MtCIzb+UVJiZoZzBvV5YckVxROaLRg4+NeB5FK4NbWsECy
         N/w5EatR6OPh1LwKTl9btKAEQKtrr3fbnX2j5kt6kcDnCyPdr7R6xnDJPE7wWPWelosy
         amcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777209793; x=1777814593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eMMfVPqe9YARpMhFOIk3XLXgxfZOPaC3gnduG8xEkU=;
        b=I7WJ+DerebLPVVt8x+BZjD+S9kdcGUAYreU6Lk0p5Kae3L4S0WaYVsGqrZriemxs8j
         uV9/IWda3fefbDlkFOJXSNSqPGMqOagUfOMnVfm3xvnuZX4sNePAuXOiZNWBN6iqVZbJ
         SdPAnsEfF84VwYM+Cp346VVdoAe5u7q8hNDl7quZPkbnBxV3y7GgNnUZUBU1ydQcRBzs
         QwGxEVJN7KA4NtSEbUhkQDLt7ed4jkhJ0ihEyf//2vtYaivQyLXwf70E4nqYWmquu8ts
         Z0jWn+u2ZCVAItiu96j9oHAQ/3BhROdOUZBfGdC6ZDMdenKGddm2luYWZKqxCQNw61Go
         w8Tw==
X-Gm-Message-State: AOJu0YyreHNP588OJrTiPxwOHQXypdKItCM4xHAcpLDOaMVIJzdtnYtF
	FYN3PpTV8fYSLUmqjFWDvY+75tbBOo1uhIGzt98/rr0e9Yh3WKQ5j33VzNAqkg==
X-Gm-Gg: AeBDiesg/Zhj11FJ1ZVjQzv6T8Nk1682DfiCMAvEVVpRPrYA6JQl7pWZ8qxVYIQWFFW
	ip6jgU0da01diYnCdpkT7mapoxt/VRRg+M7s7417gDn9ZOqPG+36XUlvELF3bCW0sw4hUSNGmT8
	eoZMSJzu/3oxgANvIYvnte8WomplC4kdviUB38KB3b3z8oVN8o3GJ87NAFSa5XcgUezSNAKmMf4
	SrpPUgBIejoJEqfT6HYLWY/hSjLniNy22wAjiQxt3XBhhN3F2tx+eq+PilIuKSy8KJBvLVYH0Yx
	m+IabJbYEjmd99CvgyfzfgLwCyBMhCkiD6jHjjcOisW9qjaklIBC7IdxBbkJ7S3451xhQa0JIzA
	cKJtpjmzQVtJirADhj18M93PJPMO/NcS0ZRyZnE9YcEkI37mtsO8vik4+I5ZGJTbyFolPZt10/z
	+RnvmOP1EDmktc3pj3VM15XbGTogTu4vc4QE58LKle/Q==
X-Received: by 2002:a05:600c:154e:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-488fb74fc02mr524114495e9.10.1777209792771;
        Sun, 26 Apr 2026 06:23:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c773fsm808392285e9.12.2026.04.26.06.23.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 06:23:12 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libcoap: mark CVE-2026-29013 patched
Date: Sun, 26 Apr 2026 15:23:11 +0200
Message-ID: <20260426132311.4112598-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 13:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126626

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-29013

The current recipe version contains the fix referenced by the
NVD report. Mark the CVE as patched, because NVD tracks it without
version info.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
index e7279013ed..7ea3eba1b0 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
@@ -64,3 +64,4 @@ FILES:${PN}-bin = "${bindir}"
 FILES:${PN}-dev += "${datadir}/${BPN}/examples"
 
 CVE_STATUS[CVE-2025-50518] = "disputed: happens only when library is used incorrectly"
+CVE_STATUS[CVE-2026-29013] = "fixed-version: fixed in 4.3.5b"

