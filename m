Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8841.1792456231446229334
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 17:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OsSSJZEF;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35aa0cf7c40so5309822eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 17:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456231; x=1793061031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBvcrh7mKqrEcdgzXs6YU/peUPFsGMcqifqBn0USM90=;
        b=OsSSJZEFjeFseabeXTe6SGDaaSXGagnxN0q8JGYBnALxJWtv4LSD658/ryU5PqphSq
         nvEZy0BJpT2CNRwu/PWZmd/BGkZXdiK5v+5YfvFbBNIh1dfOUE/0+BCCpTp6seEcTJmt
         Oz63J8m3V8abfpd7Q5Rn8tGhWfJKgp5rOdK2LkQtciUqP8qMM53IEprsQUx2/AqdLuRU
         STOdid8J4Jum2dLIEstiyqSdxm6eF07pcaWqId2EchylFbwXX51mHNP9csS4WjHPB7Dd
         LnpIh8a65HHn82BYqsJ/tUxvgE7B7VB+cchnaxOtabiro103DIPh4aX+sDs3OYGofJOw
         i72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456231; x=1793061031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBvcrh7mKqrEcdgzXs6YU/peUPFsGMcqifqBn0USM90=;
        b=Pxy7eP7Se4RRXd1HTZlJ7IvNclqF0B3jKrYRvOF35e2idl+bziaxlgngCqpeTuvoq7
         QA9K3d4WkmQg/0tmjSUl4iWZnGRhtRliyJ56qIbhvAjvLXWQUrQj3j3qgw9hBp8HTBu9
         37pYJNOIfn/V/74BlLAzPy6lm45aO+/1S3KgeZBi+TwqVwmuQUweWMCaMxHKEm7dCErl
         Z+X4FRD3DEYebVdfB9EiL90IbDaYHUDq/l67PQAzEGVfsP8b1y/PF3h1wdbu7xgZYqdY
         GLJHZuT8na+hCPm2nwhu7tc4LD/v5nfSuU14U11RolXz+C9EGkzFr+PmzX5PXeCFzmIm
         qNrw==
X-Gm-Message-State: AFq9FYJd96xNEUEOndIqFHPA8f1JmrEmet9vcFzRt4oh1d+VXBAIbBK0
	QnwwWAm3vr8MQcIUYHrbpeXrBtJFad7uqCSQ2GOvw4+yPswkmHjeoZ03WTylF/cnI3o=
X-Gm-Gg: AYBFou1zv5rIgSAqLDS6zkaDOIQvWEQVwqrPNShbWJJ65Ijbzfz/JrYx6ahu/2OkQp6
	ktzOQ2YIb47HF9qgKktc76D6yvRwn0LGZe4emKyGeOe7pMGIxa1A5vhFIdYqQtUB7J9xufEIWnJ
	d24w+v9RFiRdj04czQ/R7rIEMmEcrgKRp5OyZpAySEfOAqN8AoEp0tavYDAnPBe/GyFx171oJj0
	632iHmxsjtGlMNzHRA49NME73LCbAnDCFp4d4IWyoSe1hWEV74/QVSROjl6NQ3YRDPwZFKBP3Wm
	LYDcMBzW2WkkyrBX7j0Cx3c38p1XORHuH+98wAJCgJ5JoAHluO5nbBr6ptyxx6quD8zKS15+TWS
	eKXCVE0G9gUGP2uXVsynJbu4vwJmU9NtghGH8bkSpmv02nlKOImM/Nt7J7woLq2p953I+HNUfiD
	tqIkg1eSR8WTPTpssBgsmKGZvZZirrURDenffZDej2C+5VLsmq7tuRLHKm8o32JE8yRW+7O+s+W
	ZgLKk5ISAM+MCaoFFJ+/cYIvemdLfa6D9F6/BlpDoy1Scvge6cLiXyUhUI+Z11D41iSPEdfY7ZW
	X3IG9wg9Qfr6/3OEMlEnmibkvjGEw9RxKVwNj1twlckIMxUdcHcEebEGcv7Uwbb7MxhehlqK0B4
	/TIe9SRzp2aN89S37GxGAIpIWXnBqoa2jftAB9d8P8GoNy4RQm8sct3pI9I6ENa3AP6Z4Hzi+k7
	QgaxfBfIwwUJ5bDL1BfJ2Va5smOrQ/vTWyJjrLxwa5xq5TFYq82TufJ6mm7NQGfV4slblEWvNDo
	K+8fxZSgShjmRzVDxO83UtbTXGLRWk=
