Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E3EBF77EE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 06:32:28 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id k3so1764553pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 23:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8u8Vy5Oam1VB3yjY1qy/byfDrJuMD5PoXwQuxCJRTrk=;
	b=ohwnPbTCMUck8EPZA4zvEHr1+jBMeBddCdzhQoWKPkkAn9vqgVoULPsav9mklCUXHQ
	qysOBRXm8x3SD+hJC5+j7YX4rarjxhXknadhPUb1SM9xvb5SbIUquiZ/R00SQnIp8KwW
	yg3O05HqeJtQAhWUyKFOJ9oJHOtYxPXWFT92Cy1kr/gDoBdRfj/5TbrhcohVzTGgtmOa
	J7HsliFChDjI67ZmmTu0O4eSrB1e4la5XI1OaUZJDnrBTg413+W5FMQFUgwn71j+jCzc
	BT5oIngk3+0Ee4JAEyLxhQrKALiJkLHhY4cyKQYocIExMXc90I1e3lGjnegVlmXYqoTv
	MVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8u8Vy5Oam1VB3yjY1qy/byfDrJuMD5PoXwQuxCJRTrk=;
	b=W4ZPiBHI0/9rwVgwq5QWz0lP3dR+akOSHI+qMQviLlo3iPe/l8w57w/Q25sFnIxAaa
	HKyEnTmJbMSZ8mAle3Fr+Ohsr9VT+p1PnsA6ZFv3V4VZ6AJ96CK16FyHhgRb/974jxGd
	skLRp6w4VkirV/bLcvcEcpFdFFy//mioU9BrDr3+GGsIx7psWv9UU8YqMclkmg8JzkXK
	c2o1aV3QN4nWhBMi2q0hkWMDHLziDTwFXTJVV3s+aAnxeNLZO1hhmIs7DdCkEpLe06PT
	2crfUM2d3srM6wIVyaGUfy2izBMYOa1nVklKPfjW0yyEG80ALCIDLZx7qJeyg9exF8ea
	YsDw==
X-Gm-Message-State: AHYfb5gcluQoc01ZjjNUNpfskuoJLp5vyp/GZUV0R2ishzq5/xV92kLW
	0erZyONLxkUuahLP
X-Received: by 10.84.217.213 with SMTP id d21mr3715198plj.225.1503988349920;
	Mon, 28 Aug 2017 23:32:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	c14sm3629272pfm.151.2017.08.28.23.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Aug 2017 23:32:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Aug 2017 23:32:19 -0700
Message-Id: <20170829063219.1039-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170829063219.1039-1-raj.khem@gmail.com>
References: <20170829063219.1039-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH V2 2/2] iscsitarget: Fix kernel with new 4.12+ kernel
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2017 06:32:29 -0000

Fix patch to be able to work kernel < 4.12.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
changes from:
v1 -> v2:
- Fix build with kernel < 4.12.0

 ...vent-netlink_ack-now-requires-4-arguments.patch | 40 ++++++++++++++++++++++
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  4 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/0001-kernel-event-netlink_ack-now-requires-4-arguments.patch

diff --git a/meta-networking/recipes-extended/iscsitarget/files/0001-kernel-event-netlink_ack-now-requires-4-arguments.patch b/meta-networking/recipes-extended/iscsitarget/files/0001-kernel-event-netlink_ack-now-requires-4-arguments.patch
new file mode 100644
index 000000000..4426d3552
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/files/0001-kernel-event-netlink_ack-now-requires-4-arguments.patch
@@ -0,0 +1,40 @@
+From cbc5f8151017f45231b75a826f18354a81c287c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 07:52:59 -0700
+Subject: [PATCH] kernel/event: netlink_ack() now requires 4 arguments
+
+see https://patchwork.kernel.org/patch/9670181/
+
+event.c:32:4: error: too few arguments to function 'netlink_ack'
+|     netlink_ack(skb, nlh, 0);
+|     ^~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kernel/event.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: iscsitarget-1.4.20.3+svn502/kernel/event.c
+===================================================================
+--- iscsitarget-1.4.20.3+svn502.orig/kernel/event.c
++++ iscsitarget-1.4.20.3+svn502/kernel/event.c
+@@ -6,6 +6,7 @@
+  * Some functions are based on audit code.
+  */
+ 
++#include <linux/version.h>
+ #include <linux/module.h>
+ #include <net/tcp.h>
+ #include "iet_u.h"
+@@ -29,7 +30,11 @@ static void event_recv_skb(struct sk_buf
+ 		ietd_pid = NETLINK_CB(skb).portid;
+ 		WARN_ON(ietd_pid == 0);
+ 		if (nlh->nlmsg_flags & NLM_F_ACK)
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 12, 0)
++			netlink_ack(skb, nlh, 0, NULL);
++#else
+ 			netlink_ack(skb, nlh, 0);
++#endif
+ 		skb_pull(skb, rlen);
+ 	}
+ }
diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index 5c1e38e17..659366107 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -14,7 +14,9 @@ SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${P
            file://access-sk_v6_daddr-iff-IPV6-defined.patch \
            file://build_with_updated_bio_struct_of_linux_v4.3_and_above.patch \
            file://build_with_updated_interfaces_of_linux_v4.8_and_above.patch \
-           file://fix-call-trace-of-ahash-API-calling.patch"
+           file://fix-call-trace-of-ahash-API-calling.patch \
+           file://0001-kernel-event-netlink_ack-now-requires-4-arguments.patch \
+           "
 
 SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
 SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
-- 
2.14.1


