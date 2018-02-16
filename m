Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 81E927863B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 20:18:04 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id u84so5355432iod.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 12:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=7gE4pBQurAFAaEJqs2D0T9KmknTz/9PdVmglCy78bXY=;
	b=NxOpZ8ncuFxTk5RC/Ei/6aPrv565OU6oKdqH2C7P6LxqFC/XO1TGkM9ojTX8P7P7V8
	eEAUkIFPWDpNFsfS0iM8eA9rFUxMuh5w7bs/y+ihz+ggKzYTcE9Yo4a+8xakVf9wEkw6
	6X9kPogw/DWyKQ3p+QM1ERKNa0pzYuMvNQItnuchi/E3yqVTTjSVPKRtpRjc96TQWAdL
	J4M5LpW0bDrz/iPKk9jJg4+N7j0ca2PQe5oIaLw9izxJbK8EmAKefbTbaWxNI5MclIJs
	Fzn0ky8DWsj0xbUk0bNVrRs9dYqcAp7oN4lkQqL4o+XKFWRNBXUM9+0GYjdzIJDG/dqT
	NLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=7gE4pBQurAFAaEJqs2D0T9KmknTz/9PdVmglCy78bXY=;
	b=Nq7s0or3oEQXuBYwjU+ZfTRpfkcloZ/JlIg/oZj5BCexg1Ik2tw1dx6xh04FBfvCis
	qFLsfW3uxO/mLJhDHPJIF+n0HvrU0Sn5umOn565zKLNF4ysmGjYf8LUxYsj6rzk9Rptc
	z3vbx/KREGAiOjSRONyhp2m1+/7j4lhcfr9cwoG8bmx3xko6eDGeyKCpXqy5mp7NXRN2
	dnQFAK9hBLhnNzmWLr8Wi+bqsHr1SU+OR9IbQMcAW8jw0jejxGxB2ylOZBqe0Xq3wdkJ
	KOf/gZyxoSd0zPmgCe2waT/3pYjR/U8hXH7MKeKsW9w/cgmzql3/JYUiw1dJ2mZ/iLur
	QbSg==
X-Gm-Message-State: APf1xPClzOzlU6CXF2cILRbbGSlKWORqp2IJz3xGPkn2+bWQym9fWsPA
	HWKQkZIir+Y0p5Kw6EqLNQc=
X-Google-Smtp-Source: AH8x226meIrU/Xdy71JleUHe0dUKnq+3wnXY5n9o7f345DamM/CX600X2PFMqWQ6XwdgFu6vaNX3/A==
X-Received: by 10.107.200.69 with SMTP id y66mr3931973iof.116.1518812285230;
	Fri, 16 Feb 2018 12:18:05 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g188sm1349074iog.82.2018.02.16.12.18.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Feb 2018 12:18:04 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1518812283.6900.47.camel@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Denys Dmytriyenko
	<denis@denix.org>,  Armin Kuster <akuster808@gmail.com>
Date: Fri, 16 Feb 2018 14:18:03 -0600
In-Reply-To: <CA+chaQeYpA1oM3pHLu9Nuw3e+sGipvOnXh9GVinJQaAOFwHs2g@mail.gmail.com>
References: <20180215225339.GL2786@denix.org>
	<CANx9H-AcRnG-Er1bE-uVxSFEQX9X8_p8T=+TyGHXn0dLnbN2=w@mail.gmail.com>
	<1518736584.6900.18.camel@gmail.com>
	<CANx9H-BJ7-n8oSovzCMSVnQnUqXDYBs-SWsFEA06iT4Du8nTLw@mail.gmail.com>
	<20180215232440.GM2786@denix.org>
	<CAMKF1srn=JvEXM2WG2Y0r_L+iB-dT44LFgMU7LmeFq3etiauTw@mail.gmail.com>
	<20180215233345.GP2786@denix.org>
	<CAJdd5Gaow=CjNB1jbKjW80EYXv-a0vMqHgxzSjojz0N4Dh_ejA@mail.gmail.com>
	<20180216010333.GR2786@denix.org>
	<CA+chaQdkwxsJ1Z0wvPFEDwi4h+NsXzEapUqyxsqNDsTEg453SQ@mail.gmail.com>
	<CA+chaQeYpA1oM3pHLu9Nuw3e+sGipvOnXh9GVinJQaAOFwHs2g@mail.gmail.com>
X-Mailer: Evolution 3.26.4 (3.26.4-1.fc27) 
Mime-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 16 Feb 2018 20:18:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-02-16 at 21:08 +0100, Martin Jansa wrote:
> And now it will fail to parse as well:
> http://git.openembedded.org/openembedded-core/commit/?id=ccd1142d22b3
> 1ed85d8823b1bc9e11ccfd72b61f
> 
> removed get_waf_parallel_make from waf.bbclass, so now all waf-
> samba.bbclass users will fail to parse with:

