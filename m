Return-Path: <kamelghalgaoui7@gmail.com>
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id A00DF7D19E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 20:57:11 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id p8so17377883iln.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2019 12:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=0hhSR1qtzDrUhd1Tnfw9sCEH68HrAsby+uTRO0hpWCA=;
	b=rWwMmXi8mYWUA9OGIxyuQC1bX1EcDmWqqhizeWR4Jc7epSvJ4dFaoGiNtFuP4Ls5XM
	lV8wGeRslza5Dtm2v2IrciLvmFuxmhzf5UralPVWUZTNM93wKH5r4H+jZQuqAbYrdDbx
	ddXs/UZHrv5wFDFlvD5kj9y3/z5tGTq74BRq0XrytTEgQaihfKTsRE6yQ3FP9G3w0Db0
	JNUvle6nTmrAbDo+QMYJRN1FC0wN9EMFFqJYIAbCcb0LElHOvXTOCBi11u+oGl8zd3sc
	DUNRizv53ynUOjInQ0AujOQbuwGg9Nw+4rgPHta2iaBL/mutXPsQSlIUYVbT5UlBMdha
	Allg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=0hhSR1qtzDrUhd1Tnfw9sCEH68HrAsby+uTRO0hpWCA=;
	b=a+2H79j8mgWYNpMKaacOsFDG4lo749qpouMPWCCTBqvf3YnIZMLZ0r3hJHlUGCIRbt
	lMAlHM+nCNOr/LQ10O1vVoUmxYUVq4WPSF+2ncEY5yXw9f4oZJs3CpNeHsYEGpAKP2cO
	D7m6CpJQFNcrPr2ABr7DEituWZwM88vf9x2OKvS6eM2Yj6FUyufNSU4P9Sv6GNuplwSB
	R44beijKwFxdr/w2/3wRktNzQXfq/6RVd7ULPqefR/wbVp+Fue2wwUsL9JOWeaNY+8Av
	uTJz2h2PRGUbProNhZaAxVo4bm++SWjz0/XbbpZj/TUajYPIqNhlo8RhSicOV6WXJQjZ
	p5/A==
X-Gm-Message-State: APjAAAVVaHXZoaX6bwK55wC/1imd4rcGGAYKQxzisNqRkEOXYvMw5azq
	OjSpDLFmxqSpgqJ7KufM6Dn9VLeG5Oz3fpsnxGs=
X-Google-Smtp-Source: APXvYqzU6/Bah3ACjxQvODgmi8eUqdzCKcxtB18+WBpgPtLeHUBxjsrsBPHncLZVlYF0Px3AWVBFn2L3WB0FBSyYxrs=
X-Received: by 2002:a92:af8e:: with SMTP id v14mr8480298ill.150.1576011432232; 
	Tue, 10 Dec 2019 12:57:12 -0800 (PST)
MIME-Version: 1.0
References: <CANSQD5+CcEbaHxdfR8cjqdc6maXhrCgXy3eXrGD0dMgpiM_0LQ@mail.gmail.com>
	<7e5b400c-9c07-ff0d-df4b-9ca0329bfdbc@intel.com>
	<CANSQD5+e24bohovGjVgagiFrizqu2sj0SwzJWn+17tUJCthO_Q@mail.gmail.com>
	<CAHtQpK4zNtju4Own7yx+bTZsmyycW2dXoB0JOA=566X=h89wMw@mail.gmail.com>
	<20191210205704.wkwzy2kpgq2nqam2@vctlabs.com>
In-Reply-To: <20191210205704.wkwzy2kpgq2nqam2@vctlabs.com>
From: Kamel Ghalgaoui <kamelghalgaoui7@gmail.com>
Date: Tue, 10 Dec 2019 21:57:01 +0100
Message-ID: <CANSQD5Ju4ZN7gW7GGm6ELdG63LQDAe-gbn1aFXK4oO1Ta5NhZQ@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org, 
	Andrey Zhizhikin <andrey.z@gmail.com>,
	Kamel Ghalgaoui <kamelghalgaoui7@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 10 Dec 2019 20:57:11 -0000
Content-Type: text/plain; charset="UTF-8"

For information, I my kernel version is 5.3.11 and I have tar version: 1.26
$ which tar
/usr/local/bin/tar

Thank you

On Tue, Dec 10, 2019 at 9:54 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote:

