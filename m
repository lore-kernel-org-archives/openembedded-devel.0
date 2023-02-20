Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED75C64EC4
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:46:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16498.1676907979465317956
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 07:46:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E4D01FB;
	Mon, 20 Feb 2023 07:47:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B08243F703;
	Mon, 20 Feb 2023 07:46:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 5/8] nodejs: use a postfunc to prune source tree
Date: Mon, 20 Feb 2023 15:46:11 +0000
Message-Id: <20230220154614.42832-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220154614.42832-1-ross.burton@arm.com>
References: <20230220154614.42832-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 15:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101172

Instead of overriding do_unpack entirely and calling into base_do_unpack,
use a postfunc.  This keeps the prune logic separated neatly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_18.12.1.bb
index e14f1a4d7f..180e170a35 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -89,10 +89,9 @@ EXTRA_OEMAKE =3D "\
     builddir_name=3D./ \
 "
=20
-python do_unpack() {
+python prune_sources() {
     import shutil
=20
-    bb.build.exec_func('base_do_unpack', d)
     shutil.rmtree(d.getVar('S') + '/deps/openssl')
     if 'ares' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/cares')
@@ -105,6 +104,7 @@ python do_unpack() {
     if 'zlib' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/zlib')
 }
+do_unpack[postfuncs] +=3D "prune_sources"
=20
 # V8's JIT infrastructure requires binaries such as mksnapshot and
 # mkpeephole to be run in the host during the build. However, these
--=20
2.34.1


