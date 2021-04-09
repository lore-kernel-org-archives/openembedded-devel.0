Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web09.3540.1617934866193221202
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePCBV/C/;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so4335512otn.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E0Az+bjQ/zr1C0xQBRwA4vb2sPvMZprBobokoNEHZcI=;
        b=ePCBV/C/lQgjBO17WldDhvSUEtRol1zE0FO/S4NNNRdtwQ8c9SBbczxZbvY/Ss5xyl
         wP4SJaQgu/OYYrQUlfavYsbPKlNpbPWOpoCpPwMTRA8WuCd1oStPZtgA9Cvb0H/njzlt
         JUxfr4WCFJUNufU9HxVKUiAR1RQWKWOYAudyTW+t2WGN93UexkUSriWYGfzE3Glu+rOK
         YqFFNRfKsErPOSaTQg7lGH7sErmDAEUEMc8eYz+Q+N14cDcBJnJ/NJRQxX35lQe5xK1C
         hon8HwT8BGOLA+Xk9FAwHNJ2KDUdwucdkbz0U50vo/WLU62h6IZZXIl9dVQ5y1TFdx3A
         jRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E0Az+bjQ/zr1C0xQBRwA4vb2sPvMZprBobokoNEHZcI=;
        b=EUlgIiadrnnNSsCsvVartVOSsGKGrpwPHfDSGL92ByHtZ1SIAGEagNJKdEAILPFR3q
         7OB0L2B8HgSuu7qNluomEh9E/djEc8ezyd3AtyTuocUKM58zIfLl3JlTVBm/c3juNYsg
         Pkb9GeWAg7MhHzyAtDdMGjTcRDNGQ/j5RKhJ/1VIne1G6cDphtXAZQiKZilfF/+TvK3K
         szVSdoF8uJVj6yypkvjP+W4zjms72HEMHghm63HTwaLJJ4Ns7eAO/bN+QxxYZAtcWPKD
         id7CEyiCuotV3+fEqtZg6wE/dR6e3YjfCUg0nGoC3sEQdlJ1GtJMEKadfOpHeHSWBhTu
         Fw6g==
X-Gm-Message-State: AOAM533lEysPce4/kfofgF8sfc0F5Nip9+gh1pCNDAyep2aLZ3iE/vdV
	9TLVWdu8CNwhdAs8yASdCrTzHq/mMHs=
X-Google-Smtp-Source: ABdhPJwe/Zhq/SduXLAMxGe9W/3Egz91es2crC/cs3eqMnysZkWoQHDsRAtbrXxOYxeUYKgnGOVqlw==
X-Received: by 2002:a05:6830:2472:: with SMTP id x50mr10343895otr.69.1617934865377;
        Thu, 08 Apr 2021 19:21:05 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:05 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 14/36] python3-sqlalchemy: Upgrade 1.4.5 -> 1.4.6
Date: Thu,  8 Apr 2021 19:20:27 -0700
Message-Id: <bdc87e70c15976c099cda8ac074e94b9d1f42585.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.4.6:

orm:

- Fixed regression where a deprecated form of Query.join() were
  used, passing a series of entities to join from without any ON
  clause in a single Query.join() call, would fail to function
  correctly.
- Fixed critical regression where the Query.yield_per() method in
  the ORM would set up the internal Result to yield chunks at a
  time, however made use of the new Result.unique() method which
  uniques across the entire result.

sql:

- Fixed further regressions in the same area as that of #6173
  released in 1.4.5, where a “postcompile” parameter, again most
  typically those used for LIMIT/OFFSET rendering in Oracle and
  SQL Server, would fail to be processed correctly if the same
  parameter rendered in multiple places in the statement.
- Executing a Subquery using Connection.execute() is deprecated
  and will emit a deprecation warning; this use case was an
  oversight that should have been removed from 1.4.

schema:

- The Table object now raises an informative error message if it
  is instantiated without passing at least the Table.name and
  Table.metadata arguments positionally. Previously, if these were
  passed as keyword arguments, the object would silently fail to
  initialize correctly.

mypy:

- Applied a series of refactorings and fixes to accommodate for
  Mypy "incremental" mode across multiple files, which previously
  was not taken into account. In this mode the Mypy plugin has to
  accommodate Python datatypes expressed in other files coming in
  with less information than they have on a direct run.
- Fixed issue where the Mypy plugin would fail to interpret the
  "collection_class" of a relationship if it were a callable and
  not a class. Also improved type matching and error reporting for
  collection-oriented relationships.

asyncio:

- Added accessors .sqlstate and synonym .pgcode to the .orig
  attribute of the SQLAlchemy exception class raised by the
  asyncpg DBAPI adapter, that is, the intermediary exception
  object that wraps on top of that raised by the asyncpg
  library itself, but below the level of the SQLAlchemy dialect.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit b649e45ab1f87346c535ef77052343594391bd39)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-sqlalchemy_1.4.5.bb => python3-sqlalchemy_1.4.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.5.bb => python3-sqlalchemy_1.4.6.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
index 206a9ab3b0c..4d5aa33d1a9 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "1294f05916c044631fd626a4866326bbfbd17f62bd37510d000afaef4b35bd74"
+SRC_URI[sha256sum] = "193c3ca465fbc68de071995a461ab535466f041089d372ee6a6f0aae7b9307e6"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

