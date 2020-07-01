Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.10744.1593562077416653844
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qSU5o91A;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id l63so10738397pge.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=auFiczZWvoJqD4RnznOoxZd85/utlVyskrseJLOW+Fk=;
        b=qSU5o91AlCnyXLVIcMIG0GgV6pGH0EtdFr4mKVObvRqvGMHoKUCmQ9lWxzzn1/JEjH
         H/MJVNo/k17WJ+2WG5PWz7TcveEm/S1/C/euYQY9FnWEhpO8imEYtEcqLCIqkQN7jIKq
         nzLDBJxKB2p8sQc4VKDYMCeMLbjo4lyMNRAoCu791vKwKgm7BCWb98tMetTf2+oiPh+1
         j/Q962G0rwzyZt0HnIB10X6XltZXakSdhBzcSV3PDUz7xxxpjCRyeozymKMw5TFY5PwX
         2WFTkr5RDK0WNOh1lbQB/7xNaIyebeDuqRojyRKguoff+IHN/VO4N3nPooh0SYqy7yJR
         PnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=auFiczZWvoJqD4RnznOoxZd85/utlVyskrseJLOW+Fk=;
        b=hrB0RMfF9TGrD9X2jSPY0WG5j0ZFRv6/1785c7onhlb15pcFy8b6bcyEtT895CAFez
         ffaH3Zkv6xDqjl1ZwlhCZzaUjlpukVaKPlY9QUmsRgchGjAz+1Yply84aqbGWwaFVki2
         DGrXzPVwxsB0ViPvN7PxbI+qaR8GlnRoqtFklbj7acoLll93GphmbbxGYjieSv1TAj87
         36p8hYn9csr1Ha2sYFJfVddal0gkAJd0UECl2h+QbZBgCJCfnaHZNomGjfgTV4wDjBeU
         IO8EIdTyLQ8EKZOaW5yRD7yIx7EdnCtF2t49aiK5xeZ3CAtS7pEOa5t8rYiAS//vKBeO
         jldQ==
X-Gm-Message-State: AOAM531BI6B/8tDVf+7MziEBkUpPbBfJb+85FyJlegn4rNo1g7kJeAZK
	ySHWLtxk8OlpssIDsS11cMbIMoPOJqU=
X-Google-Smtp-Source: ABdhPJxbklw91w9uPuki+tXQubsqbLmjK+T1wfSdUBOJGGPzr51Rg+zkdtjy/W+L1IaKWkKakuJ30g==
X-Received: by 2002:a63:c204:: with SMTP id b4mr16782428pgd.67.1593562076647;
        Tue, 30 Jun 2020 17:07:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 31/32] python3-sqlalchemy: Upgrade 1.3.12 -> 1.3.17
Date: Tue, 30 Jun 2020 17:07:16 -0700
Message-Id: <2824fa40f7c24cd1476cfb1465f76b8059bb0e89.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.3.17:

- orm Bug fixes
- orm Added an accessor ColumnProperty.Comparator.expressions
  which provides access to the group of columns mapped under a
  multi-column ColumnProperty attribute.
- orm Introduce _orm.relationship.sync_backref flag in a
  relationship to control if the synchronization events that
  mutate the in-Python attributes are added. This supersedes the
  previous change #5149, which warned that viewonly=True
  relationship target of a back_populates or backref configuration
  would be disallowed.
- engine Bug fixes
- schema Bug fixes
- schema Add comment attribute to _schema.Column __repr__ method.

The year in LICENSE has been updated so LIC_FILES_CHKSUM was
changed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5fef53b9989767dae9288274df871639e7c1c4a1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...n3-sqlalchemy_1.3.12.bb => python3-sqlalchemy_1.3.17.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.3.12.bb => python3-sqlalchemy_1.3.17.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
index e29b572cbc..b9c58e5b6a 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.12.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.3.17.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2f5eb030c48975d5294baf0f5d01af1c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c19467890539ff718c00a019c9c7a7b2"
 
-SRC_URI[md5sum] = "02a46be841903b60c52a83342d3ced8e"
-SRC_URI[sha256sum] = "bfb8f464a5000b567ac1d350b9090cf081180ec1ab4aa87e7bca12dab25320ec"
+SRC_URI[md5sum] = "478214152b9293bf5652815d7312c890"
+SRC_URI[sha256sum] = "156a27548ba4e1fed944ff9fcdc150633e61d350d673ae7baaf6c25c04ac1f71"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

