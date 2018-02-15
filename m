Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 15B4271A8C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 23:35:04 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id 140so2282187iti.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 15:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Jtq74JkhOSNxVrIOITtK8CCG1axOwzxSPOFWwhT1yIo=;
	b=gIfPeYBmUGD8MntARoObSnpNGYybtIkQ601z0weZFf1SkJ/7/ApG2GF9hLIQMkgXq7
	NvUCwGDxTPqfu4jsPTJ452DXIAtZVtKJEwz6y/vhiZsh2mkL82AUM0hCGBVA3LYFFTDM
	XRrEtBvOAYiH2vPogMOS05V5jkHKFWdH9LSs5YG+M427hOz0zWJ7SEo4al4E5C4Q8dqd
	XxIKbOeiw8rKghqMdNtdqodydz2fdJxZYMh7qdWsoHXOC+rNLJdW+wGO6mysYuT+6Z+I
	YsUU4nwOitLm5re9G3UVv9aXMhclT8Dbxqmu094FIg0vI5Tsq6cv1QUkb6WVimxmjjyg
	QmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Jtq74JkhOSNxVrIOITtK8CCG1axOwzxSPOFWwhT1yIo=;
	b=N6Y7DcqpSZ+dxhLanf9Gusx7Yxij3Eg5bGIQqzgdQ7uAyABvgLf93GuBShTIkb2WbJ
	4LW7vB/UchEOh8pPvi4u4/BVOAjWWxaOTZd9FI9kipLB0lSknp4x0anEoxF2whdA6+Gy
	ALwiSEBu+DSC5FCcced3hso9P4XuTn6+p5Sn7zq2IW4zQOyErM39zEx48fPMuh3J8XD/
	NvQyP7JBwX3NpbAuxaLFDlYRnD27EXFYT9234bKsmHs+fcei0kXJmaVgEhriigwMBg/s
	mJiyDxw5GvzN8ALCUTbm+l7WnU1bZ4YEQkU4rzneSjPMw9u6cL/M+6Efu0ITlFTJQF8e
	Oc2g==
X-Gm-Message-State: APf1xPAHOMB/CYRSAXJ8mazCY0aKA3mTDve9u8FOYoFfU2AK+vnCdBDu
	aaYtOvRPgY7bmXDGDTbWiS0=
X-Google-Smtp-Source: AH8x225+adViYZcQ+k7fqch5jqjUXOJ4sgGPx01a/xp76LOGLAJ+DMMMAi8FbFrJKVu/uTjUvTn7Yw==
X-Received: by 10.36.101.203 with SMTP id u194mr688690itb.27.1518737705935;
	Thu, 15 Feb 2018 15:35:05 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	o201sm15910355itb.7.2018.02.15.15.35.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Feb 2018 15:35:05 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1518737705.6900.29.camel@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>, Tim Orling <ticotimo@gmail.com>
Date: Thu, 15 Feb 2018 17:35:05 -0600
In-Reply-To: <20180215232440.GM2786@denix.org>
References: <20180215225339.GL2786@denix.org>
	<CANx9H-AcRnG-Er1bE-uVxSFEQX9X8_p8T=+TyGHXn0dLnbN2=w@mail.gmail.com>
	<1518736584.6900.18.camel@gmail.com>
	<CANx9H-BJ7-n8oSovzCMSVnQnUqXDYBs-SWsFEA06iT4Du8nTLw@mail.gmail.com>
	<20180215232440.GM2786@denix.org>
X-Mailer: Evolution 3.26.4 (3.26.4-1.fc27) 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: libtalloc failure due to waf
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
X-List-Received-Date: Thu, 15 Feb 2018 23:35:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-02-15 at 18:24 -0500, Denys Dmytriyenko wrote:
> On Thu, Feb 15, 2018 at 11:20:49PM +0000, Tim Orling wrote:
> > Then why did ‘sudo dnf install waf’ get me past the error above?
> > And why
> > does Fedora have a package for it?
> > 
> > https://src.fedoraproject.org/rpms/waf
> > 
> > Regardless, something broke.
> 
> I thought so too. As waf.bbclass from oe-core looks for waf binary in
> the root 
> of the source package, I looked inside libtalloc 2.1.9 and 2.1.10 and
> neither 
> of them have any "waf" files at the root. How was it working before?
> What 
> broke?

We added support for detecting the waf version to waf.bbclass so that
we could correctly supply --bindir and --libdir.

libtalloc (and some others) were indirectly getting waf.bbclass via
waf-samba.bbclass. waf-samba.bbclass redirects the build to look for
waf elsewhere than the project root, and really didn't need to be
inheriting from waf.bbclass at all, hence my patch.

