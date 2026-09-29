Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC06ACA5FB3
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:53 +0000 (UTC)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1468.1790722669538542315
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cL5CZVl0;
 spf=pass (domain: gmail.com, ip: 74.125.229.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd025d06so3449001c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722669; x=1791327469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJY+FdSbP/MdWLZI/4HfdzGkoeVG9c2WJ5m5qR0CinE=;
        b=cL5CZVl0NS0Kz5TsZ54e+evL4UG4Gz3uehzkxOY4f/1TCGGI36b07FvdrwT167T4ls
         a4EkUkd9XEaejBsB7GhuguTIf9vhTLH2EDDg7jztKCZ4nWi5ORAlhMpj9MHyvnV3Lygv
         /sagxKKrbhkADiVK+PpYipo0gdd4dCg7itHVUz1j4M9X8irI0pp9NHx+2lr9J+m0Tui2
         C91oZ8lsrb8huhxn2snSEmh4nhAfYpQ6H2QaNF9W/vy9OntIQoJqAro5NP2QHiMRP69U
         6VeIZ3Zmoh2VdOwJGUjg4ISSXZgP8TNcveJ9k0XXjOM8XlbttVeQ7dkSQUC7Wh3hWNNC
         E7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722669; x=1791327469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJY+FdSbP/MdWLZI/4HfdzGkoeVG9c2WJ5m5qR0CinE=;
        b=AVZDiCMgzDOyGsVaRkKi4hjAx0JdPBfyh+r0b68cJVOvcN21unnpjAmebi19i1tT/9
         qliVaosbmw/u0OJBOxIeGVdS+eAMjyPWxPbS3inukxyHDniIoDKpfvzV84MjdOqYnic4
         T1Ue8KT/LESL3RbBazqCm8Q6mFVYNAthmHosjF16s/i65atnK25sCg3YPfVus0KQFY4u
         NHx6bASSVlMkXH6vSFOzM22rjl135sQmtstyjLBc5m2l7geBLFVT8g704xGzAXhJMyeL
         W0Ppqm6nQAjfs3UdfuZ7s0Nrx/p+LNZ1J2L2iu+Ri47LcVQ2PDe8cEzCd89CFBaxEOEg
         GV0g==
X-Gm-Message-State: AFq9FYJRB4mLC/UsDapERubc+CxUAWMZsxkbk00lgaXV4YcMgJ5Ak0i8
	xA4mU8iQk4rvn813kwwEA6ITw3uLdZIDgCMJCK29wZ0uzPrn/laQDOhn8E6gZ73Tjl0=
X-Gm-Gg: AYBFou0wcfXSsrE9j+3sifZ0dXCoBA8MId3wNGcabKFRg7S8ek7jMUUCTyibL97zVln
	HXtUw4eUeC5ZGjrRCnoCP1HXL/+3ANwfQBie9CU51wIQnOXT2uPl9rlxMQNO+Xi1gUB8c1l+24D
	zjk9UOvzZdj2/BkqXkGVxfSRYX2Jg8pfAEcVnVNdRv4A+Ih+J9hBc0ATtCusjAC3WqEBVwthU4n
	CvsYg0OhRFmbDGrqVaOPrvGgyoVW+GdqIf8TXIhbLJlwxgUyXVjUL+SzrnU1Nc4mPDAHb9cEdRx
	+vrmjzGIfs6xmzqDCn9hcvDeF7OrzdvG+DlKMapP1mbBQfMv7dXF05Ib83lOPUFVyUe8UgafVmA
	ekoZmtdNw4qiO8NG2wlECiio/N5ewUr/T4mDZMsJtbHfcU6OCBucFSPVAqIHQAy8CX7BJAwl5Ox
	+A8oB3hnwQiVLS7JMqUXc+eYGrTRtyjRVL2lgQyhg0bZPv7+IKMUo1zMLpU7yRbRcLbnogodTbw
	9qRYW6A5Cbn7LEChY7REDJIoGeIoGbkxYCqw00EJHQT1MuFKLoDYx4ZROUeKCaU6BIG7YQM5h0k
	dT5WzXAFku8NXSEhCbWtdWXptBZR2U311PyHdjYlt61P1xotBAMPrej9yLma/YYgoASs/rUSsGa
	As2E6lHMrkMg7OOPtRBDWzDg3Oge8JYnfyzsCnsLCDeF2vM6X1YcZWOvR0XAOawvDpVecmehyQX
	iNSLFlxPQCCOUjVpJe46kmnjdVizULGjgNyyWk8c703rqYod0ZK5qeC3YUpAo=
X-Received: by 2002:a05:693c:6010:b0:341:3ca2:de2d with SMTP id 5a478bee46e88-34c6370d990mr940036eec.6.1790722668659;
        Tue, 29 Sep 2026 15:57:48 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/26] xdp-tools: avoid struct ethhdr redefinition on musl
