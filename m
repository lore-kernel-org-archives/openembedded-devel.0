Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id F050171BA0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 01:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 211AF20B15;
	Fri, 16 Feb 2018 01:03:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pQrEPXH0PtGL; Fri, 16 Feb 2018 01:03:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E02C32017C;
	Fri, 16 Feb 2018 01:03:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4F6091632B0; Thu, 15 Feb 2018 20:03:33 -0500 (EST)
Date: Thu, 15 Feb 2018 20:03:33 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20180216010333.GR2786@denix.org>
References: <20180215225339.GL2786@denix.org>
	<CANx9H-AcRnG-Er1bE-uVxSFEQX9X8_p8T=+TyGHXn0dLnbN2=w@mail.gmail.com>
	<1518736584.6900.18.camel@gmail.com>
	<CANx9H-BJ7-n8oSovzCMSVnQnUqXDYBs-SWsFEA06iT4Du8nTLw@mail.gmail.com>
	<20180215232440.GM2786@denix.org>
	<CAMKF1srn=JvEXM2WG2Y0r_L+iB-dT44LFgMU7LmeFq3etiauTw@mail.gmail.com>
	<20180215233345.GP2786@denix.org>
	<CAJdd5Gaow=CjNB1jbKjW80EYXv-a0vMqHgxzSjojz0N4Dh_ejA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5Gaow=CjNB1jbKjW80EYXv-a0vMqHgxzSjojz0N4Dh_ejA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 16 Feb 2018 01:03:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Feb 15, 2018 at 06:37:11PM -0600, Joshua Watt wrote:
> On Feb 15, 2018 17:42, "Denys Dmytriyenko" <denis@denix.org> wrote:
> 
> On Thu, Feb 15, 2018 at 03:30:06PM -0800, Khem Raj wrote:
> > On Thu, Feb 15, 2018 at 3:24 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> > > On Thu, Feb 15, 2018 at 11:20:49PM +0000, Tim Orling wrote:
> > >> Then why did ‘sudo dnf install waf’ get me past the error above? And
> why
> > >> does Fedora have a package for it?
> > >>
> > >> https://src.fedoraproject.org/rpms/waf
> > >>
> > >> Regardless, something broke.
> > >
> > > I thought so too. As waf.bbclass from oe-core looks for waf binary in
> the root
> > > of the source package, I looked inside libtalloc 2.1.9 and 2.1.10 and
> neither
> > > of them have any "waf" files at the root. How was it working before?
> What
> > > broke?
> >
> > its using waf-samba.bbclass, there is a patch floating for that
> > https://patchwork.openembedded.org/patch/148046/
> 
> So, it will fix libtalloc, but some other packages that still use
> waf.bbclass
> will keep on failing with an exception?
> 
> 
> They shouldn't. I tested all the ones I could find. The way waf-samba uses
> waf is more of the exception than the rule.... Most projects will follow
> the waf.bbclass pattern of a wscript and waf in $S, but we can probably
> parameterize it if necessary.
> 
> Do you know of a specific recipe that fails?

No, but as Andre said here earlier, it should be more forgiving when ${S}/waf 
is not available or at least give a proper error message instead of dumping a 
cryptic exception stack...

In other words, before this waf.bbclass change in oe-core it was handling such 
situation just fine and there was a warning "Unable to execute waf --version, 
exit code 127". Now it never reaches that code and just throws an exception.


