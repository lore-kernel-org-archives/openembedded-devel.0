Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0CACA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 05:36:28 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.44030.1756704978296426414
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Aug 2025 22:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fQiAHsY8;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77246079bc9so1241029b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Aug 2025 22:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1756704977; x=1757309777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nALAIBs6eISwJy2P4+IIJoYPuQ1WPhywlocRBD3jG6M=;
        b=fQiAHsY8++yRgR13W8YcwiXpJY4+cy3xbSvLwOBxc+HofI5bX33gHZ02WUrggNEsFm
         ChE76bWDFm2dlcxvCd+Ns6ljYjnjb3cz9GzLrNHUAYj/ANVcF0uAaq6kIscQllsaT22m
         xK9oc/ytmLGXKQUzqY3ufi7O5y5h2vWEflKUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756704977; x=1757309777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nALAIBs6eISwJy2P4+IIJoYPuQ1WPhywlocRBD3jG6M=;
        b=iOyqFpDYItnQgTHBnZHOPlIonPaggPQDT4nWY0js6ntqJ66prTW0EvpgrE38AZJTdL
         ftYKv5mtcOC7Mp5aszjOaeTJnrNKHN1+dEn1w6rEkM7McIqJIIisvsUfNMWVMpIPOXqx
         5Mxw8b3SaxrrBMd3MzkhSySd63CKmOCK6Gs8v2Nf7tGNNtCE+ki+/Q45H20MtwKSO7D4
         awP5h6oe7hLD2exn9ID/vY8+HQ+hyG08POrSDMGz2nuMZR1f2OV3PrfjjgXN3zVcVgKi
         7GVJbu1P1Afw7K4gNw5OqTDmxCX/BpfO51CCCN4tUpfFnlU3udFowiWdRpEFMbfKaaxM
         8keQ==
X-Gm-Message-State: AOJu0YzB/1wvpoQM0CbDHoNhO6br42yp2ub+DtIRJBrDGAUcpqqkEzFO
	rX5WrkF9ryXjIWh5dZXNI8I6VuySKoFsdorpe/UTpgmNoF57MSv/ZUjHUBmKV0Oz4hqTGDjw2C+
	BVmTr
X-Gm-Gg: ASbGncuUWiHeb9muOd6LBNGOj4dsYkv0ul/FqKau4kkiBFsJIyQZrjjSNZxMP2k/tOQ
	k6Uvxv4ZKA0U9GIyt1OkG7P01ONaywiVVsmWMYG4tOnLq6pLYh3GgDDqzbktxaQTIUBFz4eNfI4
	DF9RyzsyXjZDbPxGuH6YR78ySOAvme5NrNTSEJzV/Oup2eFXQXp0OQNiLk9bpXjp6MfzY1JDbZL
	8XDax+tIikzzrgcQnKropKr20vzPIji0wuXbGL7QykgWMKjBoAIPNy6b5f6q++fGXfH17LIkNLQ
	aIcImKkLh2tm3/Y+nCpMxucMSdXgVzqFaGf09FjixfV/cN9Mw1hwHwOrowhRLbTER4hpjT8Z7ho
	XBQnQZ6LzJEzRkRNbrA2udcmGpF+YszPUM/CYAgLytIktF7E=
X-Google-Smtp-Source: AGHT+IHXrtrlk5lI/+ZWjvLe6u4M56R3ipwhryDtBVXC6LXl89Y3XZx7aWAWCaw5tIv5Y5y84z/8gA==
X-Received: by 2002:a05:6a21:3381:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-243d6dff2e0mr8665926637.13.1756704977383;
        Sun, 31 Aug 2025 22:36:17 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e01b21dfsm5106967a91.2.2025.08.31.22.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 22:36:16 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][scarthgap][PATCH] libssh: fix CVE-2025-4877
Date: Mon,  1 Sep 2025 11:06:10 +0530
Message-ID: <20250901053610.64593-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 05:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119152

Upstream-Status: Backport from https://git.libssh.org/projects/libssh.git/commit/?id=6fd9cc8ce3958092a1aae11f1f2e911b2747732d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libssh/libssh/CVE-2025-4877.patch         | 57 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch
new file mode 100644
index 0000000000..afea52c5b5
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-4877.patch
@@ -0,0 +1,57 @@
+From 6fd9cc8ce3958092a1aae11f1f2e911b2747732d Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 15 Apr 2025 11:41:24 +0200
+Subject: CVE-2025-4877 base64: Prevent integer overflow and potential OOB
+
+Set maximum input to 256MB to have safe margin to the 1GB trigger point
+for 32b arch.
+
+The OOB should not be reachable by any internal code paths as most of
+the buffers and strings we use as input for this operation already have
+similar limit and none really allows this much of data.
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit 00f09acbec55962839fc7837ef14c56fb8fbaf72)
+
+CVE: CVE-2025-4877
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=6fd9cc8ce3958092a1aae11f1f2e911b2747732d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/base64.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/base64.c b/src/base64.c
+index 4148f49c..f42e0e80 100644
+--- a/src/base64.c
++++ b/src/base64.c
+@@ -29,6 +29,9 @@
+ #include "libssh/priv.h"
+ #include "libssh/buffer.h"
+ 
++/* Do not allow encoding more than 256MB of data */
++#define BASE64_MAX_INPUT_LEN 256 * 1024 * 1024
++
+ static
+ const uint8_t alphabet[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
+                          "abcdefghijklmnopqrstuvwxyz"
+@@ -274,7 +277,15 @@ uint8_t *bin_to_base64(const uint8_t *source, size_t len)
+ {
+     uint8_t *base64 = NULL;
+     uint8_t *ptr = NULL;
+-    size_t flen = len + (3 - (len % 3)); /* round to upper 3 multiple */
++    size_t flen = 0;
++
++    /* Set the artificial upper limit for the input. Otherwise on 32b arch, the
++     * following line could overflow for sizes larger than SIZE_MAX / 4 */
++    if (len > BASE64_MAX_INPUT_LEN) {
++        return NULL;
++    }
++
++    flen = len + (3 - (len % 3)); /* round to upper 3 multiple */
+     flen = (4 * flen) / 3 + 1;
+ 
+     base64 = malloc(flen);
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 64835c5e08..48cb47d4c0 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-5318.patch \
            file://CVE-2025-5351.patch \
            file://CVE-2025-5372.patch \
+           file://CVE-2025-4877.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.50.1


