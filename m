Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B151099B22
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 17:02:07 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18035.1774026125908738395
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 10:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ahxEbjwA;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso974301eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 10:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774026125; x=1774630925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffcBix3GieqD3iwn7hBNLKuUa/faOSy5RQBHSBlSfvE=;
        b=ahxEbjwArax8+8C6Q859REA+4OoSgy4jcqNhl0mkBfFTWBGwbzG9b22gLzU8/MfB1w
         TorLFVlWAZhH0QQ2jXE/xFmssTKNzqGOMJ1SCZvR6MOoZey/VKTHW9MVe0mvs+6o6DMH
         lfACL0AJr5YUf+UERSnaIVMOCSvYXYtwf0oaESheIjzIBPI94DjHM2ekukmL0qrq4Cyd
         NwW+1ZcMsDnZV/Ur3jG44+sBKKRlfuk1LdeuByTgHb1d7yaDsSrc9Gs0EF8qdLAUr9RC
         0B67/27YmxFO15ZuarUVQkqEL00wEVfWIoFlPIt66sXNZ0lvlUsoCBma7UxeX+NAzZgi
         sXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774026125; x=1774630925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ffcBix3GieqD3iwn7hBNLKuUa/faOSy5RQBHSBlSfvE=;
        b=mGp3vQfJxCG8ZrXUD42qlcjBCWqGrRu8s//N38t27rIvEcX+SSF0PyAYyvHBTizrNv
         rjziXak/vuXiOPakUW2KttVVl3iPVwYm2FrG4PS9WagJkPfREjaa57HUQrFKIcR30EPj
         WycmXDw83HWR/2HpE2Pxr338QEmi6h+mMRC+Ri+TVSYVMD0nSt0Kn0uJ3TXKW1QAokEs
         cqCXTtVGRLt/m9tsIrZJwTB0Kr/WpRGakSjjrzrRInfNqa6AbA/lzlqhmlMKv1La2mMQ
         XZ5gO3taqbvOFfMfbDiguoN9Rg5fAkOb/ik5IYwifP4lRmRjCRGnwNRztm9yPaJx8SWD
         r5Cw==
X-Gm-Message-State: AOJu0YzaVmmOfZzu3fYHClygrQJveK5WnE9xeCYbvpaUyIMvc7BoXfhT
	qQZOnH6h+mWr/d86RjQWRcw+qGSsbyav+3OSNXFrQ/sf2qcHS7OtjPSZAYSE1O1Y
X-Gm-Gg: ATEYQzwHVyPXKlXUUOjb0unsD6CSiK+yFVooIhKPNtXbEMzjUvJmYDB1jdgM8VqzOfA
	r9tY+M4KRfMsIueKUSHhDdMxO/nMsMsQ3RJP3YNX56wKqKbMJVuA7+wbv6tyMhaiRBwg1HKRJoG
	6LwWeM1GChWdnqXMf/4HaVdBk+7j1+cJ2ySt7B1PYvllOSe+vdtefzQm/ydAdMTou/eGgKnHtOE
	L3ckzX8IzWH14+oxZTC7SR3OVAM9P227QUQw/aq/tLmOg2QP+YavoN1XZiwwrtZDkmZAqQn5oNJ
	1Ln+KveoFLezIG8qtONUJSR6MSOwN4yYkZX3YttiDADXb2zCD1S33tnyoWHhhfRnaaweexjOU3X
	neqjEFnoYantrfolivA5QkciYNd71YgNk92vZO3RMV2OtxjRaPhCE+dIApTpSNkDUGXEyNyQaAS
	Pgr02F86cuK7ZB2512yYTseRNDDOlwvr1BLAe1chQmwRN3dbUnvuWQXceWN+JDBBiXoQoWya1X5
	kaOMpZkntGE0kZpyo2Qi6w8IR2mMct+mG1Rlu+v47G1Z2LrMM1RLeCQ6GhJ
X-Received: by 2002:a05:7300:e9cb:10b0:2c0:dd1f:1718 with SMTP id 5a478bee46e88-2c10980abbcmr1311611eec.34.1774026124504;
        Fri, 20 Mar 2026 10:02:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14caf3sm5148632eec.5.2026.03.20.10.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:02:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 6/8] tunctl: Make cflags weak in makefile
Date: Fri, 20 Mar 2026 10:01:53 -0700
Message-ID: <20260320170155.1413929-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
References: <20260320170155.1413929-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 17:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125447

From: Khem Raj <raj.khem@gmail.com>

ensures it used flags from OE env

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tunctl/tunctl/makefile-add-ldflags.patch  | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch b/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
index a556f6eebb..45fbb68b70 100644
--- a/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
+++ b/meta-networking/recipes-support/tunctl/tunctl/makefile-add-ldflags.patch
@@ -4,11 +4,18 @@ Upstream-Status: Inactive-Upstream [last change: 2013-03-22]

 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>

-diff --git a/Makefile b/Makefile
-index a0aa7f6..d6ce2c7 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -14,7 +14,7 @@ MAN_DIR ?= /usr/share/man/man$(MANS)
+@@ -6,7 +6,7 @@ MAN = $(PACKAGE).$(MANS)
+
+ DIST = Makefile $(PACKAGE).spec $(PACKAGE).c $(PACKAGE).sgml ChangeLog
+
+-CFLAGS = -g -Wall
++CFLAGS ?= -g -Wall
+
+ BIN_DIR ?= /usr/sbin
+ MAN_DIR ?= /usr/share/man/man$(MANS)
+@@ -14,12 +14,12 @@ MAN_DIR ?= /usr/share/man/man$(MANS)
  all : $(BIN) $(MAN)

  $(BIN) : $(BIN).c
@@ -17,3 +24,9 @@ index a0aa7f6..d6ce2c7 100644

  $(MAN) : $(PACKAGE).sgml
  	docbook2man $(PACKAGE).sgml
+
+-clean :
++clean :
+ 	rm -f $(BIN) $(OBJS) $(MAN) *~ manpage.*
+
+ install : $(BIN) $(MAN)

