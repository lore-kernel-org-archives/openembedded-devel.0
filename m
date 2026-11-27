Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8239.1795739798213156318
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uSxmry4s;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f03eeda984so41670115ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739797; x=1796344597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgKsTdfYGcq8KRLvAHxl03TUFbl3WJXUuv3iCXaITPg=;
        b=uSxmry4samvew7orKkzQyNZjkWiv6LhiSzCA2BF0A3f5+LiljNebqWn1+BqaRM5kWz
         chotqlrrphpz5PbWg330MbWz9W1/RrgyVqRyNUIXFw33vpMdaeR6Kbn/88CZsAnzPdWJ
         H2jRJbgQkSIme/sEmG4BKVQ6TDZvVYuZzu7GLw8DntMTY31l8y9aBvjMwTmSmd6CHC/X
         59zkD0Dbuk3iByH7j2vgcOIb3fbCAX8WG210dNeJQjLSha+XYQ9DdT7kCGG3rg/IsJVu
         /wQEulfwtU8joNky4oD7PM25kebiqEOlPS9YLDndUofOxcMuJFBeSY1KV0VqXS3CoVYd
         XnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739797; x=1796344597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CgKsTdfYGcq8KRLvAHxl03TUFbl3WJXUuv3iCXaITPg=;
        b=qeAD88m/rnq7w5/+Qn4+PpxYOsY3QjWKRFy4lFv9GiBXIgZqh/tCEsOyFmz/aqX8Y4
         DA7T8/w7GaKXyZ0cz7w4QFrE3l7IGQMibsVHY1P3ZRlyPwlJhsThSmr8YDpGT8vjl/0N
         lu/NaYS4p6i1g7bRB7/Y1vyR+Q718GjU0ilbqhI7MRRK7Ph3GzSvw360onkR1NCd0pp3
         o70eosqSd8OThrFYIQfSnnfZdUt0oml40wudNLMqWRYvh5YYscA/qvo9R6j7RERQFnxt
         IIw0RrB7ev3Ez0K04wV+ZR2iiXWUGIt7XcOFLlJowVbtsswekSp+5OyoMGz5zKpHz3g/
         HUxQ==
X-Gm-Message-State: APuU4Z8VJBy59oggf/Rqg33+dJmkK5qQu9C8Upc7H1gzxbhHI67wxpIj
	y+MjlDahyg9qqsdsfJ4BPqWdfV9IkKN5rfDJD1JV9d1Rml8h6MVfsBmvHBck6A==
X-Gm-Gg: AZFdTZdHIaDepoydfdJE6buu2rtFvSMnf373TOuX3IifvSfhgVfi9KjJA8CfJHW3yNk
	HhB1jY5D77bOzY+c3FkVd3HcEXK3qzGeGzeOg4ymYjk4o1X7EBfmXnhKauGy4Fse2H9dZNjGUuy
	1Ll1XE2UlJOGiGKbMUTXlrF99tzCMksQtP3UNMAI7kQ8BaHYyiWtjugjalmFzMcj95FPgQ1pocU
	xT0rJxqJSExaCy7rFOf3FO4X/ZACvd8OJtDGWgfDdgKr01mF4PyLRNhN4QG46DzdbYhVd/4Aj0M
	VjhQiumfZwQhQG1hzlQ6R0HFlCPfK+DbhjJiYnSLejY12NHlj02iYIFpd2nqX8Xu0a9z2NUNyQ5
	jhAbPm3vhk8QfhPoDIpKVT+hUHeugaNO6vjm/iOdh9GG/S6Q8xuiSzT8r6rEe1YWiME7mslp1L4
	HyXwpIRP9kaafGT9rk8I8Cw3k2YMw2kEABBCbNmZ0Z6UDpenTXGdpYz8qHRV34j41sVQo2TP9wA
	X7yB5MxwGVFRWAfPq+MqRu4Qduz523AR4sGJQ0UvTDV0WYuH1zkN7/jtk+HVRIySrhtqblVyuFU
	4AvJsIjAGdNS2w2NFpR1hj+2MTPWBjzBD6sIHx0h2EGW/CwGpf26G/vo7uTzfqZKjNbL/7MgfOs
	Bdqy2RaP7hYdI0WN8BUMiqpxsfVm3chYDQPrcKEy/EK4vpGllbS5Fq/M7RxysKRuQPf12eZQjEn
	j9S82xsaYufC0ibq6lmFbX4B+vmF4/fRp0bMXa+DUck79pr74FrvP/5xt8xn4ljuZFrnwnk8w7n
	0xQQpcr1lf/4NSjpRQh9b8WPNIgdhbdfx/WUDjdbAku+856rTj5V3zw/pypg5MesWEFbbYhylUl
	A6UU
X-Received: by 2002:a17:902:ef4e:b0:2f0:4ebf:84e5 with SMTP id d9443c01a7336-2f04ebf8708mr227648935ad.45.1795739797492;
        Thu, 26 Nov 2026 16:36:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 27/39] python3-drgn: upgrade 0.2.0 -> 0.3.0
Date: Thu, 26 Nov 2026 16:35:31 -0800
Message-ID: <20261127003543.2167775-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133197
Content-Type: text/plain; charset="utf-8"

- Main focus is hardening against malformed or malicious debugging
  information and core dumps: many memory safety bugs, undefined
  behavior, unbounded recursion and missing error checks were fixed.
- Much faster QEMU guest debugging, reading guest memory directly from
  the QEMU process when the QMP connection is a Unix domain socket.
- Support for Linux 7.2 and 7.3 changes (irq, path_lookup(),
  cfs_rq_for_each_entity(), fsrefs.py) and a new irq_get_nr_irqs()
  helper.
- Add LoongArch64 architecture support.

Only SRCREV changes; the build system and dependencies are unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../drgn/{python3-drgn_0.2.0.bb => python3-drgn_0.3.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-kernel/drgn/{python3-drgn_0.2.0.bb => python3-drgn_0.3.0.bb} (97%)

diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb b/meta-oe/recipes-kernel/drgn/python3-drgn_0.3.0.bb
similarity index 97%
rename from meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb
rename to meta-oe/recipes-kernel/drgn/python3-drgn_0.3.0.bb
index 0790917118..66afc09e71 100644
--- a/meta-oe/recipes-kernel/drgn/python3-drgn_0.2.0.bb
+++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.3.0.bb
@@ -6,7 +6,7 @@ LICENSE = " LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c83d30e99508d6b790eacdd3abab846"
 
 SRC_URI = "git://github.com/osandov/drgn.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "818b5a7e8a4db82a1e0326667e7afaec5bf5fd19"
+SRCREV = "1bc2cc580e75bb09d95550ac7179432ef7f8810b"
 UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 
