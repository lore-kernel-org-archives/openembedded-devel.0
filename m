Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2845D1D88F
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:43 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38234.1764835002620484059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/g3JM5R;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42e2b90ad22so264231f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764835001; x=1765439801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KA8XjBRto44Zu9VVyVFytZ8S7rQDQBX6T8Rf6p7yCeY=;
        b=f/g3JM5RBUtyTNW3j4pFjmxfgrPY1Ti+duUJP09h3dUhNAcZugBliBI3VTU2f41KOF
         DDQ5NW11MOc5njYcckA6dGX8dkyowtzZYPp8hqj7WpXpl+RSvkS0zCl+lh23PP+/tRgN
         So5ZYKgDVoDW6Ng65pIcUI9ty2r4bybt/UqwSzlsdokwExsQDWJIYXAZYO0v3jXRXeMH
         iiGEB2j4O4/qHBcb5He1+SOWNwQL+lVHtkD17tQUJ3A/04o8YGrJadPDYbRHiUWg0W19
         xoWnUzxO+15QfIrtkl94SDAG+32DhJFCL22Ke81KfjDuSFky0HtdBdwhYFPHrzoHolJJ
         IFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835001; x=1765439801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KA8XjBRto44Zu9VVyVFytZ8S7rQDQBX6T8Rf6p7yCeY=;
        b=gaBjIK8634vay7I/RM4e83bB/3tfQn4SWM3DwtZ5bQt4ATwvQEOChvoWVpDlNkLwKI
         WEUNHFQfx1xq+zrLXSy2G4SUURehF1706YLmJkm+gAdELa47rLGB7iSr+6EU3w6ZvyLb
         kF0XZKNHrr1NrdkevornYOLYYnPDBx3IAvr6Qc3s+VEuFb5lDLDsq4qw0aBViF1Swy8d
         9NLJNwxEIXr/KCIbbdCi7Ikj5S0RBf56y6FriyAu+kzPf3Bo8KSubnLIJqiZfSqaECPG
         NVCrNkptdKJOv5p0a5jXO41XRopV+lBmFurIW8pCHFOAHh42kLUtIapSH2jrWCwV6LP9
         3iLg==
X-Gm-Message-State: AOJu0YyBgrKaiy0plxx8+lkUg0QtZPp4Y4PpcigKAN0k4qXSg+aPulDL
	I/44nvFp8QWXYA7HniuVIxePzgEn0TzLZY+mZooHUutqxXgaeLJBeIbiN4Vuxg==
X-Gm-Gg: ASbGncviSi2LIhtNkuyXh36IlN129UTJ+7rfIDPKAe9t57T8HpaQrdO1SUzMU/0DUth
	T95VopXaO6ZG8k1qthxFynJp0r+9TyIUGJt6uS4d6xcOvbAX7V4LqHQhjgI87U2IlKFWyv5njQf
	dZY8LC5oymqLQN38X5Mc+jZtFNEWZJ+XNukrBJhwH2cxrHE+jUG53V5H5TgxBOZWRE28VQ0Rnrd
	IwhtCm9hu9DNmy2AojDdFn+L+vxN7e3Jzrb+UO86C3qPww3yWQRMZS4rbXtlfjiz9If917knh5h
	Jf03oAzUZsk/02rD6SvhyUK2Wihjw9hYQQeFqa15hQ5crH8/OkY0MHN7wNamRUCsbBpv2XCq+it
	2ozeRZqQA53RDMtFAIYlTWgQWwppkZhDIiC+A1EI5VPkxFYC1fTA/XcpnpQijK/mRiX08Mvlw2+
	cHQAf2OCVFWKIsOnC16l8=
X-Google-Smtp-Source: AGHT+IETESwCg/KV5Uk+awwaGsMPXDJqbFAvXDjAsytMCw+s/1v/UVkUsOF7HirM3a4MTE2ECKQksg==
X-Received: by 2002:a05:6000:1887:b0:42b:2f90:bd05 with SMTP id ffacd0b85a97d-42f731c3290mr4812598f8f.45.1764835000871;
        Wed, 03 Dec 2025 23:56:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 08/12] xrdp: patch CVE-2022-23483
Date: Thu,  4 Dec 2025 08:56:31 +0100
Message-ID: <20251204075635.1088007-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122310

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23483

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix upstream-sattus formatting

 .../xrdp/xrdp/CVE-2022-23483.patch            | 65 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
new file mode 100644
index 0000000000..7172a8264c
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
@@ -0,0 +1,65 @@
+From 35cca701c753db65d3c05b7ea4fff9bd09e76661 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:21:41 +0000
+Subject: [PATCH] CVE-2022-23483
+
+Sanitise channel data being passed from application
+
+Avoids OOB read if the size field is incorrect.
+
+CVE: CVE-2022-23483
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/35cca701c753db65d3c05b7ea4fff9bd09e76661]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ xrdp/xrdp_mm.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..64ae229e01 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -676,22 +676,31 @@ xrdp_mm_trans_send_channel_setup(struct xrdp_mm *self, struct trans *trans)
+ static int
+ xrdp_mm_trans_process_channel_data(struct xrdp_mm *self, struct stream *s)
+ {
+-    int size;
+-    int total_size;
++    unsigned int size;
++    unsigned int total_size;
+     int chan_id;
+     int chan_flags;
+-    int rv;
+-
+-    in_uint16_le(s, chan_id);
+-    in_uint16_le(s, chan_flags);
+-    in_uint16_le(s, size);
+-    in_uint32_le(s, total_size);
+-    rv = 0;
++    int rv = 0;
+ 
+-    if (rv == 0)
++    if (!s_check_rem_and_log(s, 10, "Reading channel data header"))
++    {
++        rv = 1;
++    }
++    else
+     {
+-        rv = libxrdp_send_to_channel(self->wm->session, chan_id, s->p, size, total_size,
+-                                     chan_flags);
++        in_uint16_le(s, chan_id);
++        in_uint16_le(s, chan_flags);
++        in_uint16_le(s, size);
++        in_uint32_le(s, total_size);
++        if (!s_check_rem_and_log(s, size, "Reading channel data data"))
++        {
++            rv = 1;
++        }
++        else
++        {
++            rv = libxrdp_send_to_channel(self->wm->session, chan_id,
++                                         s->p, size, total_size, chan_flags);
++        }
+     }
+ 
+     return rv;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 29245f3747..f9e2105500 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23480-2.patch \
            file://CVE-2022-23481.patch \
            file://CVE-2022-23482.patch \
+           file://CVE-2022-23483.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

