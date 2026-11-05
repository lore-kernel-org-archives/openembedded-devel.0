Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29084.1793862646167192253
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:10:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wzQ6Hz7k;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36d6765756fso1668583eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 23:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862645; x=1794467445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXU1ttBuQwDSc1SMXV2LRnBRmXjN2kfq2v28Yo9mnEs=;
        b=wzQ6Hz7kBE4HydqNAvtzixGKQu6do/U2XkvR/4n5fE9OcoSFwpPOVHDjumACJLNLh9
         5Sk0XH1Q3OPQspcfIJuddwjolrRA+Jq4GTr9bGQhMdRe+U5Rvh51qXF+CmH+Q67JdMJw
         INg/5CeZMn6AhVhdJja7SryI5Vn13qcW5JrZrkvE5IYtLYrkUQOnWDaaKZjFa3vkpk80
         fnRwZNc1UcqfnWX3Ss8Lvh9On8XRJlLRlesG7d0QZEetRKSfewUXfWKNPFd503hlVAc2
         RBCKBfpOsOQ6umkZ3jNpb/5obdmjJuIMYn+t+WeujFG7AFC7QShStNdp4hog09eepozS
         5Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862645; x=1794467445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXU1ttBuQwDSc1SMXV2LRnBRmXjN2kfq2v28Yo9mnEs=;
        b=lklHMqc9wHA09R2+9Fa49PdzfN5c8eQy1Mgt9uCn5iiknaS9/jxDbiCV90K60ypIo2
         TaWsgYJyhGXAbhucE7aHS01j0vOvM0xkvqydTE/XC4EgmdPJAo4u+Y8QtZSbiiYxTwkF
         7hd28KyDyv6Q6iDkZnHuOaW564QHfvDXLJfFJxwmcY4B8f06ECFBo3eerEKlvovlJP94
         eC6gessAjbP6qnm3Dfa04+Io2zLXfu1D1VLuuCPfu0eF5k5WUa5ODta+aMTH3vJCCGO9
         Bp4qu4Ib6UEr2CUvidOb21gNdcUc/Mwjmm0yI/8FHSZ7WJ1shav/hM/8PznBvtY3n+09
         tvfw==
X-Gm-Message-State: APuU4Z+ZoOa28CJbq+x/SwLryJtq4hFA5IWlEg5wZTDaYh42Sqbtdp1O
	fvUXWIyPdK7cRRu223AOQAKS/ZRiu+PVgdirJCRJxpSzz/z7uz+rSEfpYxSkPeIVPjI=
X-Gm-Gg: AYBFou30UrkbzVdSCFSw8CIpmqvve5rSyRJZhgrq5IRepCFm4wHXcZJniuaqzSmr6jy
	RPgdTlWk7184bNMpPTW5W8tID6gey2ZPqUClaITGuLk+TDnEXRR6BjoGB32eqpxd1+UB70DNhov
	f+/9SAfxp9FprMc12DGYNfOtsiw6edrIl9EQef/i47fBSDWCWDyBGr2jfyhOVNuYU4/qHdxPGPU
	EG2PmFzkm6+MiX+KGoBrU1HCoKW20WVOZRnIvkEV9n2A48ChcoDt5avANYSv9oddgsvhSARM2b2
	tHsz6B8Fq5yEHy1Dw5Yh+7MGfLgGFh/zsPIoJ+JRKvmqUkzK7QeEuRI5z3Kmo7f8TqtYz9GwQlX
	gUtmviNrSdHGZwbzg2C0S+eRgIv/uZ9rcVjTGLsG75So4sgSMVIK/LXuSmldGmITgaRqfShSiiV
	0xnzguIaMCOKLYAM8eTQmoa9ZyAyW5ZMR1CQih7jtXR+/1/IwIddR/y6uNXa3WkjJx9yMqH24qz
	XfKrVtSy0zQia2ATogIFb3hm+QxoHnVbo6M9fc90b1OOQyYug23tA6wtEnARUYmaqmpM/3BbP/O
	hl/aFMLjRlSoQmU98plmDELjAJLrq0EXfJkM/n6UXNwy7QHIaomLSUP6nZnzQ+gUV7q123Dvo3d
	/H5GRobSfiibusBz/v0K6Wmdl7A+1CGgcQo5KjG0CQAVv5HsLmtn9OHi0CMDhvPWLjze1vzn9Fs
	bI06CyrXLoDCr4qAswmGn7DI/DFJx21AwmFLs5LRfJ3MYNPeIYHHENru00X5DKPErsPfOBpZfcF
	T7comYuo/uX/0qHDfBXOmCsvZ+gf47uLXEu1L5T/8SopdBMOhh38Uv1ULg5UWZvtsLww4Yk8rs0
	4e1n
