Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D51CA0EFF
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 11:41:31 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.7253.1755776481408303327
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 04:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WPgkYv3G;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2460757107bso4661725ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 04:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755776480; x=1756381280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQMt/BZSdyNjG9/BlINodz2K2BDZJ3umH5GzPHxBrSg=;
        b=WPgkYv3G1om+lHz5jB+v3+WmZ2bWxFOKP2WOgTPb5aIfwzy96oFwYK942g/k19dWyC
         NnmKqAo4MjujkVig7LlftPdVsJn+Ft7n0Tk8WTX3MICDNiAM3rQIQxYD5GfCqRqqFK+A
         0eN199rRBKHgt+6v4FRP3/eqowEaluwil5y94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755776480; x=1756381280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQMt/BZSdyNjG9/BlINodz2K2BDZJ3umH5GzPHxBrSg=;
        b=wpVncSHdqWo6RDirSd4G5na75w149ZB9Ppwaij1TTgYYhfIrwgTIWP3v77CjUmlGaN
         vdLSTs0bR+E2tbpF+Q0QEqre0HcBNeQZLCrKAUNSBPvgz3dhcIWD1E6qsHmd2W4eq4nS
         Tp/efy0RYqifZAgLb3XIpimA9jcQSXtxO69Y3JQmBKLtXNzybs97RnDhpx9enAT7L3rI
         RCHZbnne8MhJbOlc8Pc4O4jqBGn+A8JwS5bdTLeo+WD2DgB03aXqqNf+pQx+uNsIAEoW
         aPoygod3rogKf/tNjS7Fczs846tX9VG4g42x67QEYs5jF15+zIGcIIJj21izM2fEC35E
         qRXw==
X-Gm-Message-State: AOJu0YwNLUEWdPKLMT/TL6UOd4D1OomNNWCWS9rfr4DVzs65sGfVcja9
	gV9npSvb2KD1dAbRpn1OlmeLYYbmwbitCL93yXaBsycnTgRBHqwOroZUrdfP0Ekf71PBdL9z4Ck
	D0DJp87M=
X-Gm-Gg: ASbGncvS4tX5Re6m4kk8nEndMKyU5grAHOw52rpy5imCQfR7lJxkwVLTcEbdKHPLxDj
	nLXDGe6dSpR1XwcMnUqwFh4ajVRombjUUeNEtxgQdu0CxzAGVzsIWtqsH+OqFOmi8pdcVAh8Gh9
	neQ/NYL8rJh6RrhndZZy1DE8SukIEr5grEwhQNCKIvBnZ9CBJ3+y7TXAobmRzJdXYPqh6ffTmoc
	hmGLB4DZ7xlz8BxQ89MlAvgWSFClnZVxVJmVEiO9wfmhEl6yqw6k6rxA/ZHGW6CLKcIhqLkUWH0
	5kFqhvhdXFpolCPUvu9WL+7Gb6/0YrqYQBdDs3KhgHDBBX+7IIebpc44T7VH8+GREcH2Izu7N/W
	DCa++yxQfXKlQzTQsEP4jKrf624HwcT30JA4o7QDldrU=
X-Google-Smtp-Source: AGHT+IESfVmNU5wWyv6Ibxa+RUZw5QZH0oDNj+OEyEABMZvmxFoX96dRpL78DMx4dCBr05cVVBwwtA==
X-Received: by 2002:a17:902:f550:b0:242:bba6:fc85 with SMTP id d9443c01a7336-245ff86991emr30161685ad.56.1755776480305;
        Thu, 21 Aug 2025 04:41:20 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.224.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35fc9asm53489285ad.47.2025.08.21.04.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 04:41:19 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] postgresql: upgrade 14.18 -> 14.19
Date: Thu, 21 Aug 2025 17:11:03 +0530
Message-Id: <20250821114103.82623-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 11:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119075

From: Vijay Anusuri <vanusuri@mvista.com>

Includes fix for CVE-2025-8713, CVE-2025-8714, CVE-2025-8715

License-Update: Align organization wording in copyright statement

Changelog:
https://www.postgresql.org/docs/release/14.19/

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 14.19

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...0001-configure.ac-bypass-autoconf-2.69-version-check.patch | 2 +-
 .../postgresql/{postgresql_14.18.bb => postgresql_14.19.bb}   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.18.bb => postgresql_14.19.bb} (71%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 2396be2df9..2eb1deec07 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index bbbb204..0919d2b 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.18], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.19], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.18.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
similarity index 71%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.18.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
index c9616c21ff..1d8ab90c25 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.18.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.19.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d5dd73e90ee1a572679460ee67233fcc"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=08b6032a749e67f6e3de84ea8e466933"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -11,7 +11,7 @@ SRC_URI += "\
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "83ab29d6bfc3dc58b2ed3c664114fdfbeb6a0450c4b8d7fa69aee91e3ca14f8e"
+SRC_URI[sha256sum] = "727e9e334bc1a31940df808259f69fe47a59f6d42174b22ae62d67fe7a01ad80"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.25.1


