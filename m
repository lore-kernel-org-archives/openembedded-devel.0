Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nikunjbadjatya@gmail.com>) id 1OPESS-00051I-77
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 14:44:39 +0200
Received: by gxk19 with SMTP id 19so1742744gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=5M47AP5cJ5WfKgxkX4VPCYMCSFRtWopScZABurrvcxM=;
	b=NcKBLVG3Sbcd+gz1YA034RKPKzEBIjIv5xLNj8kpWxHdb9DylOmA6oJQxXccRj1XWT
	Z9qzM5usMn+zidtz59vejteyU8XSs5zxeg6m91O8OXZdpNXDv1IddGszuqegKfZu5jrn
	Z/ZTzuoo3GiHASjtmHq+1eV+Mm/TQrqYhgYYc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=NN0eS7aM755TQk2VdnttKK+5xVdPG2ZXE/5aAhom5o3vLvIY0f4wpdJ5CJRfPsbfQT
	i+O8d+ACmMlz7Fa4xA9rmo/a7p7e/n09RBuWRAMlxhSqyxikhR3/7zgElrq60vqOaWpa
	o+hJZec5D6zJp9IshsPJf8ICgCCurOW8HQkhE=
Received: by 10.229.181.20 with SMTP id bw20mr4741498qcb.160.1276778405484; 
	Thu, 17 Jun 2010 05:40:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.191.12 with HTTP; Thu, 17 Jun 2010 05:39:45 -0700 (PDT)
In-Reply-To: <AANLkTim1FUHwT6lBvu2yoUUM8rvYRSaw-9e4VE_olNoa@mail.gmail.com>
References: <AANLkTilQUwinqS2HGJJzP3t_UTmXtH9daLEiN_fek-6i@mail.gmail.com> 
	<AANLkTikBqtzPB0rBp1DQ4Ekzo40HeAJcX1q7i1mLFaWy@mail.gmail.com> 
	<AANLkTim1FUHwT6lBvu2yoUUM8rvYRSaw-9e4VE_olNoa@mail.gmail.com>
From: nikunj badjatya <nikunjbadjatya@gmail.com>
Date: Thu, 17 Jun 2010 18:09:45 +0530
Message-ID: <AANLkTilzhsHsHj4f-bd4FcB7Ka7fRspYX0iUsMxxzVuz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: nikunjbadjatya@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OSError: [Errno 2] No such file or directory
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
X-List-Received-Date: Thu, 17 Jun 2010 12:44:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Khem,
I have uncommented the required line.
It gives me the following output.

*$ bitbake -b coreutils-native_8.5.bb 2>&1 | tee
../../daily-work/logs_17.06.10/coreutils-native.bb.log
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 1 of 17 (ID: 6,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_setscene)
sh: stage-manager-ipkg: command not found
NOTE: Running task 2 of 17 (ID: 5,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_fetch)
NOTE: Running task 3 of 17 (ID: 0,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_unpack)
NOTE: Unpacking ../../sources/coreutils-8.5.tar.gz to
tmp/work/i686-linux/coreutils-native-8.5-r0/
NOTE: Running task 4 of 17 (ID: 1,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_patch)
NOTE: Running task 5 of 17 (ID: 7,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_configure)
NOTE: Running task 6 of 17 (ID: 8,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_qa_configure)
NOTE: Gettext required but not in DEPENDS for file
/home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/coreutils-8.5/
configure.ac.
Missing inherit gettext?
NOTE: Running task 7 of 17 (ID: 9,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_compile)
NOTE: Running task 8 of 17 (ID: 2,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_install)
NOTE: Running task 9 of 17 (ID: 12,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_package)
NOTE: Running task 10 of 17 (ID: 16,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_package_write_ipk)
NOTE: Running task 11 of 17 (ID: 11,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_package_write)
NOTE: Running task 12 of 17 (ID: 3,
/home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
do_populate_sysroot)
NOTE: Testing
/home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
for relocatability
ERROR: Error in executing: /home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb
ERROR: Exception:exceptions.OSError Message:[Errno 2] No such file or
directory
ERROR: Printing the environment of the function
ERROR: Error in executing: /home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb
ERROR: Exception:exceptions.OSError Message:[Errno 2] No such file or
directory
ERROR: Printing the environment of the function
ERROR: Build of /home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb do_populate_sysroot failed
Traceback (most recent call last):
  File "/home/nikunj/ope/bitbake/bin/bitbake", line 143, in ?
    main()
  File "/home/nikunj/ope/bitbake/bin/bitbake", line 140, in main
    cooker.cook()
  File "/home/nikunj/ope/bitbake/lib/bb/cooker.py", line 608, in cook
    if not self.buildFile(self.configuration.buildfile):
  File "/home/nikunj/ope/bitbake/lib/bb/cooker.py", line 510, in buildFile
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
  File "do_populate_sysroot", line 49, in ?
  File "do_populate_sysroot", line 42, in do_populate_sysroot
  File "/home/nikunj/ope/bitbake/lib/bb/build.py", line 120, in exec_func
    exec_func_python(func, d)
  File "/home/nikunj/ope/bitbake/lib/bb/build.py", line 141, in