X-Received: by 2002:a05:693c:20c5:10b0:36c:da71:37e0 with SMTP id 5a478bee46e88-36cda807b27mr5986821eec.2.1793862645149;
        Wed, 04 Nov 2026 23:10:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm13132205eec.28.2026.11.04.23.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:10:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 4/4] python3-execnet: Fix test_remote_exec_module_is_removed ptest
Date: Wed,  4 Nov 2026 23:10:38 -0800
Message-ID: <20261105071038.2029943-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105071038.2029943-1-khem.raj@oss.qualcomm.com>
References: <20261105071038.2029943-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131872
Content-Type: text/plain; charset="utf-8"

The test is parametrized over gateway types; it imports "remote" from
its tmp_path and then deletes that directory, but the module stays in
sys.modules. Every run after the first got the stale module back and
failed with "OSError: could not get source code". Drop the cached
module before importing it.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...hed-remote-module-in-test_remote_exe.patch | 38 +++++++++++++++++++
 .../python/python3-execnet_2.1.2.bb           |  2 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-execnet/0001-testing-Drop-cached-remote-module-in-test_remote_exe.patch

diff --git a/meta-python/recipes-devtools/python/python3-execnet/0001-testing-Drop-cached-remote-module-in-test_remote_exe.patch b/meta-python/recipes-devtools/python/python3-execnet/0001-testing-Drop-cached-remote-module-in-test_remote_exe.patch
new file mode 100644
index 0000000000..23957588c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-execnet/0001-testing-Drop-cached-remote-module-in-test_remote_exe.patch
@@ -0,0 +1,38 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 4 Nov 2026 16:22:44 -0800
+Subject: [PATCH] testing: Drop cached remote module in
+ test_remote_exec_module_is_removed
+
+test_remote_exec_module_is_removed is parametrized over the gateway
+fixtures. The first run imports "remote" from its tmp_path and then
+removes that directory, but the module stays in sys.modules. Later
+runs then get the stale module back from "import remote", whose source
+file is gone, and remote_exec() fails with:
+
+  OSError: could not get source code
+
+Remove "remote" from sys.modules before importing it, so each run
+imports the module it just wrote.
+
+Upstream-Status: Submitted [https://github.com/pytest-dev/execnet/pull/442]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ testing/test_gateway.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/testing/test_gateway.py b/testing/test_gateway.py
+index 634f237..c571bbd 100644
+--- a/testing/test_gateway.py
++++ b/testing/test_gateway.py
+@@ -130,6 +130,9 @@ class TestBasicGateway:
+         )
+ 
+         monkeypatch.syspath_prepend(tmp_path)
++        # The test is parametrized; drop the module cached by a previous run,
++        # whose source file has since been removed.
++        monkeypatch.delitem(sys.modules, "remote", raising=False)
+         import remote  # type: ignore[import-not-found]
+ 
+         ch = gw.remote_exec(remote)
diff --git a/meta-python/recipes-devtools/python/python3-execnet_2.1.2.bb b/meta-python/recipes-devtools/python/python3-execnet_2.1.2.bb
index 34f0a1f670..d94ab6375b 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_2.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_2.1.2.bb
@@ -11,6 +11,8 @@ DEPENDS += "\
     python3-hatch-vcs-native \
 "
 
+SRC_URI += "file://0001-testing-Drop-cached-remote-module-in-test_remote_exe.patch"
+
 SRC_URI[sha256sum] = "63d83bfdd9a23e35b9c6a3261412324f964c2ec8dcd8d3c6916ee9373e0befcd"
 
 inherit ptest-python-pytest pypi python_hatchling
