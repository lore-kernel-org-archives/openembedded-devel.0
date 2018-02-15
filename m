Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4E13260102
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 23:32:38 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 72so2463145iom.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 15:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=C3zh+v5uRu5TChz/gyJhGE6Rw+7SyemBjuUTZ3nQqeg=;
	b=eFDuO0g2B1NMv6/YMo4hMOaNyos3Qe379o92WScZPyuWHZMJN6dKtgD9X0pP19QpZm
	0mgk1LCfTyCJ8Sf9kNLnNBC/778pMc1B3nk5YBqmeMozmbfJrGNWSy4jMqOYB9vUjyZo
	K0Y79Fd0XRdJZpJn1wf5XsMl2vzD1k7oeR7OQYQgKYFGtZZm824iTOujypXSFxkss2Av
	RQyQSLd8TOTQV03h6W9z5h/gwix9QDTl9sd3IMQ4a7Mu9oqYw6MnTXaQVYF9UmRXCR7h
	Rrfri7TEqwATFCrQXLqcI4For0xNDwSjzdZOI/evfruzdb+K80iN05huVQT7IC9YvDCo
	meNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=C3zh+v5uRu5TChz/gyJhGE6Rw+7SyemBjuUTZ3nQqeg=;
	b=XVnjTEcAaQ2RQSxjWFCuk4xbBlfuqip0JjPMwus1mgWhc+QcRYfgsevQFXVVVttP3j
	loqzs67VrKFRfWcj+TYMNCL05vrCWglhcq6NKpSyPFJWaOaaiMSAXKGYf/MG425SZRBQ
	RdKQZNzExM0U2SF1ViQpSNaV4VrrX8F304NntT9aXQCP7rkKEqK4mAZtKwcVxLWMd2Yb
	XzcUkqDpEK23oygzrkCU/pTg59s7KA8+0FjblrCbPXn84lepRdpapsPCwFmakx2dPsst
	mcRc/rl1fDC0VD+TiTXOF+R9xnJcE9nZn97/v/A0vmqQUGId2Lecgd8WHLgu0SCzm1KV
	sgEQ==
X-Gm-Message-State: APf1xPCZwAcgP1i9g3a09yVgQLJmO5M8g0cgnA3v2YLETuQ+8q9VXOcu
	KgN5JS06YaHoiDrF8xAgUxI=
X-Google-Smtp-Source: AH8x2279HDEOMTTmU4Sb6BHctjLWFpmbjcXKh/KhKEN0QAGEdYBO8vHEy/w0wXJ9nvAPm7ZJYv5IyA==
X-Received: by 10.107.43.203 with SMTP id r194mr6001626ior.221.1518737560076; 
	Thu, 15 Feb 2018 15:32:40 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	s32sm1133960ite.1.2018.02.15.15.32.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Feb 2018 15:32:39 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1518737559.6900.26.camel@gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Date: Thu, 15 Feb 2018 17:32:39 -0600
In-Reply-To: <CANx9H-BJ7-n8oSovzCMSVnQnUqXDYBs-SWsFEA06iT4Du8nTLw@mail.gmail.com>
References: <20180215225339.GL2786@denix.org>
	<CANx9H-AcRnG-Er1bE-uVxSFEQX9X8_p8T=+TyGHXn0dLnbN2=w@mail.gmail.com>
	<1518736584.6900.18.camel@gmail.com>
	<CANx9H-BJ7-n8oSovzCMSVnQnUqXDYBs-SWsFEA06iT4Du8nTLw@mail.gmail.com>
X-Mailer: Evolution 3.26.4 (3.26.4-1.fc27) 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 15 Feb 2018 23:32:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-02-15 at 23:20 +0000, Tim Orling wrote:
> Then why did ‘sudo dnf install waf’ get me past the error above? And
> why does Fedora have a package for it?
> 
> https://src.fedoraproject.org/rpms/waf

