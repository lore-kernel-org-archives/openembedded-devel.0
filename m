Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42ACE6918E
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 19:01:47 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.32544.1732302098212569691
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 11:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hPysZcsD;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ea8b039ddcso1995231a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 11:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732302097; x=1732906897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXjDjxtBDUONfnFe1kp0IXpY2V463o/GwPTRuuj/rSA=;
        b=hPysZcsDTca1gzfra+fPnjoGKfzUv8KBoxh0mSaSDaLYqJ9WkX4FPYTmmljeJH/5cd
         7HDtFGTSoHu6HUWP+EuMYKPHSk2bAOcEuztqU4iTsetbVYlEBL+HFvIsf5XyHKNsU/CD
         bVsrQPs/KJlQFoBqmBB1UQ70T+GVuPTKYNTqxF5PzFDHEudoBRzz98Yn3aE0gz8g/uqF
         JuWUY/A3zPHLMxDkAFnYFmOGik7F+GpS5Ngbri/N8AhBDcJO5lQF+IY1aB3g4k+/Kt6K
         twLhTYmuhsoBp0fdvt/UqVB4XS7XVY+ldgfS2/AtJfzuCuVvvH6EZqlkfbRvCmvk2c4X
         a8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732302097; x=1732906897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXjDjxtBDUONfnFe1kp0IXpY2V463o/GwPTRuuj/rSA=;
        b=bMJfrBxkSpEIedS3sePN48Rv1oMrxhXpTQOJ9/YYyePpz3DgFgTtwiafGiV/H43qzc
         f5PRTXTb6iZlEbPnyW78C/wmLptmT/mNWhWCEzwCbg16SdDyJjvEmK7v9JUKqBmopZUm
         Iy9+2eKLKR86GnLo1Vrztx8ySTrWhfYG1ejYcFVRpOa7s0jnYUZYLDqZV6eNhEfuR5iN
         CcCdDXMdVJse/riOgX9IAkbdDg8QU+Vs+Pq4CCZ2BcmEjrxpocdj94KwpnDw61F20AzZ
         nVhX1Oq9ox7scwQwmSDiyLAf6eM4JwuD6ptBiJWbCiBmhQRgdsm3Hnxgp/1w0DnAP2VV
         8QTA==
X-Gm-Message-State: AOJu0YwmzzBEbSY3eDjL2WmXFkg/Ybq/X7k+X7nePJFsiwPpGp+01VoD
	PKzZIOxkEZ60vfYZWXYCRC1pX4Yqfyda1jt1BNUOOHbEBG+R+i1gXxiMzA==
X-Gm-Gg: ASbGncvAgTMW3uZdILDhZ8FFCtr+lCPBZm5xWHBSBtTNNvmZTqicJ1fH9P+KaVe8p9o
	dqSZ8i4eXJHAGPEK3PoOUST3iqLBbhMh6EKCQ8TTtIA56LqgYGGBTZPiS3lEFMERRCINF2iasO+
	/UB8h0ggg3jEXAjxUtBzcGpYqKUK3+9UfQKzlY6JqiNg9kH3DT1x6z6nIsfZ9cwdNO27t+WPGwa
	emWM7+yzV5keCw+CIRN0JEYeNSSjqnoIJi+2KtzuCWmmK65Zfs=
X-Google-Smtp-Source: AGHT+IEJ7Vp0zjSTFXi8pvpGHHZMRzT5dH17spkwsgmrRpueMdK6Rqun0f7Ohu9qotWnM6dS0TjiIg==
X-Received: by 2002:a17:90b:38cc:b0:2ea:3f34:f18e with SMTP id 98e67ed59e1d1-2eb0e866c8emr4090800a91.23.1732302097231;
        Fri, 22 Nov 2024 11:01:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead04d2cf6sm5500166a91.37.2024.11.22.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 11:01:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] keepalived: Backport fix to build with musl
Date: Fri, 22 Nov 2024 11:01:31 -0800
Message-ID: <20241122190131.2810521-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241122190131.2810521-1-raj.khem@gmail.com>
References: <20241122190131.2810521-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 19:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114009

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...clude-linux-if_ether.h-if-not-needed.patch | 34 +++++++++++++++++++
 .../keepalived/keepalived_2.3.2.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch

diff --git a/meta-networking/recipes-daemons/keepalived/keepalived/0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch b/meta-networking/recipes-daemons/keepalived/keepalived/0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch
new file mode 100644
index 0000000000..f6a38668ee
--- /dev/null
+++ b/meta-networking/recipes-daemons/keepalived/keepalived/0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch
@@ -0,0 +1,34 @@
+From f129c588f7c8a66e595d8ae96a43d585018e79cd Mon Sep 17 00:00:00 2001
+From: Quentin Armitage <quentin@armitage.org.uk>
+Date: Thu, 7 Nov 2024 11:09:43 +0000
+Subject: [PATCH] vrrp: Don't include <linux/if_ether.h> if not needed
+
+The musl headers do not allow including both <linux/if_ether.h> and
+<net/ethernet.h> since they both define struct ethhdr.
+
+It is likely that we do not need to include <linux/if_ether.h> at all
+since with both glibc and musl including  <net/ethernet.h> is sufficient,
+but removing <linux/if_ether.h> is for another day.
+
+Upstream-Status: Backport [https://github.com/acassen/keepalived/commit/f129c588f7c8a66e595d8ae96a43d585018e79cd]
+Signed-off-by: Quentin Armitage <quentin@armitage.org.uk>
+---
+ keepalived/vrrp/vrrp.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/keepalived/vrrp/vrrp.c b/keepalived/vrrp/vrrp.c
+index 96b2c4c8..4b06e387 100644
+--- a/keepalived/vrrp/vrrp.c
++++ b/keepalived/vrrp/vrrp.c
+@@ -40,8 +40,10 @@
+ #include <netinet/ip6.h>
+ #include <stdint.h>
+ #include <net/if_arp.h>
+-#include <linux/if_ether.h>
+ #include <net/ethernet.h>
++#if !defined ETH_HLEN || !defined ETH_ZLEN
++#include <linux/if_ether.h>		/* This may not be needed at all - try removing and see if any issues raised */
++#endif
+ #ifdef _NETWORK_TIMESTAMP_
+ #include <linux/net_tstamp.h>
+ #endif
diff --git a/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb b/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
index 2cb76e6d41..c0a2e57bfb 100644
--- a/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
+++ b/meta-networking/recipes-daemons/keepalived/keepalived_2.3.2.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.keepalived.org/software/${BP}.tar.gz \
            file://0001-configure.ac-Do-not-emit-compiler-flags-into-object-.patch \
+           file://0001-vrrp-Don-t-include-linux-if_ether.h-if-not-needed.patch \
            "
 SRC_URI[sha256sum] = "77f4a22e5a23fa8e49b8916acdfb584c864e72905a2f1de2a7f62ed40a896160"
 UPSTREAM_CHECK_URI = "https://github.com/acassen/keepalived/releases"