> On Tue, Dec 10, 2019 at 09:17:42PM +0100, Andrey Zhizhikin wrote:
> > On Tue, Dec 10, 2019 at 8:13 PM Kamel Ghalgaoui
> > <kamelghalgaoui7@gmail.com> wrote:
> > >
> > > I try with zeus, but I got the same error:
> > >
> > > kamel@ThinkPad-E590:/opt/yocto/poky/build$ git branch
> > >   fido
> > >   morty
> > >   thud
> > >   warrior
> > > * zeus
> > > kamel@ThinkPad-E590:/opt/yocto/poky/build$
> > > kamel@ThinkPad-E590:/opt/yocto/poky/build$ bitbake core-image-minimal
> > > Loading cache: 100%
> > >
> |##########################################################################################################|
> > > Time: 0:00:00
> > > Loaded 2061 entries from dependency cache.
> > > NOTE: Resolving any missing task queue dependencies
> > >
> > > Build Configuration:
> > > BB_VERSION        = "1.32.0"
> > > BUILD_SYS         = "x86_64-linux"
> > > NATIVELSBSTRING   = "universal"
> > > TARGET_SYS        = "arm-poky-linux-gnueabi"
> > > MACHINE           = "raspberrypi3"
> > > DISTRO            = "poky"
> > > DISTRO_VERSION    = "2.2.4"
> > > TUNE_FEATURES     = "arm armv7ve vfp thumb neon vfpv4
> callconvention-hard
> > > cortexa7"
> > > TARGET_FPU        = "hard"
> > > meta
> > > meta-poky
> > > meta-yocto-bsp    = "zeus:e56be3cee517c5262486136dbd6d649b68c3a8b7"
> > > meta-oe           = "zeus:997caf9146cd3797cd054e2adebd1fbb4df91911"
> > > meta-raspberrypi  = "zeus:2a192261a914892019f4f428d7462bb3c585ebac"
> > >
> > > Initialising tasks: 100%
> > >
> |#####################################################################################################|
> > > Time: 0:00:04
> > > NOTE: Executing SetScene Tasks
> > > NOTE: Executing RunQueue Tasks
> > > ERROR: quilt-native-0.64-r0 do_populate_lic: Error executing a python
> > > function in exec_python_func() autogenerated:
> > >
> > > The stack trace of python calls that resulted in this
> exception/failure was:
> > > File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
> > >      0001:
> > >  *** 0002:sstate_task_postfunc(d)
> > >      0003:
> > > File: '/opt/yocto/poky/meta/classes/sstate.bbclass', lineno: 670,
> function:
> > > sstate_task_postfunc
> > >      0666:
> > >      0667:python sstate_task_postfunc () {
> > >      0668:    shared_state = sstate_state_fromvars(d)
> > >      0669:
> > >  *** 0670:    sstate_install(shared_state, d)
> > >      0671:    for intercept in shared_state['interceptfuncs']:
> > >      0672:        bb.build.exec_func(intercept, d, (d.getVar("WORKDIR",
> > > True),))
> > >      0673:    omask = os.umask(0o002)
> > >      0674:    if omask != 0o002:
> > > File: '/opt/yocto/poky/meta/classes/sstate.bbclass', lineno: 274,
> function:
> > > sstate_install
> > >      0270:
> > >      0271:    # Run the actual file install
> > >      0272:    for state in ss['dirs']:
> > >      0273:        if os.path.exists(state[1]):
> > >  *** 0274:            oe.path.copyhardlinktree(state[1], state[2])
> > >      0275:
> > >      0276:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS', True) or
> > > '').split():
> > >      0277:        # All hooks should run in the SSTATE_INSTDIR
> > >      0278:        bb.build.exec_func(postinst, d, (sstateinst,))
> > > File: '/opt/yocto/poky/meta/lib/oe/path.py', lineno: 81, function:
> > > copyhardlinktree
> > >      0077:    if (os.stat(src).st_dev ==  os.stat(dst).st_dev):
> > >      0078:        # Need to copy directories only with tar first since
> cp
> > > will error if two
> > >      0079:        # writers try and create a directory at the same time
> > >      0080:        cmd = "cd %s; find . -type d -print | tar --xattrs
> > > --xattrs-include='*' -cf - -C %s -p --no-recursion --files-from - | tar
> > > --xattrs --xattrs-include='*' -xf - -C %s" % (src, src, dst)
> > >  *** 0081:        subprocess.check_output(cmd, shell=True,
> > > stderr=subprocess.STDOUT)
> > >      0082:        source = ''
> > >      0083:        if os.path.isdir(src):
> > >      0084:            import glob
> > >      0085:            if len(glob.glob('%s/.??*' % src)) > 0:
> > > File: '/usr/lib/python3.5/subprocess.py', lineno: 626, function:
> > > check_output
> > >      0622:        # empty string. That is maintained here for backwards
> > > compatibility.
> > >      0623:        kwargs['input'] = '' if
> kwargs.get('universal_newlines',
> > > False) else b''
> > >      0624:
> > >      0625:    return run(*popenargs, stdout=PIPE, timeout=timeout,
> > > check=True,
> > >  *** 0626:               **kwargs).stdout
> > >      0627:
> > >      0628:
> > >      0629:class CompletedProcess(object):
> > >      0630:    """A process that has finished running.
> > > File: '/usr/lib/python3.5/subprocess.py', lineno: 708, function: run
> > >      0704:            raise
> > >      0705:        retcode = process.poll()
> > >      0706:        if check and retcode:
> > >      0707:            raise CalledProcessError(retcode, process.args,
> > >  *** 0708:                                     output=stdout,
> stderr=stderr)
> > >      0709:    return CompletedProcess(process.args, retcode, stdout,
> stderr)
> > >      0710:
> > >      0711:
> > >      0712:def list2cmdline(seq):
> > > Exception: subprocess.CalledProcessError: Command 'cd
> > >
> /opt/yocto/poky/build/tmp/work/x86_64-linux/quilt-native/0.64-r0/license-destdir;
> > > find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C
> > >
> /opt/yocto/poky/build/tmp/work/x86_64-linux/quilt-native/0.64-r0/license-destdir
> > > -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*'
> -xf -
> > > -C /opt/yocto/poky/build/tmp/deploy/licenses' returned non-zero exit
> status
> > > 64
> > >
> > > Subprocess output:
> > > tar: unrecognized option '--xattrs'
> > > Try `tar --help' or `tar --usage' for more information.
> > > tar: unrecognized option '--xattrs'
> > > Try `tar --help' or `tar --usage' for more information.
> >
> > My best guess would be: this error (and you would see much more of
> > those) is comming from the tar version which is included in Ubuntu
> > 16.04 as this version is relatively old. I believe the next error with
> > that host distro would be from git: something with --set-upstream-to
> > would be an unrecognized option (modern git has changed syntax to
> > --set-upstream).
> >
> > If you have any possibility to upgrade host distro - I would strongl
> > suggest you to do that. Otherwise - Docker with a bit newer distro
> > would be a good choice.
>
> Actually 16.04 does support --xattrs, so more likely is that there is
> a 'tar' executable coming from somewhere else. What does 'which tar'
> have to say?
>