There is a... complicated.... history (which I am not a part of)
between the maintainers of Waf and distros (see https://lists.debian.or
g/debian-devel/2010/02/msg00714.html). I'm not sure exactly what Fedora
(and I think debian has (had?) a package as well) are going for with
that, but I do know that the recipes in OE use waf "as intended" (by
the maintainers of Waf), in which each one has its own copy of the
program. 
Thankfully, OE doesn't seem to have some moral disproval to a package
containing its own binary build program.
I don't exactly know why installing it fixed the error.... that doesn't
seem to make sense to me looking at the code, but even if it did a
"waf-native" tool is still not the correct answer.
Thanks,Joshua Watt
> Regardless, something broke.
> On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
> > 
> > > Seeing the same and trying to figure it out. Also, seems there is
> > no
> > 
> > > recipe
> > 
> > > for waf-native, so it becomes a new required host tool.
> > 
> > 
> > 
> > There is no "waf" tool, so a "waf-native" tool doesn't make
> > sense...
> > 
> > it's not how waf works. Each project has their own copy of the waf
> > 
> > program, it's not something the host has to provide.
> > 
> > 
> > 
> > > On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko <denis@denix.or
> > g>
> > 
> > > wrote:
> > 
> > >
> > 
> > > > Hi,
> > 
> > > >
> > 
> > > > I'm getting below stack dump building libtalloc 2.1.10 in
> > master.
> > 
> > > > Works
> > 
> > > > fine in
> > 
> > > > rocko with libtalloc 2.1.9. I need it for cifs-utils. I'm not
> > 
> > > > familiar with
> > 
> > > > waf, any help? Thanks.
> > 
> > > >
> > 
> > > >
> > 
> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Error executing a
> > python
> > 
> > > > function
> > 
> > > > in exec_python_func() autogenerated:
> > 
> > > >
> > 
> > > > The stack trace of python calls that resulted in this
> > 
> > > > exception/failure
> > 
> > > > was:
> > 
> > > > File: 'exec_python_func() autogenerated', lineno: 2, function:
> > 
> > > > <module>
> > 
> > > >      0001:
> > 
> > > >  *** 0002:waf_preconfigure(d)
> > 
> > > >      0003:
> > 
> > > > File: '/OE/master/sources/oe-core/meta/classes/waf.bbclass',
> > 
> > > > lineno: 34,
> > 
> > > > function: waf_preconfigure
> > 
> > > >      0030:    from distutils.version import StrictVersion
> > 
> > > >      0031:    subsrcdir = d.getVar('S')
> > 
> > > >      0032:    wafbin = os.path.join(subsrcdir, 'waf')
> > 
> > > >      0033:    try:
> > 
> > > >  *** 0034:        result = subprocess.check_output([wafbin, '
> > 
> > > > --version'],
> > 
> > > > cwd=subsrcdir, stderr=subprocess.STDOUT)
> > 
> > > >      0035:        version = result.decode('utf-8').split()[1]
> > 
> > > >      0036:        if StrictVersion(version) >=
> > 
> > > > StrictVersion("1.8.7"):
> > 
> > > >      0037:            d.setVar("WAF_EXTRA_CONF", "
> > 
> > > > --bindir=${bindir}
> > 
> > > > --libdir=${libdir}")
> > 
> > > >      0038:    except subprocess.CalledProcessError as e:
> > 
> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 626,
> > function:
> > 
> > > > check_output
> > 
> > > >      0622:        # empty string. That is maintained here for
> > 
> > > > backwards
> > 
> > > > compatibility.
> > 
> > > >      0623:        kwargs['input'] = '' if
> > 
> > > > kwargs.get('universal_newlines',
> > 
> > > > False) else b''
> > 
> > > >      0624:
> > 
> > > >      0625:    return run(*popenargs, stdout=PIPE,
> > timeout=timeout,
> > 
> > > > check=True,
> > 
> > > >  *** 0626:               **kwargs).stdout
> > 
> > > >      0627:
> > 
> > > >      0628:
> > 
> > > >      0629:class CompletedProcess(object):
> > 
> > > >      0630:    """A process that has finished running.
> > 
> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 693,
> > function:
> > 
> > > > run
> > 
> > > >      0689:        if 'stdin' in kwargs:
> > 
> > > >      0690:            raise ValueError('stdin and input
> > arguments
> > 
> > > > may not
> > 
> > > > both be used.')
> > 
> > > >      0691:        kwargs['stdin'] = PIPE
> > 
> > > >      0692:
> > 
> > > >  *** 0693:    with Popen(*popenargs, **kwargs) as process:
> > 
> > > >      0694:        try:
> > 
> > > >      0695:            stdout, stderr =
> > process.communicate(input,
> > 
> > > > timeout=timeout)
> > 
> > > >      0696:        except TimeoutExpired:
> > 
> > > >      0697:            process.kill()
> > 
> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 947,
> > function:
> > 
> > > > __init__
> > 
> > > >      0943:                                startupinfo,
> > 
> > > > creationflags,
> > 
> > > > shell,
> > 
> > > >      0944:                                p2cread, p2cwrite,
> > 
> > > >      0945:                                c2pread, c2pwrite,
> > 
> > > >      0946:                                errread, errwrite,
> > 
> > > >  *** 0947:                                restore_signals,
> > 
> > > > start_new_session)
> > 
> > > >      0948:        except:
> > 
> > > >      0949:            # Cleanup if the child failed starting.
> > 
> > > >      0950:            for f in filter(None, (self.stdin,
> > 
> > > > self.stdout,
> > 
> > > > self.stderr)):
> > 
> > > >      0951:                try:
> > 
> > > > File: '/usr/lib/python3.5/subprocess.py', lineno: 1551,
> > function:
> > 
> > > > _execute_child
> > 
> > > >      1547:                                # The error must be
> > from
> > 
> > > > chdir(cwd).
> > 
> > > >      1548:                                err_msg += ': ' +
> > 
> > > > repr(cwd)
> > 
> > > >      1549:                            else:
> > 
> > > >      1550:                                err_msg += ': ' +
> > 
> > > > repr(orig_executable)
> > 
> > > >  *** 1551:                    raise
> > child_exception_type(errno_num,
> > 
> > > > err_msg)
> > 
> > > >      1552:                raise child_exception_type(err_msg)
> > 
> > > >      1553:
> > 
> > > >      1554:
> > 
> > > >      1555:        def _handle_exitstatus(self, sts,
> > 
> > > > _WIFSIGNALED=os.WIFSIGNALED,
> > 
> > > > Exception: FileNotFoundError: [Errno 2] No such file or
> > directory:
> > 
> > > > '/OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> > 
> > > > gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
> > 
> > > >
> > 
> > > > ERROR: libtalloc-2.1.10-r0 do_configure: Function failed:
> > 
> > > > waf_preconfigure
> > 
> > > > ERROR: Logfile of failure stored in:
> > 
> > > > /OE/master/build/tmp-glibc/work/armv7ahf-neon-oe-linux-
> > 
> > > > gnueabi/libtalloc/2.1.10-r0/temp/log.do_configure.52699
> > 
> > > > ERROR: Task
> > 
> > > > (/OE/master/sources/meta-openembedded/meta-networking/recipes-
> > 
> > > > support/libtalloc/libtalloc_2.1.10.bb:do_configure)
> > 
> > > > failed with exit code '1'
> > 
> > > > --
> > 
> > > > _______________________________________________
> > 
> > > > Openembedded-devel mailing list
> > 
> > > > Openembedded-devel@lists.openembedded.org
> > 
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-dev
> > el
> > 
> > > >
> > 
From denis@denix.org  Thu Feb 15 23:32:53 2018
Return-Path: <denis@denix.org>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 31E5460102
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Feb 2018 23:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C32E820B15;
	Thu, 15 Feb 2018 23:32:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id v7s0BLgl_8bP; Thu, 15 Feb 2018 23:32:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9F9222017C;
	Thu, 15 Feb 2018 23:32:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 672531632B0; Thu, 15 Feb 2018 18:32:52 -0500 (EST)
Date: Thu, 15 Feb 2018 18:32:52 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20180215233252.GO2786@denix.org>
References: <20180215225339.GL2786@denix.org>
	<CANx9H-AcRnG-Er1bE-uVxSFEQX9X8_p8T=+TyGHXn0dLnbN2=w@mail.gmail.com>
	<CAJ86T=WS5dkQ8K9jqgK5vGG1vCpnOTNFzd4WA6Qvp6pFXEKV8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ86T=WS5dkQ8K9jqgK5vGG1vCpnOTNFzd4WA6Qvp6pFXEKV8g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] libtalloc failure due to waf
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
X-List-Received-Date: Thu, 15 Feb 2018 23:32:53 -0000

On Thu, Feb 15, 2018 at 03:24:16PM -0800, Andre McCurdy wrote:
> On Thu, Feb 15, 2018 at 3:10 PM, Tim Orling <ticotimo@gmail.com> wrote:
> > Seeing the same and trying to figure it out. Also, seems there is no recipe
> > for waf-native, so it becomes a new required host tool.
> > On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> >> Hi,
> >>
> >> I'm getting below stack dump building libtalloc 2.1.10 in master. Works
> >> fine in
> >> rocko with libtalloc 2.1.9. I need it for cifs-utils. I'm not familiar with
> >> waf, any help? Thanks.
> 
> Does reverting this help?
> 
>   http://git.openembedded.org/openembedded-core/commit/?id=aa168ee7f785ff007ca645db57698883922b5eb3
> 
> It looks like the new version may need to be a little more forgiving
> if ${S}/waf doesn't exist?

Bingo! I just came to the same conclusion.

