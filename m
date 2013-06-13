Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7C86A619
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 09:51:55 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf11so5192254pab.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2013 02:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QMDNW8psBYBtuTRKHHOGnwlNbA2xWBt9DKMyK2ZBFog=;
	b=k9gLAIVwBO4ftIlqNzju4YU7X1Dwa9IVqp2jbCjtBbh86N9YI7ykyv+UkJf4a38YHt
	urE9bjxlq/mzCWwl71mmdx95QaNRSLXXWAYNmZblm259FyuuRq+E4JVWcWYnCf3KpEf0
	lFPP2pVN5V5UIAiDVOgd5pCPHHmFdj7xppZMr11pP8piiNJFg2pzha5cyW+suEG361ZM
	xNH0VUhs0FsQVFdWDSI7KJe8ebiK4KWx9DHakJC8bbxS5OjtLgVMJVcX+9+ukcf2qFKC
	4gK3+soQnNIMvfFNce8hoaTcUGqeyl9z/Q/jy9BC2m8ZoE22UGNqgKnsSgCrTbRzSk6Y
	9rOQ==
X-Received: by 10.66.4.106 with SMTP id j10mr1951957paj.218.1371117116640;
	Thu, 13 Jun 2013 02:51:56 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	dg3sm20656931pbc.24.2013.06.13.02.51.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Jun 2013 02:51:55 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jun 2013 20:05:54 +1000
Message-Id: <1371117954-11905-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [meta-oe][PATCH v2] llvm: move cross script install to separate sysroot preprocess function
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
X-List-Received-Date: Thu, 13 Jun 2013 09:51:56 -0000

The llvm-config2.x script doesn't get placed in the target sysroot
crosscripts directory otherwise.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta-oe/recipes-core/llvm/llvm.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index 6cf9db8..fcd2666 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -141,6 +141,12 @@ do_install() {
         # later for native case
         install -d ${D}${bindir}
         install -m 0755 bin/llvm-config ${D}${bindir}
+}
+
+SYSROOT_PREPROCESS_FUNCS_append_class-target = " llvm_sysroot_preprocess"
+
+llvm_sysroot_preprocess() {
+    cd ${OECMAKE_BUILDPATH}
 
     # Fix the paths in the config script to make it find the binaries and
     # library files. Doing so allows 3rd party configure scripts working
-- 
1.8.3


