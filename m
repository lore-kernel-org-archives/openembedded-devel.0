Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OZ6Bx-0007MF-3D
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 19:56:25 +0200
Received: by pxi12 with SMTP id 12so108380pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 10:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=RSmOTyhwh129m5i00NDPSrHgv5ZgcAY6x3dw/sH9vJ0=;
	b=tkucD8EXKbCsMBicwEJiMwrQ3sZAc2YLHFlesgrc0rtOjYXK8ygKQXxaHH2GniIoly
	SYz+h6Tz7plyf4V+Tjum1/6yurE+4qNKKobPEqvWb7NvuBKo/mU7Fjln7FA+/Yp/clNt
	rt0MJu3Frw+7zVZ/fBfPhe/Ke/8P7omCjA2RE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pCJBnG/fqx9p/aY1GTV6WzhD9fkumTo2ECRigyRUlmIPCvl/rqrSHCABEbOzs+w57h
	IpGbXM1Bs1OyuaeIy7fuumdcOfwCoqCYZ0/S7Cwr7v+CAKwbU1V0VT2VK8QJ1tztaiEb
	kOX81Xir4ZysUwMSaBZ67oUPBtKNLVTuHemAs=
Received: by 10.142.211.6 with SMTP id j6mr21646897wfg.164.1279130167438;
	Wed, 14 Jul 2010 10:56:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id c11sm99009rvf.3.2010.07.14.10.56.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Jul 2010 10:56:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Jul 2010 10:56:02 -0700
Message-Id: <1279130162-5731-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc-configure-common.inc: Disable multilib generation.
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
X-List-Received-Date: Wed, 14 Jul 2010 17:56:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gcc/gcc-4.5.inc              |    3 +++
 recipes/gcc/gcc-configure-common.inc |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
index 19ab47b..c9b61a6 100644
--- a/recipes/gcc/gcc-4.5.inc
+++ b/recipes/gcc/gcc-4.5.inc
@@ -54,3 +54,6 @@ EXTRA_OECONF_INTERMEDIATE = "--disable-libmudflap --disable-libgomp --disable-li
 EXTRA_OECONF_append_linux-uclibc = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibceabi = " --disable-decimal-float "
 EXTRA_OECONF_append_linux-uclibcspe = " --disable-decimal-float "
+
+EXTRA_OECONF_append_sh4 = " -with-cpu=sh4a --with-endian=little --with-multilib-list=none "
+TARGET_CC_ARCH_sh4 = ""
diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index 892d684..bad70a4 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -36,7 +36,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
                 --enable-shared \
                 --enable-languages=${LANGUAGES} \
                 --enable-threads=posix \
-                --enable-multilib \
+		--disable-multilib \
                 --enable-c99 \
                 --enable-long-long \
                 --enable-symvers=gnu \
-- 
1.7.1



