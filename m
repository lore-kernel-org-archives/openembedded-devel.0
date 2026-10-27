Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14685.1793092903203000643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=fjqVUtAd;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso40327005e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092901; x=1793697701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BROFX+lM4fqy2Jx0tUSxaqz+jBDIZMXfv9+Vq4K71pA=;
        b=fjqVUtAduybx0a5sloRGxkN1G6M7YU3qQlT76FHpKYJwBqC9pUTLYE965xJcv6IvGn
         85pTaC3biiVncU0IBcyeZ1DAPxcczC6Z8yAq8eAiYSWD9mGh30FZ7S/lA6a9RqWmV4du
         plcTn3PZq1o5EzsERF76OG2q3iezusAceaYe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092901; x=1793697701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BROFX+lM4fqy2Jx0tUSxaqz+jBDIZMXfv9+Vq4K71pA=;
        b=LAc9AsnRxcSW0sJCFne/Vhkrsly+Wn8OUAcVLTwZAT1guhJJlzbg6pHisoF6fGT+pM
         XAJ3lHtztmNbI+8reWu0ocdj/LTjueDIaYpbwLGiTH+x18PV5A2BIR49rguikJ1J/Ezy
         FT/h5PTs4kUF6EXdIAlvEhXAdSsWG9TABye4hljQLosKZz9grG77tPW6WK7fSBqUtxm3
         0rvCJVnQclP/DadsG086yAfmDzpBkOwFpl8Zx8fZm6WocGLw5fHUVb4760pdr0QFwb6i
         1+s6DB6yjw8hOJh+nX13o8+uFwBh7liUXvkJUdXyBJ6VOYmbnAyCqFjEwc7QGBydVtoe
         msvQ==
X-Gm-Message-State: AFq9FYJ5Pf5fG4Wa4brBZ5yxUy1H1xjI62K27yb5hXDdaJJzZ1/51IWT
	EZfquRPZenAn1eJSfXkL48ZYRO2vySqR7639pbR8BzbldW8Rw+OcsQy2TFVrnpyTkKU9YkyQWMF
	XojOm
X-Gm-Gg: AYBFou1eXVop1Il1utCz63n7MmDmbn8qiSakc5e+mBNA0xem47/PFGK+pIEHkHYUzal
	gqoze7sYf+maJhX8AzDukcoMfAA5BEDAfzLyo5WdfA4599Mw9ZX//nzckVQiIG0TLo459UKTndr
	xn3nwP1eluiIsrLxYyw3V6uuUdmvIxQSzZjoaoPrWSY3vdT48zkg7HhpnJJAobfvF2RcY+9cFri
	nXh1pIzmGCj/7JuL6V6PzeXyvlmsarONoxbxaKsCtjTkVZsjiAIsdDHWmSb/BlJ6qEW5mS//YYg
	2t/KUooUfXB5XPn5lDAG9LCE9Noceyvdks8hg0CeIrrx0hgzu7DjUNqWLzTpeu84YBEhId7vYZp
	n1QE2ZoeXpwTdsL3ZGE2Kr2+RJi/92nuMbblLBlf2oCrgelsH9kZVy/id5yWzg0G2XLg5Vwazjj
	c/6sc6zVluyn5jFKG/LdBJiksZbu5rzj0imgVZpxTOEFMXf5lW1KlAANJItdkVrcjnvtS2UISQy
	XA5d1ROSxWpJUCXXOL8hk1YveMwRxMenohbsEI+1YlPd9MNfFffn2PrRYeByQek5gPhie8O1rEA
	d5yjdjVxCJl57S39Jt7kN7IeRvVFG+THEoVmy0NDgnM+lMOfcoF5sw8ypOnsmvEvW3IKBfBUOOj
	lNPduFv0kDfQf5s/0nqq9zwkddA==
X-Received: by 2002:a05:600c:83c7:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4a35aca186amr172283925e9.18.1793092901495;
        Tue, 27 Oct 2026 02:21:41 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 56/61] python3-virtualenv: Upgrade 21.7.8 -> 21.14.13
Date: Tue, 27 Oct 2026 11:20:23 +0200
Message-ID: <20261027092028.782979-56-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131520
Content-Type: text/plain; charset="utf-8"

Upgrade to release 21.14.13:

- Stop bash running commands from --prompt or an environment name
  containing $(...), backticks or a backslash after shopt -s
  promptvars, set -o posix, or in a child shell that inherits an
  exported PS1 (GHSA-cx6f-vjhg-g3cc); reported by rozzkml. zsh now
  draws the prompt from psvar[9], which is never parsed as shell
  syntax.

Write the .venv redirect and the wheel RECORD with exclusive create, so
a link planted after the existence check cannot redirect the write. On
POSIX, a read-only .venv redirect that points at a virtualenv is
replaced.

License-Update: Copyright years updated

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...irtualenv_21.7.8.bb => python3-virtualenv_21.14.13.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_21.7.8.bb => python3-virtualenv_21.14.13.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.8.bb b/meta-python/recipes-devtools/python/python3-virtualenv_21.14.13.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-virtualenv_21.7.8.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_21.14.13.bb
index 820db11d71..e3a3a109af 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_21.7.8.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_21.14.13.bb
@@ -1,12 +1,10 @@
-# SPDX-License-Identifier: MIT
-# Copyright (C) 2023 iris-GmbH infrared & intelligent sensors
-
 SUMMARY = "A tool for creating isolated virtual python environments."
+DESCRIPTION = "Virtual Python Environment builder"
 HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=36ef9437b761b314fa717c786c5ca460"
 
-SRC_URI[sha256sum] = "1dc49c790072a9072cb1803f9bd62aa69cd583077cada32390f75505cdc64c9b"
+SRC_URI[sha256sum] = "de5307ba4b9a0001d9c8ea02832d38f63ca432880f416c1bface61c4323fd905"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.47.3

