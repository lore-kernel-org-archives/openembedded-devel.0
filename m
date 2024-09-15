Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 999F0C3ABA0
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 16:30:53 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.117605.1726417844866425064
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 09:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qxjb9eqX;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b5b65b1b9fso27476737b3.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 09:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726417844; x=1727022644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCASiIWlmLqbAUN2P47BnjpqrA8IXLgC20kd6WkVCas=;
        b=Qxjb9eqXMLwXAy7cAlBeB1aiN4zuk2XdlYLb5vdPVsrwm2AoI59UUaogk/r0zEgBNH
         cQ4IJUwsZoIX8UxB6rEjOCToFXwYNcR7TeK3/zKi/6O/bI2ygIlJAfobXC5lGJz6QVw/
         7vGJME5+cCcrKGAYUs5BqUkFSzRoGTTIMqa3fETmShVFWyPdArZvraIN8qiHYaeAqXG+
         Tuu+bfGsGEkNKP/CDAbckzJkMmzn7KSjaY834Fz5j2oSiKKq7B6dSfT0pGudVcid8OuJ
         0BZbmbzKn3wDNqBFBFrb4OnUy04yVP/mfykc/bgOdFtVbh8PRt5QvY3wPC/QLMplDRU9
         zkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726417844; x=1727022644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCASiIWlmLqbAUN2P47BnjpqrA8IXLgC20kd6WkVCas=;
        b=ivn43DmZIfTvGePlvOVCxCa6iFcx2eul2Y4BOVJNOpEE5ZpZdMCtW43RzBgJYeM5V7
         bgvK9lVybe2XNszeFC8sV0lJdH2QU0OPuwaGAZjt8M/OY3recKuzrJ/NuMe48WrvmZsE
         FR97sX4b0WZogkLbYHE7UXgpF+ZwPVVsEw7mW0tay/9VZ/jldSSLhYGdwzlUbddbN4qS
         iKnlqsgZZWZDVnQdLp33Jja84ZYOXF+arGrRtHj7Xvbo1M0qHU4B69Qt2gxdGu5pvFf6
         KI7H/ML4PJOaVUqCYNcm7A5GDP39bZvvElSqp/XcIpzSGLIqFGRSAt30XsXo8U+DUvks
         u2Fg==
X-Gm-Message-State: AOJu0YyHY/mxAM5ksN+EaX/P5HKJ2FaXbPp6G7qhdMvPSZ/KCS2eoI3V
	qu2vHBqRzNJ2qBF8Qm/twjYpOLp/D0jCwsi+17qUK8swqbId8ZL9RxMuTA==
X-Google-Smtp-Source: AGHT+IGnqk+lchoMkQ7JCLgv/cP44B8c+n8PwglEd9Orb7zOjmKaRCkxX0GFCXqM7BdPQMCwfDlDkg==
X-Received: by 2002:a05:690c:ec8:b0:6db:b1d5:5116 with SMTP id 00721157ae682-6dbb6add2fdmr111373057b3.9.1726417843962;
        Sun, 15 Sep 2024 09:30:43 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:971b:923e:7e7f:305e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e28e55sm5777867b3.70.2024.09.15.09.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 09:30:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 5/5] postgresql: upgrade 16.3 -> 16.4
Date: Sun, 15 Sep 2024 12:30:40 -0400
Message-ID: <20240915163040.189190-5-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240915163040.189190-1-akuster808@gmail.com>
References: <20240915163040.189190-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112308

From: Wang Mingyu <wangmy@fujitsu.com>

0003-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 16.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4d253bca26c5e6f9d79e19ab1b62fa34b5c05429)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...03-configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../postgresql/{postgresql_16.3.bb => postgresql_16.4.bb}   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.3.bb => postgresql_16.4.bb} (87%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 9df4d073ff..342aeba85e 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 401ce30..27f382d 100644
+index 65715a4..4ad6340 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,5 +28,5 @@ index 401ce30..27f382d 100644
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
similarity index 87%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
index 31f427503b..341f855d49 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://CVE-2024-7348.patch \
 "
 
-SRC_URI[sha256sum] = "331963d5d3dc4caf4216a049fa40b66d6bcb8c730615859411b9518764e60585"
+SRC_URI[sha256sum] = "971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.43.0


