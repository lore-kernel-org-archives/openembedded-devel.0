Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FF2CCF2D3
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 17:20:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18253.1792344020992910156
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 10:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YlNorJvm;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so10343955e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 10:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792344019; x=1792948819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=912/8afHuDk/bTlUr73hzgl3Kk8mfc8Z1qn9bnhWx7A=;
        b=YlNorJvm5lS1j1RuFuJWfSRXONcyrYs2lMHI8EhFzGE1O/1ahSnOYpcS1rUVJDgCh1
         l/z8bQaBjmqCgV5rFzzTvO55A9ZVBuZ+Zt3yMlHJ2xDqke4HFey9Pf+jux3SdPXM5KZ6
         tlexlIHv1HrThuCB9HDCc1YF7tJdgralQ8OHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344019; x=1792948819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=912/8afHuDk/bTlUr73hzgl3Kk8mfc8Z1qn9bnhWx7A=;
        b=ftRdwv+z8llYnrt84HGhVfQ+6LzCPjs68soqHtJASGyRf5GXjPMCWC7MYMq2yEPtFi
         maRyXipqhKlRLlbKQF+avhjBv9vgcTEdzPyuFEmTuRlNyz2hYBtnzq6VFyGkcNdtco++
         8k/qCbmg0EeLPxUu9X/JHTa49RUtCBzAC5VTNwNYmJAeR6Xtk4CymjpdoL4d6Q45tenc
         w1JbfY3Qjz/h5Owqt7HhTv4tU8B+t53xtt0luMnOMZdiGtiteuoJLD6wlYhT6Joh8x49
         W9oZwMfQsNgBlGaCrBM/WmMkkuzMx1gwR0kWxBBGAaBMjUoiVJek5C5QrlAWeIAtLXcu
         qE7g==
X-Gm-Message-State: AFq9FYL/ZtpOvqZ1wP41FHNYOq+H625i5Jir2EYZoQSrV513R1YzFFcY
	OooDTfbY0mothqOagDpg5abvtiP2DzfVzzQBkscv/EXZHP9mbeh6/4Z9RMJoyafEh+AU7X4BzVt
	SSHae
X-Gm-Gg: AYBFou0nmYHrjSUQ81/peP8ExVD3Tbfp35aIkZabQZF9bNUIbjHx9Kn6CiuYhxp3Jj2
	Qrbp0jeCGwt1m+70wZtE/kWDobJwBWnQyuyjrDsUftWQkHClu3GRpwfzTGZ2DUujV8Aj18+1AUK
	qmrxSBQJuuhpSijcEkmgr2unTtOOXCIwWtr4TUiVcZPIOC8Y9ZQ7jqqO8bXKKmgFjSpGMM3iQIU
	LLE3lwZ5ThQDnLyy2XSax+spt/1U0N1XH5U/u0fuPRqR27EH0U6RtZNcrhq6YhUTw70T69Q82QH
	OzEHK1jA1eRuo+st/CuEmgrPgxjieFO5EyLb+bsvWu/UcNhvVcAzmCMJhDG6OEkLvbVYaozn+Cw
	yTnsmANFPVYY9j9imrwLtaJL/VOY1TY6G4scRhvzlHSvoT2jZ1PUKzDsjxG4/qCn4bfWuZgmoZQ
	KwgRRkJb1RWc+82bYe+aaeuL6PV3sNwV/xYM6HVerhFI5D2yZyvwpowe3JeEG+X77v1sxEtps9r
	caOkkA4vz7L0j9Z1DcDYHpmzGyVmWaNdvy6ep9y3VvBx57O1aTq2TmhpIz/h42W6sO+tO6FEYtQ
	WXMi1on4QegcC3Wk2lXgsb4=
X-Received: by 2002:a05:600c:4f06:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4a1e69d931cmr26868435e9.22.1792344019299;
        Sun, 18 Oct 2026 10:20:19 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1dc952d63sm156755155e9.2.2026.10.18.10.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:20:18 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-alembic: Upgrade 1.19.1 -> 1.20.0
Date: Sun, 18 Oct 2026 20:20:12 +0300
Message-ID: <20261018172013.925046-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018172013.925046-1-leon.anavi@konsulko.com>
References: <20261018172013.925046-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:20:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131098

Upgrade to release 1.20.0:

usecase:

