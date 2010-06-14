Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nikunjbadjatya@gmail.com>) id 1OOAT4-00015T-BH
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jun 2010 16:17:03 +0200
Received: by vws1 with SMTP id 1so2001135vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jun 2010 07:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=SIeOEVMag0BVKzHDdYWXGf4h0g8aYy6SKvw6/oC5Wfc=;
	b=iibLWRVn0UnR8euGSo6TSq550gI8qNjGu5GV2Bw8jZ1XPq9W7uPSNASLEBZsNZ7F3w
	O/9SxCULBaWs2SSiLLBzmuljeKksDlFF6qryEw+V+DyRuLswIW9CBiKYwzbfIPMHyGp1
	Obm8TsiMIEAVhn2EGaUlmvr1EyAaYkYVR9Slg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=qwb9ha1fTdoMLaE4X+Tka2K1pj90yoBZfX0RZqcehdIsToH95SnUapxGbmt50IXe1S
	1NQzYER3tHHjjWbZc2jdul1HD6ZNLissyl9c6irgkUQEHZUxL4zt8lQR5zHYBttsbqJG
	Lj9e/OCD06G1qR8e2DhV9ZrBC2YEWixgIKeKE=
Received: by 10.224.58.170 with SMTP id g42mr2216124qah.246.1276524742540; 
	Mon, 14 Jun 2010 07:12:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.191.12 with HTTP; Mon, 14 Jun 2010 07:12:00 -0700 (PDT)
In-Reply-To: <AANLkTilQUwinqS2HGJJzP3t_UTmXtH9daLEiN_fek-6i@mail.gmail.com>
References: <AANLkTilQUwinqS2HGJJzP3t_UTmXtH9daLEiN_fek-6i@mail.gmail.com>
From: nikunj badjatya <nikunjbadjatya@gmail.com>
Date: Mon, 14 Jun 2010 19:42:00 +0530
Message-ID: <AANLkTikBqtzPB0rBp1DQ4Ekzo40HeAJcX1q7i1mLFaWy@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	angstrom-distro-users <angstrom-distro-users@linuxtogo.org>
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: nikunjbadjatya@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OSError: [Errno 2] No such file or directory
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
X-List-Received-Date: Mon, 14 Jun 2010 14:17:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Kindly ignore if this mail already has reached your mailbox.!
==================================================
Hi,
I am trying to build "console-image" using OE framework. With *ANGSTROM
distro* and *OMAP5912OSK* as my machine.
I get an error, saying OSError, no such file or directory.

I have pasted the command with its output.

All necessary python modules are installed .
I tried with frequent "git pull" but results are same.

My organization does not permits to use ftp links.


*NOTE: I have installed python2.6 in /opt directory.
 and /usr/bin/python points to /opt/python2.6/python2.6*

Kindly help me to rectify this problem.

Thanks,

Nikunj
Bangalore, India
*

