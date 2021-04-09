Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web12.3628.1617934861617172872
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UZ+N9909;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so4316773ote.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xjdwDbJ/vlt341vPeddsQp5808tE1Y4cQOe+G+3rbNE=;
        b=UZ+N9909SxADLnc/tgQpxvqKbEXuyUkY59TRFi68O5+N8ebTNpFmzrXCpunaiEta8j
         NTLCEJVGNs9HGxPR9LNUEODDj1E4wHMDUdfWcMP0dJc6wH6lyC3BGcUYC7fawQIeB3BE
         iFTNnDfijaTDkxuzJk7rB/FtKGH3EWQkQjKfgpmx6a3W1/vGfYppHJzocu+byTzZi5oY
         iADBjEqKrsrKcEI5YE4TXYSKlcJ/IXvOBTn/PuQt/GeYnOw4HEp/6BwOx6uqGWZ521Hy
         riQbZw4YxsJeCy/zHNcxo7JMhahzf7kJEWuILLvB2tjaUEIHYjng54+f8eH/fMpF1dZ1
         yFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xjdwDbJ/vlt341vPeddsQp5808tE1Y4cQOe+G+3rbNE=;
        b=HdNnLFW1YL5WKgpLqv37PU/TP0rMeTq5bfKz5rPJpfSJdyaUz5ORoH2dYiI0bMYYHi
         hZu8UkfdpA4m+Q8R4MRe5KF7+bNN05ABWL8jJ7WB5r/sDj8MeEOM3u7fYWQzY0xp2j5k
         8oWf7TFZuvQzxyRXMi96UGjp/P6awyeMtRs9lAMY/6Im0v5owBPuzlFaDUa10icV2rU+
         58mLeYCAAE38AYFYaQTmYyCEiphVAwHQeM0rUWXLjKEyez52uUJ5490xHziMgLsOxxm+
         mxnlo47f+Am4z2FssdAzYaPxsY90bQSAmjuMBNJiL7UqFUNAY3kcVuSQB4CqlmKoT84Z
         PDHg==
X-Gm-Message-State: AOAM530K25Faw0AHCE4t2OB13am5TahBOrWgHLfTYFO0rF99Kf8F7ezx
	ep86g3trcm1t/3VOx1kINUepq1XRrgw=
X-Google-Smtp-Source: ABdhPJx8eYYB2QilAjZlxYxXvcrKPyPciPZOoGbY+a4j9A3A674jBXKD0zhuECRCrgDN1Cv3oToKrQ==
X-Received: by 2002:a9d:5191:: with SMTP id y17mr10292442otg.332.1617934860750;
        Thu, 08 Apr 2021 19:21:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.21.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:21:00 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 08/36] python3-sqlalchemy: Upgrade 1.4.4 -> 1.4.5
Date: Thu,  8 Apr 2021 19:20:21 -0700
Message-Id: <4ca987b2dc4ab3fe516d35049668279f4085c747.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.4.5:

orm:
- Fixed regression where the joinedload() loader strategy would
  not successfully joinedload to a mapper that is mapper against
  a CTE construct.
- Scaled back the warning message added in #5171 to not warn for
  overlapping columns in an inheritance scenario where a
  particular relationship is local to a subclass and therefore
  does not represent an overlap.

sql:
- Fixed bug in new FunctionElement.render_derived() feature where
  column names rendered out explicitly in the alias SQL would not
  have proper quoting applied for case sensitive names and other
  non-alphanumeric names.
- Fixed regression where use of the Operators.in_() method with a
  Select object against a non-table-bound column would produce an
  AttributeError, or more generally using a ScalarSelect that has
  no datatype in a binary expression would produce invalid state.
- Added a new flag to the Dialect class called
  Dialect.supports_statement_cache. This flag now needs to be
  present directly on a dialect class in order for SQLAlchemy's
  query cache to take effect for that dialect. The rationale is
  based on discovered issues such as #6173 revealing that dialects
  which hardcode literal values from the compiled statement, often
  the numerical parameters used for LIMIT / OFFSET, will not be
  compatible with caching until these dialects are revised to use
  the parameters present in the statement only. For third party
  dialects where this flag is not applied, the SQL logging will
  show the message "dialect does not support caching", indicating
  the dialect should seek to apply this flag once they have
  verified that no per-statement literal values are being rendered
  iwithin the compilation phase.

schema:
- Introduce a new parameter Enum.omit_aliases in Enum type allow
  filtering aliases when using a pep435 Enum. Previous versions of
  SQLAlchemy kept aliases in all cases, creating database enum
  type with additional states, meaning that they were treated as
  different values in the db. For backward compatibility this flag
  defaults to False in the 1.4 series, but will be switched to
  True in a future version. A deprecation warning is raise if this
  iflag is not specified and the passed enum contains aliases.

mypy:
- Fixed issue in mypy plugin where newly added support for
  as_declarative() needed to more fully add the DeclarativeMeta
  class to the mypy interpreter’s state so that it does not
  result in a name not found error; additionally improves how
  global names are setup for the plugin including the Mapped name.

asyncio:
- Fixed issue where the asyncio extension could not be loaded if
  running Python 3.6 with the backport library of contextvars
  installed.

postgresql:
- Fixed regression where the PostgreSQL cast operator applied to
  elements within an ARRAY when using psycopg2 would fail to use
  the correct type in the case that the datatype were also
  embedded within an instance of the Variant adapter.
- Fixed typo in the fix released in 1.4.4 that completely
  prevented this change from working correctly, i.e. the error
  message did not match what was actually emitted by pg8000.
- Fixed issue where the PostgreSQL PGInspector, when generated
  against an Engine, would fail for .get_enums(),
  .get_view_names(), .get_foreign_table_names() and
  .get_table_oid() when used against a "future" style engine
  and not the connection directly.

mysql:
- Fixed regression in the MySQL dialect where the reflection query
  used to detect if a table exists would fail on very old MySQL
  5.0 and 5.1 versions.

mssql:
- Fixed a regression in MSSQL 2012+ that prevented the order by
  clause to be rendered when offset=0 is used in a subquery.

oracle:
- Fixed critical regression where the Oracle compiler would not
  maintain the correct parameter values in the LIMIT/OFFSET for a
  select due to a caching issue.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit b8230b6a66018b370fdae7e32e7e5286234afe78)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-sqlalchemy_1.4.4.bb => python3-sqlalchemy_1.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.4.bb => python3-sqlalchemy_1.4.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
index 1578da5e578..206a9ab3b0c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "7ba9c00c129dbb4fd026a1f2c943188db59c802612e49bc9bded426d8eb14bc0"
+SRC_URI[sha256sum] = "1294f05916c044631fd626a4866326bbfbd17f62bd37510d000afaef4b35bd74"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

