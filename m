Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDFF7F265
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 20:17:53 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t2so21602966wrr.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 12:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Tult9EZPk1TS5TcLWwVNXNbD9ozx67yR8hM3G4eeu/k=;
	b=jbRZYhLIQi1RcabFCyAom+HndSZe/IkJlYB7txn2oljP7fIUJAFSUbD+tqNE3vrjy0
	kxXg9n6rEpjDj7FVaCTbHTHXvH5y1DuI5506OSPC816JHF/ibZl9AjBa6hZNryZ+ou7N
	sKMzb69QlvbYgETQwqQBQBTwbd7r45SNWWvCWxe4P6ZrXD7Vrtl2ZcRMFCPEGFODW7In
	vwdXtnaFbPXFA10bqLl7tFmoU1tEpynzXSOsnC7q7Fzj611MRjoHewuKiDW9kPG1yI0+
	YBbupJgolwQ1eEY2AMMpu/JEPpgCdWijObwHWenz7YUETtXbQhYUuv9mAD89Klr5FeQh
	10aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tult9EZPk1TS5TcLWwVNXNbD9ozx67yR8hM3G4eeu/k=;
	b=ezNw10qY9i4UJ2pOiDzLGB+pNiKapzklKmPLa9Ne8IFiXbX01vlHLfOiLj5QBe/m7G
	/lDm+2OfbxUdlvrVy7YuG49lFzYpQlU8hPYp0J562ZQ1m8gPHB45vGIU2aeTqxx8TG09
	2q0h49VRSfSUpU00Z1Oau/aiARZ/uDyORyA7KRs1pETlVyzGYIucrmhoynIggXRkCFyT
	/1sObXJ7uDO3WBl0XzIscYSjfFdhV7ck1hBjmOrjTrdmWPkwti9qn6sHQradhuSPhMB9
	rufLA7B901pmyEdy2+skd0RT1KIfBO3wfyhXkL+QpHo7AxHhiwPFHaCHCXRZrdX29IBx
	/nMg==
X-Gm-Message-State: APjAAAXV3JZPnMOpQ8jodRVLEb2p4nqZBKxb5UFPbb2NsLxSsUX4K82a
	xl85MOc2p4XiZ369MYwgw4pdZaNl5VDQrVm+Bmg=
X-Google-Smtp-Source: APXvYqxB3BromJYWewg4kBwgqrOAUWY7bnoA2dnVOmx1t6LpN2wbtMKLEO7TOkHcKW3f7E5DSMh2VcTpRfmHo0c6N50=
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr5257174wrs.222.1576009073614; 
	Tue, 10 Dec 2019 12:17:53 -0800 (PST)
MIME-Version: 1.0
References: <CANSQD5+CcEbaHxdfR8cjqdc6maXhrCgXy3eXrGD0dMgpiM_0LQ@mail.gmail.com>
	<7e5b400c-9c07-ff0d-df4b-9ca0329bfdbc@intel.com>
	<CANSQD5+e24bohovGjVgagiFrizqu2sj0SwzJWn+17tUJCthO_Q@mail.gmail.com>
