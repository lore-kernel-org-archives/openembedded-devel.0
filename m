Return-Path: <jpewhacker@gmail.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5D46011B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 00:37:10 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id f18so1416241otf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 16:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7pl+RUnbNxuZIWnmq9+iEQxzaljyeLKiXYa8GbOhEe4=;
	b=qe6FXT3lJnL5fRbyj5a9NF9ZVGifBxcvGOYpa0/4bzVDfUcUdfKiL5rK8tCSHJcGQF
	kc68TLhMTEmlJpcURTT5fsg+l6otwGiUkZKCIHJtMUbNG86QVK/0BZ5pkPO5G2/fMFex
	0QBx6l3MuBMfULuJBvgOPfCA7xFoH/OhxIuOou7Cbw1Y/iPvgT0076IQpdmV3EbFZ69b
	iwDd1mw2DEMFI+UFn4EmO53IhfJWqSsMQM5Em2ApVryVCuuVmAYj/7Zfsfi5vA1TGI4i
	C3AbztcYqQ/zpkoSFeUkJC/OVXiWX4NxuIWlXRbI6p5YRXsRBP2fYgKBYKGJCcFg7RrW
	8PgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7pl+RUnbNxuZIWnmq9+iEQxzaljyeLKiXYa8GbOhEe4=;
	b=haGI2w5raT2QXal/1WCdt/PA8QukVbzBN9Vp+PuyvOJa2pHauLiiej9184uVZuS8F9
	4lUb4l26y9VjKCBEMSrbm4ewUM7sWwjf/LVKGkec6T8Zy25SXvdm6o9Gnp6vkayDdu8K
	Favo5lUrTYmvT7INIxp55eQ/lqq8fAPRNcVDk619r8/FqICVdekrwVpbhFaLNaiNq6S8
	pjzvpuaaHkfEpZrFui2Ln7bnGrmvoaG5qj3cfTIes4OmsH+IFSakmrP7CeJ8C61kw1Hd
	VAFHTHKKevR21JLF1TDxH730SNwEM5aQJYIapw7ZszivUEfkVWEfgOgOdFy8BfBFF5sQ
	vnUA==
X-Gm-Message-State: APf1xPACogNZ6T6tFwBdezKjzFIu+dmrTx2tJMbso8kAMmWi+xzDaWdi
	8w5eB0knTs2/d0xj2B46fKInaB+OltSM88Hz5Z8=
X-Google-Smtp-Source: AH8x22587NqT9UYHgazXP29e7AS1ylTl1AjTIqnOOja58znLCEGX3LvdB8F29MZK9sf0IUqJdR4n1EsoqxGDsqDwXFw=
X-Received: by 10.157.73.3 with SMTP id e3mr3470763otf.15.1518741432039; Thu,
	15 Feb 2018 16:37:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.48.29 with HTTP; Thu, 15 Feb 2018 16:37:11 -0800 (PST)
Received: by 10.157.48.29 with HTTP; Thu, 15 Feb 2018 16:37:11 -0800 (PST)
In-Reply-To: <20180215233345.GP2786@denix.org>
References: <20180215225339.GL2786@denix.org>
	<CANx9H-AcRnG-Er1bE-uVxSFEQX9X8_p8T=+TyGHXn0dLnbN2=w@mail.gmail.com>
	<1518736584.6900.18.camel@gmail.com>
	<CANx9H-BJ7-n8oSovzCMSVnQnUqXDYBs-SWsFEA06iT4Du8nTLw@mail.gmail.com>
	<20180215232440.GM2786@denix.org>
	<CAMKF1srn=JvEXM2WG2Y0r_L+iB-dT44LFgMU7LmeFq3etiauTw@mail.gmail.com>
	<20180215233345.GP2786@denix.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 15 Feb 2018 18:37:11 -0600
Message-ID: <CAJdd5Gaow=CjNB1jbKjW80EYXv-a0vMqHgxzSjojz0N4Dh_ejA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 16 Feb 2018 00:37:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Feb 15, 2018 17:42, "Denys Dmytriyenko" <denis@denix.org> wrote:

On Thu, Feb 15, 2018 at 03:30:06PM -0800, Khem Raj wrote:
> On Thu, Feb 15, 2018 at 3:24 PM, Denys Dmytriyenko <denis@denix.org>
wrote:
> > On Thu, Feb 15, 2018 at 11:20:49PM +0000, Tim Orling wrote:
> >> Then why did =E2=80=98sudo dnf install waf=E2=80=99 get me past the er=
ror above? And
why
> >> does Fedora have a package for it?
> >>
> >> https://src.fedoraproject.org/rpms/waf
> >>
> >> Regardless, something broke.
> >
> > I thought so too. As waf.bbclass from oe-core looks for waf binary in
the root
> > of the source package, I looked inside libtalloc 2.1.9 and 2.1.10 and
neither
> > of them have any "waf" files at the root. How was it working before?
What
> > broke?
>
> its using waf-samba.bbclass, there is a patch floating for that
> https://patchwork.openembedded.org/patch/148046/

So, it will fix libtalloc, but some other packages that still use
waf.bbclass
will keep on failing with an exception?


They shouldn't. I tested all the ones I could find. The way waf-samba uses
waf is more of the exception than the rule.... Most projects will follow
the waf.bbclass pattern of a wscript and waf in $S, but we can probably
parameterize it if necessary.

Do you know of a specific recipe that fails?




