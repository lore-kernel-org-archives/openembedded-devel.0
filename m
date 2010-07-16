Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OZpvO-0007hO-Ek
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 20:46:19 +0200
Received: by yxi11 with SMTP id 11so571921yxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 11:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=cn54aocAwDiUz6UeI0+T5li8Du9TKE3cTKfIV03H9Ag=;
	b=wBG26ZOSITSjIPsn2meL4/AgJY3coKla8Pt3/DTh93qu+/4lDgDI874piq38rqebqz
	Rps06FfGn5tOXghMvxPVq6DsOpYWbwNePnNbmuTXp9p+3QxstHR5R3tvyLOCKbS8e24c
	3IWUau0BzFv7zpsQq0OHUS7QVly/xR1arVhMw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=xtMmFGg6om1+leVMpXnSYqaAQZtNENOQH3ImPvrsW0hPf83XQHy9Cjm2etxrmXSHQv
	i6X0I0h9tJsKSuU775hx8Tioqi62RLTYnHy513PMoA6hwenDUD26ZNzG5zrcuhpkHRFv
	k+6V2FiPdZ2yG9uaBRMdPtVkqtQZQ+QECojP4=
MIME-Version: 1.0
Received: by 10.100.12.14 with SMTP id 14mr1651738anl.244.1279305971931; Fri, 
	16 Jul 2010 11:46:11 -0700 (PDT)
Received: by 10.100.127.11 with HTTP; Fri, 16 Jul 2010 11:46:11 -0700 (PDT)
Date: Fri, 16 Jul 2010 11:46:11 -0700
Message-ID: <AANLkTimwFjLODTbT6WEEhthhjwYMiMQ4nt5RtXniNgZb@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: spca5xx does not build
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
X-List-Received-Date: Fri, 16 Jul 2010 18:46:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was trying to build this for my gumstix and first it had a DL
location issue which I fixed and its now downloading the pacakge but
fails on the build with the following errors. Hope someone can make
some sense of this as I have no clue nor does googling help any seems
as though according to posts been unbuildable for a couple years? the
earliest post I found complaining was 06 then 07 a update to file was
done but still did not build correctly then according to the boards. I
also tried gspcav1 as well since its a similar driver and that one
fails as well.



NOTE: Running task 516 of 750 (ID: 9,
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/spca5xx/spca5xx_20060501.bb,
do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/spca5xx-20060501-r81/temp/log.do_compile.17684)
| NOTE: make -e MAKEFLAGS=
KERNELDIR=/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kernel
CC=ccache arm-angstrom-linux-gnueabi-gcc
LD=arm-angstrom-linux-gnueabi-ld
|    Building SPCA5XX driver for 2.5/2.6 kernel.
|    Remember: you must have read/write access to your kernel source tree.
| make -C /home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kernel
SUBDIRS=/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/spca5xx-20060501-r81/spca5xx-20060501
CC="ccache arm-angstrom-linux-gnueabi-gcc " modules
| make[1]: Entering directory
`/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kernel'
| scripts/Makefile.build:49: *** CFLAGS was changed in
"/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/spca5xx-20060501-r81/spca5xx-20060501/Makefile".
Fix it to use EXTRA_CFLAGS.  Stop.
| make[1]: *** [_module_/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/spca5xx-20060501-r81/spca5xx-20060501]
Error 2
| make[1]: Leaving directory
`/home/vdubhack/overo-oe/tmp/sysroots/overo-angstrom-linux-gnueabi/kernel'
| make: *** [default] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/vdubhack/overo-oe/tmp/work/overo-angstrom-linux-gnueabi/spca5xx-20060501-r81/temp/log.do_compile.17684
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/spca5xx/spca5xx_20060501.bb
do_compile failed
ERROR: Task 9 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/spca5xx/spca5xx_20060501.bb,
do_compile) failed
NOTE: Tasks Summary: Attempted 515 tasks of which 510 didn't need to
be rerun and 1 failed.
ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/spca5xx/spca5xx_20060501.bb'
failed


