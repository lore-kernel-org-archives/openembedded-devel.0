Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD14BC2A082
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61072.1767607370092509391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYRrDvKW;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47aa03d3326so89883265e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607368; x=1768212168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SrprgzhC+pDta+kf6x/KtzvjMTW/0atUDHnBaN0fW50=;
        b=PYRrDvKWl34uutOWQ0A7Yy/lqb5YvP6HPeA7RHFevRjeGlOatuE8phKdnTfDujSCob
         /81IfwlTGjwktjBcn0tXZg/87xGul1dHV1pft/WsD+VLcg7yK0wqS9y+jniNhLE9XMdN
         iecgGsXXwCZYzeDIIavtAkOJ0waTEOT1ZRDI+eujq4d/NaAL1fD3NQc810LXxILlMTWL
         Ukp9u3SpzGbc8yQJcPNz/nOVW7llkssv9rJB/Tuoh7N06TrgF4XS2mLnmhxgqTMGogFD
         NWYwjvixADxEaT13uOi7dX0z5EedZKsSbgrIzvAOw8KL/vS77eQwF0VdrVU8k2ApNWu8
         qDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607368; x=1768212168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SrprgzhC+pDta+kf6x/KtzvjMTW/0atUDHnBaN0fW50=;
        b=Xz2Rbsa+HmdvlUqItsEWjWg20/wlw1uluvmRU6gHeRP8jGLzYkM7GsDlhcWvbXc18L
         Hd84cz7O4caEDV8e88RLXTT/Kf2Q8ftyrlsi8eSITpyom36/MtjeFBg1KjcYmLn51T+h
         unssjWGuGYG/5JmRgtLgHzae6Y9YNgDx2hJ+GILCE2IoZWRU31Wb+8JV2Wxzb1R8Oddj
         TOjwNiOUZWXatFCNzO6EoJMafoxBM5foED4CRjjswnANV56e3A5SJNfCHPyfwWehDTDs
         hF99/bgHV8tvItcu3hNQofpnorQvChDd3hOqt3VEzxCT7bzBt1qf0Xh95Ppe65xARcP3
         QVyw==
X-Gm-Message-State: AOJu0YzYb1baTyjHsXVCgV8OFBCr+72po5HhqTsJKpciK7aD1CQKRIQQ
	J3fhFnxxB9goQnulDstd7QPOv+iDgVQ48y6ukPMRdNruwf6lJocusB90Ec5vDA==
X-Gm-Gg: AY/fxX5txDbss0lGA+egJv+7ONgGphwzSQXjTKVcRVEHooi9QMEFOoYn9e6J7BTmbRr
	gYmXOetpnZS7gaBascznx67ukpiY+O7tW/lVnk7QgKkHZB0MUhwX0xkt7KLtcXl6s3lDy77GqQb
	gd1y1FsxQJQODFqR4LOxGNKbSyKAqV+i53x+tJhKs+Vnf3c/3Ppfu8AYDo61x8M+uTaCX2vdkJ3
	/EpdI5QSjo5FzDl9pVRjDHTDg6Jp4lTWFmruAfcxDANViaJLAkGbdiH9U1LPcncpw6dky6J0Tzp
	ehmh+jDSoF501U1Yr4iDI7aoEnh8RU5/QNU3hRZ2Qf5YXF6ScH9FSIj3zulipxm3LWH2GkXRdn3
	u1vS46/UMplSCYy/D3qqxA7hQWd+G/l5d+vOLrq33WYVfpft0JMfOhDRcnNiGp3I3XQE1uuGrd9
	Kbz9dE1mYN5VLYf1cwnrE=
X-Google-Smtp-Source: AGHT+IFGob1n/GQDd80vuDQYFXYtjIWJILfFv1X6Kyo0JjmYIl4kq1iiO/pxReGUlVKUKExl50CkGQ==
X-Received: by 2002:a05:600c:4686:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-47d1954ea05mr703370075e9.15.1767607368319;
        Mon, 05 Jan 2026 02:02:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 14/17] postgresql: upgrade 17.6 -> 17.7
Date: Mon,  5 Jan 2026 11:02:34 +0100
Message-ID: <20260105100237.3081345-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123145

It contains fixes for CVE-2025-12817 and CVE-2025-12818.

Changelog:
https://www.postgresql.org/docs/release/17.7/

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8217b90e941619820c88dbdb4db5e35d171a4157)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...0003-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
 .../postgresql/{postgresql_17.6.bb => postgresql_17.7.bb}     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.6.bb => postgresql_17.7.bb} (69%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 95070b98c5..ce19bacc47 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index 642dbde..af37179 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.6], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [17.7], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.6.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.7.bb
similarity index 69%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.6.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_17.7.bb
index 9ddb40fefa..81b096194c 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.6.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.7.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "e0630a3600aea27511715563259ec2111cd5f4353a4b040e0be827f94cd7a8b0"
+SRC_URI[sha256sum] = "ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5"
 
-CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
+CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."

