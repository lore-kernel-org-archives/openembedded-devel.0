Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q4hbm-0000gt-6q
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 00:41:54 +0200
Received: by pxi1 with SMTP id 1so161658pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 15:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=0eNybxcj7b+rEn6BuE8e05Vu7Yz4VhRqodMlpnwOSBo=;
	b=eI5ho2h3AUGmYYvySfamcuc7GSSCbrxeMZTaQadRXNCkPXkCKOuFJKgpgenAZh7NoZ
	t/3BhwcZEwTLKTCS+Wi71ojgTORgS8ke1MnSTrfQdZ8UL1s9HTvvKO8wRr1dfpGOxgOE
	dNeUBtb6YUFwp5ck00Wa5nzqjrohF5sS/SlpQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=W5oZVEBUNwcE2IQ8KbV5vnLxB6BPQQj/MCmJ0IcyEn7JUkWNuL51wNCnfN5o0g3IE6
	uHqilstUxt6UTthJr008u2035mUJaRWHg628kw6t2nSmMBv9y/lAYOTHyFd8fWzt+nVE
	hX3Vs8jYW3AQSd6lOKMjIIoPcncLerQkLc+uA=
Received: by 10.142.133.17 with SMTP id g17mr288860wfd.70.1301438394978;
	Tue, 29 Mar 2011 15:39:54 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n4sm7819275wfl.2.2011.03.29.15.39.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Mar 2011 15:39:53 -0700 (PDT)
Date: Tue, 29 Mar 2011 15:39:49 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110329223949.GA6899@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <99989183e4a44b810bb727c31af09ddd@nebelhauch.de>
	<4D925506.5090304@whisper-net.de>
MIME-Version: 1.0
In-Reply-To: <4D925506.5090304@whisper-net.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: do_compile of gcc-cross-sdk-4.5 fails with -mfloat-abi=hard
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
X-List-Received-Date: Tue, 29 Mar 2011 22:41:54 -0000
X-Groupsio-MsgNum: 30712
Content-Type: multipart/mixed; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (29/03/11 23:54), Julian Pietron wrote:
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hey,
> 
> some more information for you in the hope that it will help you to
> find the cause for these problems. I attached the Makefile from the
> gcc-cross-4.5 build, libgcc-subdirectory, and the Makefile from the
> gcc-cross-sdk-4.5, libgcc subdirectory. As you can see in line 67
> where CC is set, the former Makefile includes the correct
> TARGET_CC_ARCH (-mtune=armv7-a etc.), while the latter doesn't contain
> this and especially doesn't contain the -mfloat-abi=hard which would
> be required to perform the correct hard float compilation. I guess
> there is something missing in the call to ./configure for the
> gcc-cross-sdk-build, perhaps you could point me to the directive that
> has to be added to have the correct CFLAGS for building libgcc.

OK here is untested patch. Please apply it on top of current OE and
rebuild from scratch to make sure it builds new toolchain correctly.

and let me know if it helps

-Khem

--SLDf9lqlvOQaIe6s
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="armfp.patch"

diff --git a/conf/machine/include/tune-cortexa8.inc b/conf/machine/include/tune-cortexa8.inc
index 2ac0ebf..e07bf16 100644
--- a/conf/machine/include/tune-cortexa8.inc
+++ b/conf/machine/include/tune-cortexa8.inc
@@ -4,9 +4,9 @@
 # [3] https://support.codesourcery.com/GNUToolchain/kbentry29
 
 # Can be 'softfp' or 'hardfp'
-ARM_FP_MODE ?= "softfp"
+ARM_FP_ABI ?= "softfp"
 
-ARM_FP_OPT = "${@['-mfloat-abi=softfp', '-mfloat-abi=hard'][bb.data.getVar('ARM_FP_MODE', d, 1) == 'hardfp']}"
+ARM_FP_OPT = "${@['-mfloat-abi=softfp', '-mfloat-abi=hard'][bb.data.getVar('ARM_FP_ABI', d, 1) == 'hardfp']}"
 ARM_FP_PACKAGESUFFIX = "${@['', '-hardfp'][bb.data.getVar('ARM_FP_MODE', d, 1) == 'hardfp']}"
 
 TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon ${ARM_FP_OPT}"
diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
index 9fd433b..d32b2ba 100644
--- a/recipes/gcc/gcc-common.inc
+++ b/recipes/gcc/gcc-common.inc
@@ -15,8 +15,16 @@ COMPATIBLE_TARGET_SYS ?= "(?!nios2)"
 # for building for the new host part.  So only obey TARGET_FPU for the
 # real target.
 def get_gcc_fpu_setting(bb, d):
-    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ] and bb.data.getVar('TARGET_OS', d, 1).find('linux') >= 0 :
-        return "--with-float=soft"
+    if bb.data.getVar('TARGET_FPU', d, True) in [ 'soft', 'hard'] and bb.data.getVar('TARGET_OS', d, True).find('linux') >= 0 :
+        # ARM_FP_ABI could be either 'hardfp' or 'softfp'
+        arm_fpabi = bb.data.getVar('ARM_FP_ABI', d, True) or ""
+        if arm_fpabi != "":
+	    if arm_fpabi  == "hardfp":
+	        # reset it to whatever gcc --with-float configure expects which is either 'softfp' or 'hard'
+	        arm_fpabi = "hard"
+            return "--with-float=" + arm_fpabi
+	else:
+	    return "--with-float=" + bb.data.getVar('TARGET_FPU', d, True)
     return ""
 
 def get_gcc_mips_plt_setting(bb, d):

--SLDf9lqlvOQaIe6s--
