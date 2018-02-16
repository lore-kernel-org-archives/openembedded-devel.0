Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 154C37847D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 20:55:25 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id l43so4149913wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 12:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jLAlUAwrEwFFXeEc1mg1kAB5mL4I6pGF0ud05B1VV9U=;
	b=cOWacXYmDhHB0DfaoTan2GRLhCcnKeuoVtEu1nwUJoG2bjFOpez0MKBiCX7+jxLhSs
	yAH9027kFuljLae3Eex40OP3CS4G68mY6IQO3IIpggt0aBc+V+TeBGQ21Y3WGL+LPq/Y
	cC9AKyn9xGCQkK8TzqpMPvEu/QuN2M22mOeYD97OPuWcIP1SMoP4Iv8vFU5A6bjo6rag
	n5X+rHuUyG21U16Imk+v8MO6iEYUFdGuqsoMbg2RlukwbjqvYv5v2XAzPgb/iZm6QYq7
	pAIPWxfhgMKmAZBkhayuI1bLkVei5sg7jqwXbCl5WX7OZOXINz4jPFj70FvFX6i0AZoY
	sq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jLAlUAwrEwFFXeEc1mg1kAB5mL4I6pGF0ud05B1VV9U=;
	b=PBjGrFBGamPkWBFEb5kH8eNZeOkx7+T0/jlYotEq/WpxsgsqDw0Kkxs5IITgLLrMfp
	Mz+1V0m6CXVf4AygqXOdqlovqgNksOOsgLVZt4YhfZER5HFltyFzbTAeVOhhVKf+oI0t
	9+n9AJdzg1N0qO4WC/2wE0z6yPx96YoYy4haw+teSpAuHD2GsFHp9Y7YRG5jArcsFCjg
	GThy24i6xhCzkvJwLTtm7oyEIFkLRPxYOlk2u2EYHE3graHqaLMcRpPCW5EH+J1sgDF5
	1PZXTXmQFxpO1ovfQQ9Ww1W4Rwxn6heBPAfhiCK2PQqNZcC+fY85bfEr+j64Oezq77jJ
	VceA==
X-Gm-Message-State: APf1xPBzvUc6h/Qt+JObBmU7sJ4x1WzTMF9WH+Q7s2bYGdKJnwW7HQNZ
	uIyWqi21QYoT5F9zX+nLHHWcnTCEOG+quVTDsho=
X-Google-Smtp-Source: AH8x224NYC4tdqa07+uJgQ5WVxGkhSJ8QvXwsX1vc1utTt7tzfu2uCscUTJeqXFUU3XY5Qh/VBDVVhD1jEptWxo7Lbg=
X-Received: by 10.223.189.136 with SMTP id l8mr7026587wrh.58.1518814526522;
	Fri, 16 Feb 2018 12:55:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 16 Feb 2018 12:55:25 -0800 (PST)
In-Reply-To: <1518812283.6900.47.camel@gmail.com>
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
	<1518812283.6900.47.camel@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Feb 2018 21:55:25 +0100
Message-ID: <CA+chaQeE4=jqCufB3f+O2E=cHp-TxbZyW-kLwq_xPY5dQjzN4A@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
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
X-List-Received-Date: Fri, 16 Feb 2018 20:55:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Don't you want to update that one to use the new function from utils
instead of re-introducing get_waf_parallel_make?

