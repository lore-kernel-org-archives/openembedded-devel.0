Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QWKml-0000qG-FP
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Jun 2011 05:59:28 +0200
Received: by ywg8 with SMTP id 8so2572415ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jun 2011 20:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:cc:subject:content-type:content-transfer-encoding;
	bh=O49ltndEvFX3QOyj419jB1a5WeEKGFZ4BFE0u+dtY90=;
	b=CPPlz9g6k66T4x7tpcl+vk4Z6n8J4MRXEZp1P9yfxjcrYzhrJuUUSWHU8/fY/vuXjI
	yhwdpx14mNodjs9arU5uZJUrCnq/wr7lb4teOtsFZcLqdgEiFjFGibsV9gIblJQqw56v
	+Szhnpr22gfk4s91iMLHlaH0b6Hs3Rk2RdtTc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	b=RsYa9zBtyOinjx99RLtl+mRezmMi+pD6hlN+tEg5z4Mzwe/lyBryLkJu3aamuUaQj5
	rxFkaeX77bhkFr8/oO19rtTlTyE3lSSNeP2CPItmSp6pRnA7qOXaPo1IwdjesQr/bpN1
	UWEdtMZUjYVAJOegkhTTesoAg0gg3rg41jknM=
Received: by 10.101.2.1 with SMTP id e1mr5974507ani.18.1308023761943;
	Mon, 13 Jun 2011 20:56:01 -0700 (PDT)
Received: from [192.168.1.109] (cpe-76-184-244-226.tx.res.rr.com
	[76.184.244.226])
	by mx.google.com with ESMTPS id c35sm6283829anp.11.2011.06.13.20.56.00
	(version=SSLv3 cipher=OTHER); Mon, 13 Jun 2011 20:56:01 -0700 (PDT)
Message-ID: <4DF6DBCE.7010404@gmail.com>
Date: Mon, 13 Jun 2011 22:55:58 -0500
From: Joel A Fernandes <agnel.joel@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Cc: "Kridner, Jason" <jdk@ti.com>, Koen <k-kooi@ti.com>
Subject: [PATCH] ti-dsplink: Fixed location of toolchain
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Jun 2011 03:59:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

ti-dsplink: Fixed location of toolchain to build ti-dsplink.

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
 recipes/ti/ti-dsplink.inc |   34 +++++++++++++++++-----------------
 1 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/recipes/ti/ti-dsplink.inc b/recipes/ti/ti-dsplink.inc
index c48ec41..bbdc35a 100644
--- a/recipes/ti/ti-dsplink.inc
+++ b/recipes/ti/ti-dsplink.inc
@@ -94,23 +94,23 @@ do_compile() {
     # Build the gpp user space library
     cd ${DSPLINK}/gpp/src/api && make \
       CROSS_COMPILE="${TARGET_PREFIX}" \
-      CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
-      AR="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
-      LD="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ld" \
-      COMPILER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
-      ARCHIVER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
+      CC="${CC}" \
+      AR="${AR}" \
+      LD="${LD}" \
+      COMPILER="${CC}" \
+      ARCHIVER="${AR}" \
       KERNEL_DIR="${STAGING_KERNEL_DIR}" \
       all
 
     # Build the gpp kernel space (debug and release)
     cd ${DSPLINK}/gpp/src && make \
-      OBJDUMP="${TARGET_PREFIX}objdump" \
+      OBJDUMP="${OBJDUMP}" \
       CROSS_COMPILE="${TARGET_PREFIX}" \
-      CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
-      AR="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
-      LD="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ld" \
-      COMPILER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
-      ARCHIVER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
+      CC="${CC}" \
+      AR="${AR}" \
+      LD="${LD}" \
+      COMPILER="${CC}" \
+      ARCHIVER="${AR}" \
       KERNEL_DIR="${STAGING_KERNEL_DIR}" \
       BASE_BUILDOS="${STAGING_KERNEL_DIR}" \
       all
@@ -122,12 +122,12 @@ do_compile() {
       OSINC_PLATFORM="${TOOLCHAIN_PATH}/lib/gcc/${TARGET_SYS}/$(${TARGET_PREFIX}gcc -dumpversion)/include" \
       OSINC_TARGET="${BASE_TOOLCHAIN}/target/usr/include" \
       CROSS_COMPILE="${TARGET_PREFIX}" \
-      CC="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
-      LD="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
-      AR="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
-      COMPILER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
-      LINKER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}gcc" \
-      ARCHIVER="${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}ar" \
+      CC="${CC}" \
+      AR="${AR}" \
+      LD="${LD}" \
+      COMPILER="${CC}" \
+      ARCHIVER="${AR}" \
+      LINKER="${CC}" \
       KERNEL_DIR="${STAGING_KERNEL_DIR}" \
       all
 