In-Reply-To: <CANSQD5+e24bohovGjVgagiFrizqu2sj0SwzJWn+17tUJCthO_Q@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Tue, 10 Dec 2019 21:17:42 +0100
Message-ID: <CAHtQpK4zNtju4Own7yx+bTZsmyycW2dXoB0JOA=566X=h89wMw@mail.gmail.com>
To: Kamel Ghalgaoui <kamelghalgaoui7@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Building Linux Error
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
X-List-Received-Date: Tue, 10 Dec 2019 20:17:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 10, 2019 at 8:13 PM Kamel Ghalgaoui
<kamelghalgaoui7@gmail.com> wrote:
>
> I try with zeus, but I got the same error:
>
> kamel@ThinkPad-E590:/opt/yocto/poky/build$ git branch
>   fido
>   morty
>   thud
>   warrior
> * zeus
> kamel@ThinkPad-E590:/opt/yocto/poky/build$
> kamel@ThinkPad-E590:/opt/yocto/poky/build$ bitbake core-image-minimal
> Loading cache: 100%
> |##########################################################################################################|
> Time: 0:00:00
> Loaded 2061 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        = "1.32.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "raspberrypi3"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.2.4"
> TUNE_FEATURES     = "arm armv7ve vfp thumb neon vfpv4 callconvention-hard
> cortexa7"
> TARGET_FPU        = "hard"
> meta
> meta-poky
> meta-yocto-bsp    = "zeus:e56be3cee517c5262486136dbd6d649b68c3a8b7"
> meta-oe           = "zeus:997caf9146cd3797cd054e2adebd1fbb4df91911"
> meta-raspberrypi  = "zeus:2a192261a914892019f4f428d7462bb3c585ebac"
>
> Initialising tasks: 100%
> |#####################################################################################################|
> Time: 0:00:04
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: quilt-native-0.64-r0 do_populate_lic: Error executing a python
> function in exec_python_func() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:sstate_task_postfunc(d)
>      0003:
> File: '/opt/yocto/poky/meta/classes/sstate.bbclass', lineno: 670, function:
> sstate_task_postfunc
>      0666:
>      0667:python sstate_task_postfunc () {
>      0668:    shared_state = sstate_state_fromvars(d)
>      0669:
>  *** 0670:    sstate_install(shared_state, d)
>      0671:    for intercept in shared_state['interceptfuncs']:
>      0672:        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR",
> True),))
>      0673:    omask = os.umask(0o002)
>      0674:    if omask != 0o002:
> File: '/opt/yocto/poky/meta/classes/sstate.bbclass', lineno: 274, function:
> sstate_install
>      0270:
>      0271:    # Run the actual file install
>      0272:    for state in ss['dirs']:
>      0273:        if os.path.exists(state[1]):
>  *** 0274:            oe.path.copyhardlinktree(state[1], state[2])
>      0275:
>      0276:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or
> '').split():
>      0277:        # All hooks should run in the SSTATE_INSTDIR
>      0278:        bb.build.exec_func(postinst, d, (sstateinst,))
> File: '/opt/yocto/poky/meta/lib/oe/path.py', lineno: 81, function:
> copyhardlinktree
>      0077:    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>      0078:        # Need to copy directories only with tar first since cp
> will error if two
>      0079:        # writers try and create a directory at the same time
>      0080:        cmd = "cd %s; find . -type d -print | tar --xattrs
> --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar
> --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
>  *** 0081:        subprocess.check_output(cmd, shell=True,
> stderr=subprocess.STDOUT)
>      0082:        source = ''
>      0083:        if os.path.isdir(src):
>      0084:            import glob
>      0085:            if len(glob.glob('%s/.??*' % src)) > 0:
> File: '/usr/lib/python3.5/subprocess.py', lineno: 626, function:
> check_output
>      0622:        # empty string. That is maintained here for backwards
> compatibility.
>      0623:        kwargs['input'] = '' if kwargs.get('universal_newlines',
> False) else b''
>      0624:
>      0625:    return run(*popenargs, stdout=PIPE, timeout=timeout,
> check=True,
>  *** 0626:               **kwargs).stdout
>      0627:
>      0628:
>      0629:class CompletedProcess(object):
>      0630:    """A process that has finished running.
> File: '/usr/lib/python3.5/subprocess.py', lineno: 708, function: run
>      0704:            raise
>      0705:        retcode = process.poll()
>      0706:        if check and retcode:
>      0707:            raise CalledProcessError(retcode, process.args,
>  *** 0708:                                     output=stdout, stderr=stderr)
>      0709:    return CompletedProcess(process.args, retcode, stdout, stderr)
>      0710:
>      0711:
>      0712:def list2cmdline(seq):
> Exception: subprocess.CalledProcessError: Command 'cd
> /opt/yocto/poky/build/tmp/work/x86_64-linux/quilt-native/0.64-r0/license-destdir;
> find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C
> /opt/yocto/poky/build/tmp/work/x86_64-linux/quilt-native/0.64-r0/license-destdir
> -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xf -
> -C /opt/yocto/poky/build/tmp/deploy/licenses' returned non-zero exit status
> 64
>
> Subprocess output:
> tar: unrecognized option '--xattrs'
> Try `tar --help' or `tar --usage' for more information.
> tar: unrecognized option '--xattrs'
> Try `tar --help' or `tar --usage' for more information.

My best guess would be: this error (and you would see much more of
those) is comming from the tar version which is included in Ubuntu
16.04 as this version is relatively old. I believe the next error with
that host distro would be from git: something with --set-upstream-to
would be an unrecognized option (modern git has changed syntax to
--set-upstream).

If you have any possibility to upgrade host distro - I would strongl
suggest you to do that. Otherwise - Docker with a bit newer distro
would be a good choice.

Ross,
Poky master still has ubuntu-16.04 as SANITY_TESTED_DISTROS, are we
absolutely sure that it is still supported? I guess with this report
this is not valid anymore... Or is this build error - something else?

Thanks a lot!

>
> ERROR: quilt-native-0.64-r0 do_populate_lic: Function failed:
> sstate_task_postfunc
> ERROR: Logfile of failure stored in:
> /opt/yocto/poky/build/tmp/work/x86_64-linux/quilt-native/0.64-r0/temp/log.do_populate_lic.4692
> ERROR: Task
> (/opt/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.64.bb:do_populate_lic)
> failed with exit code '1'
> ERROR: quilt-native-0.64-r0 do_populate_sysroot: Error executing a python
> function in exec_python_func() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:sstate_task_postfunc(d)
>      0003:
> File: '/opt/yocto/poky/meta/classes/sstate.bbclass', lineno: 670, function:
> sstate_task_postfunc
>      0666:
>      0667:python sstate_task_postfunc () {
>      0668:    shared_state = sstate_state_fromvars(d)
>      0669:
>  *** 0670:    sstate_install(shared_state, d)
>      0671:    for intercept in shared_state['interceptfuncs']:
>      0672:        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR",
> True),))
>      0673:    omask = os.umask(0o002)
>      0674:    if omask != 0o002:
> File: '/opt/yocto/poky/meta/classes/sstate.bbclass', lineno: 274, function:
> sstate_install
>      0270:
>      0271:    # Run the actual file install
>      0272:    for state in ss['dirs']:
>      0273:        if os.path.exists(state[1]):
>  *** 0274:            oe.path.copyhardlinktree(state[1], state[2])
>      0275:
>      0276:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or
> '').split():
>      0277:        # All hooks should run in the SSTATE_INSTDIR
>      0278:        bb.build.exec_func(postinst, d, (sstateinst,))
> File: '/opt/yocto/poky/meta/lib/oe/path.py', lineno: 81, function:
> copyhardlinktree
>      0077:    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
>      0078:        # Need to copy directories only with tar first since cp
> will error if two
>      0079:        # writers try and create a directory at the same time
>      0080:        cmd = "cd %s; find . -type d -print | tar --xattrs
> --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar
> --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
>  *** 0081:        subprocess.check_output(cmd, shell=True,
> stderr=subprocess.STDOUT)
>      0082:        source = ''
>      0083:        if os.path.isdir(src):
>      0084:            import glob
>      0085:            if len(glob.glob('%s/.??*' % src)) > 0:
> File: '/usr/lib/python3.5/subprocess.py', lineno: 626, function:
> check_output
>      0622:        # empty string. That is maintained here for backwards
> compatibility.
>      0623:        kwargs['input'] = '' if kwargs.get('universal_newlines',
> False) else b''
>      0624:
>      0625:    return run(*popenargs, stdout=PIPE, timeout=timeout,
> check=True,
>  *** 0626:               **kwargs).stdout
>      0627:
>      0628:
>      0629:class CompletedProcess(object):
>      0630:    """A process that has finished running.
> File: '/usr/lib/python3.5/subprocess.py', lineno: 708, function: run
>      0704:            raise
>      0705:        retcode = process.poll()
>      0706:        if check and retcode:
>      0707:            raise CalledProcessError(retcode, process.args,
>  *** 0708:                                     output=stdout, stderr=stderr)
>      0709:    return CompletedProcess(process.args, retcode, stdout, stderr)
>      0710:
>      0711:
>      0712:def list2cmdline(seq):
> Exception: subprocess.CalledProcessError: Command 'cd
> /opt/yocto/poky/build/tmp/work/x86_64-linux/quilt-native/0.64-r0/sysroot-destdir/opt/yocto/poky/build/tmp/sysroots/x86_64-linux;
> find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C
> /opt/yocto/poky/build/tmp/work/x86_64-linux/quilt-native/0.64-r0/sysroot-destdir/opt/yocto/poky/build/tmp/sysroots/x86_64-linux
> -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xf -
> -C /opt/yocto/poky/build/tmp/sysroots/x86_64-linux' returned non-zero exit
> status 64
>
> Subprocess output:
> tar: unrecognized option '--xattrs'
> Try `tar --help' or `tar --usage' for more information.
> tar: unrecognized option '--xattrs'
> Try `tar --help' or `tar --usage' for more information.
>
> ERROR: quilt-native-0.64-r0 do_populate_sysroot: Function failed:
> sstate_task_postfunc
> ERROR: Logfile of failure stored in:
> /opt/yocto/poky/build/tmp/work/x86_64-linux/quilt-native/0.64-r0/temp/log.do_populate_sysroot.4691
> ERROR: Task
> (/opt/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.64.bb:do_populate_sysroot)
> failed with exit code '1'
>
> Second Keyboard Interrupt, stopping...
>
>
> Summary: 2 tasks failed:
>   /opt/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.64.bb:
> do_populate_lic
>   /opt/yocto/poky/meta/recipes-devtools/quilt/quilt-native_0.64.bb:
> do_populate_sysroot
> Summary: There were 4 ERROR messages shown, returning a non-zero exit code.
>
> On Tue, Dec 10, 2019 at 12:03 PM Ross Burton <ross.burton@intel.com> wrote:
>
> > On 10/12/2019 10:12, Kamel Ghalgaoui wrote:
> > > kamel@ThinkPad-E590:/opt/yocto/poky/build$ bitbake core-image-minimal
> > > Parsing recipes: 100%
> > >
> > |########################################################################################################|
> > > Time: 0:00:33 Parsing of 1499 .bb files complete (0 cached, 1499 parsed).
> > > 2061 targets, 132 skipped, 0 masked, 0 errors. NOTE: Resolving any
> > missing
> > > task queue dependencies Build Configuration: BB_VERSION = "1.32.0"
> > > BUILD_SYS = "x86_64-linux" NATIVELSBSTRING = "universal" TARGET_SYS =
> > > "arm-poky-linux-gnueabi" MACHINE = "raspberrypi3" DISTRO = "poky"
> > > DISTRO_VERSION = "2.2.4" TUNE_FEATURES = "arm armv7ve vfp thumb neon
> > vfpv4
> > > callconvention-hard cortexa7" TARGET_FPU = "hard" meta meta-poky
> > > meta-yocto-bsp = "fido:e56be3cee517c5262486136dbd6d649b68c3a8b7" meta-oe
> > =
> > > "fido:997caf9146cd3797cd054e2adebd1fbb4df91911" meta-raspberrypi =
> > > "fido:2a192261a914892019f4f428d7462bb3c585ebac" Initialising tasks: 100%
> > >
> > |#####################################################################################################|
> > > Time: 0:00:06 NOTE: Executing SetScene Tasks NOTE: Executing RunQueue
> > Tasks
> > > **ERROR:** *quilt-native-0.64-r0 do_populate_lic: Error executing a
> > python
> > > function in exec_python_func() autogenerated: The stack trace of python
> > > calls that resulted in this exception/failure was: File:
> > > 'exec_python_func() autogenerated', lineno: 2, function: <module>*
> >
> > You stopped including the message at the point that the actual error was
> > shown.
> >
> > That's Fido which is *very* old.  Please use Zeus if possible, Warrior
> > if not (as you said that release already), and include the entire output.
> >
> > Immediate hunch is that you don't have sufficient permissions in your
> > build dir.
> >
> > Ross
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Regards,
Andrey.

