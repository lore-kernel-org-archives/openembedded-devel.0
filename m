Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EABCA5FB3
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:43 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1482.1790722662985576206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hXrC81rE;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so4541133eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722662; x=1791327462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpMJhyeaey6DBL6emw/+/Bj0T/6rMQuI9X52auIBuKs=;
        b=hXrC81rEIBQWkVSAjXCsWnscGdzaHvGD0ETs1hGDIb0eCTJPnn2cVb23WO1T+tBsei
         /TFxsLy6/ZW2Jlx0C7rGysc+dUd9X0oDsVVaOYVj9cLBQp23bj/Lj2MarhTE62t/63j/
         qHdIu7cxqlZWxO3meEafJe7sQSOQlEJ2c2b04Mi395+gRT8xpzPrheNeL1XHo1Sw+4Co
         nl8VtwjepmlAT2cGaY/O/14b4K4qLHo7htkaiR3crmgCwYPvM8l1YcflZwBpqY+uptbl
         eRQKIP0VAvPQ7kNxK+L2uLTeV1gDx6zV2otAR7cZ5nlImtrhsVkeXc3NM1vE5jJi8dTv
         qNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722662; x=1791327462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpMJhyeaey6DBL6emw/+/Bj0T/6rMQuI9X52auIBuKs=;
        b=kYgp80KJb6d5Ahp4fOkOOPt7qKJ5CZKBU9zdAN2o2/9bChrOFUjqimy+oFosrYLRpw
         8SqcY7Ck4AaIQxn/Mv3X8qpi2WqrOJxzUHcVdBqTqprbqOPKnt29trrbss/jGODfSBqh
         HsyJCKuR9FRcobPU9xkNIT5PBb8B12stTNZXFu13c9P3n99rdam1UFt3W+Xsxcn5m907
         LnTMS8GCHKEOcS8hpxbPFscaxrIQDhgTMkzmE48erjFxCNlK9XhW6QRI6cKJ93549Bqk
         T0Bx+4GdbrXhzklmPdr5z6I6Sc0oewEWrjyULNUGDyQzcKVnfZrpkjH4Ngg3/MMdDgFC
         /Pgg==
X-Gm-Message-State: AFq9FYI2pA86uSzhl3EGnUgrq7MH11kFx5TNFrKagyBLayzd2/+VLJ7C
	63JDZVTdZYl3Gu7E+XozHg47dfQzK4DBzjZYNDWBwQ7k9t76iZeAekomfViXlgY3270=
X-Gm-Gg: AYBFou07tcVcVgf/gpXV44HGHUYcBETosyAWdm4gIEEDisj1XpDtrYO6SM/5H5ObCRp
	C8fmo5DSxPT3Y4WdeUcCfN9AFM7/U7gy7wlaFe7K/z8yRDtKXy7TMG05JFmFZAFnOGIdvKb64Ae
	dfiIilOgnyC+TGNaMd8JowthUruJo2t/ZYW1nCRpnLk/jWDYW/LLHgp7DTIpOxcuhNHfg1ckn/n
	KmAXvibgmlgpy8lO7DlHWj2sgZun4jCpiGyd+flLcZkS7oGIHGWAwddW4Z/HVI/ms+iEKT1d/bz
	LVU4iaP/WswxctBIO0kF3MtaXqh1EwOD445ofJPCWrKmzIMRbMAmJMRtqKHlzp/NLOTHT05309j
	IrMrSfb4JuZCyUhRxdBWUQBJz/BkXyJpIDbJ55qIuItjp+PTwlnMsDpSjo57no7S/oDCNoR4c5b
	MEFQTZVw3yQcSCCvQ3UQQHONUny0jpprPYPS9JJZy7aMpgqmYUklHuAORD+5iRGnxfyQ3ZtAI6G
	LQCkp3yRZj6gGkPz4BTA/L04Fbnfqrxj8lpWPlsGdD1ENZBKfn9poc+FcPF3M08jYCCFlCPUdcl
	Lq6G6A1Uq+z5qd4196qb8mgWiR+ObaVbgwT37m4lJqWkmxSyu0Uo2WNOpVC5WVF0YksDKHrciX0
	9v4tPMXHeb6vZW3jvDsQQiTRia7Kc6ss1R7rvAsu4wEbqSmlS/AUXmt5WrV5DufJHiaI+jyTJ18
	Dh5RCgJeTdj5reWIwpG7aIo8K+QJrIbxmii5xFYea15zgbW1sg