> >> On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacker@gmail.com>
wrote:
> >>
> >> > On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
> >> > > Seeing the same and trying to figure it out. Also, seems there is
no
> >> > > recipe
> >> > > for waf-native, so it becomes a new required host tool.
> >> >
> >> > There is no "waf" tool, so a "waf-native" tool doesn't make sense...
> >> > it's not how waf works. Each project has their own copy of the waf
> >> > program, it's not something the host has to provide.
> >> >
> >> > > On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko <denis@denix.org=
>
> >> > > wrote:
> >> > >
> >> > > > Hi,
> >> > > >
> >> > > > I'm getting below stack dump building libtalloc 2.1.10 in master=
.
> >> > > > Works
> >> > > > fine in
> >> > > > rocko with libtalloc 2.1.9. I need it for cifs-utils. I'm not
> >> > > > familiar with
> >> > > > waf, any help? Thanks.
> >> > > >
> >> > > >
> >> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Error executing a pytho=
n
> >> > > > function
> >> > > > in exec_python_func() autogenerated:
> >> > > >
> >> > > > The stack trace of python calls that resulted in this
> >> > > > exception/failure
> >> > > > was:
> >> > > > File: 'exec_python_func() autogenerated', lineno: 2, function:
> >> > > > <module>
> >> > > >      0001:
> >> > > >  *** 0002:waf_preconfigure(d)
> >> > > >      0003:
> >> > > > File: '/OE/master/sources/oe-core/meta/classes/waf.bbclass',
> >> > > > lineno: 34,
> >> > > > function: waf_preconfigure
> >> > > >      0030:    from distutils.version import StrictVersion
> >> > > >      0031:    subsrcdir =3D d.getVar('S')
> >> > > >      0032:    wafbin =3D os.path.join(subsrcdir, 'waf')
> >> > > >      0033:    try:
> >> > > >  *** 0034:        result =3D subprocess.check_output([wafbin, '
> >> > > > --version'],
> >> > > > cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)
> >> > > >      0035:        version =3D result.decode('utf-8').split()[1]
> >> > > >      0036:        if StrictVersion(version) >=3D
> >> > > > StrictVersion("1.8.7"):
> >> > > >      0037:            d.setVar("WAF_EXTRA_CONF", "
> >> > > > --bindir=3D${bindir}
> >> > > > --libdir=3D${libdir}")
> >> > > >      0038:    except subprocess.CalledProcessError as e:
> >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 626, function:
> >> > > > check_output
> >> > > >      0622:        # empty string. That is maintained here for
> >> > > > backwards
> >> > > > compatibility.
> >> > > >      0623:        kwargs['input'] =3D '' if
> >> > > > kwargs.get('universal_newlines',
> >> > > > False) else b''
> >> > > >      0624:
> >> > > >      0625:    return run(*popenargs, stdout=3DPIPE,
timeout=3Dtimeout,
> >> > > > check=3DTrue,
> >> > > >  *** 0626:               **kwargs).stdout
> >> > > >      0627:
> >> > > >      0628:
> >> > > >      0629:class CompletedProcess(object):
> >> > > >      0630:    """A process that has finished running.
> >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 693, function:
> >> > > > run
> >> > > >      0689:        if 'stdin' in kwargs:
> >> > > >      0690:            raise ValueError('stdin and input argument=
s
> >> > > > may not
> >> > > > both be used.')
> >> > > >      0691:        kwargs['stdin'] =3D PIPE
> >> > > >      0692:
> >> > > >  *** 0693:    with Popen(*popenargs, **kwargs) as process:
> >> > > >      0694:        try:
> >> > > >      0695:            stdout, stderr =3D process.communicate(inp=
ut,
> >> > > > timeout=3Dtimeout)
> >> > > >      0696:        except TimeoutExpired:
> >> > > >      0697:            process.kill()
> >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 947, function:
> >> > > > __init__
> >> > > >      0943:                                startupinfo,
> >> > > > creationflags,
> >> > > > shell,
> >> > > >      0944:                                p2cread, p2cwrite,
> >> > > >      0945:                                c2pread, c2pwrite,
> >> > > >      0946:                                errread, errwrite,
> >> > > >  *** 0947:                                restore_signals,
> >> > > > start_new_session)
> >> > > >      0948:        except:
> >> > > >      0949:            # Cleanup if the child failed starting.
> >> > > >      0950:            for f in filter(None, (self.stdin,
> >> > > > self.stdout,
> >> > > > self.stderr)):
> >> > > >      0951:                try:
> >> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 1551, function=
:
> >> > > > _execute_child
> >> > > >      1547:                                # The error must be
from
> >> > > > chdir(cwd).
> >> > > >      1548:                                err_msg +=3D ': ' +
> >> > > > repr(cwd)
> >> > > >      1549:                            else:
> >> > > >      1550:                                err_msg +=3D ': ' +
> >> > > > repr(orig_executable)
> >> > > >  *** 1551:                    raise child_exception_type(errno_
num,
> >> > > > err_msg)
> >> > > >      1552:                raise child_exception_type(err_msg)
> >> > > >      1553:
> >> > > >      1554:
> >> > > >      1555:        def _handle_exitstatus(self, sts,
> >> > > > _WIFSIGNALED=3Dos.WIFSIGNALED,
> >> > > > Exception: FileNotFoundError: [Errno 2] No such file or
directory:
> >> > > > '/OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> >> > > > gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
> >> > > >
> >> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Function failed:
> >> > > > waf_preconfigure
> >> > > > ERROR: Logfile of failure stored in:
> >> > > > /OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> >> > > > gnueabi/libtalloc/2.1.10-r0/temp/log.do_configure.52699
> >> > > > ERROR: Task
> >> > > > (/OE/master/sources/meta-openembedded/meta-networking/recipes-
> >> > > > support/libtalloc/libtalloc_2.1.10.bb:do_configure)
> >> > > > failed with exit code '1'
> >> > > > --
> >> > > > _______________________________________________
> >> > > > Openembedded-devel mailing list
> >> > > > Openembedded-devel@lists.openembedded.org
> >> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l
> >> > > >
> >> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

