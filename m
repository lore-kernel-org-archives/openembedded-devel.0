Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE73CA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 11:08:23 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7177.1791371295833755344
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 04:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qTKv6UgR;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso1898029a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 04:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791371295; x=1791976095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S/vtIbBj5NttZQk7uYjdBO/hTrn9NPCzqC+PCvhQUU=;
        b=qTKv6UgRdiwwO5BpoUnBN9e2lyT0eCF6S7wsobpOJFtzrVp6/PK46fn7UZ5pdZhGPk
         zaiDSSeL8fn1oyqf+Z3NcMgtiZlJKNia9jV2EvpNw8DgPtLdhFVEiOlYf2jl93NqTrhM
         AHWGQTw47NyZpYhlcOwq6oIAqit7Pj83I2+CDl71qjNbEfYZqsuqX6pf5+Ipdj9c8Mcr
         4YQENxqIkvpSBa1GXa+Ynn50ODCJ60ODC6dsjE1YaqpKGyNAFl3d3p24DG6rAk0Kbgc4
         zBMnnLF/YABp9GBBeoIKn2nbMvlXQeUPfoBsvRmrhH+mW/6/xVyQ7cbf+chbMXYFG1EX
         d3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791371295; x=1791976095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7S/vtIbBj5NttZQk7uYjdBO/hTrn9NPCzqC+PCvhQUU=;
        b=qcvN6bkNYhZgCbszqZhNT4QWprVl7CXU0tvwUz96Nu2BuPLzSq9lJpBN3loNuN7vqB
         eONbbE7Musc1FlZiOqxUOJxcAJnr4+dLnJWJgPGeWtYXfhD5TMjlDspjDmepEK8+n2xW
         7aiKfquwM8XOv6LGDTJ3bSe6c6SrEIeVIu8hoNRvTCRf7SZE3GI+qktR9dZ/TfePxXFx
         taI4gex8k3IMulr1nng/dqyImXl9O581NMC+HUKZTJWJiAk2DMytZHXkkAZioql+HQNj
         bPR3ViQDCGbd9eQGuXKDr02HJrHUZ3V62cRj7HA3q5ZcZG+CE3M9I1jA4CAnlmlKPoFj
         h8TQ==
X-Gm-Message-State: AFq9FYJVgwbu4APbbaQUXjMZ+XhAhKb75qQMpbxQSJS6IpxKj0fkZwh5
	CEOvLtYrhUqpS7Pw8XQHchkL6D+uA5urQPqjDCW5y4Ep4imWV9O0ODyh5Jq8FKzZ
X-Gm-Gg: AYBFou3RyTXsIUYwxEpI+/D/3RXEvQGAVGxcDehhcRcapLQw1VWQ9SMTJcAhYzXoHyz
	/gXXh0CuIF6FoX5lCDhPpR+HqoLU67Fjy2GIGv3OKBFdV4dxd+7x9XJEZ4IYA3dIDO0Tz4cnwt8
	tZe7Y/ZZLNHxHGSK2sgRL0QqGP+uzkto7O3B8/fj4Oxe+uzFFJTN/jQeSeLqQlb3FI0eUJ6ZlV7
	crl5CjQrjkKBjGctlFBHFKZrJVYmlbYOjkpiEwO/phhrRDqn95Q6dO5wsXb0ROxEYEAlO1Yd7D+
	SWsAsBD9/LT1lRbfFeju8mBar/rf3Axw9hnJ+vf/EcEYESkh2LVe6TUHkv2DJDjyMp6JOvxdyCk
	rX9P2Lc4HZBFrOCaLhrbPyBsOPZh+UaIfgYeKPw9qXCfGqWV1XDQuIiIbTe73PqL5DeAt9DZXko
	v829eJbqHArCGKdSna5hgnp7xtdM8nhoaT0KEv6HIiCddAaZXJeBzCPgre6EaSh2VQt+HB20jhg
	55oNtJxuaFIn0xWzdmmEhQ=
X-Received: by 2002:a17:90b:5887:b0:3a7:250:386e with SMTP id 98e67ed59e1d1-3a8a07404admr1725264a91.22.1791371295026;
        Wed, 07 Oct 2026 04:08:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10862177a91.2.2026.10.07.04.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:08:14 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 9/15] python3-astroid: upgrade 4.3.2 -> 4.3.3
Date: Thu,  8 Oct 2026 00:07:34 +1300
Message-ID: <20261007110740.3179543-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
References: <20261007110740.3179543-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 11:08:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130651

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/pylint-dev/astroid/releases/tag/v4.3.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-astroid_4.3.2.bb => python3-astroid_4.3.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.3.2.bb => python3-astroid_4.3.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb b/meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
index 55f4d01194..c9a209aba0 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.3.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "8cdaf5b7f3f4f39557ae05ed8b0852136b43a04ab686db7d39255b206233677a"
+SRC_URI[sha256sum] = "d03854b09d92c08e18d8e7d9185d393961186ed0747136d8fcb2d1c008a504ec"
 
 inherit pypi python_setuptools_build_meta
 

