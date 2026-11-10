Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5.1794324454819938060
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=H30/dIQN;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so14143405e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324453; x=1794929253; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S15W9m11zMkh/Dc8cpRfuMtxAUcJzgIDHExUEC12lOE=;
        b=H30/dIQNzybREfPLtCrWFTzQRraANl4XwVb+eLOIRUkkF1CeJBTNgS96op7zeHDWFq
         G4moIC/t0z44tCqyFG5pooHfKxMFRJxGeSGzno7NcrZiHNnsfs22Qs0GnrZdNzQuZk8z
         RgR/5kUbvz7Rn7dDK4d06735wtafwv8RyIO5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324453; x=1794929253;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S15W9m11zMkh/Dc8cpRfuMtxAUcJzgIDHExUEC12lOE=;
        b=XHu0fkKzR6ENZPcMoUdUysNR6VL79By3RfinOC+UEoFnGg1iKyDAcLdEK8OautI66w
         l85BBxWeHnWCrV8PvarVYNE1B7TlKxr5i4XxjS1VKmA7jINB/ZLOTjFh+lcKOIDwXSH1
         GxY7Ky3iHWCmGdjM1I+HYhs0GkoJVSPz/o13xD+4VVqIdxsRv9MaqqQO9Ui8p6VdhEVc
         M2XnOz7G8rueMP4vwXKHMjn3cIaC4jeEAYJyFVlSfMCa8F3jY1WaswE8N2EkTMF569k8
         nFMku6mPSVyf2SaqW5GYG4AXSojXnD8PaR34SkR7JENUAF78/fd3l6OdjWLo82fbewU9
         3WfA==
X-Gm-Message-State: APuU4Z/6B55kbAuUgpiJsCZhB7veOdWacMMfIPaFHqRxPgi0Q5HLuRwi
	jEVPfPejP5IbRyPeDqFEfi/riXau6Wcfn89lE1HTEmLTx5oZ7soLJmXLvszm+zXexhuGrxl8vFx
	TERb/
X-Gm-Gg: AYBFou2Wk4An8doDBEkK/NJwGkqIGq25lYliOokoFdexdtbkQl48F7pALqQZriKc9p/
	Miww61OMkBGoDJOSTBYLAijPLHe4DBSN/nHIl3M7fy8J1SE4PKF7Q+Sk8wBcJmqXzHFiWmklzM2
	lNw2MUCLz9c7CYAUIt6V/qfbK2I2gDb85BCtksF0oeVq7nJrCqOp/coaJuJhgXf5W6G+iesINvC
	yEOF0YcgiO25sKVdalMuBnxy1Mxc5UWyTz/aNsPv23Kh+wtyhNej04bqbStg4Hl7R5XFUQ13G+4
	6lgUY5ttiKFacvXgZ/qseCP2KZ0Nrw9UJhkOxVRYzxGQzoHsEEg90tRo4IFjaCHGFfkMOxuqYHI
	RvXGEY4JjFJmtnjFYicu7DB5brdTj8eBS+S1wJtf5F6busPjkEqWIDACLNhmLgzi0esL8APFOjA
	YRuEi23N4oj3uMxH8JNP4KH2RsdLkEu8TCuWUow93lSOjM2NUh1ypq/FjGRrf0yy12Zi1XqwaZc
	0KQvLIdhOhaU/EmTfRm0KJ3I12qc+Cfn4UPKBxtJYgZD2OD9crFw4NVrl00PweQe+ll2DSaRgHG
	VaQqnOX3TZkCBKOkgwBCSlLKjsLtoO7ZNet9dF4FIDs+upUXY3h1h56bqWoeL2JHZFtkkAoAApf
	Ryr7dCHD6HqkIbOqoxI4DBQnzFBx+1vyqChjTpDTRUDjYtkc+ncBwmjEhTRWsRBcs3tWAJHBypd
	E=
X-Received: by 2002:a05:600c:3143:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ba02355f49mr47825625e9.33.1794324453106;
        Tue, 10 Nov 2026 07:27:33 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:32 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/19] python3-coverage: Upgrade 7.17.1 -> 7.17.2
Date: Tue, 10 Nov 2026 17:27:12 +0200
Message-ID: <20261110152729.1065911-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132076
Content-Type: text/plain; charset="utf-8"

Upgrade to release 7.17.2:

- Fix: two different scenarios failed with "attempt to write a
  readonly database". These were regressions in 7.17.1. They are
  fixed:
  - When using a version of SQLite older than 3.34.0, such as on
    RHEL 8 or Ubuntu 20.04, coverage combine (and pytest-cov, which
    combines automatically) always failed.
  - coverage combine and coverage debug data failed when a data
    file existed but had no coverage schema, for example an empty
    file left behind by a worker that died. A file we can’t read is
    now reported like any other unusable data file, and is left in
    place.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_7.17.1.bb => python3-coverage_7.17.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.17.1.bb => python3-coverage_7.17.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.17.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.17.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.17.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.17.2.bb
index cfa7fe8fa6..836388afd0 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.17.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "5c5c77f95a0e83e6b79eff948d251c9911cfd61d67f5059159fc25b7bc4aec27"
+SRC_URI[sha256sum] = "d05a1bef52f4d7f1b484a1cf46a8929e50963f910e51396373f06cd3b6248f38"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

