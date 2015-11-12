Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EBC7777202
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:35:26 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so159413301wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 07:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vgVQqly2Kbf/BeYKdTtXNdisBk3IOjUtQmIx5bb7zpk=;
	b=KOpF98xrAecJtwvvWUcFO0nCx8hfNOopan4hNVzm7w/aA63yPbPkhoHHvG7qmU1eM6
	cx9aNtfdofTjy9uo9NKVFKNusYnW1/fFJRlQzVOBkUdSUf5RGI58RR+tLuxIx6s+og4S
	BnBmPhLo9kgJFKijMn/lnIoCiG3BlKi/raLjet/u/4CVjVQ52638R0WlhiiI4e2PY6Zj
	DVc6wjx7CEAwkTXBpcHLg7VJmc+OrUBqP34WteQ/CjMZ5YUIPfl8sQp91pBVjBjHOfng
	QwFFyGXSVn4woji1PEZgx+EFTZ2+3RvjrE4p3UlWfvQeEhTtm0BiIxvWTSIGIEev5kth
	KrAw==
X-Received: by 10.28.4.212 with SMTP id 203mr18665789wme.89.1447342526586;
	Thu, 12 Nov 2015 07:35:26 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	it4sm15044302wjb.0.2015.11.12.07.35.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 07:35:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:35:40 +0100
Message-Id: <1447342540-4196-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-efl] packagegroup-efl-sdk: exclude packagegroup-core-sdk dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Nov 2015 15:35:31 -0000

* packagegroup-core-sdk is MACHINE_ARCH since:
  commit 66ff089603618dc9b22532509bf39274bf6adf67
  Author: Dan McGregor <dan.mcgregor@usask.ca>
  Date:   Wed Dec 10 20:14:57 2014 -0600
  packagegroup-core-sdk: add gcc-sanitizers to core SDK
* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: packagegroup-efl-sdk different signature for task do_package_write_ipk.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['efledbus_1.7.9.bb.do_packagedata', 'eflefl_1.15.1.bb.do_packagedata', 'eflelementary_1.15.1.bb.do_packagedata', 'lttnglttng-ust_git.bb.do_packagedata', 'luajitluajit_2.0.4.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'packagegroupspackagegroup-core-sdk.bb.do_packagedata', 'packagegroupspackagegroup-efl-sdk.bb.do_package', 'packagegroupspackagegroup-efl-sdk.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'valgrindvalgrind_3.10.1.bb.do_packagedata']
to
['efledbus_1.7.9.bb.do_packagedata', 'eflefl_1.15.1.bb.do_packagedata', 'eflelementary_1.15.1.bb.do_packagedata', 'lttnglttng-ust_git.bb.do_packagedata', 'luajitluajit_2.0.4.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'packagegroupspackagegroup-core-sdk.bb.do_packagedata', 'packagegroupspackagegroup-efl-sdk.bb.do_package', 'packagegroupspackagegroup-efl-sdk.bb.do_packagedata', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'valgrindvalgrind_3.10.1.bb.do_packagedata']
openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb.do_packagedata with hash 34ab468f4471fb07663ce2952ad545b5
 changed to
openembedded-core/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb.do_packagedata with hash 0a589cc6975e9a4d4fdbdc63bc76b84f
Hash for dependent task packagegroupspackagegroup-core-sdk.bb.do_packagedata changed from 34ab468f4471fb07663ce2952ad545b5 to 0a589cc6975e9a4d4fdbdc63bc76b84f

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
index ed132aa..ea90ce2 100644
--- a/meta-efl/conf/layer.conf
+++ b/meta-efl/conf/layer.conf
@@ -29,3 +29,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   e-wm-theme-illume-neo->e-wm \
   e-wm-theme-b-and-w->e-wm \
 "
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  packagegroup-efl-sdk->packagegroup-core-sdk \
+"
-- 
2.6.3


