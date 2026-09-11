Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01021C88E45
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:18:05 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40605.1789136280255713343
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jX+qglYA;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c96c92c0980so742108a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 07:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789136280; x=1789741080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n00U1zb927CwnuY9ZMVzZaCQhjWgRphwfOhlb4Jfaw4=;
        b=jX+qglYAumRMgJuhbvDUUmgZQN9iCWzcnF7H4zB3sHi61Wkc+c9ibiCaQtocEUZjYc
         vDisj+hjMlR1kBB7NEdvSTNTtBhfpkxa1X1Ly3o9AoOvsjfOZ/QWn8JK6FDiEwT2EcLs
         gddrsIcpYZ/1DKKLqOaIhH7u3rL9+xk0E/vAzWrgIhJNYP+ZloAF6K9F50NZlIpBfAz2
         v7ILg/6oL+cE45u8E4THn5x/fUVjDZQ9BjI+RuvzvlIYeyIUOWFyxz3f4XhFg7o99K/i
         na8F+Ip+5KNCayZne9PEeAeVgG7G2ybVQgk/zdu8JCOFDvZ2Njd1XqlfXDIyCKbWLcmF
         aEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136280; x=1789741080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n00U1zb927CwnuY9ZMVzZaCQhjWgRphwfOhlb4Jfaw4=;
        b=ihfn0L+DKCZ3UmTBcDp909UTntc8ZTtbHTuH3QNNOhL8nLKeeO52wbDwqbDnTUbBQ3
         0I6B1/BXTgayt0KtHwnXcMjX0yUlR7Oj8CR/AreM0drFTaeK94RD7M6dw7ij02XiumZO
         6K5HWM0uAmzvLt+3BWOlr+qv6cq/W1wLYlfW+18+tYWDKz3bMLeLJ47EiVWL77+yhPSQ
         DAeiKPDrQDWX7YhHfuX27Qz8UdL2nQF/Pq1pS18TSjeDfOtyt9xoxkXEb1cWBRxlXVQW
         FOmgf57FyDpAHdLl/C9ECvYKE0Olh0zFYyAyFlv3aHWrcBkP6khjOJLkk0EEsh75Y4rE
         7nxg==
X-Gm-Message-State: AFuF++nwPYAA1WmqqWcuDUPKmLI1AmFNtBV/goqBPOiA3PJESRij5CvI
	6EbovDfRcuSRmFNe73unKj4RgRmbh6NwTLFboJSPENJ89e5Od3bACj2lwXJAlw==
X-Gm-Gg: AYBFou0B+aCX4TdqAt47WfNvijAxl1DymJ8YFmgg4IQADM0sA9lC+TnD3BjL1yZ9GMS
	SL61/R0YgySwpDKIJUBkS1k/7k9DUS8DEkZNmaRkxT/ABjvug2UOqDd5spTpC/40p/4NODXeFpU
	BJyW2FW25Q0sG98nmImNJm3j9COcI2hbFwsrNrXMMdynXAi2UHzzAqYe/FQumqz3nhEVLb91LIJ
	pUG6HjQNZplwak5F/qy0ItjBUqEDXTuE9bRR4XfaN9X9psJb7/IFv7HJYao119IRs02JUhjeQ4F
	4/Lwqkoj2loQgDqmEThJowjikx306p9etUcK7OGOxxGU9E2rgPCUXCoY5JlPta0s0umu68Tw3ZW
	KQ6rnvaab/hBt20Q0sRAndHq65k0qrp11xitR4EdpqeDG+HIrz1ciIKBUBRp7d8oXaFA3c3Db9/
	StvmPfLAF3smlYubya3iCxY6VkWPQFUlzSYoS48Xh6cvHF8jULLoNbRF7QOMwkw31XkHx1w86Ug
	rU1byy4xSnpopYmbkiL4SB//dOXV3hdBWoy6nMHyRm5TZyzKbrQtlitlWMiIzuE6FnI9lsfYRZE
	oyrhVTUmdxr4/VclGCotF0f6+JBJ1KzXNL3/3g3XJOdEgCrblbXrn8Lqt7W1XstIIsIRhzr1fMX
	T+03VlJMlwXs7FSgSDV8/x6xxUwb1yj8EBkbxdKpC8dCHGTflhxznduOKwQ==
X-Received: by 2002:a17:90b:4a8b:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39d9bbc81cfmr6952566a91.2.1789136279386;
        Fri, 11 Sep 2026 07:17:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm7840791eec.28.2026.09.11.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:17:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/7] bit7z: Fix build with clang
Date: Fri, 11 Sep 2026 07:17:50 -0700
Message-ID: <20260911141756.2275517-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 14:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129965

The 4.1.0 upgrade added two CXXFLAGS that only work with GCC, which
breaks the clang build of the testsuite (BIT7Z_WARNINGS_AS_ERRORS
defaults to BIT7Z_BUILD_TESTS, so -Werror is on whenever ptest is
enabled).

  error: unknown warning option '-Wno-sfinae-incomplete'; did you mean
    '-Wno-delete-incomplete'? [-Werror,-Wunknown-warning-option]

-Wsfinae-incomplete is a GCC 15+ diagnostic that clang does not have, so
only pass it when building with GCC.

  cpm_cache/ghc_filesystem/include/ghc/filesystem.hpp:4090:41: error:
    implicit conversion changes signedness: 'int' to 'mode_t'
    (aka 'unsigned int') [-Werror,-Wsign-conversion]

Upstream declares the ghc::filesystem include directory as a SYSTEM one
(target_include_directories(ghc_filesystem SYSTEM INTERFACE ...) in
cmake/Dependencies.cmake), which keeps warnings from that header quiet.
Passing it as a plain -I undoes that, so use -isystem instead.

There is nothing to upgrade to here, 4.1.0 is the latest release and
upstream master is a single documentation commit ahead of it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
index 4661046220..5f0b65b3cc 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
@@ -35,8 +35,15 @@ DEPENDS = "7zip"
 
 EXTRA_OECMAKE += "-DBIT7Z_CUSTOM_7ZIP_PATH=${STAGING_INCDIR}/7zip"
 
-CXXFLAGS:append = " -Wno-error=array-bounds -Wno-sfinae-incomplete"
-CXXFLAGS:append = " -I${B}/cpm_cache/ghc_filesystem/include"
+CXXFLAGS:append = " -Wno-error=array-bounds"
+# -Wsfinae-incomplete is a GCC 15+ diagnostic, clang does not know the option
+# and errors out on it because the testsuite build enables -Werror.
+CXXFLAGS:append:toolchain-gcc = " -Wno-sfinae-incomplete"
+# Use -isystem, the same way upstream declares this include directory
+# (target_include_directories(ghc_filesystem SYSTEM INTERFACE ...) in
+# cmake/Dependencies.cmake). With a plain -I the warnings coming out of
+# ghc/filesystem.hpp are reported and the testsuite build enables -Werror.
+CXXFLAGS:append = " -isystem ${B}/cpm_cache/ghc_filesystem/include"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[tests] = " \