X-Received: by 2002:a05:7300:c389:b0:327:e68e:3230 with SMTP id 5a478bee46e88-34c65c625bdmr767565eec.10.1790722662239;
        Tue, 29 Sep 2026 15:57:42 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/26] switchtec-user: include switchtec-endian.h for musl htole32/le32toh
Date: Tue, 29 Sep 2026 15:57:06 -0700
Message-ID: <20260929225723.1046705-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130496

lib/cap-cli-main.c uses htole32()/le32toh() from <endian.h> without
including it directly; pull it in via the project's own endian
compat header.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...n-include-switchtec-endian.h-for-mus.patch | 44 +++++++++++++++++++
 .../switchtec-user/switchtec-user_4.4.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-support/switchtec-user/switchtec-user/0002-lib-cap-cli-main-include-switchtec-endian.h-for-mus.patch

diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user/0002-lib-cap-cli-main-include-switchtec-endian.h-for-mus.patch b/meta-oe/recipes-support/switchtec-user/switchtec-user/0002-lib-cap-cli-main-include-switchtec-endian.h-for-mus.patch
new file mode 100644
index 0000000000..c59e76e496
--- /dev/null
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user/0002-lib-cap-cli-main-include-switchtec-endian.h-for-mus.patch
@@ -0,0 +1,44 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:56:40 +0000
+Subject: [PATCH] lib/cap, cli/main: include switchtec/endian.h for musl
+
+lib/cap.c and cli/main.c call htole32()/le32toh()/le64toh() etc.
+without including inc/switchtec/endian.h, the project's own portable
+endian-conversion shim (already used by lib/diag.c, lib/switchtec.c,
+lib/pmon.c, lib/fw.c, lib/fabric.c, cli/mfg.c and cli/diag.c). On
+glibc this went unnoticed because some other transitively-included
+header happens to pull in <endian.h> as a side effect, but musl's
+headers don't have that side effect, so building with musl libc fails
+with "call to undeclared function 'htole32'" and friends. Add the
+missing include to both files so they pick up the same <endian.h>
+declarations (switchtec/endian.h just wraps <endian.h> on Linux,
+which musl provides unconditionally, unlike glibc which historically
+gated it behind feature-test macros).
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/cli/main.c b/cli/main.c
+index 6dc4524..b0bdcc3 100644
+--- a/cli/main.c
++++ b/cli/main.c
+@@ -33,6 +33,7 @@
+ #include <switchtec/errors.h>
+ #include <switchtec/utils.h>
+ #include <switchtec/pci.h>
++#include <switchtec/endian.h>
+ 
+ #include <locale.h>
+ #include <time.h>
+diff --git a/lib/cap.c b/lib/cap.c
+index b10685f..52ee3f5 100644
+--- a/lib/cap.c
++++ b/lib/cap.c
+@@ -32,6 +32,7 @@
+ #include "switchtec/cap.h"
+ #include "switchtec/switchtec.h"
+ #include "switchtec/mrpc.h"
++#include "switchtec/endian.h"
+ #include "switchtec_priv.h"
+ 
+ #include <stddef.h>
diff --git a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.4.bb b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.4.bb
index 61d431178a..32c75c1bfe 100644
--- a/meta-oe/recipes-support/switchtec-user/switchtec-user_4.4.bb
+++ b/meta-oe/recipes-support/switchtec-user/switchtec-user_4.4.bb
@@ -8,6 +8,7 @@ DEPENDS = "ncurses openssl"
 
 SRC_URI = "git://github.com/Microsemi/switchtec-user.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-lib-diag-do-not-use-a-variable-length-array-in-a-str.patch \
+           file://0002-lib-cap-cli-main-include-switchtec-endian.h-for-mus.patch \
            "
 SRCREV = "d995512f3bf1ceb98eefada813642d5ba5d62cd1"
 

