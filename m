Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.3584.1618693582981721600
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jThCnUP2;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id f29so21540509pgm.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Bjlq65TLEB3Bu11r3uI7VF50wrpqgKrcKLu7BIkraJI=;
        b=jThCnUP2OAzxqZRmE3hX/DCV5mznC7IVmsxCaKSVyvSdcgnyzVY+LZpVX5fx1xSjMG
         1EjhvwP/pjPZ2gk3LKA0yxE6AuhKUSfC4Hp1j1XKKBRxPalE6+BX0YbU2oX87HwCdtrj
         DgIO7qL0rnbE53dJQS17KGePijwNZ7CORgxruOH3JSjVkJ7oxPemnjfhBd7jtD+cNpPr
         942UwqUbD8EzrrxdAFQzFJVq8Xgjec2sv0UOEHMEqJItOJN3mS4uhLBmtmKhsvXK/Xg2
         2s6vA3oSJzXUsel2UUJE9kPvP3R67fW0XfDJLPBxDnJb9j6nufFDzf+cYEtExcoOFDTz
         8lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bjlq65TLEB3Bu11r3uI7VF50wrpqgKrcKLu7BIkraJI=;
        b=id5E7vXqiTaCZ9ZRzrp8MvHpClnTfJRB8/DYyLDJkHh52uao6nErRe59CdAJY8PPDx
         Siv+CEOZrutRQBwKhDAUgxm5zyBU1UoT32QMPYgxGtShul4CVLovNUrtjUdz23SdnNZr
         3DryWmxBQlChbdvjK2fmZV+PHqmUvEYuqt0qU6qJ0kDmB91K/cHY/0NUAmrROaTCSTDD
         Gfk08YxfJZdSmuiRds4c7DU88LXoMu5m6/uX7QCuOegGDYVGrSyeNyT8UN4ZpNv6k9C4
         qSMv7nH1hmVO7vSKDDo5s3moBrJlOSe3KmidesYPPuNqp8ncfzJKGlE2zTl+zEtxj+Yj
         /4jg==
X-Gm-Message-State: AOAM532Vq7XhtX+hNz/NOmRo530YdoXVd2dOXGvXTPSXwc5rjqrDtevr
	TgzyviZjJ+4tZnmJcF27cUSx/uSatU4mlQ==
X-Google-Smtp-Source: ABdhPJzdadgV5dy4AzV1zf0PBwg4v+vSFjZ645RYMM/3tlO5plyh+myGcAN0wOx136G/yTw+e4MOHA==
X-Received: by 2002:a63:4f0a:: with SMTP id d10mr4878266pgb.418.1618693582361;
        Sat, 17 Apr 2021 14:06:22 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:22 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 18/50] python3-sqlalchemy: Upgrade 1.4.6 -> 1.4.7
Date: Sat, 17 Apr 2021 14:05:27 -0700
Message-Id: <f220c5a6394cc3f25fd61e9dd7fb81701fa80ffd.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.4.7:

orm:

- Fixed regression where the subqueryload() loader strategy would
  fail to correctly accommodate sub-options, such as a defer()
  option on a column, if the “path” of the subqueryload were more
  than one level deep.
- Fixed regression where the merge_frozen_result() function relied
  upon by the dogpile.caching example was not included in tests
  and began failing due to incorrect internal arguments.
- Fixed critical regression where the Session could fail to
  "autobegin" a new transaction when a flush occurred without an
  existing transaction in place, implicitly placing the Session
  into legacy autocommit mode which commit the transaction. The
  Session now has a check that will prevent this condition from
  occurring, in addition to repairing the flush issue.
- Fixed regression where the ORM compilation scheme would assume
  the function name of a hybrid property would be the same as the
  attribute name in such a way that an AttributeError would be
  raised, when it would attempt to determine the correct name for
  each element in a result tuple.
- Fixed critical regression caused by the new feature added as
  part of #1763, eager loaders are invoked on unexpire operations.
  The new feature makes use of the "immediateload" eager loader
  strategy as a substitute for a collection loading strategy,
  which unlike the other “post-load” strategies was not
  accommodating for recursive invocations between
  mutually-dependent relationships, leading to recursion overflow
  errors.

engine:

- Fixed up the behavior of the Row object when dictionary access
  is used upon it, meaning converting to a dict via dict(row) or
  accessing members using strings or other objects i.e.
  row["some_key"] works as it would with a dictionary, rather than
  raising TypeError as would be the case with a tuple, whether or
  not the C extensions are in place

sql:

- Enhanced the "expanding" feature used for ColumnOperators.in_()
  operations to infer the type of expression from the right hand
  list of elements, if the left hand side does not have any
  explicit type set up. This allows the expression to support
  stringification among other things. In 1.3, "expanding" was not
  automatically used for ColumnOperators.in_() expressions, so in
  that sense this change fixes a behavioral regression.
- Fixed the "stringify" compiler to support a basic
  stringification of a "multirow" INSERT statement, i.e. one with
  multiple tuples following the VALUES keyword.

schema:

- Fixed regression where usage of a token in the
  Connection.execution_options.schema_translate_map dictionary
  which contained special characters such as braces would fail to
  be substituted properly. Use of square bracket characters [] is
  now explicitly disallowed as these are used as a delimiter
  character in the current implementation.

mypy:

- Fixed issue in Mypy plugin where the plugin wasn't inferring the
  correct type for columns of subclasses that don’t directly
  descend from TypeEngine, in particular that of TypeDecorator and
  UserDefinedType.

misc:

- Added a new flag to DefaultDialect called supports_schema; third
  party dialects may set this flag to True to enable SQLAlchemy's
  schema-level tests when running the test suite for a third party
  dialect.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit bc55118cf6e176b19ccebb86de85c51ad711c217)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-sqlalchemy_1.4.6.bb => python3-sqlalchemy_1.4.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.6.bb => python3-sqlalchemy_1.4.7.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.7.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.7.bb
index 4d5aa33d1a9..883b2660b00 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.7.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "193c3ca465fbc68de071995a461ab535466f041089d372ee6a6f0aae7b9307e6"
+SRC_URI[sha256sum] = "84115f97d88c8ccf26db81b7997c5f5de9ae360e0785ef859d0987794495f0a9"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

