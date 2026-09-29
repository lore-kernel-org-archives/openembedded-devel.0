Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66942CA5FBA
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:33 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1457.1790722649404725205
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wb0hcgwV;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e630052ebso5312277eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722649; x=1791327449; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABoeO9i/mOtdU2+b1YIlaU4PofXUKLNyG+q+DfAN23k=;
        b=Wb0hcgwVDAYZcn3MKUZ5RUp259lq8Q3RvD7Q6S0PjiNC8jSk0SnFu+ZkE2iHjVbwCv
         OySLLkhd044EYLCgSq9gRxp9dPsAOS7tQulG8Qzvgt5wymj46xdV7eLZLETEBlya0TC+
         Dw0ru2NfU85Gd+VJ2m8+DzuBrxdd852pQaZUoDtDJb8lPMene3zX2IKorEOfck9lv0Y6
         DVd49om5sIouRiwri6vFpelXob6ZLWMiyVPaN6tMQ39ahnSThrwOKfWP5QDCOgQibquL
         QG+BJ0Y5/HlJ3W1sYmdrh12cXvlcswu4CjWscw1taL4P2Nrab4zTScPdKDKf1cn83M7X
         x/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722649; x=1791327449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABoeO9i/mOtdU2+b1YIlaU4PofXUKLNyG+q+DfAN23k=;
        b=ulyoLH6sKmlxBjgNv4Tf2trT2zkmTlvXA19UFK+vK2D24E4LzeNE2/sCKgxqMYNbmO
         40aEW0c8Q2IPlqBRJxwNNXls7h6wB9Vz9NN6zqkW+rrDZvD+mt0Zc0EsdB7uKceTfHEY
         2pXFcjE0hiBN5sO49fxQAuokFG8UmHn1RXnTmjqaWSVABdW7DMhpwVQCwQLRy3Hd/XbX
         irD02vkaZaWMAxZDXkUmEaQvxIbhv8saZZj7auhNM1Dyeoe5jzq6H9EZQW1SDRK5Ofbb
         IXHIEuCtKq+lpJQa5Jyp3jKkR9oK1c1hANXELKVmG4PaiXwb5pgPvCBkYNg1PrOdbKuF
         /u0w==
X-Gm-Message-State: AFq9FYLgKioV/ifwYuQZlIVaZ74dHC3haa4NnCA6p/k6eZB7354Zy29p
	8UkrhXRt6u3pUh3nhtzmiM/mzoS3klw8CYnJdu2HZPpiu9a+6n+hM12MCMwi0I44w1c=
X-Gm-Gg: AYBFou25E95gbGrePkbsLWrwistCBEe47SD1IMuD7YddZnfQ2F/fM+2Y0h5Ln/xfdSD
	IMs0vgFHQgIzvffrOtyJ8leYx9rhZmQVLvGU3vilz92rvT9aqC9ozL4v4rVeTTygdDggSX5j74r
	cU9O13zhVBkhY70tYuIYdtxd8UGiFM/RzRAinjuwI5KktFw5QCmVUgqjHbBbNGUzfsgrqhpUVXM
	eZKMDa1NKscGabVKd3L7pA4iaCPyX2ElDRVy92ybmQ5ykeMrhLhR47Z1gTLPpOTnXV7NFhaWjzd
	72s6EFhgUdvsp+PR/8Vbaq3cMnH9j4YQuYinbiRM8QYj387/GJmkV60A45c3jnF38MBQiZkz/i3
	npL00c7VPElusQisMisx4fBfaEKEcaxRMnntWtiuJbFiRXvZFAIkOUGKJDZo2hrALTlhfeTPNDj
	tEPSub571ZsxbaelPyKmtDGOhcg+ag9BGQircqaWoV7L4kN8lAhrcOJEp4vx4oZ3+tWYD0fAK3I
	izI3CPTIley88PzlL0I9gIHepAbH6vuW0L0MZHFBfzWRLt2pgLg3lX+WIokomaXCgAoeWAYT0gp
	vziAo41EKHjFSBDAjUkzjHSoHbqhwhel9JyTf1UVIUOgSSOhZYc9APjjtUF2qkfiNURhF9kgk/R
	fCVtlw2JfHdewH6H6bYK0Pcb7RE/mkZj+Oxr90QA5DysC/Re51YwUje3h/cYc3KvXbcrq24LfIU
	4eZCNtGp/4booziBFPtYu1tm1ucKsrFlvdTBJIXQ==
X-Received: by 2002:a05:7301:4d05:b0:33c:14c9:c79d with SMTP id 5a478bee46e88-34c664374f5mr816880eec.9.1790722648577;
        Tue, 29 Sep 2026 15:57:28 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/26] floret: add missing <cstdint> include for int64_t on musl
Date: Tue, 29 Sep 2026 15:56:59 -0700
Message-ID: <20260929225723.1046705-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130489

args.h uses int64_t without including <cstdint>; glibc headers pull it
in transitively via other includes, musl's don't.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-missing-cstdint-include-for-int64_t.patch | 32 +++++++++++++++++++
 .../recipes-support/floret/floret_0.10.5.bb   |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/floret/files/0002-args.h-add-missing-cstdint-include-for-int64_t.patch

diff --git a/meta-oe/recipes-support/floret/files/0002-args.h-add-missing-cstdint-include-for-int64_t.patch b/meta-oe/recipes-support/floret/files/0002-args.h-add-missing-cstdint-include-for-int64_t.patch
new file mode 100644
index 0000000000..cfececbad7
--- /dev/null
+++ b/meta-oe/recipes-support/floret/files/0002-args.h-add-missing-cstdint-include-for-int64_t.patch
@@ -0,0 +1,32 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:54:51 +0000
+Subject: [PATCH] args.h: add missing <cstdint> include for int64_t
+
+args.h declares getAutotuneModelSize() returning int64_t but never
+includes <cstdint> itself. On glibc/libstdc++ this compiles because
+some other transitively-included standard header happens to declare
+int64_t first, but that is not guaranteed. musl's libc++/libstdc++
+headers do not provide this transitive declaration, so args.h fails
+to parse with "unknown type name 'int64_t'". The existing
+0001-PATCH-floret patch adds <cstdint> to args.cc, but only after
+it includes "args.h", so it does not help args.h parse itself.
+Include <cstdint> directly in args.h so the header is self-contained.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/args.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/args.h b/src/args.h
+index 1111111..2222222 100644
+--- a/src/args.h
++++ b/src/args.h
+@@ -8,6 +8,7 @@
+
+ #pragma once
+
++#include <cstdint>
+ #include <istream>
+ #include <ostream>
+ #include <string>
diff --git a/meta-oe/recipes-support/floret/floret_0.10.5.bb b/meta-oe/recipes-support/floret/floret_0.10.5.bb
index 52c46b2a4b..fd96ed701c 100644
--- a/meta-oe/recipes-support/floret/floret_0.10.5.bb
+++ b/meta-oe/recipes-support/floret/floret_0.10.5.bb
@@ -16,7 +16,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4ce16d1d2b4c556959d654417007b713"
 DEPENDS = "zlib"
 
 SRC_URI = "git://github.com/explosion/floret.git;protocol=https;branch=main;tag=v${PV} \
-           file://0001-PATCH-floret-Adjust-CMake-flags-for-cross-compilation.patch"
+           file://0001-PATCH-floret-Adjust-CMake-flags-for-cross-compilation.patch \
+           file://0002-args.h-add-missing-cstdint-include-for-int64_t.patch \
+           "
 
 SRCREV = "775638223bee4fabc420cc8234632557452558e0"
 