> > >> On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > >>
> > >> > On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
> > >> > > Seeing the same and trying to figure it out. Also, seems there is
> no
> > >> > > recipe
> > >> > > for waf-native, so it becomes a new required host tool.
> > >> >
> > >> > There is no "waf" tool, so a "waf-native" tool doesn't make sense...
> > >> > it's not how waf works. Each project has their own copy of the waf
> > >> > program, it's not something the host has to provide.
> > >> >
> > >> > > On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko <denis@denix.org>
> > >> > > wrote:
> > >> > >
> > >> > > > Hi,
> > >> > > >
> > >> > > > I'm getting below stack dump building libtalloc 2.1.10 in master.
> > >> > > > Works
> > >> > > > fine in
> > >> > > > rocko with libtalloc 2.1.9. I need it for cifs-utils. I'm not
> > >> > > > familiar with
> > >> > > > waf, any help? Thanks.
> > >> > > >
> > >> > > >
> > >> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Error executing a python
> > >> > > > function
> > >> > > > in exec_python_func() autogenerated:
> > >> > > >
> > >> > > > The stack trace of python calls that resulted in this
> > >> > > > exception/failure
> > >> > > > was:
> > >> > > > File: 'exec_python_func() autogenerated', lineno: 2, function:
> > >> > > > <module>
> > >> > > >      0001:
> > >> > > >  *** 0002:waf_preconfigure(d)
> > >> > > >      0003:
> > >> > > > File: '/OE/master/sources/oe-core/meta/classes/waf.bbclass',
> > >> > > > lineno: 34,
> > >> > > > function: waf_preconfigure
> > >> > > >      0030:    from distutils.version import StrictVersion
> > >> > > >      0031:    subsrcdir = d.getVar('S')
> > >> > > >      0032:    wafbin = os.path.join(subsrcdir, 'waf')
> > >> > > >      0033:    try:
> > >> > > >  *** 0034:        result = subprocess.check_output([wafbin, '
> > >> > > > --version'],
> > >> > > > cwd=subsrcdir, stderr=subprocess.STDOUT)
> > >> > > >      0035:        version = result.decode('utf-8').split()[1]
> > >> > > >      0036:        if StrictVersion(version) >=
> > >> > > > StrictVersion("1.8.7"):
> > >> > > >      0037:            d.setVar("WAF_EXTRA_CONF", "
> > >> > > > --bindir=${bindir}
> > >> > > > --libdir=${libdir}")
> > >> > > >      0038:    except subprocess.CalledProcessError as e:
> > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 626, function:
> > >> > > > check_output
> > >> > > >      0622:        # empty string. That is maintained here for
> > >> > > > backwards
> > >> > > > compatibility.
> > >> > > >      0623:        kwargs['input'] = '' if
> > >> > > > kwargs.get('universal_newlines',
> > >> > > > False) else b''
> > >> > > >      0624:
> > >> > > >      0625:    return run(*popenargs, stdout=PIPE,
> timeout=timeout,
> > >> > > > check=True,
> > >> > > >  *** 0626:               **kwargs).stdout
> > >> > > >      0627:
> > >> > > >      0628:
> > >> > > >      0629:class CompletedProcess(object):
> > >> > > >      0630:    """A process that has finished running.
> > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 693, function:
> > >> > > > run
> > >> > > >      0689:        if 'stdin' in kwargs:
> > >> > > >      0690:            raise ValueError('stdin and input arguments
> > >> > > > may not
> > >> > > > both be used.')
> > >> > > >      0691:        kwargs['stdin'] = PIPE
> > >> > > >      0692:
> > >> > > >  *** 0693:    with Popen(*popenargs, **kwargs) as process:
> > >> > > >      0694:        try:
> > >> > > >      0695:            stdout, stderr = process.communicate(input,
> > >> > > > timeout=timeout)
> > >> > > >      0696:        except TimeoutExpired:
> > >> > > >      0697:            process.kill()
> > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 947, function:
> > >> > > > __init__
> > >> > > >      0943:                                startupinfo,
> > >> > > > creationflags,
> > >> > > > shell,
> > >> > > >      0944:                                p2cread, p2cwrite,
> > >> > > >      0945:                                c2pread, c2pwrite,
> > >> > > >      0946:                                errread, errwrite,
> > >> > > >  *** 0947:                                restore_signals,
> > >> > > > start_new_session)
> > >> > > >      0948:        except:
> > >> > > >      0949:            # Cleanup if the child failed starting.
> > >> > > >      0950:            for f in filter(None, (self.stdin,
> > >> > > > self.stdout,
> > >> > > > self.stderr)):
> > >> > > >      0951:                try:
> > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 1551, function:
> > >> > > > _execute_child
> > >> > > >      1547:                                # The error must be
> from
> > >> > > > chdir(cwd).
> > >> > > >      1548:                                err_msg += ': ' +
> > >> > > > repr(cwd)
> > >> > > >      1549:                            else:
> > >> > > >      1550:                                err_msg += ': ' +
> > >> > > > repr(orig_executable)
> > >> > > >  *** 1551:                    raise child_exception_type(errno_
> num,
> > >> > > > err_msg)
> > >> > > >      1552:                raise child_exception_type(err_msg)
> > >> > > >      1553:
> > >> > > >      1554:
> > >> > > >      1555:        def _handle_exitstatus(self, sts,
> > >> > > > _WIFSIGNALED=os.WIFSIGNALED,
> > >> > > > Exception: FileNotFoundError: [Errno 2] No such file or
> directory:
> > >> > > > '/OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> > >> > > > gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
> > >> > > >
> > >> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Function failed:
> > >> > > > waf_preconfigure
> > >> > > > ERROR: Logfile of failure stored in:
> > >> > > > /OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> > >> > > > gnueabi/libtalloc/2.1.10-r0/temp/log.do_configure.52699
> > >> > > > ERROR: Task
> > >> > > > (/OE/master/sources/meta-openembedded/meta-networking/recipes-
> > >> > > > support/libtalloc/libtalloc_2.1.10.bb:do_configure)
> > >> > > > failed with exit code '1'
> > >> > > > --
> > >> > > > _______________________________________________
> > >> > > > Openembedded-devel mailing list
> > >> > > > Openembedded-devel@lists.openembedded.org
> > >> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >> > > >
> > >> >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

