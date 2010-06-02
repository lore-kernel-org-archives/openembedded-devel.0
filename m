Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OJoQu-00077Q-7I
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 15:57:03 +0200
Received: by wwb34 with SMTP id 34so3668177wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 06:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=SwQz1DSKPlWQsZ7BddyNzp98JUvWcJOiVZbQSPYERmk=;
	b=iqnu/RA9qjgbeWAJgJjwI/ScUku8ljgMTepws7nSFvkOSv3qPi2VSaXzOmeYKUa7/o
	Bxhd6hSVXwq/ZcOindUlpFpvemCO1Dz+lKkFXzv0KwWWWgste7Hd0ImrfaD8AOJYMI7S
	Yo2J/AO4z9wmpX4zyQe+pb9s/jAnQHzypiOvo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Yu4VMQeG2V8VNVB4Zf1fD08QBDnuaJbiqdIplX9nWhXdA/Lyz9ppH8LTPy6+60i1Ue
	wpwz6taoXzmF9KpfTdPYepIRebhNhrwBX74jkIZU7GLfog9Ukp+JZxJ9LMoRlftTaSgf
	tEw8Adxf7Dy9Fho5Ro/tz/6STmy4aweayGxH4=
MIME-Version: 1.0
Received: by 10.227.72.206 with SMTP id n14mr7719473wbj.33.1275486737316; Wed, 
	02 Jun 2010 06:52:17 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Wed, 2 Jun 2010 06:52:17 -0700 (PDT)
In-Reply-To: <hu2a9n$bb5$1@dough.gmane.org>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com>
	<AANLkTilCZJoRhGKzBokT9TuZwbh0mzyzsBQ2J3NsIpwJ@mail.gmail.com>
	<AANLkTinUqQ16GPijhEAJof0uwAfrokQroib56xX2IutT@mail.gmail.com>
	<hu2a9n$bb5$1@dough.gmane.org>
Date: Wed, 2 Jun 2010 09:52:17 -0400
Message-ID: <AANLkTim75oyfx6Gt5W84j5G7x_zXAiEmK5vISeoTQSfZ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gitver problems
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
X-List-Received-Date: Wed, 02 Jun 2010 13:57:03 -0000
X-List-Received-Date: Wed, 02 Jun 2010 13:57:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Working on this some more this morning ...

As mentioned previously, the example located:

http://cgit.bec-systems.com/cgit.cgi/autotools-demo/

Can simply be cloned into your recipes directory, and then 'bitbake
autotools-demo'

I'm still getting a several errors, but the interesting thing is that
if I run bitbake 3 times, it finally succeeds.

Cliff

cbrake@happy:/scratch/oe/oe-build/oe$ bitbake autotools-demo
NOTE: Handling BitBake files: - (8388/8388) [100 %]
Parsing of 8388 .bb files complete (7920 cached, 468 parsed). 8310
targets, 333 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 723 of 733 (ID: 0,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_populate_sysroot)
NOTE: Running task 724 of 733 (ID: 6,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_distribute_sources)
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task
do_populate_sysroot: Started
NOTE: autotools-demo-1.0-3-gd30ab94-r0: executing task do_configure
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_configure: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task
do_distribute_sources: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task
do_distribute_sources: Succeeded
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_configure: Succeeded
NOTE: autotools-demo-1.0-3-gd30ab94-r0: executing task do_qa_configure
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_qa_configure: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_qa_configure: Succeeded
NOTE: autotools-demo-1.0-3-gd30ab94-r0: executing task do_compile
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_compile: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_compile: Succeeded
NOTE: autotools-demo-1.0-3-gd30ab94-r0: executing task do_install
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_install: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_install: Succeeded
FATAL: Unable to start to 'None' UI due to exception: 23868.