$ bitbake console-image 2>&1 | tee console-image-19.16pm.log
Parsing .bb files, please wait...NOTE: Angstrom DOES NOT support fso-apm
because regular apmd is good enough
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been
replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-utils because bluez-utils 3.x has been
replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
replaced by bluez4
NOTE: Angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
replaced by bluez4
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is used
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is used
NOTE: Angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is used
done.
NOTE: Parsing finished. 0 cached, 8094 parsed, 310 skipped, 0 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 3329 (ID: 601,
/home/nikunj/ope/openembedded/recipes/stage-manager/
stagemanager-native_0.0.1.bb, do_setscene)
NOTE: Running task 2 of 3329 (ID: 600,
/home/nikunj/ope/openembedded/recipes/stage-manager/
stagemanager-native_0.0.1.bb, do_fetch)
NOTE: Running task 3 of 3329 (ID: 596,
/home/nikunj/ope/openembedded/recipes/stage-manager/
stagemanager-native_0.0.1.bb, do_unpack)
NOTE: Unpacking ../openembedded/recipes/stage-manager/files/stage-manager to
tmp/work/i686-linux/stagemanager-native-0.0.1-r12/
NOTE: Unpacking
../openembedded/recipes/stage-manager/files/stage-manager-ipkg to
tmp/work/i686-linux/stagemanager-native-0.0.1-r12/
NOTE: Unpacking
../openembedded/recipes/stage-manager/files/stage-manager-ipkg-build to
tmp/work/i686-linux/stagemanager-native-0.0.1-r12/
NOTE: Running task 4 of 3329 (ID: 597,
/home/nikunj/ope/openembedded/recipes/stage-manager/
stagemanager-native_0.0.1.bb, do_patch)
NOTE: Running task 5 of 3329 (ID: 602,
/home/nikunj/ope/openembedded/recipes/stage-manager/
stagemanager-native_0.0.1.bb, do_configure)
NOTE: Running task 6 of 3329 (ID: 603,
/home/nikunj/ope/openembedded/recipes/stage-manager/
stagemanager-native_0.0.1.bb, do_qa_configure)
NOTE: Running task 7 of 3329 (ID: 604,
/home/nikunj/ope/openembedded/recipes/stage-manager/
stagemanager-native_0.0.1.bb, do_compile)
NOTE: Running task 8 of 3329 (ID: 598,
/home/nikunj/ope/openembedded/recipes/stage-manager/
stagemanager-native_0.0.1.bb, do_install)
NOTE: Running task 9 of 3329 (ID: 599,
/home/nikunj/ope/openembedded/recipes/stage-manager/
stagemanager-native_0.0.1.bb, do_populate_sysroot)
cp: cannot stat
`/home/nikunj/ope/build/tmp/work/i686-linux/stagemanager-native-0.0.1-r12/sysroot-destdir//home/nikunj/ope/build/tmp/*':
No such file or directory
NOTE: Running task 10 of 3329 (ID: 102,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_setscene)
NOTE: Running task 11 of 3329 (ID: 101,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_fetch)
NOTE: Running task 12 of 3329 (ID: 97,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_unpack)
NOTE: Unpacking ../../sources/coreutils-8.5.tar.gz to
tmp/work/i686-linux/coreutils-native-8.5-r0/
NOTE: Running task 13 of 3329 (ID: 98,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_patch)
NOTE: Running task 14 of 3329 (ID: 103,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_configure)
NOTE: Running task 15 of 3329 (ID: 24,
/home/nikunj/ope/openembedded/recipes/quilt/quilt-native_0.48.bb,
do_setscene)
NOTE: Running task 16 of 3329 (ID: 23,
/home/nikunj/ope/openembedded/recipes/quilt/quilt-native_0.48.bb, do_fetch)
NOTE: Running task 17 of 3329 (ID: 19,
/home/nikunj/ope/openembedded/recipes/quilt/quilt-native_0.48.bb, do_unpack)
NOTE: Unpacking ../../sources/quilt-0.48.tar.gz to
tmp/work/i686-linux/quilt-native-0.48-r0/
NOTE: Unpacking ../openembedded/recipes/quilt/quilt-0.48/install.patch to
tmp/work/i686-linux/quilt-native-0.48-r0/
NOTE: Running task 18 of 3329 (ID: 104,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_qa_configure)
NOTE: Gettext required but not in DEPENDS for file
/home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/coreutils-8.5/
configure.ac.
Missing inherit gettext?
NOTE: Running task 19 of 3329 (ID: 105,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_compile)
NOTE: Running task 20 of 3329 (ID: 99,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_install)
NOTE: Running task 21 of 3329 (ID: 100,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_populate_sysroot)
ERROR: Error in executing: /home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such file
or directory
ERROR: Printing the environment of the function
ERROR: Error in executing: /home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb
ERROR: Exception:<type 'exceptions.OSError'> Message:[Errno 2] No such file
or directory
ERROR: Printing the environment of the function
ERROR: Build of /home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb do_populate_sysroot failed
Traceback (most recent call last):
  File "/home/nikunj/ope/bitbake/bin/bitbake", line 143, in <module>
    main()
  File "/home/nikunj/ope/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/home/nikunj/ope/bitbake/lib/bb/cooker.py", line 640, in cook
    return self.buildTargets(pkgs_to_build)
  File "/home/nikunj/ope/bitbake/lib/bb/cooker.py", line 547, in
buildTargets
    failures = rq.execute_runqueue()
  File "/home/nikunj/ope/bitbake/lib/bb/runqueue.py", line 841, in
execute_runqueue
    self.execute_runqueue_internal()
  File "/home/nikunj/ope/bitbake/lib/bb/runqueue.py", line 950, in
execute_runqueue_internal
    self.cooker.tryBuild(fn)
  File "/home/nikunj/ope/bitbake/lib/bb/cooker.py", line 136, in tryBuild
    return self.tryBuildPackage(fn, item, self.configuration.cmd, the_data)
  File "/home/nikunj/ope/bitbake/lib/bb/cooker.py", line 110, in
tryBuildPackage
    bb.build.exec_task('do_%s' % task, the_data)
  File "/home/nikunj/ope/bitbake/lib/bb/build.py", line 283, in exec_task
    exec_func(task, localdata)
  File "/home/nikunj/ope/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/home/nikunj/ope/bitbake/lib/bb/build.py", line 141, in
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/nikunj/ope/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "do_populate_sysroot", line 49, in <module>
  File "do_populate_sysroot", line 42, in do_populate_sysroot
  File "/home/nikunj/ope/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/home/nikunj/ope/bitbake/lib/bb/build.py", line 141, in
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/nikunj/ope/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "relocatable_binaries_preprocess", line 4, in <module>
  File "relocatable_binaries_preprocess", line 2, in
relocatable_binaries_preprocess
  File "<bb>", line 7, in rpath_replace
  File "<bb>", line 35, in process_dir
  File "/opt/python2.6/lib/python2.6/subprocess.py", line 633, in __init__
    errread, errwrite)
  File "/opt/python2.6/lib/python2.6/subprocess.py", line 1139, in
_execute_child
    raise child_exception
OSError: [Errno 2] No such file or directory
ERROR: Task 100 (/home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb, do_populate_sysroot) failed
NOTE: Tasks Summary: Attempted 20 tasks of which 0 didn't need to be rerun
and 1 failed.
ERROR: '/home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb' failed
*

