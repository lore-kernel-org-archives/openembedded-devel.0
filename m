Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71332F5581C
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 11:22:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17213.1776683855801051517
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 04:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=UKCwXMys;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B8164E42A7B;
	Mon, 20 Apr 2026 11:17:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12BE85FFA5;
	Mon, 20 Apr 2026 11:17:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D52510461586;
	Mon, 20 Apr 2026 13:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776683853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9jqxI3xrqW7ciC/kCFzK4t/241M+do1T/HxRfypte34=;
	b=UKCwXMysEBbL4XvYjx2YqzWjftg0ucAbLa+NxJ/m4OMdpqZ9uwAMvBw57cnQC9W7KTOM/y
	uaJI6OcDZqrzQUnif20j3KtBqK+aqRhbFs9FPv9eUzorvtsZAxx3qiQgZtdu6b9br3FdXq
	QFJ1EQUrIFfQ1YOo7vEl4YOdBlIKzBwiOiM/8Mw7YT/SRqFfQ424oi3gviwzjCS4gAroDG
	6R/Vkdg7Fuo79iLpyxhNBI5S+DpA74WCUwfWMjUoA2diM19Iy9PwzbwO4zzbxQw9UPxkiL
	LUTrWFzdUfUQ8e9BZsjP/i7nbEjSuj7eFCC3sLKkNDPH//3LPW3NQwV1bnfJIw==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	raj.khem@gmail.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-oe][PATCH 4/4] kernel-selftest: add missing sources if mm is enabled
Date: Mon, 20 Apr 2026 13:17:12 +0200
Message-ID: <20260420111712.26945-5-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260420111712.26945-1-joaomarcos.costa@bootlin.com>
References: <20260420111712.26945-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 11:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126499

Some headers come from 'mm' (in the top source directory, i.e. the root o=
f
Linux's sources), as in the exampels below:

Makefile:LOCAL_HDRS +=3D $(selfdir)/mm/local_config.h $(top_srcdir)/mm/gu=
p_test.h
cow.c:#include "../../../../mm/gup_test.h"
gup_longterm.c:#include "../../../../mm/gup_test.h"
gup_test.c:#include <mm/gup_test.h>
hmm-tests.c:#include <mm/gup_test.h>
uffd-unit-tests.c:#include "../../../../mm/gup_test.h"

Add this directory to KERNEL_SELFTEST_SRC if 'mm' PACKAGECONFIG is enable=
d.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/=
meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 1e18caedda..5c001696d0 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -80,6 +80,7 @@ KERNEL_SELFTEST_SRC ?=3D "Makefile \
                         tools \
                         scripts \
                         arch \
+                        ${@bb.utils.filter('PACKAGECONFIG', 'mm', d)} \
                         LICENSES \
 "
 do_compile() {
--=20
2.43.0


