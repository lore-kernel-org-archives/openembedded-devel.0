Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E16E6B274
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 05:03:11 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.95332.1766466184484194052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 21:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aSc4BtaH;
 spf=pass (domain: mvista.com, ip: 209.85.210.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7aab7623f42so5323650b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 21:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1766466183; x=1767070983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zwvo936MA/9EQBoQ7MIpHrkC8YVqG+z6pCYVwqbUWZI=;
        b=aSc4BtaH3Ut3uVBXpWJRUJeka0pcR3uqongMybhbjiOvMdNiFtY+dviHZTnsEIo3nk
         Jy0kbW5Bij2oZXoPOpAq1KSnm0Kq5D5cfIkFQ+7q4BJhdpKRdqBzn+INx0zDppnlGATv
         LTx0IAfypzhh7WJerA0RKvW5u8/OKo7XFFohY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766466183; x=1767070983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwvo936MA/9EQBoQ7MIpHrkC8YVqG+z6pCYVwqbUWZI=;
        b=hahrkiqif2KIw2RdGiYh7xTeWNM4QtKSW3sUxAGikfRdDBfsvUEHo4gXlVQyy8zufs
         tJX2keIVU0IZ0ox6HbjKlG2ugFOygSiDVgaJSYABuRJQ2BJ3pXPYXTj+n7ZjCMqWhyqV
         hMq46rBzqGeVY6L+7dxxNe8Xcib4tP9tbSBBGMx6nkE29yy9sOx6fs/Z7KS6pDmfISji
         LgW2wes66qvUZoN28qg4pjATHBrAbfeFzvRb6lgd/k39sb1JH7PvvkNXienmcHr2b4CG
         NLLboPdi0PlgowftTksUTHKVveDaAVZVb/jfSUWqo6hRm251rGiQ/qyvpa48U95nGrFV
         9TcA==
X-Gm-Message-State: AOJu0YzmlUAWbONEE6NgT1GwGu23JWpLJS1sCgt5GmeWoJe/VACFXLAn
	ExI2I9sKuXDu/bjiPi4Za9NnZt960QsY3RJMY2VQq/FDgfmJJfFeBxu9NR14tKlIeH2CDqC0DxG
	9p3U3PXg=
X-Gm-Gg: AY/fxX7evrC5pCL+UKAU+No+joKo+TIXZ7D31EAwIR+WXyKVSw0nDDexUEcdgxSoMQg
	MHAB2eAvxQEjB8oTPKLObB3C5vdpTSkvdMoEGTP8PSdpOaPve7vsoIAY4VALcUURDezxMqI4Z3S
	jMqnXIaM/Yk/PSrA2/qXAl/GruxNqacOHo4ZKTOKlJrhS4h/hx6ZwYQewJI5jioZyIq6d2VCvYn
	ZPdLWnt3JbC3f3TyrlXS4FbghGvOaT66Oyjh/LQ5LlqnCEoDpeSyDZDeJBbwCuWV30mHHazLGnM
	psmk7IAnZpCy4DZqvzhgH6igZVlRjvBLN0Ay51T1rmw1LOmgbSBgkiiZzvTCm7y763+VEZ9z8nh
	zCjXCtq0Rgx0lOsUN2B/iDOdhBmQIBsS03WUXtBbnr4Q0IRcB1a5PHTnLtPvXkwyVcJVamWxUIA
	kkpDfScK9XE/Dh+ua3vgZavPnR
X-Google-Smtp-Source: AGHT+IH6EkZWo7PhMCjnTMw5AtMDBMarEAuk6bMrxQg723VZNlSL8MZgVpucrO/0MFDrXoaNPruP8g==
X-Received: by 2002:a05:6a00:a11:b0:7ff:a989:2e8e with SMTP id d2e1a72fcca58-7ffa9892fe4mr11750315b3a.25.1766466183421;
        Mon, 22 Dec 2025 21:03:03 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:54:bb59:d26b:1e5d:2e4a:9386])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e0a2e3esm11984370b3a.37.2025.12.22.21.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 21:03:01 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] postgresql: upgrade 14.19 -> 14.20
Date: Tue, 23 Dec 2025 10:32:52 +0530
Message-Id: <20251223050252.182801-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 05:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122816

From: Vijay Anusuri <vanusuri@mvista.com>

Includes fix for CVE-2025-12817, CVE-2025-12818

Changelog:
https://www.postgresql.org/docs/release/14.20/

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 14.20

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../0001-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
 .../postgresql/{postgresql_14.19.bb => postgresql_14.20.bb}     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.19.bb => postgresql_14.20.bb} (84%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 2eb1deec07..76363cd26d 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index bbbb204..0919d2b 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.19], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.20], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
similarity index 84%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
index 1d8ab90c25..04d8723f15 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.20.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "727e9e334bc1a31940df808259f69fe47a59f6d42174b22ae62d67fe7a01ad80"
+SRC_URI[sha256sum] = "7527f10f1640761bc280ad97d105d286d0cf72e54d36d78cf68e5e5f752b646b"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.25.1