X-Received: by 2002:a05:7301:470e:b0:358:8bd2:fda1 with SMTP id 5a478bee46e88-361a2649752mr12619839eec.30.1792456230685;
        Mon, 19 Oct 2026 17:30:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm35596579eec.13.2026.10.19.17.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:30:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 4/5] dlm: Define __always_inline for musl
Date: Mon, 19 Oct 2026 17:30:21 -0700
Message-ID: <20261020003022.1913623-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020003022.1913623-1-khem.raj@oss.qualcomm.com>
References: <20261020003022.1913623-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 00:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131150
Content-Type: text/plain; charset="utf-8"

dlm_controld's rbtree headers were copied from the kernel and use
__always_inline. glibc defines it in <sys/cdefs.h>, but musl does not,
so the build fails on musl:

  ./rbtree.h:153:8: error: unknown type name '__always_inline'

Add a patch that provides a fallback definition in linux_helpers.h.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ine-__always_inline-when-libc-does-n.patch | 34 +++++++++++++++++++
 .../recipes-extended/dlm/dlm_4.3.0.bb         |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-extended/dlm/dlm/0002-dlm_controld-Define-__always_inline-when-libc-does-n.patch

diff --git a/meta-networking/recipes-extended/dlm/dlm/0002-dlm_controld-Define-__always_inline-when-libc-does-n.patch b/meta-networking/recipes-extended/dlm/dlm/0002-dlm_controld-Define-__always_inline-when-libc-does-n.patch
new file mode 100644
index 0000000000..bddfbf9453
--- /dev/null
+++ b/meta-networking/recipes-extended/dlm/dlm/0002-dlm_controld-Define-__always_inline-when-libc-does-n.patch
@@ -0,0 +1,34 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 18 Oct 2026 18:30:00 -0700
+Subject: [PATCH] dlm_controld: Define __always_inline when libc does not
+
+rbtree.h and rbtree_augmented.h were copied from the kernel and use
+__always_inline. glibc defines it in <sys/cdefs.h>, but musl does not,
+so the build fails on musl:
+
+  ./rbtree.h:153:8: error: unknown type name '__always_inline'
+
+Add a fallback definition to linux_helpers.h, which rbtree.h already
+includes.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ dlm_controld/linux_helpers.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/dlm_controld/linux_helpers.h b/dlm_controld/linux_helpers.h
+--- a/dlm_controld/linux_helpers.h
++++ b/dlm_controld/linux_helpers.h
+@@ -3,6 +3,11 @@
+ #ifndef __DLM_LINUX_HELPERS__
+ #define __DLM_LINUX_HELPERS__
+
++/* glibc provides this in <sys/cdefs.h>, but musl does not */
++#ifndef __always_inline
++#define __always_inline inline __attribute__((__always_inline__))
++#endif
++
+ /*
+  * static_assert - check integer constant expression at build time
+  *
diff --git a/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
index 1c09a35d0a..fab31c1b99 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.3.0.bb
@@ -8,6 +8,7 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 SRC_URI = "https://pagure.io/dlm/archive/dlm-${PV}/dlm-dlm-${PV}.tar.gz \
            file://0001-Include-sys-sysmacros.h-for-major-minor-macros-in-gl.patch \
            file://0001-make-Replace-cp-a-with-mode-preserving-options.patch \
+           file://0002-dlm_controld-Define-__always_inline-when-libc-does-n.patch \
            "

 SRC_URI[sha256sum] = "8dc23b97390236032a2fe19068c7dad23f82fb624732c9bff6898b6996c9b700"
