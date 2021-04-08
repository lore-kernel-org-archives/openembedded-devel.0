Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web09.257.1617899787561496401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DkOfl2sc;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id c12-20020a4ae24c0000b02901bad05f40e4so649431oot.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rtN+j4FnjPi9B4b98shGw+LOpCQxMnm6hK3D9Q387fw=;
        b=DkOfl2scss7uxq/BTcNCxBQbG7RqI/vOaIhXQTG/v2TsJJ6L154nUTOh9k+sIbhX9t
         yLGGs+9uS8UrF+QACpn5I97K3vqh4b6ryFxR/u6zXMAhATA8A3utdVmmFZJJoq8PLfBb
         EbykBnp2toXIPGU7Lr6yI9BS7RGsGjWA6TqmKCKhvK3W4jK4HN3N+MpyewQ0MtO4Kx3o
         Y8j/o9zIshf3Bh9r57h37coFCRP7QGw3pRzPXYrzcxIG2pPBOgocLMWZR8KV1tqAcW7W
         HmnesAJRmHPBmkk0uS3e9kzCXoc3SlzAuJMHpb0L3arlfn2ieDo066YR4q9myJaJ9a92
         zvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rtN+j4FnjPi9B4b98shGw+LOpCQxMnm6hK3D9Q387fw=;
        b=GdbvQPwD9fWaJ65JK399X4YjgVvu1vy0okoTlVVVUQc3IxjPjn/Ot2Gqxqo5bRF/0g
         OPBZGzrVHbcKbHG1ld+LcZB+OeyEq1yUn9+8q7pbmNs00fNIIQbQ4G/xXMkc9UjMFUh1
         KtKQ5NyXQV6jIeWbdmSLE1Cpe9h1nzPYFx4bmkyW+zu/K41FgPNnvwbSKoBhqWFzhd6X
         hI2Gj9nv6CZOWneX2mEmf1AztE7Hh7cdG8UeZ6Blnb2pVIRMpaRTksyNuE5jIYr7YtdV
         bC5ws3kVdRknhK636EXC3LhkwadAo+g7e7/POHvc72DX14q+udC5WN2xcvhHXEpNCtca
         rErg==
X-Gm-Message-State: AOAM530f+0eahv0TqzLqOpytP2SCZWPBx7qDaQNJZMHIkMOxh9qHGe32
	cXdCcyR8GwIqKBuOmVN0YbZU8Xrmxlw=
X-Google-Smtp-Source: ABdhPJwyQ9gkd5bqScFiI1icGCjdus1MkVPezAIUMbkXZGKpF8Kk80TEKiexPjhPTBWxRy2jK+vQNg==
X-Received: by 2002:a4a:be86:: with SMTP id o6mr8232055oop.70.1617899786759;
        Thu, 08 Apr 2021 09:36:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:26 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 14/64] python3-sqlalchemy: Upgrade 1.4.3 -> 1.4.4
Date: Thu,  8 Apr 2021 09:35:21 -0700
Message-Id: <cdd7e646ca4f6ade31563735cab11d0fb7d577a1.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 1.4.4:

orm:
- Fixed critical issue in the new PropComparator.and_() feature
  where loader strategies that emit secondary SELECT statements
  such as selectinload() and lazyload() would fail to accommodate
  for bound parameters in the user-defined criteria in terms of
  the current statement being executed, as opposed to the cached
  statement, causing stale bound values to be used.
- Fixed missing method Session.get() from the ScopedSession
  interface.

engine:
- Modified the context manager used by Transaction so that an
  "already detached" warning is not emitted by the ending of the
  context manager itself, if the transaction were already manually
  rolled back inside the block. This applies to regular
  transactions, savepoint transactions, and legacy "marker"
  transactions. A warning is still emitted if the .rollback()
  method is called explicitly more than once.
- Repair wrong arguments to exception handling method in
  CursorResult.

postgresql:
- Fixed issue in PostgreSQL reflection where a column expressing
  "NOT NULL" will supersede the nullability of a corresponding
  domain.
- Modified the is_disconnect() handler for the pg8000 dialect,
  which now accommodates for a new InterfaceError emitted by
  pg8000 1.19.0.

misc:
- Adjusted the usage of the importlib_metadata library for loading
  setuptools entrypoints in order to accommodate for some
  deprecation changes.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit b1d3eb11b3da5d2367c7b7caa609c6aa1134057a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...{python3-sqlalchemy_1.4.3.bb => python3-sqlalchemy_1.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.3.bb => python3-sqlalchemy_1.4.4.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.3.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
index 8cff18dc2eb..1578da5e578 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "a719b80b41a900bbcec3cc248616394ebd134043ce5e62185270d785d8a184d3"
+SRC_URI[sha256sum] = "7ba9c00c129dbb4fd026a1f2c943188db59c802612e49bc9bded426d8eb14bc0"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.17.1