Date: Tue, 29 Sep 2026 15:57:11 -0700
Message-ID: <20260929225723.1046705-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130501

musl's <netinet/if_ether.h> and the kernel's raw <linux/if_ether.h>
both define struct ethhdr, and only avoid colliding if
<netinet/if_ether.h> (or something that pulls it in) is processed
first. lib/util/params.{c,h} and xdpsock.c, xdp-filter.c and
xdp-dump/xdpdump.c all got this backwards in various ways; fix the
include order/choice in each.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...d-struct-ethhdr-redefinition-on-musl.patch | 81 +++++++++++++++++++
 ...dump-avoid-struct-ethhdr-redefinitio.patch | 57 +++++++++++++
 .../xdp-tools/xdp-tools_1.6.3.bb              |  2 +
 3 files changed, 140 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdp-tools/files/0003-lib-util-avoid-struct-ethhdr-redefinition-on-musl.patch
 create mode 100644 meta-oe/recipes-support/xdp-tools/files/0004-xdp-filter-xdp-dump-avoid-struct-ethhdr-redefinitio.patch

diff --git a/meta-oe/recipes-support/xdp-tools/files/0003-lib-util-avoid-struct-ethhdr-redefinition-on-musl.patch b/meta-oe/recipes-support/xdp-tools/files/0003-lib-util-avoid-struct-ethhdr-redefinition-on-musl.patch
new file mode 100644
index 0000000000..607c7c7038
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/files/0003-lib-util-avoid-struct-ethhdr-redefinition-on-musl.patch
@@ -0,0 +1,81 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:14:39 +0000
+Subject: [PATCH] lib/util: avoid struct ethhdr redefinition on musl
+
+lib/util/params.h and lib/util/params.c only need ETH_ALEN from
+<linux/if_ether.h>, but including that raw kernel uapi header can
+collide with musl's own <netinet/if_ether.h>: musl only skips its own
+struct ethhdr (via __UAPI_DEF_ETHHDR) once its own header has already
+been processed, so pulling in <linux/if_ether.h> first, or from a
+translation unit that later also includes <net/ethernet.h>, defines
+struct ethhdr twice and fails to build. Switch both files to use
+<netinet/if_ether.h> directly instead of the uapi header.
+
+lib/util/xdpsock.c already includes <netinet/ether.h> (which pulls in
+musl's <netinet/if_ether.h>) after also including <linux/if_ether.h>
+earlier in the file, i.e. in the wrong order for musl's
+__UAPI_DEF_ETHHDR guard to take effect. Move the <linux/if_ether.h>
+include to after <netinet/ether.h> so the guard suppresses the uapi
+header's struct ethhdr as intended.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/lib/util/params.c b/lib/util/params.c
+index 5a5ee11..f4b143c 100644
+--- a/lib/util/params.c
++++ b/lib/util/params.c
+@@ -10,7 +10,9 @@
+ #include <errno.h>
+
+ #include <net/if.h>
+-#include <linux/if_ether.h>
++/* ETH_ALEN only; see params.h for why this uses the libc header instead of
++ * the raw <linux/if_ether.h> uapi one. */
++#include <netinet/if_ether.h>
+ #include <linux/if_link.h> /* XDP_FLAGS_* depend on kernel-headers installed */
+ #include <linux/if_xdp.h>
+ #include <arpa/inet.h>
+diff --git a/lib/util/params.h b/lib/util/params.h
+index ab0ee4a..b50c259 100644
+--- a/lib/util/params.h
++++ b/lib/util/params.h
+@@ -8,7 +8,12 @@
+ #include <stdlib.h>
+ #include <linux/in.h>
+ #include <linux/in6.h>
+-#include <linux/if_ether.h>
++/* Only ETH_ALEN is needed here; use the libc's own header (rather than the
++ * raw kernel uapi one) so we don't end up defining struct ethhdr twice when
++ * a translation unit also includes <net/ethernet.h>/<netinet/ether.h> (musl
++ * only suppresses <linux/if_ether.h>'s struct ethhdr via __UAPI_DEF_ETHHDR
++ * when its own netinet/if_ether.h was included first). */
++#include <netinet/if_ether.h>
+ #include <bpf/libbpf.h>
+
+ enum option_type {
+diff --git a/lib/util/xdpsock.c b/lib/util/xdpsock.c
+index a893728..46379dc 100644
+--- a/lib/util/xdpsock.c
++++ b/lib/util/xdpsock.c
+@@ -9,7 +9,6 @@
+ #include <linux/err.h>
+ #include <linux/if_link.h>
+ #include <linux/if_xdp.h>
+-#include <linux/if_ether.h>
+ #include <linux/ip.h>
+ #include <linux/limits.h>
+ #include <linux/udp.h>
+@@ -17,6 +16,12 @@
+ #include <arpa/inet.h>
+ #include <net/ethernet.h>
+ #include <netinet/ether.h>
++/* <linux/if_ether.h> must come after <netinet/ether.h> above: musl's
++ * <netinet/if_ether.h> (pulled in by netinet/ether.h) defines its own
++ * struct ethhdr and then sets __UAPI_DEF_ETHHDR=0, which this header
++ * checks before defining struct ethhdr itself. Included the other way
++ * around, both structs get defined and the second one is a hard error. */
++#include <linux/if_ether.h>
+ #include <net/if.h>
+ #include <poll.h>
+ #include <pthread.h>
diff --git a/meta-oe/recipes-support/xdp-tools/files/0004-xdp-filter-xdp-dump-avoid-struct-ethhdr-redefinitio.patch b/meta-oe/recipes-support/xdp-tools/files/0004-xdp-filter-xdp-dump-avoid-struct-ethhdr-redefinitio.patch
new file mode 100644
index 0000000000..8c4c72c81b
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/files/0004-xdp-filter-xdp-dump-avoid-struct-ethhdr-redefinitio.patch
@@ -0,0 +1,57 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:14:39 +0000
+Subject: [PATCH] xdp-filter, xdp-dump: avoid struct ethhdr redefinition on
+ musl
+
+0003-lib-util-avoid-struct-ethhdr-redefinition-on-musl.patch made
+lib/util/params.h include musl's <netinet/if_ether.h> (rather than the
+raw <linux/if_ether.h> uapi header) so that struct ethhdr is only
+defined once. That only works if <netinet/if_ether.h> (or something
+that pulls it in) is processed before any raw <linux/if_ether.h>
+inclusion sets __UAPI_DEF_ETHHDR=1 as a side effect of defining its
+own struct ethhdr.
+
+Two translation units still get this backwards:
+
+- xdp-filter.c directly includes <linux/if_ether.h> before "params.h",
+  even though it doesn't use anything from that header itself (ETH_ALEN
+  already comes via params.h). Just drop the redundant include.
+
+- xdpdump.c includes <linux/ethtool.h> (which itself pulls in
+  <linux/if_ether.h> for struct ethhdr) before "params.h" is reached
+  further down the file. Include musl's <netinet/if_ether.h> ahead of
+  <linux/ethtool.h> so the guard is already set when ethtool.h's
+  transitive <linux/if_ether.h> is processed.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/xdp-dump/xdpdump.c b/xdp-dump/xdpdump.c
+index fa3aeb3..395226c 100644
+--- a/xdp-dump/xdpdump.c
++++ b/xdp-dump/xdpdump.c
+@@ -21,6 +21,11 @@
+ #include <bpf/libbpf.h>
+
+ #include <linux/err.h>
++/* <linux/ethtool.h> pulls in <linux/if_ether.h>, which defines its own
++ * struct ethhdr unless __UAPI_DEF_ETHHDR is already 0. Include musl's
++ * <netinet/if_ether.h> first (it defines struct ethhdr and sets that
++ * guard) so <linux/ethtool.h> doesn't try to define it a second time. */
++#include <netinet/if_ether.h>
+ #include <linux/ethtool.h>
+ #include <linux/perf_event.h>
+ #include <linux/sockios.h>
+diff --git a/xdp-filter/xdp-filter.c b/xdp-filter/xdp-filter.c
+index 8e9d344..89286fc 100644
+--- a/xdp-filter/xdp-filter.c
++++ b/xdp-filter/xdp-filter.c
+@@ -14,8 +14,6 @@
+ #include <xdp/libxdp.h>
+ #include <arpa/inet.h>
+
+-#include <linux/if_ether.h>
+-
+ #include "params.h"
+ #include "logging.h"
+ #include "util.h"
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
index b0571c2754..bcaa8c91c4 100644
--- a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
+++ b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
@@ -16,6 +16,8 @@ SRC_URI = " \
     git://github.com/xdp-project/xdp-tools.git;tag=v${PV};nobranch=1;protocol=https \
     file://0001-configure-correctly-handle-CC-when-validating-requir.patch \
     file://0002-lib-libxdp-Makefile-use-cp-fRd-to-preserve-symlinks-.patch \
+    file://0003-lib-util-avoid-struct-ethhdr-redefinition-on-musl.patch \
+    file://0004-xdp-filter-xdp-dump-avoid-struct-ethhdr-redefinitio.patch \
 "
 SRCREV = "8fbad9f0af621a22aa87ff2520b3735915b1f0fd"
 

