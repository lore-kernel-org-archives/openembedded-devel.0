Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1D7E9273A
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:53:03 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44464.1767019980989491178
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kDF2qNWm;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47774d3536dso72919365e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019979; x=1767624779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDuqar3YEfq3JCW1eRHnPMFowfgqs1E5JH1NlmjbqvQ=;
        b=kDF2qNWmrDc5bOh9Kbp72L6VosX5DwADCBHfD+vl201VFH1eK4VNWhMzMhHHx3e//s
         +5x6D1q+8Z8EsHfo/Y4WolR5Ajprycccuykr7fXbv7UYDfuxoUC04c0G8unpVUMh/LHo
         DSjCjRjBN5aF9l6YM2MQ7OZ6kT74K8qwAvm51OCBYJGj5JlRhEWozxXg5bjfJgr04QbK
         umOWDgl3DkV2mrsVnJYHUN/7Tmo8Gw9GHe8K7wOecCNkVpJzU+e1tpsVRe8WL9AUFb7r
         Xwr5IiPPB2bstZ1j79BRlw50eeCi15z3sdAoM+m5yQI/LGWi3XAersBbH6261S9f83PJ
         RtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019979; x=1767624779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yDuqar3YEfq3JCW1eRHnPMFowfgqs1E5JH1NlmjbqvQ=;
        b=svfVmK1Ymlvs1ioa/Q+uaFTwORdP3eWUx6skNrWo7C+R2pq89EdfEBhPWZOQIvFNr6
         Crrsk3XIFjjVqnqYV6dfTVuxsMd5jzuta+qDXpXGUq7fqv2uHgkouBh2VaMkVOSMS/AH
         FRZNmr7nRBDK/ax92YFcvnBjsHh4feexd8IUhST15UN5WJ1tEmEVxV9Gkh2+k7m26I7P
         2QUqzKsMmjveDvDDFtxlHWriPHClDwbbiuxURiUlB/WfXWTiwWSX9PLViK0H2nplXZe8
         5MdKEMiERKfLC/ooaxtBhPUqovWO8gYwrA58VW0HG4cPZVGY98pYGQ70BTuud6NXpNeF
         4hDQ==
X-Gm-Message-State: AOJu0YxG9tClUk0s/JUGiRhebXmKW42+PcEMyLeT3rq5+658kE4t0C1X
	sLkcLZwW6M6MIKlHH+TB2vFBKl0tNpIq/WYEFnyOMgnkXoV4EnL0EwCrDf/SsQ==
X-Gm-Gg: AY/fxX6OYA2rCFUol/NGTEkE7vpG3Wcvrckbl/2uMlQoUgNDuAvp6uuC+lBKXxO06tD
	qHJ3hQwPoWhAcOyrHhwZYcJcD+UVC0w60WwS0fTw890Uzm6Lhk8pg8+5Io44kidHc7SpZWBmZV7
	o4C7wbvUm/fHVswCwL39mEPdFq9hgDqt98ySO4XfATgchRuNGoQKT3/8dybTlR7FgCiTGoHpdXG
	ABuMSW/pR1VMej6mTwAoBzXBtFPjnqt/FWMzfSSG6nUBY5G+/G56hnV4HsPo/d14T6nqXzQZ3bh
	xEmR6a2uEOy2WpMhW3jIhuGZ92NMC3F3MQhcFAwL2wMkvzBx3D9poSMOFxcjWXE/fdoqVp+t8vK
	S/F1H8Cetzqv/a8ipjtPEDMn3N5lZcEYtfJiFEpSbNVQOsgGyyhhUeSQII/silMZQXZt6YA8LGf
	eZUebXLQVC
X-Google-Smtp-Source: AGHT+IGXOxLw2Iy57FUrpdvMkMvQpgMs0rDn7+BQtYUdSphsD24K3iCRr9bqMfPtjhrmSB2VwBWtqQ==
X-Received: by 2002:a05:600c:6749:b0:471:665:e688 with SMTP id 5b1f17b1804b1-47d18be89d5mr442216715e9.17.1767019979223;
        Mon, 29 Dec 2025 06:52:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm601067785e9.6.2025.12.29.06.52.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:52:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/4] gimp: patch CVE-2025-14424
Date: Mon, 29 Dec 2025 15:52:55 +0100
Message-ID: <20251229145256.489179-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145256.489179-1-skandigraun@gmail.com>
References: <20251229145256.489179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122993

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14424

Pick the patch referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2025-14424.patch            | 34 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
new file mode 100644
index 0000000000..e7821d3109
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
@@ -0,0 +1,34 @@
+From d30875b606085316b1cb7ac1da0d26e5bac0cf2c Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 13 Nov 2025 18:26:51 -0500
+Subject: [PATCH] app: fix #15288 crash when loading malformed xcf
+
+From: Jacob Boerema <jgboerema@gmail.com>
+
+ZDI-CAN-28376 vulnerability
+
+Add extra tests to not crash on a NULL g_class.
+
+CVE: CVE-2025-14424
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/5cc55d078b7fba995cef77d195fac325ee288ddd]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ app/core/gimpitemlist.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/app/core/gimpitemlist.c b/app/core/gimpitemlist.c
+index 6473938..a431519 100644
+--- a/app/core/gimpitemlist.c
++++ b/app/core/gimpitemlist.c
+@@ -345,7 +345,10 @@ gimp_item_list_named_new (GimpImage   *image,
+   g_return_val_if_fail (GIMP_IS_IMAGE (image), NULL);
+ 
+   for (iter = items; iter; iter = iter->next)
+-    g_return_val_if_fail (g_type_is_a (G_OBJECT_TYPE (iter->data), item_type), NULL);
++    {
++      g_return_val_if_fail (iter->data && ((GTypeInstance*) (iter->data))->g_class, NULL);
++      g_return_val_if_fail (g_type_is_a (G_OBJECT_TYPE (iter->data), item_type), NULL);
++    }
+ 
+   if (! items)
+     {
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
index 24281e5dfd..bc55aed06f 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
@@ -63,6 +63,7 @@ SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
            file://0001-meson.build-require-iso-codes-native.patch \
            file://CVE-2025-14422.patch \
            file://CVE-2025-14423.patch \
+           file://CVE-2025-14424.patch \
            "
 SRC_URI[sha256sum] = "246c225383c72ef9f0dc7703b7d707084bbf177bd2900e94ce466a62862e296b"
 

