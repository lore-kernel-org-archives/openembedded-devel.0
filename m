Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059B4CA5FBD
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:57:54 +0000 (UTC)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1465.1790722665613134640
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XAyvhh1f;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3115c4451c8so1125218eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722665; x=1791327465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qh7nBqIfPPUocIlA3P/VRvkcRiFlkdUkXd+PzFo2AcM=;
        b=XAyvhh1fRa8ot91Mlw1S2u1ul5iuwHCqTsfo95w1OxUqslQ7MJ4OHpqWYafedk499H
         umRxxOjHyw6/wZ77ChEAYnt+m8vHqftOY7NHsGwjzjnJaS+WLeX3+HwFAH5LkLdpOjI3
         CTA1TwGxytjvFskNxfmKp5wCMk5lGgIMC1tF0hfo3cJJB48RExKKmtYQvA40Oo0WNHAt
         4WHGF9TXBY0jiRaEeaQiBablduG2YfjBexlWTrmkuBH3Or2DIXz+hjBQWFztmMqiy0Qo
         U1qLtIxlJTqJqkeBEXCfF/GXOCl1QRA7AcpWGpjPiS0MpKWdR65ZrIBQm/NmhaBpkEYY
         CoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722665; x=1791327465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qh7nBqIfPPUocIlA3P/VRvkcRiFlkdUkXd+PzFo2AcM=;
        b=1NljaWLNJNtIHVFpbgjt2idx+hdGHAQugmYLNYBYT2Cr8VgaUwljnHU3gJlWWlpyo/
         0gCoeoS8A2JzcoWWOcjDHmrVy+xDABvsIgbD/9csFbXaPaPJfmjq4fMp1GrpX9TojRfu
         a6GT4jrmlOsG0EI/H21IHZL8/SV/tTLl9Xn1GrxGKfSDzsS3jUpL02xlFar+IPTQDpE2
         dBxOpdcxMsO+JEWG4kgUM2A0PHLLr0tUKhvhe3op6hjITTZ1ArbMDFmPkyxPCccKsePq
         y3rcm2ZE/U4iEVUCSg2IfujZ68uf/cLjdVGoqcTq+JxFBXJi5KAE7nEGxGs1l1p4WFxu
         YufQ==
X-Gm-Message-State: AFq9FYKiO1eBUswGKz7ML3jec9phkFJWCe+nd7gyLsipAyYREUIyLmD4
	YEsC4tkDNRfi3idP5Okdy1B6+A6Pm4Zs2IKTXpnmrtSZ2tKN3MhUKCPe7GDRKIgxgzo=
X-Gm-Gg: AYBFou2f7HYAhfh+VNWOimUzh/y21dOc7CwrnP16PIIiv7EPGpQrlmUpSL4nbdB+tTJ
	LD4p035Eu+nXh9Os+18O7Dlx6wsYNgjYQ055/3ul7ebNabXwNTdPaqnDOe7gt9HXNqMkIo5IsmR
	spfgHNGYIeROENSjwM1wY/2bAEG9jRuC0t9CYxVMbrGVpVWeJQFnFHe2wutq0QbRL0iKR9gwEOS
	qvrn5ZQMsdpuiWjLZWQlhulguk7rg2FX0lfA+8I5306LjZnrH6NneDMD2WwxBsJyaE9AH4UY0Ie
	T9ZAVeEzpb1GsbuK0uIYIKGBMHnHM+r2Q03d/flGn8NmYbtPprqWpEO2LAy0Oh233tmJCFc/BM5
	oxX2JwAGqRGGaFoPsAmj0OPpahzfRolublskBrXqfoLB77tI3OJPzJSjwO0aDPk07yZbvBEoeGh
	btpx7q4x1G+3CYbsR31uuxLEAFdNzlL68MlY/Ox8goPpv1+k+OLxQ0+8jU1yRTAcVRPR+CaBvBq
	6q658lHdWdmOo8HhwMu9KROf3FINbljcmh74auVi7YUlsggKZ7lu/q4SLUqiKKYFxJhrMdZrJFG
	1YDgs3ngulxKLGR4nTxcE4+QJFgXBeLK0QA9bx2d8de2HCo9Gm28PH6PhIKNmI9UA+fWR1NyBeJ
	oWuVp2+0rd7FAtEBOL3SbqKHe1iRI3iDJgvD/o2l/nIisnapPnxKf7FODeSCRe+aDH1kuWZe20z
	vHA7lC/AqMqnpW7F8sY9kMM82XU8mrQzJ38tcSQQ==
X-Received: by 2002:a05:7301:433:b0:342:890a:4088 with SMTP id 5a478bee46e88-34af520868fmr4258048eec.2.1790722664863;
        Tue, 29 Sep 2026 15:57:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:57:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 11/26] evolution-data-server: define _GNU_SOURCE for strcasestr in imapx test
Date: Tue, 29 Sep 2026 15:57:08 -0700
Message-ID: <20260929225723.1046705-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130498

The camel-provider-imapx test uses strcasestr(), a GNU extension that
needs _GNU_SOURCE defined before <string.h> is included to be
declared.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../evolution-data-server.bb                  |  1 +
 ...vider-imapx-define-_GNU_SOURCE-for-s.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-tests-camel-provider-imapx-define-_GNU_SOURCE-for-s.patch

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
index 8ed111b334..d1108b6b93 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
            file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
            file://0004-call-native-helpers.patch \
            file://0001-data-CMakeLists.txt-dont-create-automatic-google-log.patch \
+           file://0005-tests-camel-provider-imapx-define-_GNU_SOURCE-for-s.patch \
            file://iconv-detect.h \
            "

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-tests-camel-provider-imapx-define-_GNU_SOURCE-for-s.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-tests-camel-provider-imapx-define-_GNU_SOURCE-for-s.patch
new file mode 100644
index 0000000000..133932fb04
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0005-tests-camel-provider-imapx-define-_GNU_SOURCE-for-s.patch
@@ -0,0 +1,33 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 01:56:54 +0000
+Subject: [PATCH] tests: camel: provider-imapx: define _GNU_SOURCE for
+ strcasestr
+
+musl libc only declares strcasestr() in <string.h> when _GNU_SOURCE (or
+_BSD_SOURCE/_DEFAULT_SOURCE) is defined before the header is included,
+whereas glibc exposes this GNU extension unconditionally by default.
+Define _GNU_SOURCE as the first thing in the file, before any
+includes, so the prototype is visible on musl too.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/camel/tests/test-camel-provider-imapx.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/camel/tests/test-camel-provider-imapx.c b/src/camel/tests/test-camel-provider-imapx.c
+index 1111111..2222222 100644
+--- a/src/camel/tests/test-camel-provider-imapx.c
++++ b/src/camel/tests/test-camel-provider-imapx.c
+@@ -3,6 +3,11 @@
+  * SPDX-License-Identifier: LGPL-2.0-or-later
+  */
+
++/* Needed for strcasestr(), which musl only declares in <string.h>
++ * when a GNU/BSD feature-test macro is defined; glibc exposes it
++ * unconditionally by default. */
++#define _GNU_SOURCE
++
+ #include "evolution-data-server-config.h"
+
+ #include <string.h>

