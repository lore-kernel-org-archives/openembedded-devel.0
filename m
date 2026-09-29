Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDA4CA5FBA
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:53 +0000 (UTC)
Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1486.1790722667286829361
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ArExJv5h;
 spf=pass (domain: gmail.com, ip: 74.125.229.140, mailfrom: raj.khem@gmail.com)
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd025d07so4273951c88.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722667; x=1791327467; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVDOx7rzTRvyrhi9Q6GrcsuJd8gHUCAmi3SL6dpx+cQ=;
        b=ArExJv5htpfm/b2G0Pa/aS19U0++w8BHHGqFoNpUWAn63gJhj8mMubiT8rOrN2taRY
         AbSR9SsSCA5RftGONYjL+HeSopUu0jyXoQgIKpHu75XUKyVOFKGyVQjA+NdOjX2kYwKc
         qhcjmV9kqULlcCBUi4yuE9+rtqjloEXfHqciiRkFhuNtwhI7LkzFmSTh+Q5e5LYhNVuf
         9RysG/mC3hGARZNO7epA2N9BKF0CphQ8fp+lnddq8mUIuPoAi/B+j9BUZlvhqK4Cr89S
         G/ea8E4mYbLAfBIZ3QlW4nUTmWYs+MGWBwvWVyro7vcnBX25u+LXTJXtmTxw9WvY83cR
         ZMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722667; x=1791327467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVDOx7rzTRvyrhi9Q6GrcsuJd8gHUCAmi3SL6dpx+cQ=;
        b=NQ8dDKmOX7GSY2XnsNFfVabJv93UMHLmwmiL9DLgqvtAiMF5y6yLuNbGO1DBZ43fbz
         nCwb0a6he8QXb9IDHyX8V1qhcWoCxf/QTaOmQXNA5GiknU4uPpczzC6W82FdJxDaDnEw
         J5RAVfzt0sbI+ylAolNlD9tUoGyYpiA7Zav9RUCI8zqTDaSQP2y5x/PGDPMifESViYkc
         TBzE2iPDGWAtE3RwnsfWMyx1348euFqoFEptSKPfINa2Ab4jUIgIaCwYZZJLR+Oh9gEE
         ZSQq2CW4ZADTE0sOFFlmj7ToGV+4uGI/YdIW4lTNADiu0UIbYyGVJQDwp+NLyaR7B1gY
         SLCw==
X-Gm-Message-State: AFuF++kkemQ2BTHG6qEcB+uQW+JB3SSL6N8SLPHnOxfhhal/byWGygjr
	8E4xzW903TUc6SgRNejwBD+dwDZO1NwQsswqvUbGNPpnIyy+84341NvWxb1EugiRR0E=
X-Gm-Gg: AYBFou2lksR3dZz3RBSE2p0Wx175fJCe8b34N8Q2Plbw0JFUIlIwj7xUUl2m2zXi8If
	uUDDEmTclJa74+jM0JSGNmYUzXEuRTd96bTtNfz5QBOTiHLXGxZUGPmRme63rFWtIHOKtjkcmGC
	FkIMFzEmJhJgzMScTFLa3vyfYFoZvrxKeUSbTZvcNm90xVD4+kVTohECvjVo/4cavXKqGENbvFI
	8r0HThifJ/OWnwRNRSiA7zbaWvKiG356NC3jZzW2NdPSjFG6NMLSWwSabvTtuZzaKr9M4QXlWPD
	NkAUvuyfZ0ahW/MSAqaXGanVm2MDBNzqJsQ/63mee2424eOokM55sDXHZaSYDm+VhXhtKUwOSnx
	NdXazosMGdHfCRaPomiL4R/KNiFuTrNx9m4t9+d4hhl1gmaly+WrTu3CL/aFC0qK+NV9fDRR8DN
	yDWAq2dTdcbHRMVlfxnySJESr/8JwLh9lbRX6OH9cNhSwLOnpzttcSb31KNTFmMHfhg4i62DcKa
	8pIXXaIhz/BAF8Dwym0Qa/aCkjiZWVJ00JS2TRcSkvbBCgd6HGtAvXE02V2FsEt95Iv+edXaAs7
	wbEjCKLcN1UmaVmsMx+XzypcMR/B8Pc80tHm+ZVoseETuot3mEAYkYiwQuTowcNQkXlimdOR8Db
	mJIj+sUEq7dHelqCAqbQ6MpQ+dsziiku+fBpGLsfGi1cMUDx7ucR+3Gj7vx7SqRcNPaM4ZXdpV5
	l0NCAdN0tYNsX0eJzhlpHihTyQPfWwnUSyF75Wp6vRn++EhCIcvA==
X-Received: by 2002:a05:7301:4697:b0:327:c036:1c7a with SMTP id 5a478bee46e88-34c6370d9a1mr915254eec.10.1790722666366;
        Tue, 29 Sep 2026 15:57:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/26] bpftrace: define _GNU_SOURCE for pthread_setname_np in testprogs
Date: Tue, 29 Sep 2026 15:57:09 -0700
Message-ID: <20260929225723.1046705-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130499

A test program uses pthread_setname_np(), a GNU extension that needs
_GNU_SOURCE defined before <pthread.h> is included to be declared.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-define-_GNU_SOURCE-for-pthread_setn.patch | 28 +++++++++++++++++++
 .../bpftrace/bpftrace_0.26.1.bb               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch
new file mode 100644
index 0000000000..d9d297055e
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch
@@ -0,0 +1,28 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:56:02 +0000
+Subject: [PATCH] tests/testprogs: define _GNU_SOURCE for pthread_setname_np
+
+glibc exposes GNU/BSD extensions such as pthread_setname_np() by default
+in its headers unless the build is put into a strict ISO mode, whereas
+musl only exposes these extensions when _GNU_SOURCE is explicitly defined
+before <pthread.h> is included. Without it, musl's <pthread.h> does not
+declare pthread_setname_np(), causing an implicit-declaration error under
+clang's -Werror=implicit-function-declaration (mandatory in C99 and
+later). Define _GNU_SOURCE before the first include so the declaration is
+visible on musl too.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/testprogs/multi_threads.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/testprogs/multi_threads.c b/tests/testprogs/multi_threads.c
+index 1111111..2222222 100644
+--- a/tests/testprogs/multi_threads.c
++++ b/tests/testprogs/multi_threads.c
+@@ -1,3 +1,4 @@
++#define _GNU_SOURCE
+ #include <pthread.h>
+ #include <stdlib.h>
+ #include <stdio.h>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
index a2f6a93f66..e217ac150d 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.26.x;protocol=http
            file://0005-CMakeLists-Add-support-for-LLVM-23.patch \
            file://0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch \
            file://0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch \
+           file://0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch \
 "
 SRCREV = "1bac8a8daad6e0aa579980e877d0c9d5fc296593"
 

