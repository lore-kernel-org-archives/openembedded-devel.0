Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79116C79F82
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 01:54:15 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.903.1788573246186331288
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 18:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=egc4wAKk;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d53197d8b5so14912995ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 18:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788573245; x=1789178045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UxxgNPHYxw72Sdriw2G6G7hSY8dH3a6xRL2zjy5XkDo=;
        b=egc4wAKkrqXt1bMnSw2u/yAhdO4ZVU/JQC/T5MW8oYwhaUOIsm4keDhFns8fQXN3f5
         lThKELqY3cWOV43EYni3XOhtOYftpQnD1Iokic+1bDOeRuL9QeKx0x2gjmY4Ni/4v+ki
         FxIVK1XUsQ57zP98jdF7SwhBYceyIw31b8jVVEKzTgK/W7tUB0y2W/Wl6alpAqg4Pi6W
         ZN6AsUhuowWnw4iDJMszEbQb/h0jqBzlpFZoIBiC8roj3ig7c+yo1Ie9qr86Pp8ZuDff
         Oj1LADC84ftYnFFDF856dhQScnC/qPs3POFqH87ZXN5dOEYbPc/j2aQx4SAyhvaGIie3
         Fmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788573245; x=1789178045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UxxgNPHYxw72Sdriw2G6G7hSY8dH3a6xRL2zjy5XkDo=;
        b=qZ3j3YOxnAkvC6terRTtd2RZBkh/j3HKS4GWPImATEXILmvfkMCZgGVzSU1kKMcf5W
         kWL7K67YK5/qoHrkyXvwIwp4tr65P+ldulOCN4RVFL+sZTR6Hp+AwmdnbzeC6Jp/kXJI
         BtZRprJhU1NYNVDgrwoe7ROxBtydKZyIzgY+hKfBWsSyp98E1bWP2L7IBzxRnEcEa3Ps
         1WxjLf1hWua+awPGwcth2MaBj7lwS/DTyXJ6MPqAPSZeyrgjsXiyqttMi3L4CgKnZ3h9
         q7O/N7kCutwQ+BiZ2QajVvEqYB3ATul/nYbB8AGLfvERgQEl6uzTj97Hi56nSiZS1wbB
         44mg==
X-Gm-Message-State: AFuF++nacLA/lTOUFfJmGNaiu+i8hYO8fwjL8TgIwRP/RDJdswOA+2yV
	2gyP3n9b24dl8KFL98WJ6gclQaFXOToKYykQrNRyrAy6+w5uuWdP6cxB0bhPUA==
X-Gm-Gg: AYBFou13ESnlKPLZjd8vywXV2nwWA3NlmLcLeqPJ5HRtLq3BkrJa/QUuxw6uCnGnf96
	/FvowfYdbAm8B21XoP8FZgOVtzHyjgpBljb3UnnU4xTyoDlfLuDZ0hqxnbIr5NtD+wCaICrBocB
	IKxInB75FR5JtksAGF4vAuz9QzOdikSUm+3pJJMnbEtwNJr1QSzl7KP7jXRok8ob65FqBOYFSsq
	0IbEkqr1Zcmde0FHJZ1lh0jB2lkV/nb9rs98iKLE3KKkMgBWzsuaMe3nz8JtJOjiD62egopsWnC
	5yWWK8yOWFZ2Pk3ON4cFwC/QJxNhyc98D+7J6o4pa3H0bKZfKz2MUQ4Cee5J8biSF5TLBYvXPci
	ocuTcM44QDem83MLIrjWWAKRBUcFFcuQW/bhHt9VpKdE5Ks6bbb7F9exKsVubFMbOxwySXrjG6J
	asG82m6xudFRL/sGln5OkUXc0wEICnyQcjPTP5j46HjMqejqLKkkCRS9FusoG1a0RtAQluyeze1
	//4dFDXFXdOhTfC3+eAY+0CtTpvoptafx7pEfkRJ04G0QzcEWc4LiGpe0Xlj8Y0iGKuC/TIBO0w
	Tsc5P9lt1UKCiZCxbq85VpFjlY5m2+iiqnkqQfHxQlVu7faMMSYonWXvieJXQG1Es/4aMW+UNhy
	GUF08NFGv10GdGGO1gLn4PWzFJfI+NcQQZbr5NTi3qc/630LQQ3G5kSu4
X-Received: by 2002:a17:90a:e703:b0:398:e969:87ef with SMTP id 98e67ed59e1d1-39b2629926dmr14769008a91.24.1788573245485;
        Fri, 04 Sep 2026 18:54:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm2505284c88.12.2026.09.04.18.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:54:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] dovecot: Work around clang 23 hang
Date: Fri,  4 Sep 2026 18:54:02 -0700
Message-ID: <20260905015402.689119-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2026 01:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129774

clang 23 gets stuck in an infinite loop compiling dovecot, so the build
never completes.

turn off loop strenght reduction opt pass

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
index 2f4981bee1..27d19f178e 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
@@ -20,6 +20,9 @@ SRC_URI[sha256sum] = "868c2686a61b5f8e00a3e4721789b1ab46e6528fd773a5fbed07a6ecba

 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"
+# clang 23 runs into infinite loop while compiling it
+CFLAGS:append:toolchain-clang = " -mllvm -disable-lsr"
+
 LDFLAGS += "-ltirpc"

 inherit autotools pkgconfig systemd useradd gettext multilib_header

