Return-Path: <idealsim@laposte.net>
Received: from smtp.laposte.net (smtpoutz25.laposte.net [194.117.213.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4637D7838C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 10:32:54 +0000 (UTC)
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout013 (Postfix) with ESMTP id 735D5104C0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 12:32:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=laposte.net; s=mail0;
	t=1502965975; bh=IAmYjAVHGc2BQo6GgYNuDfjMJ2ks1spnTFvOIKyCi5Y=;
	h=To:From:Subject:Date;
	b=Yv/WV6J2EdQVkTbCntXBuyTdNV+dvyOXVq6LEEmBh/jGm/RxwCXk0dZvVTDneWWom
	U8Dy1v8gCTaNTLmL+sfzYMep/zM5pn5hbe6OED3wZJpLyT+qN45qCKFaIUCcYpTENg
	xcOahWG6isfzG1zPothYJ8QM+k+yNC2XWwsgbPgKeBOp6j5RtyMKjhXzzvH19i8MU2
	h2u+QcV/lVCIc26vDqiGLCUXyn842B3KVSnipI7JcwWFcda/pdtg/RxSAJMcdTA1X/
	sloIyX5N+MS4xNG0pHxFtyTiZ+1GFR/vzc8vP4AR8qgu6NGyjcMWJW4pnkVjp+mNGQ
	8zps5pX52TCnw==
Received: from smtp.laposte.net (localhost [127.0.0.1])
	by lpn-prd-vrout013 (Postfix) with ESMTP id 64A01104C11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 12:32:55 +0200 (CEST)
Received: from lpn-prd-vrin004 (lpn-prd-vrin004.laposte [10.128.63.5])
	by lpn-prd-vrout013 (Postfix) with ESMTP id 5F297104C0C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 12:32:55 +0200 (CEST)
Received: from lpn-prd-vrin004 (localhost [127.0.0.1])
	by lpn-prd-vrin004 (Postfix) with ESMTP id 5164A713FC4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 12:32:55 +0200 (CEST)
Received: from [192.168.1.19] (ARennes-654-1-262-25.w2-13.abo.wanadoo.fr
	[2.13.73.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lpn-prd-vrin004 (Postfix) with ESMTPSA id 0C526713FAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Aug 2017 12:32:54 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
From: idealsim <idealsim@laposte.net>
Message-ID: <c2b6cee4-59c7-c8f3-ebcb-5946172af1cc@laposte.net>
Date: Thu, 17 Aug 2017 12:32:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
X-VR-SrcIP: 2.13.73.25
X-VR-FullState: 0
X-VR-Score: 0
X-VR-Cause-1: gggruggvucftvghtrhhoucdtuddrfeelkedruddtuddgvdejucetufdoteggodetrfdotffvucfrrhho
X-VR-Cause-2: fhhilhgvmecunfetrffquffvgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefvhffukfff
X-VR-Cause-3: fgggtgesrgdtreertdefjeenucfhrhhomhepihguvggrlhhsihhmuceoihguvggrlhhsihhmsehlrghp
X-VR-Cause-4: ohhsthgvrdhnvghtqeenucfkphepvddrudefrdejfedrvdehnecurfgrrhgrmhepmhhouggvpehsmhht
X-VR-Cause-5: phhouhhtpdhhvghloheplgduledvrdduieekrddurddulegnpdhinhgvthepvddrudefrdejfedrvdeh
X-VR-Cause-6: pdhmrghilhhfrhhomhepihguvggrlhhsihhmsehlrghpohhsthgvrdhnvghtpdhrtghpthhtohepohhp
X-VR-Cause-7: vghnvghmsggvugguvgguqdguvghvvghlsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-VR-AvState: No
X-VR-State: 0
X-VR-State: 0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [php5.6.26]error during build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Aug 2017 10:32:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi try to build an image with php5.6.26 in pyro branch. I have this 
error during the build :

/| ERROR: oe_runmake failed//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o): 
In function `ssl_onceonlyinit'://
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302: 
warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld: 
TSRM/.libs/TSRM.o: undefined reference to symbol 
'pthread_getspecific@@GLIBC_2.4'//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0: 
error adding symbols: DSO missing from command line//
//| collect2: error: ld returned 1 exit status//
//| Makefile:270: recipe for target 'sapi/cli/php' failed//
//| make: *** [sapi/cli/php] Error 1//
//| make: *** Waiting for unfinished jobs....//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o): 
In function `ssl_onceonlyinit'://
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302: 
warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld: 
TSRM/.libs/TSRM.o: undefined reference to symbol 
'pthread_getspecific@@GLIBC_2.4'//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0: 
error adding symbols: DSO missing from command line//
//| collect2: error: ld returned 1 exit status//
//| Makefile:306: recipe for target 'sapi/cgi/php-cgi' failed//
//| make: *** [sapi/cgi/php-cgi] Error 1//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o): 
In function `ssl_onceonlyinit'://
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302: 
warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/6.3.0/ld: 
TSRM/.libs/TSRM.o: undefined reference to symbol 
'pthread_getspecific@@GLIBC_2.4'//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/lib/libpthread.so.0: 
error adding symbols: DSO missing from command line//
//| collect2: error: ld returned 1 exit status//
//| Makefile:283: recipe for target 'sapi/fpm/php-fpm' failed//
//| make: *** [sapi/fpm/php-fpm] Error 1//
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/recipe-sysroot/usr/lib/../lib/libc-client.a(osdep.o): 
In function `ssl_onceonlyinit'://
//| 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/uw-imap/2007f-r0/imap-2007f/c-client/osdep.c:302: 
warning: the use of `tmpnam' is dangerous, better use `mkstemp'//
//| WARNING: exit code 1 from a shell command.//
//| ERROR: Function failed: do_compile (log file is located at 
/media/modjo/data1TO/yocto/pyro/quadBuild/tmp/work/udooqdl-poky-linux-gnueabi/php/5.6.26-r0/temp/log.do_compile.15528)//
//ERROR: Task 
(/media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recipes-devtools/php/php_5.6.26.bb:do_compile) 
failed with exit code '1'//
//NOTE: Tasks Summary: Attempted 6275 tasks of which 6269 didn't need to 
be rerun and 1 failed.//
//
//Summary: 1 task failed://
///media/modjo/data1TO/yocto/pyro/sources/meta-openembedded/meta-oe/recipes-devtools/php/php_5.6.26.bb:do_compile//
//Summary: There was 1 WARNING message shown.//
//Summary: There were 2 ERROR messages shown, returning a non-zero exit 
code./

Do you have an idea to resolve this ?

Mickael