exec_func_python
    utils.better_exec(comp, g, tmp, bbfile)
  File "/home/nikunj/ope/bitbake/lib/bb/utils.py", line 185, in better_exec
    exec code in context
  File "relocatable_binaries_preprocess", line 4, in ?
  File "relocatable_binaries_preprocess", line 2, in
relocatable_binaries_preprocess
  File "<bb>", line 7, in rpath_replace
  File "<bb>", line 35, in process_dir
  File "/usr/lib/python2.4/subprocess.py", line 550, in __init__
    errread, errwrite)
  File "/usr/lib/python2.4/subprocess.py", line 993, in _execute_child
    raise child_exception
OSError: [Errno 2] No such file or directory
ERROR: Task 3 (/home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb, do_populate_sysroot) failed
NOTE: Tasks Summary: Attempted 11 tasks of which 0 didn't need to be rerun
and 1 failed.
ERROR: '/home/nikunj/ope/openembedded/recipes/coreutils/
coreutils-native_8.5.bb' failed
*

-------------------------------------------------------------
*$ rpm -qa \*gettext\**
gettext-0.14.6-4.el5


Kindly Kindly help.!

Thanks,
Nikunj



On Tue, Jun 15, 2010 at 8:05 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jun 14, 2010 at 7:12 AM, nikunj badjatya
> <nikunjbadjatya@gmail.com> wrote:
> >  File "/home/nikunj/ope/bitbake/lib/bb/build.py", line 141, in
> > exec_func_python
> >    utils.better_exec(comp, g, tmp, bbfile)
> >  File "/home/nikunj/ope/bitbake/lib/bb/utils.py", line 185, in
> better_exec
> >    exec code in context
> >  File "relocatable_binaries_preprocess", line 4, in <module>
> >  File "relocatable_binaries_preprocess", line 2, in
> > relocatable_binaries_preprocess
> >  File "<bb>", line 7, in rpath_replace
> >  File "<bb>", line 35, in process_dir
> >  File "/opt/python2.6/lib/python2.6/subprocess.py", line 633, in __init__
> >    errread, errwrite)
> >  File "/opt/python2.6/lib/python2.6/subprocess.py", line 1139, in
> > _execute_child
> >    raise child_exception
> > OSError: [Errno 2] No such file or directory
> > ERROR: Task 100 (/home/nikunj/ope/openembedded/recipes/coreutils/
> > coreutils-native_8.5.bb, do_populate_sysroot) failed
> > NOTE: Tasks Summary: Attempted 20 tasks of which 0 didn't need to be
> rerun
> > and 1 failed.
> > ERROR: '/home/nikunj/ope/openembedded/recipes/coreutils/
> > coreutils-native_8.5.bb' failed
> >
>
> It dies in process_dir while trying to do os.access I think. my guess
> is that you are
> passing it host paths like /usr/lib /lib etc which are under root
> permissions and can
> not be modified by normal user.
>
> You have to debug it. uncomment the
>
> #bb.note("Testing %s for relocatability" % fpath)
>
> in classes/relocatable.bbclass line 28
>
> and check what paths are passed to it when you do
>
> bitbake -b coreutils-native_8.5.bb
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

