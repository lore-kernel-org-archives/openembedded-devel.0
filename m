Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E85DEC636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 04:44:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.76336.1675745092221531208
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Feb 2023 20:44:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TbnNZjTZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id f15-20020a17090ac28f00b00230a32f0c9eso6093303pjt.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 20:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ehu1g0wjUOC7H9B3qmtWcKLJTSDgC8HBzla+TiaP28s=;
        b=TbnNZjTZi3XLnW0obmPD3cfyJbgumrjSRg0Io9fEO0hcd83upIqJIdPxKJnfDGl8PR
         T/GfUfC8U66a7noJF+SeJrqjqkfJATArNtKlBKmaQNMVaKun3752jjvnkhY3OqtiLyZv
         a+1MfdpWjmGYSxwbSk+dIyTcBDKJYCMGzeQf6N8ZCUCTsBJ+VrXVk4CT9SB4ZBwMqlG1
         AGSCvyC2L6AJhzfq/1dxDjEGzyA611Fmt6J0Dk6kBuCPcNWT3fnD0SQ8SxWwYUJ1I6HQ
         2qc38ec3vLrG6HZgSO6YJbTb51uP0aBBRfTUibcBxza8+YSvv6IPTpPAOcJEXnWF/kRj
         68hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ehu1g0wjUOC7H9B3qmtWcKLJTSDgC8HBzla+TiaP28s=;
        b=fsS/8MJgfCHGnxcITods+G/bvtXWK1rv6LuPdPCHAE4zHvlqwIARdXPv/YUOH1IFhk
         keecg/g5G89A7tSbsdALUANZG95HJIu+e/zOaWVhOjeNLoo+KPVGU2fCPQoJ/sgr0LkT
         hJ1L+zWLgIqLASjFQQqGTjKWh5lHMNF0Ik66JoOMDbieqbTOs7pgoZ2seE87nXz3wEWN
         swb3b1hAmz5tVN3D1vSZprpj2E0cuxdNmcLzjlfghAQboTAyWiCKcZ7tXYBj8dZbhjw5
         jnlIXiJB7wdh9zWOhGtFoNN9F5mZHilPQucax0Em/jMWLpTdkAXuy7AximJUF0Cgnajm
         Pkkw==
X-Gm-Message-State: AO0yUKXBOiE622AbUNTBF6Bt+n7KxidBKVhdY/rFn0qtWEdqr3UNZ3KA
	/uGNrWog5rqwFPUcNL0Vm6tlizsWE9g=
X-Google-Smtp-Source: AK7set9+Cq5WtTwjz9CJlMIS/rwoW9ZFFNSRjX5KON4he+j2+k5NSovNbg9HcIBfcJXctPFNVoQDVg==
X-Received: by 2002:a05:6a20:549a:b0:bc:a63f:423c with SMTP id i26-20020a056a20549a00b000bca63f423cmr2472286pzk.11.1675745091380;
        Mon, 06 Feb 2023 20:44:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id u13-20020aa7848d000000b00593ce42db6bsm7993180pfn.59.2023.02.06.20.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 20:44:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] perfetto: Fix build on musl again
Date: Mon,  6 Feb 2023 20:44:48 -0800
Message-Id: <20230207044448.2426336-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 04:44:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100954

Update to 0.31 broke build on musl. New dependencies mean additional
fixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index e8c4025bd8..4ab7a93714 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -49,6 +49,9 @@ COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm).*-linux*"
 
 CCACHE_DISABLE = "1"
 
+# Some musl hacks gets through compiling it for musl
+# Nullifying -DTEMP_FAILURE_RETRY might be grossest of them
+TUNE_CCARGS:append:libc-musl = " -D_LIBCPP_HAS_MUSL_LIBC -Dgetprogname\(\)=program_invocation_name -DTEMP_FAILURE_RETRY="
 FILES:${PN}:append = " \
   ${bindir}/tracebox \
   "
@@ -133,13 +136,6 @@ do_configure () {
         cd ..
     fi
     # Done processing the Ninja files
-
-    # Workaround for the functions not supported by musl
-    if [ "${TCLIBC}" = "musl" ]; then
-        sed -e 's/strtoll_l(__a, \&__p2, __base, _LIBCPP_GET_C_LOCALE)/strtoll(__a, \&__p2, __base)/g' \
-            -e 's/strtoull_l(__a, \&__p2, __base, _LIBCPP_GET_C_LOCALE)/strtoull(__a, \&__p2, __base)/g' \
-            ${S}/buildtools/libcxx/include/locale -i
-    fi
 }
 
 # Perfetto generates a few different binaries, such as traced and traced_probes and perfetto.
-- 
2.39.1


