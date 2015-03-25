Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id DB52872B1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2015 21:53:01 +0000 (UTC)
Received: by igcau2 with SMTP id au2so2564983igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2015 14:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bMsgo/STb/YJh65RpkyaqIIQX6W3H9Bzw/URny5E6pw=;
	b=h7PVl3xcFGVu37o18jbYu7/G5yXvkRojq/rjdDURLOZpyF1fdppi1fhj06PuSuwXWd
	shMG3HHigaGUAMSDEdrFHgXvZYgY1StIENrBiL0jmzYuf2qEx9QnPuJBMFaxM4BFunDM
	8VJhCQHzqAEVCKK/SjMKDAqG1RJMezmylEiFmZtvUuGgL3jlJ8+S6727NiQx+1t4XR69
	db8tmVpnPZsMxP7Er4QUINYsOgWUabVf5MAXIbYFod73/QdPtF9PgwuZ8UFEk4S7nSUY
	bt0Bnwvs8HpM6gOdVC039FvpfapsyXh5H1lLIl7UNUOaNX740yUe2sjYH4ko5mqdGADa
	cJDw==
X-Received: by 10.42.199.193 with SMTP id et1mr33680898icb.75.1427320382644;
	Wed, 25 Mar 2015 14:53:02 -0700 (PDT)
Received: from nebula.sys.comcast.net (a-96-119-40-215.sys.comcast.net.
	[96.119.40.215])
	by mx.google.com with ESMTPSA id e3sm10943914igg.16.2015.03.25.14.53.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Mar 2015 14:53:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Mar 2015 14:50:52 -0700
Message-Id: <1427320252-6933-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] breakpad: Install missing headers
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
X-List-Received-Date: Wed, 25 Mar 2015 21:53:03 -0000

We have compile failures due these headers missing from sysroot
and other breakpad headers referring to them. So when some package
wants to link with breakpad ends up in build errors.

Change-Id: I61161e33dfb1ea6383e421e7bd2cb96bb9b06688
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
index 00c3637..fcebccf 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
@@ -28,6 +28,11 @@ do_install_append() {
         install -m 0644 ${S}/src/client/linux/handler/exception_handler.h ${D}${includedir}/breakpad/client/linux/handler/exception_handler.h
         install -m 0644 ${S}/src/client/linux/handler/minidump_descriptor.h ${D}${includedir}/breakpad/client/linux/handler/minidump_descriptor.h
 
+        install -d ${D}${includedir}/breakpad/client/linux/dump_writer_common
+        install -m 0644 ${S}/src/client/linux/dump_writer_common/mapping_info.h ${D}${includedir}/breakpad/client/linux/dump_writer_common/mapping_info.h
+        install -m 0644 ${S}/src/client/linux/dump_writer_common/thread_info.h ${D}${includedir}/breakpad/client/linux/dump_writer_common/thread_info.h
+        install -m 0644 ${S}/src/client/linux/dump_writer_common/raw_context_cpu.h ${D}${includedir}/breakpad/client/linux/dump_writer_common/raw_context_cpu.h
+
         install -d ${D}${includedir}/breakpad/client/linux/minidump_writer
         install -m 0644 ${S}/src/client/linux/minidump_writer/linux_dumper.h ${D}${includedir}/breakpad/client/linux/minidump_writer/linux_dumper.h
         install -m 0644 ${S}/src/client/linux/minidump_writer/minidump_writer.h ${D}${includedir}/breakpad/client/linux/minidump_writer/minidump_writer.h
-- 
1.9.1