> 
> 
> > On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacker@gmail.com>
> > wrote:
> > 
> > > On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
> > > > Seeing the same and trying to figure it out. Also, seems there
> > > > is no
> > > > recipe
> > > > for waf-native, so it becomes a new required host tool.
> > > 
> > > There is no "waf" tool, so a "waf-native" tool doesn't make
> > > sense...
> > > it's not how waf works. Each project has their own copy of the
> > > waf
> > > program, it's not something the host has to provide.
> > > 
> > > > On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko <denis@denix.
> > > > org>
> > > > wrote:
> > > > 
> > > > > Hi,
> > > > > 
> > > > > I'm getting below stack dump building libtalloc 2.1.10 in
> > > > > master.
> > > > > Works
> > > > > fine in
> > > > > rocko with libtalloc 2.1.9. I need it for cifs-utils. I'm not
> > > > > familiar with
> > > > > waf, any help? Thanks.
> > > > > 
> > > > > 
> > > > > ERROR: libtalloc-2.1.10-r0 do_configure: Error executing a
> > > > > python
> > > > > function
> > > > > in exec_python_func() autogenerated:
> > > > > 
> > > > > The stack trace of python calls that resulted in this
> > > > > exception/failure
> > > > > was:
> > > > > File: 'exec_python_func() autogenerated', lineno: 2,
> > > > > function:
> > > > > <module>
> > > > >      0001:
> > > > >  *** 0002:waf_preconfigure(d)
> > > > >      0003:
> > > > > File: '/OE/master/sources/oe-core/meta/classes/waf.bbclass',
> > > > > lineno: 34,
> > > > > function: waf_preconfigure
> > > > >      0030:    from distutils.version import StrictVersion
> > > > >      0031:    subsrcdir = d.getVar('S')
> > > > >      0032:    wafbin = os.path.join(subsrcdir, 'waf')
> > > > >      0033:    try:
> > > > >  *** 0034:        result = subprocess.check_output([wafbin, '
> > > > > --version'],
> > > > > cwd=subsrcdir, stderr=subprocess.STDOUT)
> > > > >      0035:        version = result.decode('utf-8').split()[1]
> > > > >      0036:        if StrictVersion(version) >=
> > > > > StrictVersion("1.8.7"):
> > > > >      0037:            d.setVar("WAF_EXTRA_CONF", "
> > > > > --bindir=${bindir}
> > > > > --libdir=${libdir}")
> > > > >      0038:    except subprocess.CalledProcessError as e:
> > > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 626,
> > > > > function:
> > > > > check_output
> > > > >      0622:        # empty string. That is maintained here for
> > > > > backwards
> > > > > compatibility.
> > > > >      0623:        kwargs['input'] = '' if
> > > > > kwargs.get('universal_newlines',
> > > > > False) else b''
> > > > >      0624:
> > > > >      0625:    return run(*popenargs, stdout=PIPE,
> > > > > timeout=timeout,
> > > > > check=True,
> > > > >  *** 0626:               **kwargs).stdout
> > > > >      0627:
> > > > >      0628:
> > > > >      0629:class CompletedProcess(object):
> > > > >      0630:    """A process that has finished running.
> > > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 693,
> > > > > function:
> > > > > run
> > > > >      0689:        if 'stdin' in kwargs:
> > > > >      0690:            raise ValueError('stdin and input
> > > > > arguments
> > > > > may not
> > > > > both be used.')
> > > > >      0691:        kwargs['stdin'] = PIPE
> > > > >      0692:
> > > > >  *** 0693:    with Popen(*popenargs, **kwargs) as process:
> > > > >      0694:        try:
> > > > >      0695:            stdout, stderr =
> > > > > process.communicate(input,
> > > > > timeout=timeout)
> > > > >      0696:        except TimeoutExpired:
> > > > >      0697:            process.kill()
> > > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 947,
> > > > > function:
> > > > > __init__
> > > > >      0943:                                startupinfo,
> > > > > creationflags,
> > > > > shell,
> > > > >      0944:                                p2cread, p2cwrite,
> > > > >      0945:                                c2pread, c2pwrite,
> > > > >      0946:                                errread, errwrite,
> > > > >  *** 0947:                                restore_signals,
> > > > > start_new_session)
> > > > >      0948:        except:
> > > > >      0949:            # Cleanup if the child failed starting.
> > > > >      0950:            for f in filter(None, (self.stdin,
> > > > > self.stdout,
> > > > > self.stderr)):
> > > > >      0951:                try:
> > > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 1551,
> > > > > function:
> > > > > _execute_child
> > > > >      1547:                                # The error must be
> > > > > from
> > > > > chdir(cwd).
> > > > >      1548:                                err_msg += ': ' +
> > > > > repr(cwd)
> > > > >      1549:                            else:
> > > > >      1550:                                err_msg += ': ' +
> > > > > repr(orig_executable)
> > > > >  *** 1551:                    raise
> > > > > child_exception_type(errno_num,
> > > > > err_msg)
> > > > >      1552:                raise child_exception_type(err_msg)
> > > > >      1553:
> > > > >      1554:
> > > > >      1555:        def _handle_exitstatus(self, sts,
> > > > > _WIFSIGNALED=os.WIFSIGNALED,
> > > > > Exception: FileNotFoundError: [Errno 2] No such file or
> > > > > directory:
> > > > > '/OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> > > > > gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
> > > > > 
> > > > > ERROR: libtalloc-2.1.10-r0 do_configure: Function failed:
> > > > > waf_preconfigure
> > > > > ERROR: Logfile of failure stored in:
> > > > > /OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> > > > > gnueabi/libtalloc/2.1.10-r0/temp/log.do_configure.52699
> > > > > ERROR: Task
> > > > > (/OE/master/sources/meta-openembedded/meta-
> > > > > networking/recipes-
> > > > > support/libtalloc/libtalloc_2.1.10.bb:do_configure)
> > > > > failed with exit code '1'
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-d
> > > > > evel
> > > > > 

