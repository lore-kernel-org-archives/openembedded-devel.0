Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8876.1792580510177937342
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=MfspWG0L;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1e2957d7eso5753255e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 04:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792580508; x=1793185308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gw4BywpYP2K8v1J1hzPgdxYQLwMdlRWvz7p51Lh+/YE=;
        b=MfspWG0Ljin8nsCPMAgGXFZZW2QCdwiDK24kS6gXBSvhjauxIJUik/q8sF6IT+kluz
         qrc2UEd7LGR0hZ0Mq8SivbfE9VMI686rsxVZrdEo9BQNFrLn/qo/ocE3WpZ0IVr8DUpm
         DAFH0EcwiKwdrQg3P4sj5nTFWJ7iNI7TpKRSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792580508; x=1793185308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gw4BywpYP2K8v1J1hzPgdxYQLwMdlRWvz7p51Lh+/YE=;
        b=Cz67MNoC4n7HTdTfpma5J/0WQ+2sJzPQRTQoTjkJB35UwmiCYMFFJKXD9of9KLiNCi
         eO54rR0RdpFvICxUFjiL4rnyclNiRTA5dmX2ZaolKxVvjQjGYba94Qm28DnN+rS1CdKA
         eDXtnQmrMUiDjdsbsddxxqYa3BkWHeKtnbSwCNFir+J4fIfWbrYHQjmCCh0NhZi1fzH9
         0JFs+c4LHrfOodX4TJMKu8zhn6eFxjtpfamlWx25mosCNtVSJdTWC3r4WRO96WaVbOfF
         99SK4tTyQrOuEh4klqErzZZqmMpqzPkSE2QAu1FkwZCDC/I354q0fnSh5OiQuL0kW6CC
         An8w==
X-Gm-Message-State: AFq9FYJg0jpLfYF5tLUSU5ccVMIsGaEz3KBh1hbX4U6HZY1RSnbBv+oB
	vTKK5JkLm9g1TudTW1KNJT9sNCdBy+39zHwBci86IUYPpUwnPjZhR7oEcAfsaL9JzJpBX7lsCHw
	ZhRTX
X-Gm-Gg: AYBFou3nRO8P3YzcsaiBMaqvL1MO04r0gRu/80a3xRqjckifk/V2mrVQw2B2j8esBUA
	2kOgv+ufQ4GFupm9mrqPFPx+gfb7TYpo5skoBQ7I4InCg6Ve2ArZEeeJyNZY4726AihIzSbsVfq
	bT2wGUjIoupCJCw++P91V9++KhJ551/wJ0lYWfT2vqWzliZ0Lc1wk9EZRTMFvz6tnvIDcoZysue
	ZKB1bu+aXzvgIiKXdvJjhQOWgN+1hOC21pby8YFIxaVdtsVvtAq4F8R/HVOOQOg2fNTVUEJXQ5o
	BGaV5hZAjPvvvonL49Zv7n1yMipzXn4CVBmoXYVh7WjfiZMgdaCAfbyVIjyaoaN82L3V2kIh5RR
	KP7yxQSxgqom3VBuk/VSg9W6HHNqMHUV2nFVETdD2rYndF6CdBjlp8JOdJn6CzskbqI3wMW8+FR
	IuWHpu6RlkXpjYa7OXHzup7Q0h4mtERmnqHocYK2KUIqxYYVqYsM2e2nDnx/K54zjrLm1eRtMvv
	lar8v/ubEt76gCNh+6Op3mjsJ2jbyzLv7h+AH2mFcGXJnY68me4zUa8UCkiMdevSURB5Zs5AgpJ
	MJE5IGZSuzdtr1aJQPc3tkxO9rKukipvj58VSm3z3YyYGGv8znpovInv+/laa0OcMK84EczUTpK
	mS1eS
X-Received: by 2002:a7b:cbd0:0:b0:4a1:f9e6:f418 with SMTP id 5b1f17b1804b1-4a1fdd22fb0mr23016285e9.34.1792580508354;
        Wed, 21 Oct 2026 04:01:48 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm4972423f8f.46.2026.10.21.04.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:01:47 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 23/36] python3-joblib: Upgrade 1.5.3 -> 1.6.0
Date: Wed, 21 Oct 2026 14:00:47 +0300
Message-ID: <20261021110103.1943456-23-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021110103.1943456-1-leon.anavi@konsulko.com>
References: <20261021110103.1943456-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 11:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131282
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.6.0:

- Fix caching of functions whose source cannot be retrieved, such
  as functions defined in a notebook cell. Their identity fell back
  to str(hash(func.__code__)), which is salted by PYTHONHASHSEED
  and so differed between processes. A worker reading the
  func_code.py written by another one concluded that the function
  had changed and wiped the whole cache directory for it, discarding
  results computed by its peers. func_code.py is also no longer
  rewritten in place, so a reader can no longer catch it
  half-written and draw the same conclusion.
- Drop python 3.9 support. The oldest supported Python version is
  now Python 3.10.
- Fix eval_expr (used to evaluate the pre_dispatch argument of
  Parallel) to raise a ValueError as documented instead of leaking
  a ZeroDivisionError for expressions that divide or take a modulo
  by zero.
- MemorizedResult now forwards mmap_mode to its store backend, so a
  cached array reconstructed from a location is memory-mapped as
  requested instead of being loaded fully into memory.
- Unvendor cloudpickle to more quickly benefit from maintenance
  releases of cloudpickle
- Fix Memory.cache for functions with a keyword-only argument that
  has a default declared before a keyword-only argument without a
  default.
- Fix behavior of filter_args on some precise cases.
- Fix a concurrency error that could happen with unordered
  generator.
- Fix: dump() now accepts any input os.PathLike object to be
  consistent with load.
- The documentation now uses pydata sphinx theme. Furthermore,
  optional dependencies test and docs have been added to
  pyproject.toml.

Extend RDEPENDS with the missing runtime dependencies:
python3-cloudpickle.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-joblib_1.5.3.bb => python3-joblib_1.6.0.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.5.3.bb => python3-joblib_1.6.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb b/meta-python/recipes-devtools/python/python3-joblib_1.6.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.6.0.bb
index 46b89ba267..b70bd04d87 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.6.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit python_setuptools_build_meta pypi
 
-SRC_URI[sha256sum] = "8561a3269e6801106863fd0d6d84bb737be9e7631e33aaed3fb9ce5953688da3"
+SRC_URI[sha256sum] = "2ccc96785b12046c08fd6d55839c12857831b54a3c1673ffadd2f04bfc4eda03"
 
 CVE_PRODUCT = "joblib"
 
@@ -14,4 +14,5 @@ RDEPENDS:${PN} += " \
     python3-multiprocessing \
     python3-pprint \
     python3-pydoc \
+    python3-cloudpickle \
 "
-- 
2.47.3