On Fri, Feb 16, 2018 at 9:18 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Fri, 2018-02-16 at 21:08 +0100, Martin Jansa wrote:
>
> And now it will fail to parse as well:
>
> http://git.openembedded.org/openembedded-core/commit/?id=3D
> ccd1142d22b31ed85d8823b1bc9e11ccfd72b61f
>
> removed get_waf_parallel_make from waf.bbclass, so now all
> waf-samba.bbclass users will fail to parse with:
>
>
> http://lists.openembedded.org/pipermail/openembedded-devel/
> 2018-February/116701.html will fix that as well.... We probably need to
> speed along that getting merged.
> Armin can you help with that?
>
> This patch should resolve all of the waf issues that have been discussed
> here, with exception of the one improvement proposed by Denys. While it
> should probably be improved, I don't beleive it actually affects any
> recipes (some please give me an example if I am wrong).
>
> Sorry for the churn. Hopefull this will be better in the future since waf
> and samba-waf are no longer tied together.
>
> Joshua Watt
>
>
> bb.data_smart.ExpansionError: Failure expanding variable do_compile,
> expression was
>     python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
>  which triggered exception NameError: name 'get_waf_parallel_make' is not
> defined
>
> On Fri, Feb 16, 2018 at 9:45 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> Check this thread:
> http://lists.openembedded.org/pipermail/openembedded-commits
> /2018-January/218460.html
>
> but my patch wasn't merged:
> http://lists.openembedded.org/pipermail/openembedded-core/20
> 18-January/146974.html
> only the one from Joshua.
>
> The original issue is still in rocko as well, the backported waf change
> doesn't work and causes useless warning.
>
> Either the "waf.bbclass: explicitly pass bindir and libdir if supported"
> should be reverted in rocko or all fixes for this should be backported to
> rocko once they are all in oe-core and meta-oe master.
>
> Regards,
>
> On Fri, Feb 16, 2018 at 2:03 AM, Denys Dmytriyenko <denis@denix.org>
> wrote:
>
> On Thu, Feb 15, 2018 at 06:37:11PM -0600, Joshua Watt wrote:
> > On Feb 15, 2018 17:42, "Denys Dmytriyenko" <denis@denix.org> wrote:
> >
> > On Thu, Feb 15, 2018 at 03:30:06PM -0800, Khem Raj wrote:
> > > On Thu, Feb 15, 2018 at 3:24 PM, Denys Dmytriyenko <denis@denix.org>
> > wrote:
> > > > On Thu, Feb 15, 2018 at 11:20:49PM +0000, Tim Orling wrote:
> > > >> Then why did =E2=80=98sudo dnf install waf=E2=80=99 get me past th=
e error above? And
> > why
> > > >> does Fedora have a package for it?
> > > >>
> > > >> https://src.fedoraproject.org/rpms/waf
> > > >>
> > > >> Regardless, something broke.
> > > >
> > > > I thought so too. As waf.bbclass from oe-core looks for waf binary =
in
> > the root
> > > > of the source package, I looked inside libtalloc 2.1.9 and 2.1.10 a=
nd
> > neither
> > > > of them have any "waf" files at the root. How was it working before=
?
> > What
> > > > broke?
> > >
> > > its using waf-samba.bbclass, there is a patch floating for that
> > > https://patchwork.openembedded.org/patch/148046/
> >
> > So, it will fix libtalloc, but some other packages that still use
> > waf.bbclass
> > will keep on failing with an exception?
> >
> >
> > They shouldn't. I tested all the ones I could find. The way waf-samba
> uses
> > waf is more of the exception than the rule.... Most projects will follo=
w
> > the waf.bbclass pattern of a wscript and waf in $S, but we can probably
> > parameterize it if necessary.
> >
> > Do you know of a specific recipe that fails?
>
> No, but as Andre said here earlier, it should be more forgiving when
> ${S}/waf
> is not available or at least give a proper error message instead of
> dumping a
> cryptic exception stack...
>
> In other words, before this waf.bbclass change in oe-core it was handling
> such
> situation just fine and there was a warning "Unable to execute waf
> --version,
> exit code 127". Now it never reaches that code and just throws an
> exception.
>
>
> > > >> On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacker@gmail.com>
> > wrote:
> > > >>
> > > >> > On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
> > > >> > > Seeing the same and trying to figure it out. Also, seems there
> is
> > no
> > > >> > > recipe
> > > >> > > for waf-native, so it becomes a new required host tool.
> > > >> >
> > > >> > There is no "waf" tool, so a "waf-native" tool doesn't make
> sense...
> > > >> > it's not how waf works. Each project has their own copy of the w=
af
> > > >> > program, it's not something the host has to provide.
> > > >> >
> > > >> > > On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko <
> denis@denix.org>
> > > >> > > wrote:
> > > >> > >
> > > >> > > > Hi,
> > > >> > > >
> > > >> > > > I'm getting below stack dump building libtalloc 2.1.10 in
> master.
> > > >> > > > Works
> > > >> > > > fine in
> > > >> > > > rocko with libtalloc 2.1.9. I need it for cifs-utils. I'm no=
t
> > > >> > > > familiar with
> > > >> > > > waf, any help? Thanks.
> > > >> > > >
> > > >> > > >
> > > >> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Error executing a
> python
> > > >> > > > function
> > > >> > > > in exec_python_func() autogenerated:
> > > >> > > >
> > > >> > > > The stack trace of python calls that resulted in this
> > > >> > > > exception/failure
> > > >> > > > was:
> > > >> > > > File: 'exec_python_func() autogenerated', lineno: 2, functio=
n:
> > > >> > > > <module>
> > > >> > > >      0001:
> > > >> > > >  *** 0002:waf_preconfigure(d)
> > > >> > > >      0003:
> > > >> > > > File: '/OE/master/sources/oe-core/meta/classes/waf.bbclass',
> > > >> > > > lineno: 34,
> > > >> > > > function: waf_preconfigure
> > > >> > > >      0030:    from distutils.version import StrictVersion
> > > >> > > >      0031:    subsrcdir =3D d.getVar('S')
> > > >> > > >      0032:    wafbin =3D os.path.join(subsrcdir, 'waf')
> > > >> > > >      0033:    try:
> > > >> > > >  *** 0034:        result =3D subprocess.check_output([wafbin=
, '
> > > >> > > > --version'],
> > > >> > > > cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)
> > > >> > > >      0035:        version =3D result.decode('utf-8').split()=
[1]
> > > >> > > >      0036:        if StrictVersion(version) >=3D
> > > >> > > > StrictVersion("1.8.7"):
> > > >> > > >      0037:            d.setVar("WAF_EXTRA_CONF", "
> > > >> > > > --bindir=3D${bindir}
> > > >> > > > --libdir=3D${libdir}")
> > > >> > > >      0038:    except subprocess.CalledProcessError as e:
> > > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 626,
> function:
> > > >> > > > check_output
> > > >> > > >      0622:        # empty string. That is maintained here fo=
r
> > > >> > > > backwards
> > > >> > > > compatibility.
> > > >> > > >      0623:        kwargs['input'] =3D '' if
> > > >> > > > kwargs.get('universal_newlines',
> > > >> > > > False) else b''
> > > >> > > >      0624:
> > > >> > > >      0625:    return run(*popenargs, stdout=3DPIPE,
> > timeout=3Dtimeout,
> > > >> > > > check=3DTrue,
> > > >> > > >  *** 0626:               **kwargs).stdout
> > > >> > > >      0627:
> > > >> > > >      0628:
> > > >> > > >      0629:class CompletedProcess(object):
> > > >> > > >      0630:    """A process that has finished running.
> > > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 693,
> function:
> > > >> > > > run
> > > >> > > >      0689:        if 'stdin' in kwargs:
> > > >> > > >      0690:            raise ValueError('stdin and input
> arguments
> > > >> > > > may not
> > > >> > > > both be used.')
> > > >> > > >      0691:        kwargs['stdin'] =3D PIPE
> > > >> > > >      0692:
> > > >> > > >  *** 0693:    with Popen(*popenargs, **kwargs) as process:
> > > >> > > >      0694:        try:
> > > >> > > >      0695:            stdout, stderr =3D
> process.communicate(input,
> > > >> > > > timeout=3Dtimeout)
> > > >> > > >      0696:        except TimeoutExpired:
> > > >> > > >      0697:            process.kill()
> > > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 947,
> function:
> > > >> > > > __init__
> > > >> > > >      0943:                                startupinfo,
> > > >> > > > creationflags,
> > > >> > > > shell,
> > > >> > > >      0944:                                p2cread, p2cwrite,
> > > >> > > >      0945:                                c2pread, c2pwrite,
> > > >> > > >      0946:                                errread, errwrite,
> > > >> > > >  *** 0947:                                restore_signals,
> > > >> > > > start_new_session)
> > > >> > > >      0948:        except:
> > > >> > > >      0949:            # Cleanup if the child failed starting=
.
> > > >> > > >      0950:            for f in filter(None, (self.stdin,
> > > >> > > > self.stdout,
> > > >> > > > self.stderr)):
> > > >> > > >      0951:                try:
> > > >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 1551,
> function:
> > > >> > > > _execute_child
> > > >> > > >      1547:                                # The error must b=
e
> > from
> > > >> > > > chdir(cwd).
> > > >> > > >      1548:                                err_msg +=3D ': ' =
+
> > > >> > > > repr(cwd)
> > > >> > > >      1549:                            else:
> > > >> > > >      1550:                                err_msg +=3D ': ' =
+
> > > >> > > > repr(orig_executable)
> > > >> > > >  *** 1551:                    raise
> child_exception_type(errno_
> > num,
> > > >> > > > err_msg)
> > > >> > > >      1552:                raise child_exception_type(err_msg=
)
> > > >> > > >      1553:
> > > >> > > >      1554:
> > > >> > > >      1555:        def _handle_exitstatus(self, sts,
> > > >> > > > _WIFSIGNALED=3Dos.WIFSIGNALED,
> > > >> > > > Exception: FileNotFoundError: [Errno 2] No such file or
> > directory:
> > > >> > > > '/OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> > > >> > > > gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
> > > >> > > >
> > > >> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Function failed:
> > > >> > > > waf_preconfigure
> > > >> > > > ERROR: Logfile of failure stored in:
> > > >> > > > /OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> > > >> > > > gnueabi/libtalloc/2.1.10-r0/temp/log.do_configure.52699
> > > >> > > > ERROR: Task
> > > >> > > > (/OE/master/sources/meta-openembedded/meta-networking/recipe
> s-
> > > >> > > > support/libtalloc/libtalloc_2.1.10.bb:do_configure)
> > > >> > > > failed with exit code '1'
> > > >> > > > --
> > > >> > > > _______________________________________________
> > > >> > > > Openembedded-devel mailing list
> > > >> > > > Openembedded-devel@lists.openembedded.org
> > > >> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-
> devel
> > > >> > > >
> > > >> >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>
>