http://lists.openembedded.org/pipermail/openembedded-devel/2018-Februar
y/116701.html will fix that as well.... We probably need to speed along
that getting merged.Armin can you help with that? 
This patch should resolve all of the waf issues that have been
discussed here, with exception of the one improvement proposed by
Denys. While it should probably be improved, I don't beleive it
actually affects any recipes (some please give me an example if I am
wrong).
Sorry for the churn. Hopefull this will be better in the future since
waf and samba-waf are no longer tied together.
Joshua Watt
> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
> expression was  
>     python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
>  which triggered exception NameError: name 'get_waf_parallel_make' is
> not defined
> On Fri, Feb 16, 2018 at 9:45 AM, Martin Jansa <martin.jansa@gmail.com
> > wrote:
> > Check this thread:
> > http://lists.openembedded.org/pipermail/openembedded-commits/2018-J
> > anuary/218460.html
> > 
> > but my patch wasn't merged:
> > http://lists.openembedded.org/pipermail/openembedded-core/2018-Janu
> > ary/146974.html
> > only the one from Joshua.
> > 
> > 
> > The original issue is still in rocko as well, the backported waf
> > change doesn't work and causes useless warning.
> > 
> > Either the "waf.bbclass: explicitly pass bindir and libdir if
> > supported" should be reverted in rocko or all fixes for this should
> > be backported to rocko once they are all in oe-core and meta-oe
> > master.
> > 
> > Regards,
> > 
> > On Fri, Feb 16, 2018 at 2:03 AM, Denys Dmytriyenko <denis@denix.org
> > > wrote:
> > > On Thu, Feb 15, 2018 at 06:37:11PM -0600, Joshua Watt wrote:
> > > 
> > > > On Feb 15, 2018 17:42, "Denys Dmytriyenko" <denis@denix.org>
> > > wrote:
> > > 
> > > >
> > > 
> > > > On Thu, Feb 15, 2018 at 03:30:06PM -0800, Khem Raj wrote:
> > > 
> > > > > On Thu, Feb 15, 2018 at 3:24 PM, Denys Dmytriyenko <denis@den
> > > ix.org>
> > > 
> > > > wrote:
> > > 
> > > > > > On Thu, Feb 15, 2018 at 11:20:49PM +0000, Tim Orling wrote:
> > > 
> > > > > >> Then why did ‘sudo dnf install waf’ get me past the error
> > > above? And
> > > 
> > > > why
> > > 
> > > > > >> does Fedora have a package for it?
> > > 
> > > > > >>
> > > 
> > > > > >> https://src.fedoraproject.org/rpms/waf
> > > 
> > > > > >>
> > > 
> > > > > >> Regardless, something broke.
> > > 
> > > > > >
> > > 
> > > > > > I thought so too. As waf.bbclass from oe-core looks for waf
> > > binary in
> > > 
> > > > the root
> > > 
> > > > > > of the source package, I looked inside libtalloc 2.1.9 and
> > > 2.1.10 and
> > > 
> > > > neither
> > > 
> > > > > > of them have any "waf" files at the root. How was it
> > > working before?
> > > 
> > > > What
> > > 
> > > > > > broke?
> > > 
> > > > >
> > > 
> > > > > its using waf-samba.bbclass, there is a patch floating for
> > > that
> > > 
> > > > > https://patchwork.openembedded.org/patch/148046/
> > > 
> > > >
> > > 
> > > > So, it will fix libtalloc, but some other packages that still
> > > use
> > > 
> > > > waf.bbclass
> > > 
> > > > will keep on failing with an exception?
> > > 
> > > >
> > > 
> > > >
> > > 
> > > > They shouldn't. I tested all the ones I could find. The way
> > > waf-samba uses
> > > 
> > > > waf is more of the exception than the rule.... Most projects
> > > will follow
> > > 
> > > > the waf.bbclass pattern of a wscript and waf in $S, but we can
> > > probably
> > > 
> > > > parameterize it if necessary.
> > > 
> > > >
> > > 
> > > > Do you know of a specific recipe that fails?
> > > 
> > > 
> > > 
> > > 
> > > No, but as Andre said here earlier, it should be more forgiving
> > > when ${S}/waf
> > > 
> > > is not available or at least give a proper error message instead
> > > of dumping a
> > > 
> > > cryptic exception stack...
> > > 
> > > 
> > > 
> > > In other words, before this waf.bbclass change in oe-core it was
> > > handling such
> > > 
> > > situation just fine and there was a warning "Unable to execute
> > > waf --version,
> > > 
> > > exit code 127". Now it never reaches that code and just throws an
> > > exception.
> > > 
> > > 
> > > 
> > > 
> > > 
> > > > > >> On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacker@gm
> > > ail.com>
> > > 
> > > > wrote:
> > > 
> > > > > >>
> > > 
> > > > > >> > On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
> > > 
> > > > > >> > > Seeing the same and trying to figure it out. Also,
> > > seems there is
> > > 
> > > > no
> > > 
> > > > > >> > > recipe
> > > 
> > > > > >> > > for waf-native, so it becomes a new required host
> > > tool.
> > > 
> > > > > >> >
> > > 
> > > > > >> > There is no "waf" tool, so a "waf-native" tool doesn't
> > > make sense...
> > > 
> > > > > >> > it's not how waf works. Each project has their own copy
> > > of the waf
> > > 
> > > > > >> > program, it's not something the host has to provide.
> > > 
> > > > > >> >
> > > 
> > > > > >> > > On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko <den
> > > is@denix.org>
> > > 
> > > > > >> > > wrote:
> > > 
> > > > > >> > >
> > > 
> > > > > >> > > > Hi,
> > > 
> > > > > >> > > >
> > > 
> > > > > >> > > > I'm getting below stack dump building libtalloc
> > > 2.1.10 in master.
> > > 
> > > > > >> > > > Works
> > > 
> > > > > >> > > > fine in
> > > 
> > > > > >> > > > rocko with libtalloc 2.1.9. I need it for cifs-
> > > utils. I'm not
> > > 
> > > > > >> > > > familiar with
> > > 
> > > > > >> > > > waf, any help? Thanks.
> > > 
> > > > > >> > > >
> > > 
> > > > > >> > > >
> > > 
> > > > > >> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Error
> > > executing a python
> > > 
> > > > > >> > > > function
> > > 
> > > > > >> > > > in exec_python_func() autogenerated:
> > > 
> > > > > >> > > >
> > > 
> > > > > >> > > > The stack trace of python calls that resulted in
> > > this
> > > 
> > > > > >> > > > exception/failure
> > > 
> > > > > >> > > > was:
> > > 
> > > > > >> > > > File: 'exec_python_func() autogenerated', lineno: 2,
> > > function:
> > > 
> > > > > >> > > > <module>
> > > 
> > > > > >> > > >      0001:
> > > 
> > > > > >> > > >  *** 0002:waf_preconfigure(d)
> > > 
> > > > > >> > > >      0003:
> > > 
> > > > > >> > > > File: '/OE/master/sources/oe-
> > > core/meta/classes/waf.bbclass',
> > > 
> > > > > >> > > > lineno: 34,
> > > 
> > > > > >> > > > function: waf_preconfigure
> > > 
> > > > > >> > > >      0030:    from distutils.version import
> > > StrictVersion
> > > 
> > > > > >> > > >      0031:    subsrcdir = d.getVar('S')
> > > 
> > > > > >> > > >      0032:    wafbin = os.path.join(subsrcdir,
> > > 'waf')
> > > 
> > > > > >> > > >      0033:    try:
> > > 
> > > > > >> > > >  *** 0034:        result =
> > > subprocess.check_output([wafbin, '
> > > 
> > > > > >> > > > --version'],
> > > 
> > > > > >> > > > cwd=subsrcdir, stderr=subprocess.STDOUT)
> > > 
> > > > > >> > > >      0035:        version = result.decode('utf-
> > > 8').split()[1]
> > > 
> > > > > >> > > >      0036:        if StrictVersion(version) >=
> > > 
> > > > > >> > > > StrictVersion("1.8.7"):
> > > 
> > > > > >> > > >      0037:            d.setVar("WAF_EXTRA_CONF", "
> > > 
> > > > > >> > > > --bindir=${bindir}
> > > 
> > > > > >> > > > --libdir=${libdir}")
> > > 
> > > > > >> > > >      0038:    except subprocess.CalledProcessError
> > > as e:
> > > 
> > > > > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno:
> > > 626, function:
> > > 
> > > > > >> > > > check_output
> > > 
> > > > > >> > > >      0622:        # empty string. That is maintained
> > > here for
> > > 
> > > > > >> > > > backwards
> > > 
> > > > > >> > > > compatibility.
> > > 
> > > > > >> > > >      0623:        kwargs['input'] = '' if
> > > 
> > > > > >> > > > kwargs.get('universal_newlines',
> > > 
> > > > > >> > > > False) else b''
> > > 
> > > > > >> > > >      0624:
> > > 
> > > > > >> > > >      0625:    return run(*popenargs, stdout=PIPE,
> > > 
> > > > timeout=timeout,
> > > 
> > > > > >> > > > check=True,
> > > 
> > > > > >> > > >  *** 0626:               **kwargs).stdout
> > > 
> > > > > >> > > >      0627:
> > > 
> > > > > >> > > >      0628:
> > > 
> > > > > >> > > >      0629:class CompletedProcess(object):
> > > 
> > > > > >> > > >      0630:    """A process that has finished
> > > running.
> > > 
> > > > > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno:
> > > 693, function:
> > > 
> > > > > >> > > > run
> > > 
> > > > > >> > > >      0689:        if 'stdin' in kwargs:
> > > 
> > > > > >> > > >      0690:            raise ValueError('stdin and
> > > input arguments
> > > 
> > > > > >> > > > may not
> > > 
> > > > > >> > > > both be used.')
> > > 
> > > > > >> > > >      0691:        kwargs['stdin'] = PIPE
> > > 
> > > > > >> > > >      0692:
> > > 
> > > > > >> > > >  *** 0693:    with Popen(*popenargs, **kwargs) as
> > > process:
> > > 
> > > > > >> > > >      0694:        try:
> > > 
> > > > > >> > > >      0695:            stdout, stderr =
> > > process.communicate(input,
> > > 
> > > > > >> > > > timeout=timeout)
> > > 
> > > > > >> > > >      0696:        except TimeoutExpired:
> > > 
> > > > > >> > > >      0697:            process.kill()
> > > 
> > > > > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno:
> > > 947, function:
> > > 
> > > > > >> > > > __init__
> > > 
> > > > > >> > > >      0943:                               
> > > startupinfo,
> > > 
> > > > > >> > > > creationflags,
> > > 
> > > > > >> > > > shell,
> > > 
> > > > > >> > > >      0944:                                p2cread,
> > > p2cwrite,
> > > 
> > > > > >> > > >      0945:                                c2pread,
> > > c2pwrite,
> > > 
> > > > > >> > > >      0946:                                errread,
> > > errwrite,
> > > 
> > > > > >> > > >  *** 0947:                               
> > > restore_signals,
> > > 
> > > > > >> > > > start_new_session)
> > > 
> > > > > >> > > >      0948:        except:
> > > 
> > > > > >> > > >      0949:            # Cleanup if the child failed
> > > starting.
> > > 
> > > > > >> > > >      0950:            for f in filter(None,
> > > (self.stdin,
> > > 
> > > > > >> > > > self.stdout,
> > > 
> > > > > >> > > > self.stderr)):
> > > 
> > > > > >> > > >      0951:                try:
> > > 
> > > > > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno:
> > > 1551, function:
> > > 
> > > > > >> > > > _execute_child
> > > 
> > > > > >> > > >      1547:                                # The
> > > error must be
> > > 
> > > > from
> > > 
> > > > > >> > > > chdir(cwd).
> > > 
> > > > > >> > > >      1548:                                err_msg +=
> > > ': ' +
> > > 
> > > > > >> > > > repr(cwd)
> > > 
> > > > > >> > > >      1549:                            else:
> > > 
> > > > > >> > > >      1550:                                err_msg +=
> > > ': ' +
> > > 
> > > > > >> > > > repr(orig_executable)
> > > 
> > > > > >> > > >  *** 1551:                    raise
> > > child_exception_type(errno_
> > > 
> > > > num,
> > > 
> > > > > >> > > > err_msg)
> > > 
> > > > > >> > > >      1552:                raise
> > > child_exception_type(err_msg)
> > > 
> > > > > >> > > >      1553:
> > > 
> > > > > >> > > >      1554:
> > > 
> > > > > >> > > >      1555:        def _handle_exitstatus(self, sts,
> > > 
> > > > > >> > > > _WIFSIGNALED=os.WIFSIGNALED,
> > > 
> > > > > >> > > > Exception: FileNotFoundError: [Errno 2] No such file
> > > or
> > > 
> > > > directory:
> > > 
> > > > > >> > > > '/OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-
> > > linux-
> > > 
> > > > > >> > > > gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
> > > 
> > > > > >> > > >
> > > 
> > > > > >> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Function
> > > failed:
> > > 
> > > > > >> > > > waf_preconfigure
> > > 
> > > > > >> > > > ERROR: Logfile of failure stored in:
> > > 
> > > > > >> > > > /OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-
> > > linux-
> > > 
> > > > > >> > > > gnueabi/libtalloc/2.1.10-
> > > r0/temp/log.do_configure.52699
> > > 
> > > > > >> > > > ERROR: Task
> > > 
> > > > > >> > > > (/OE/master/sources/meta-openembedded/meta-
> > > networking/recipes-
> > > 
> > > > > >> > > > support/libtalloc/libtalloc_2.1.10.bb:do_configure)
> > > 
> > > > > >> > > > failed with exit code '1'
> > > 
> > > > > >> > > > --
> > > 
> > > > > >> > > > _______________________________________________
> > > 
> > > > > >> > > > Openembedded-devel mailing list
> > > 
> > > > > >> > > > Openembedded-devel@lists.openembedded.org
> > > 
> > > > > >> > > > http://lists.openembedded.org/mailman/listinfo/opene
> > > mbedded-devel
> > > 
> > > > > >> > > >
> > > 
> > > > > >> >
> > > 
> > > > > > --
> > > 
> > > > > > _______________________________________________
> > > 
> > > > > > Openembedded-devel mailing list
> > > 
> > > > > > Openembedded-devel@lists.openembedded.org
> > > 
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded
> > > -devel
> > > 
> > > > >
> > > 
> > > > --
> > > 
> > > > _______________________________________________
> > > 
> > > > Openembedded-devel mailing list
> > > 
> > > > Openembedded-devel@lists.openembedded.org
> > > 
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-dev
> > > el
> > > 
> > > --
> > > 
> > > _______________________________________________
> > > 
> > > Openembedded-devel mailing list
> > > 
> > > Openembedded-devel@lists.openembedded.org
> > > 
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > 
From mkelly@xevo.com  Fri Feb 16 20:25:01 2018
Return-Path: <mkelly@xevo.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
X-Greylist: delayed 1139 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Feb 2018 20:25:00 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0067.outbound.protection.outlook.com [104.47.36.67])
	by mail.openembedded.org (Postfix) with ESMTP id 484C678441
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 20:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lrYIuL3baP6AGoMyC+bmxwBN0a+aqGStdXnpjYi1bpw=;
	b=n5KcSxtGOrtsXRAcVu1UHD8RdUwa1Ec9Dq3GL8hWCMb1QXk6w/gDVeA1+wplpT9su/yQeP2+nwvk/hqamlFEGzor2SVEF5zjrERHZpRAZdHQo7QFz7zOu1evYtRws9wg45C6mizYXCGAgcd2K+o4rkkU45Iq15CRLR7ees29INA=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from [10.201.1.39] (65.122.179.226) by
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.485.10; Fri, 16 Feb 2018 19:51:48 +0000
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180211215129.9564-1-JPEWhacker@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <fb6228f3-5aa3-3dbd-963f-7f21c8e36279@xevo.com>
Date: Fri, 16 Feb 2018 11:51:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180211215129.9564-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR13CA0035.namprd13.prod.outlook.com (10.173.156.149) To
	BN6PR0101MB2932.prod.exchangelabs.com (10.174.87.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 771dab19-b244-4425-e304-08d57576b793
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603307)(7153060)(7193020);
	SRVR:BN6PR0101MB2932; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	3:9RMCoH3n1NNbAByMB0blHnyaV3+WWe2tztgzmqNCR6/C5g5oUG0iMzTdJoJIfYHxZPlW5nHOkZ/Wr42NpUU8+ys/wSYQ1/oqQXl6imWZjmhnLhXuBcSX9GISLSFO78SwGsBWk3YIuLUv36jIoz5qHDE3WVIMtiMllHiri+25O/lrAnn/D23bwD3LTdjpI0M/9KVrFbp0GqrEBxN7lrIQNgkG4oV/dmWLZj5PF7Ut5dPcXVqCfHDPJqAm64hjOkga;
	25:pkCVQT6RZAKozo15aeOvI/a6VMghquyA2JMN8iyzMNFjO5tExi7kOmlL4Wsnv4NrRZbt95el2lpYRDnzrh71xhQ0yMm3inpmewmLrb/iSpucYPJ5Doxn4fVbk3EWle+dY9MnaxrGF2gkL+LmkY9xyq4LWoPJKsCHhrNfVFXRf+6uxw31ti2jqabS7s6huQY4TSYyUqGvw2kA6DXa1wkM9yyPKelFJP2C6n7UiH61RDglopwfBWBp079Iecly5a+Ep9z3/2SgqYVjh9s6I5BWFbXpGdOSfagckKWrqngT8cyJ+Z6xdg9yoR7HxcAcJgxj9u87FVUIgDnRvJBjtVF39w==;
	31:MNu7dMWSpmcbw5T1WbGD0gmb2w088NjdAmI/o6Bt1OI68QPA1Q5xLXjjz33JjINUEdsJCc4dn9jYHjMHuIz4k6wmO8b5+ZbNYk0ctshSsl4kNq8ZMkIZ679jGn8inkYcMoKCEcvRvJSE3s2FWczHFToMie6yntgFJHoqeZ+mxxpYM7yKeMOnbtXvph5A6+LOx9EuVng2txgsuUcOZAVnkP8FN8qYEa5UQ3ryo+URBfQ=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2932:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	20:zABbYl+fgIrl/k7gjPpR5Bb2qvVTiWX/50u9iDJt7VZUt+eoF1cLg+Nl1DTHN1KeF6gsmops76kC6CGqSq+BQdTWrHCvgOq41edohWZaGFxlL6UebmIfE8PCNdZmSuiEPtBN8AesIpQNK9hve6DBwttHQv5H0ZglIbEBb6d4Ctt/hqz0gDYr+eZSu87hciPNqdUsW/zKzN4uhgDz4MDn7+UWK66C2/nu0YPH0sDM/0dw68upliA02/zAuuz2GFuv0zERLu7TIaurhm5P1wCKK0ou8GkqCxXyAolPzTcW4ue+UB3ZIcO2oDqIbQnGinTbuBS2GXNXL0g3t1Ic/QG6D2pXvcgAste78YreysUlL9I4glzUFT35l3Vj3j6cWCPtp2cNOZdevCS6NM5yfn9TOvVCTRVmU0JrnUqZKkBUoPo=;
	4:tV4MgVVomyfP1DbhnaaRyDDbnHKsHgfRNnXKP9AGHvITIcpK6W4b8O3O1lbf/cbmBlAPNaZmT9na9J/wHKLRNpDHHZeh3QBZk8Z/qHCITjeoXwocmajqogIsRi3m9oWMGs00DheThCZNAQYSUOa8V98wfu+lsMh6+TXftfcVSbWckdynOjADuaqWlD7eEbdLl+ZQfYCxWq8cIcua3IBr35sIzPjx2uDCL3SXexGPqHk5vw0Ft1bBiSde5v/UJa1DY4Ct8G0YZeVrCBt0OvpEmKS+hqS2t8Xbm8eRhpYVDTBiW/KCczKnJwlIi9fcvtmO
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2932CAF0FD2FEC8A114BA963ABCB0@BN6PR0101MB2932.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(3231101)(944501161)(3002001)(93006095)(93001095)(10201501046)(6041288)(20161123562045)(20161123558120)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR0101MB2932; BCL:0; PCL:0; RULEID:;
	SRVR:BN6PR0101MB2932; 
X-Forefront-PRVS: 0585417D7B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(39840400004)(376002)(346002)(366004)(396003)(39380400002)(199004)(189003)(6246003)(50466002)(23676004)(53546011)(52146003)(230700001)(316002)(53936002)(2486003)(16576012)(386003)(52116002)(6306002)(76176011)(83506002)(58126008)(81166006)(6116002)(3846002)(347745004)(66066001)(81156014)(77096007)(36756003)(966005)(47776003)(67846002)(64126003)(5660300001)(8676002)(26005)(31686004)(186003)(478600001)(8936002)(31696002)(305945005)(6666003)(2950100002)(7736002)(16526019)(39060400002)(106356001)(65956001)(345774005)(65806001)(25786009)(65826007)(4326008)(105586002)(2906002)(86362001)(16799955002)(68736007)(90366009)(97736004)(229853002)(6486002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2932; H:[10.201.1.39];
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAxMDFNQjI5MzI7MjM6ME9VYzlleXEzWnl3a004SEM3ajZvNHZY?=
	=?utf-8?B?TzFFdXFyWjlvaFhXZGtLSGdLcUFUYXRIVzBJVSt6Ry9EbHl4d0FXbWpGaTRl?=
	=?utf-8?B?aUFQdWdDTGczb0ZidzNiTGFQM0xsZ0dEUll1T3dqbXFxWkpjd0ZDSkxqaGx5?=
	=?utf-8?B?dlBNNytDb3lOVkx0QVphdVM2ZzV0bmltU3dIa2VBaVdDSityZHkzTVM4Yit6?=
	=?utf-8?B?T1dmV1hlTE1GSVV4WU1LWkRRUjRlL3FxeTltekg2N3dmOE0wNHp5Tms4SmZq?=
	=?utf-8?B?NVpaRDBJSklEelJtVWZRdTRjL2QydWxncWo3R3pGRGUzaW54dUd5WlQ4S01r?=
	=?utf-8?B?K24rMHVYeHViazhDbnJYNENJL2xkbVVDVTBIMTYweFNFNE1TaGY4SUcvK2JT?=
	=?utf-8?B?cndsbXl5Q2xFMzA2bkp2U1Jnd25uNUZIb2IrWlRXVTZjazlwZHFMblI0cDds?=
	=?utf-8?B?ZkIrNDVjVzk4QkRGazErZFo3OEZtK1p4QUdGNjFHQmZVM2tUeFlSZXN2VlZp?=
	=?utf-8?B?SWdTQVRsczZTa0NvVDhyRWZDaytFdW52a0M2cWRLTjNHT2lGU0xLQk9RblFK?=
	=?utf-8?B?eDROb09iajZOdk1WR09VTEVSbXQzeEtPT1l4MW9qQmhvcllkZ1RxK25BbUZp?=
	=?utf-8?B?Q0drRTNxTExJVFVwdDJwNXNiTTZQczJ4MlhweVpZa2xLYWh5YXBSL0cxTEw0?=
	=?utf-8?B?WS9lcldpeGV5SEJDWEdLZjFlQWpaMDFJQ3lHaW5zZTNRNVNnWDMxdzZVZzU4?=
	=?utf-8?B?RGdXWGRieFljZEpKOUpXUjUvMEZ6dXR3RW1rYzBBeGNSdUlJSm9uYjBxTUdx?=
	=?utf-8?B?ODVlZFNHQlo3Q0d6eGNVaGZ4STJWUENVTDIyajkyNERvOVluSWFJakwxaWdr?=
	=?utf-8?B?NHp4V3d3S3BuTldyTk8yLzg0bHo2Q1JFblF2MVZobkx4MFRvQU83VitXT0xw?=
	=?utf-8?B?UmRlbDVtUGRGd0ZYQjZmS2tLSmRxaTM3SzZGWG8vcEJuYmFVK0tMTEE0Zitt?=
	=?utf-8?B?YWpZdlRCMXNFMm9xRjY3MndOVWo2RWZ5dzkxdkVyb1VNY0JaeEhJTkM3NVhC?=
	=?utf-8?B?UGRwSytUdHVvZ01nbjlWL0s0WU9Pbm5oTUVDNUtNSjcydCs5YzRxZUtMQ0pu?=
	=?utf-8?B?UkxVc242bWpWdjBoWHU4Q1gzM0Y4bm9MK2VxMzI3VklWMDQyd0pmcnBpVDZI?=
	=?utf-8?B?TVNJa0syc3JpZWZjZ0podWFrRmxrRHJ0dkMwei9zVzNlaS9yZjNjSFV4YStU?=
	=?utf-8?B?ekFNRXF3MWJDR2grVHJySE5KMlZvU05SbEFVZjgvWUxJY1BtZlVCTW5YRTdh?=
	=?utf-8?B?TlVaR2x5ZjhNSTR0eTFyQi9QeDNaTHdCVzgxOU1ESTlEc1ZLVEM5UzJWVlRP?=
	=?utf-8?B?RmhIOWYwdVNERVJxMW1zU2ZmMCtXbWYyK0N1YkgxUy9ab2kwcDRUck1nNTla?=
	=?utf-8?B?U0VqTlNmenJNc0paaWJJMTAyMnoxS01FOWlZSEtxSlMvSW1KY0MwM2JVWjBt?=
	=?utf-8?B?MzlKQm9RSkxBeWhwM2Y3T2tFaFlObkZqYVJtWHc0NXdWdDVsV3lkYncyMGd6?=
	=?utf-8?B?dzBTTDQ0U29pVXBNakNvcWlpL2RjZUg1akVnVDdNbmQxQWZFT0FQVzVkOHUx?=
	=?utf-8?B?MlYzclplY3pIWkh1UUE5VW90ZmVQUUlnU0I0R3hSajduUzJTaXFUK2c1N0R3?=
	=?utf-8?B?dzhwU2tnaGFJcDhhenBiMTJoMnN6cVhScTRrOE1tZkYxSWw3REFhWU5FK0R1?=
	=?utf-8?B?QTZHT0NxV1o3OUVwL2p0eHBNaXUwcEE5UHV4bGdvemJRek4zT1NGbkdLYU41?=
	=?utf-8?B?YVJSS29URzZhdE1jSllNY3F6VTBGZE9MbHlVYVVHdTZ4a1BMNTdYWnEzeXRB?=
	=?utf-8?B?Y1BYMVdnNEtRSk9PaVdtbUVlTTM5Y0dMODNtb3JyQXpEME5EMnZzVGpkandl?=
	=?utf-8?B?VURlWEVkQVN5T3k5M3o2KzBGRnQxd08ya1V4U3BRUlhPd3NpWWZaUnlQUldY?=
	=?utf-8?B?Mjg2WnIwelR2aGlUL2hLd1NNVE95ODVqQmc4QUhRWjA0c2lNTUVIekdGTmc1?=
	=?utf-8?Q?9frPbc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2932;
	6:6qXpGNn+siTX0HXz2T04uudkX1T0RWlUw1xRRDYKNao3tO5ZZDUdKp5v6a073KBtfxGns8qstJ5VanqO1FuWajf2RIAUGBfpWNztSF1OYiJREsN20AvN+LlZhmkR8/iZy+gqefBaYNmPX+/AOhp0y3MB+HOUxMJIrPewUJxUhhkcEZ9xfaaFUJCaTHopAC9TE3ZfkBeUMA9HZ0B0MaYWjg7E2s4usOO19PBRSsp8GBvNO5vGtnrnVXky1NbQjuu5E7BRKYo1PnOE42q19/SoNINkaMqiOszWQ+MzD6T4LdikUa6DM4UlvP8SzMu07sS48pm/etR7qc9RViWzqm5uXZR1+xBvItAoDZvPaSzYD4o=;
	5:ZkOTg/Z0EtXDXR6vHgzcGxbgkceK/xtREYVU/SHe+D9nMCbg+xKOeee0yinelAPkK3zt7Hc67O82NjqsaCcPcbckSO6Li+yoT1MBDGF7QCNU2wMA8X1Eznn/aE/2McKMcZEr7uKLkxPaT8VKcAwBAgYk112+OFJ/D6NEELG5WIw=;
	24:wsJA3zhJeYI8L5xIh6qIp0uii9/thBGMg97+oPbbt8/sxSgLPrS0qeFVsO5Uhjtj+8qm8+KH1E45JIbk+Akel/i69a6geX+7Dfpb0llwr5w=;
	7:PiEF9JHCxQotzOAVamhfvM8C5ckxoSjAQ7rmEPVZbZjaTxxWbR23vnOsjFWW/1iKMgdgknK4wcNj2wJ0rTAVf3nBkvn+tevi230Fy7vFP9ef/NlfQrTin9m6kKsdO4QhL4SD7lv3XatrpTTNuRGd1U9lgfbbxBtje2vPE511dyK/tX8ItJzbZKfG7/wtkLiWFdaBJXtyNmXEHylSAZbzlAkMHg9LwDWQJVlezDyWg91GoTIJpqFIMzmOh7lMAEgO
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2018 19:51:48.4150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 771dab19-b244-4425-e304-08d57576b793
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2932
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [oe] [meta-networking][PATCH] waf-samba.bbclass: No longer
 inherit waf.bbclass
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
X-List-Received-Date: Fri, 16 Feb 2018 20:25:01 -0000

On 02/11/2018 01:51 PM, Joshua Watt wrote:
> waf-samba.bbclass uses waf in a very different way than the "standard"
> method that waf.bbclass targets and ends getting very little useful
> functionality from that class.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta-networking/classes/waf-samba.bbclass | 29 +++++++++++++++++++++++++++--
>   1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
> index e49017624..4b1499fd4 100644
> --- a/meta-networking/classes/waf-samba.bbclass
> +++ b/meta-networking/classes/waf-samba.bbclass
> @@ -1,7 +1,7 @@
>   # waf is a build system which is used by samba related project.
>   # Obtain details from https://wiki.samba.org/index.php/Waf
> -#
> -inherit qemu pythonnative waf
> +#
> +inherit qemu pythonnative
>   
>   DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python"
>   
> @@ -21,6 +21,31 @@ CONFIGUREOPTS = " --prefix=${prefix} \
>                     ${PACKAGECONFIG_CONFARGS} \
>                   "
>   
> +# avoids build breaks when using no-static-libs.inc
> +DISABLE_STATIC = ""
> +
> +def get_waf_parallel_make(d):
> +    pm = d.getVar('PARALLEL_MAKE')
> +    if pm:
> +        # look for '-j' and throw other options (e.g. '-l') away
> +        # because they might have different meaning in bjam
> +        pm = pm.split()
> +        while pm:
> +            v = None
> +            opt = pm.pop(0)
> +            if opt == '-j':
> +                v = pm.pop(0)
> +            elif opt.startswith('-j'):
> +                v = opt[2:].strip()
> +            else:
> +                v = None
> +
> +            if v:
> +                v = min(64, int(v))
> +                return '-j' + str(v)
> +
> +    return ""
> +
>   # Three methods for waf cross compile:
>   # 1. answers:
>   #    Only --cross-answers - try the cross-answers file, and if
> 

Though I am not a waf expert and cannot vouch for that part of the 
patch, this patch fixes a build error I'm seeing after the removal of 
get_waf_parallel_make from waf.bbclass, so thank you for that!