cbrake@happy:/scratch/oe/oe-build/oe$ bitbake autotools-demo
NOTE: Handling BitBake files: - (8388/8388) [100 %]
Parsing of 8388 .bb files complete (7921 cached, 467 parsed). 8310
targets, 333 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 724 of 733 (ID: 5,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package)
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_package: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_package: Succeeded
NOTE: Running task 727 of 733 (ID: 10,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package_write_ipk)
Packaged contents of autotools-demo-dbg into
/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/deploy/glibc/ipk/armv5te/autotools-demo-dbg_1.0-3-gd30ab94-r0.5_armv5te.ipk
Packaged contents of autotools-demo into
/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/deploy/glibc/ipk/armv5te/autotools-demo_1.0-3-gd30ab94-r0.5_armv5te.ipk
Packaged contents of autotools-demo-dev into
/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/deploy/glibc/ipk/armv5te/autotools-demo-dev_1.0-3-gd30ab94-r0.5_armv5te.ipk
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task
do_package_write_ipk: Started
NOTE: Not creating empty archive for autotools-demo-doc-1.0-3-gd30ab94-r0.5
NOTE: Not creating empty archive for autotools-demo-static-1.0-3-gd30ab94-r0.5
NOTE: Not creating empty archive for autotools-demo-locale-1.0-3-gd30ab94-r0.5
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task
do_package_write_ipk: Succeeded
NOTE: Running task 728 of 733 (ID: 4,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package_write)
/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-3-gd30ab94-r0/staging-pkg/deploy/glibc/ipk/armv5te/
/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-3-gd30ab94-r0/staging-pkg/deploy/glibc/ipk/armv5te/
/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-3-gd30ab94-r0/staging-pkg/deploy/glibc/ipk/armv5te/
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_package_write: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_package_write: Succeeded
NOTE: Running task 729 of 733 (ID: 8,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package_stage)
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb
do_package_stage failed
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_package_stage: Started
ERROR: Task 8 (/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package_stage) failed with 256
ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb'
failed
ERROR: Function staging_packager failed
NOTE: Task failed: ('function staging_packager failed',
'/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-3-gd30ab94-r0/temp/log.staging_packager.25337')
ERROR: Logfile of failure stored in:
/scratch/oe/oe-build/oe/build/angstrom-2008.1/tmp/work/armv5te-angstrom-linux-gnueabi/autotools-demo-1.0-3-gd30ab94-r0/temp/log.staging_packager.25337
Log data follows:
| *** Error: CONTROL/control is missing field Source
| The Source field contain the URL's or filenames of the source code
and any patches
| used to build this package.  Either gnu-style tarballs or Debian
source packages
| are acceptable.  Relative filenames may be used if they are
distributed in the same
| directory as the .ipk file.
|
| ipkg-build: Please fix the above errors and try again.
| ERROR: Function staging_packager failed
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_package_stage: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb
do_package_stage failed
ERROR: Task 8 (/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package_stage) failed with 256
ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb'
failed
ERROR: '/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb'
failed




cbrake@happy:/scratch/oe/oe-build/oe$ bitbake autotools-demo
NOTE: Handling BitBake files: - (8388/8388) [100 %]
Parsing of 8388 .bb files complete (7921 cached, 467 parsed). 8310
targets, 333 skipped, 1 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 728 of 733 (ID: 7,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_package_stage_all)
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task
do_package_stage_all: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task
do_package_stage_all: Succeeded
NOTE: Running task 731 of 733 (ID: 2,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_build)
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_build: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_build: Succeeded
NOTE: Running task 732 of 733 (ID: 9,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_rm_work)
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_rm_work: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_rm_work: Succeeded
NOTE: Running task 733 of 733 (ID: 1,
/scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/autotools-demo.bb,
do_rm_work_all)
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_rm_work_all: Started
NOTE: package autotools-demo-1.0-3-gd30ab94-r0: task do_rm_work_all: Succeeded
NOTE: Tasks Summary: Attempted 733 tasks of which 729 didn't need to
be rerun and 0 failed.


