Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7B3C5DF77
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:51:02 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2467.1786762256454166664
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PZYxZqnf;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbed97fa26fso1057635a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762256; x=1787367056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYm9AuJAjJZN/iHMEIGkk+jr/emO/HF/JOpEGar4E70=;
        b=PZYxZqnfKxgtwiLF9AmwnkJgmy8qAcSCsEDVn17eoXxi/JXlwlJ6CgXcG1z3pH6F0G
         2uZb+o7Bxc0h67A5ZzfvW8+H+G8YsUDAGp/1uNCA14stgjNx0cLOdBEjo4dqx9kKsjHN
         J9snd5gy6NoxMJU7GqBwJP73beOkq4lzHrG3jOOWDow9BIYI/F6aoEPlI+r0riz4p2iZ
         9tMUHG38eeWs9whvE/N1ggkUgWPEtPi/SA8QPZRn8MbxZ8iXeJqLDQXdx1eFy0FgQ+jJ
         xjpMwPJb9xyt4a3J4qD1oYuDN8SdnentJJWomDunrj7FQkphSbGK9OvGc397twHBpEWg
         QwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762256; x=1787367056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYm9AuJAjJZN/iHMEIGkk+jr/emO/HF/JOpEGar4E70=;
        b=ehAXXARUj3t9zeVx1qWFUDdYfmsVIPC/WYjpXA0pY8EGCzprPto0dunLJ8/XYSJ93q
         tm/+8nwDXi7tNmFqWPJW42Agj2BKVZ+YADvkxksqorXUK7XSvC2er1T3C16nNURIVz7o
         JMNhVUr9ZEuA4ZC6mCYf32LBq45FgUhShb0m76zxkQa+kJLaTlPHWCTdwM8pGyuLZT1J
         zgXSUgzuq29PRABh5D2A1bOaTIKuPU4KB3PXcoYyzKSs/KW1r4czfGOwyINWq3Rdi7+U
         HcGhUlyherTFz/zEDyWHgGsSwxrYPsdfrhaGMZyhj4zYry74CSDaGMyeaTWp8m3+qmcX
         zTLw==
X-Gm-Message-State: AOJu0Yx11GVLv+EMwH6FS6wzOLlNNSQb1BUlacy6+YAE7ptdeN3vDiaR
	X5qEq/ENtIubW0GTY438HOCxrq293CWy3yuw/rBOqFUEu7qjMWqw77wQu9344KWG
X-Gm-Gg: AR+sD10LeVYK60UO/cK1IK33pw9G113VQjUL0of5ryuItShz0yNylh5ddBHN8P63pBL
	xTo8hlV1gSpWykxRkmYRdGlAa2zTJ9WMFwMWz3V09q921Twr9kt1SMmIc90epc8b4idzxOz1dGB
	0xwSfL4D0Voa2AIV629TG/N3RDPNNe6unrlUVpNo3vykxZFNcJXq3pixgkynw50OdFuSDsxEnK2
	5k1FILx2bj0J1/sy5B6L2R1i8p7HFABm5cEdY1W3yPWVraiyR1yaME118eHGGRRLbpn5sPnvLJq
	gCItkt3MM37TdusKhDmWSBUMJX3KjdddY9cbzh9AWpqmElusO/DSdknYu6t7a6gCJiJNC+prHhX
	ddJM7llcRns7vnmAyCWOk8i5o0EyFMx9VDitrp2upMvnF3OLNI/Y2+st2ohIETTn4q79wjPpRR9
	BGemuZLJBT3gTTL+dt/r8UBajVAR6IIEe46pY6cGz2Y0UcFGdatFMdhAtxk9SVCuZ+Tnkn8nJ2D
	Cm378QlpNKEkL3jLay9eRM9o2cEoV4ZUpAOpHBBiIR1lbvvFh3jCzj2Yn1Twp0QJRHZnxb6EHeG
	UtNxVubfzbF/it9UiOaAC+t8VD/TU3vMf5y+JrujVrU+047ZPZPW/2kkMYvKz9r8/Re4FVn+EVT
	2hG9fdn8Mek0J70Xjem+ZswNuNteWaqZ/HczC1zUfbbzR/GA=
X-Received: by 2002:a17:90b:1dc5:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-3931f4844b0mr14552953a91.7.1786762255659;
        Fri, 14 Aug 2026 19:50:55 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 106/109] expected-lite: add new recipe (0.8.0)
Date: Fri, 14 Aug 2026 19:50:40 -0700
Message-ID: <20260815025044.437694-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
References: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129171

restinio 0.7.x drops its bundled nonstd::expected backport and
instead requires expected-lite to be supplied externally via
find_package(). Add a new recipe pinned to v0.8.0, the exact
version restinio 0.7.9.1 pins in its externals.rb manifest.

Modeled on the existing span-lite recipe (same author/ecosystem,
same LICENSE.txt boilerplate).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../expected-lite/expected-lite_0.8.0.bb         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-support/expected-lite/expected-lite_0.8.0.bb

diff --git a/meta-oe/recipes-support/expected-lite/expected-lite_0.8.0.bb b/meta-oe/recipes-support/expected-lite/expected-lite_0.8.0.bb
new file mode 100644
index 0000000000..f63d5dde2e
--- /dev/null
+++ b/meta-oe/recipes-support/expected-lite/expected-lite_0.8.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Expected objects in C++11 and later in a single-file header-only library"
+DESCRIPTION = "A single-file header-only library to represent value objects \
+               that either contain a valid value or an error, providing a \
+               backport of the C++23 std::expected for use with C++11 and \
+               later."
+HOMEPAGE = "https://github.com/martinmoene/expected-lite"
+SECTION = "libs"
+LICENSE = "BSL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI = "git://github.com/martinmoene/expected-lite.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "182165b584dad130afaf4bcd25b8629799baea38"
+
+inherit cmake
+
+BBCLASSEXTEND = "native nativesdk"