- [usecase] [batch] Added a warning for the case where an unnamed
  CHECK constraint on a reflected table is omitted from a batch
  "recreate" operation.  An unnamed CHECK constraint can't be
  reliably carried over in a batch recreate as it may refer to
  columns that are being dropped or changed.  This omission was
  previously a silent operation.   The presence of any
  ~sqlalchemy.schema.CheckConstraint in
  Operations.batch_alter_table.table_args is taken to indicate that
  the case has been accommodated, and no warning is emitted.

- [usecase] [autogenerate] Autogenerate now renders a warning
  comment above any rendered Operations.drop_constraint() directive
  for which the constraint name is None, as is the case when a
  constraint that has no name in the model is dropped, most
  typically within the downgrade() function of a migration that
  adds an unnamed constraint.  A warning is also emitted on the
  console when the migration script is generated. The directive
  requires a non-None name in order to be able to emit a "DROP
  CONSTRAINT" command.

bug:

- [bug] [batch] Fixed bug in batch mode where adding a column with
  a type that generates its own CHECK constraint, such as
  ~sqlalchemy.types.Boolean or ~sqlalchemy.types.Enum with
  ~sqlalchemy.types.Boolean.create_constraint set to True, would
  emit the constraint twice when the table was recreated, once
  under the name generated by the naming convention in use and once
  under the name given to the type.  The constraint is now emitted
  once, using the same name that would be used outside of batch
  mode.

- [bug] [batch] Fixed bug in batch mode where a CHECK constraint
  generated by a type such as ~sqlalchemy.types.Boolean or
  ~sqlalchemy.types.Enum would lose the name established for it by
  the naming convention in use when the table was recreated, as the
  constraint was regenerated against the temporary table used for
  the recreate operation.  The naming convention is now resolved
  against the name of the table being replaced.

As part of this change, a type that generates a CHECK constraint
but has no name of its own, used in conjunction with a naming
convention that includes the %(constraint_name)s token, now emits a
warning, as the convention has no name to interpolate; the
constraint continues to be emitted without a name.  As noted at
batch_check_constraints, these datatypes should be given a name in
order to participate fully in batch mode.

- [bug] [batch] Fixed bug in batch mode where the
  Operations.batch_alter_table.naming_convention parameter would
  re-generate the names of constraints that already had a name when
  reflected, in the case where the convention included the
  %(constraint_name)s token, leading to a name that included the
  convention's own prefix twice.  The convention is now applied
  only to those constraints that are reflected without a name,
  which is the use case the parameter is documented for.

- [bug] [mysql] Fixed bug where autogenerate with
  EnvironmentContext.configure.compare_server_default would report
  a persistent server default change for Float, Numeric and other
  decimal columns on MySQL. MySQL reports a literal server default
  for such a column either in quoted form, e.g. '1', or, when the
  value is fractional, as a parenthesized expression, e.g. (2.5);
  neither form was accommodated for columns other than those of
  Integer affinity, so that a default such as server_default="1" on
  a sqlalchemy.Float column would never compare as equal to the
  reflected value.

- [bug] [mysql] Fixed bug where autogenerate with
  EnvironmentContext.configure.compare_server_default would report
  a persistent server default change for an expression server
  default such as (rand()). MySQL reports such a default with the
  surrounding parenthesis included whereas MariaDB reports it
  without them, so that the parenthesis are now disregarded when
  comparing.

misc:

- [change] [general] Support for SQLAlchemy 1.4 is dropped as of
  Alembic 1.20.0; SQLAlchemy 2.0.0 is now the minimum required
  version. SQLAlchemy 1.4 has no support for Python 3.13 and above,
  and the version-conditional code paths it required throughout
  Alembic have been removed in favor of the SQLAlchemy 2.0 API.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.19.1.bb => python3-alembic_1.20.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.19.1.bb => python3-alembic_1.20.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.19.1.bb b/meta-python/recipes-devtools/python/python3-alembic_1.20.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.19.1.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.20.0.bb
index ae0ee99743..f3c165bb9f 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.20.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ff111c41e8748bbfa45e8ba92347b681"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e0fca0518118c78acc493e31bcb5402f190057aaf6df8b5b95ce94c4789cf648"
+SRC_URI[sha256sum] = "db505480647bc60386c5369402f4a57a506b7539c9e9ef5e270d45cbbe4939bf"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.47.3


