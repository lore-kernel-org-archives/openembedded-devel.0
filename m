Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 192087871D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 09:15:50 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id w6so2858806uae.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 01:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DXX5VCJEk9fXjzGS+PFr96Hu3Raa7HHIDp0OhLtyp0o=;
	b=KBEb1BRI67Dsf15S4C35Yz5LM/pXbQIsyOjQF1N6yH0Re9ntJduvlIsPRzWYheo5gS
	ILKdlv/dneBjU9E3ZndPPClqitg2u4TnNIQyDYZJrOwLO0ubjM0YxPDZr3BzHZ6dEvp4
	Y6x456xKTg/794Q6VZZhRVQKPaR+57BBzyv5+ociYkG6QDki5Lfr7P+FUMtf4Rx+EmL+
	IYcYDVUnpX2j9F4okt3dZDAyGVx4uugKROIrOcyqUlTQ2yt9/jzei9MI1RdY2cz0SQ0Q
	1tkCKtHXVHQfDdwowehLVO8ZqQhbLn88be4svGRrjpOLacI80S0yq/6cKywApwZ6UfLG
	oDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DXX5VCJEk9fXjzGS+PFr96Hu3Raa7HHIDp0OhLtyp0o=;
	b=hUL+BOu2zQHCCE6WMobZYG7sYAFi4aXulhJ2kC886MK12nwVU/GeMtBEdmIzdfVUcp
	tEdmS/Of6V6X637Yi3p6NswZyv6iGpIz/Dgzm1UAw2jAWBjnA0UGaIVtfCw+aOwWrWem
	qBR20ybNAirfD7aXsimeK4Pee92QYMwUlnsHJT/pAEJ34QVr2tqj5CWN3NB6GRlFbQ7Y
	XvUDAZ5wYYimCwC6g+y1rJP3OR2D6te9NcFaBJA38q6Zv5Si60yIPoCyItcYqDY0HYH0
	p8fOEL3MH05b05IDmh5Y+bOC1AL2RMTj+J6f4RC/A63Q3MsPKBOu1scRfD8pgzKNuvL/
	zqBw==
X-Gm-Message-State: APf1xPBM3bkXzVNiPI9f1LmMsW5NhaY8j3/KPuks0tdlJX9BvNOqYXU/
	ghR+GfygyQ2+1HwbcPRcsuH4Oj3yyKAyQJ0+Rvs=
X-Google-Smtp-Source: AH8x227B+GajbXn7afQV3V6IEJ/mxhJgaHn/olYIIoMjR5iwEjiG7O0JL9jYHeV5lltRfZD9+RG0eGVWQMKUq3wV6XM=
X-Received: by 10.176.82.75 with SMTP id j11mr4690015uaa.86.1519290951717;
	Thu, 22 Feb 2018 01:15:51 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1srn=JvEXM2WG2Y0r_L+iB-dT44LFgMU7LmeFq3etiauTw@mail.gmail.com>
	<20180215233345.GP2786@denix.org>
	<CAJdd5Gaow=CjNB1jbKjW80EYXv-a0vMqHgxzSjojz0N4Dh_ejA@mail.gmail.com>
	<20180216010333.GR2786@denix.org>
	<CA+chaQdkwxsJ1Z0wvPFEDwi4h+NsXzEapUqyxsqNDsTEg453SQ@mail.gmail.com>
	<CA+chaQeYpA1oM3pHLu9Nuw3e+sGipvOnXh9GVinJQaAOFwHs2g@mail.gmail.com>
	<1518812283.6900.47.camel@gmail.com>
	<CA+chaQeE4=jqCufB3f+O2E=cHp-TxbZyW-kLwq_xPY5dQjzN4A@mail.gmail.com>
	<1518814859.6900.49.camel@gmail.com>
	<CANx9H-A=C9PZPRsJ6AyFMKcGFk3=UTO6UB7avz1bTKM6UfVMfw@mail.gmail.com>
	<20180222013650.GE2786@denix.org>
	<1AE70E4D-231C-4E48-866C-CFBA4E266FB9@linux.intel.com>
	<CA+chaQfJmAXa_vftmhidupmdpL9SSYrwyfjq1r4dv9dk6PywLg@mail.gmail.com>
	<CA+chaQf0pjENm-B=81sZqiHFhjN5c2DC+O_caFxFgfhOtGAJiQ@mail.gmail.com>
In-Reply-To: <CA+chaQf0pjENm-B=81sZqiHFhjN5c2DC+O_caFxFgfhOtGAJiQ@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 22 Feb 2018 09:15:41 +0000
Message-ID: <CANx9H-C5QG72bXL7O+S5wEFbCNDxdsFNyAwQ1-sW=pt4Z57cQw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
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
X-List-Received-Date: Thu, 22 Feb 2018 09:15:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I automatically sync about 12 layers every day. This is a show stopper
because it breaks that workflow and forces a deviation from just building
on =E2=80=9Cmaster=E2=80=9D. I am now about two months behind =E2=80=9Cmast=
er=E2=80=9D for various reasons,
but this is the one remaining blocker. I have zero interest in carrying
local patches for this. Just frustrated. I wish I had a suggestion for a
better way.

In particular, this points out the frailty of bbclasses not having a
mechanism like bbapends. It is invasive to fix this locally. Or I am just
being dumb. And frustrated. And should be sleeping now.
On Thu, Feb 22, 2018 at 12:48 AM Martin Jansa <martin.jansa@gmail.com>
wrote:

> +Joe who will merge it to meta-networking
>
> maybe you meant show stopper as libtalloc failure not the whole OE world
> failing to parse because of waf-samba.bbclass (even if you don't build an=
y
> recipes using it).
>
> FWIW: I've also sent simple fix for that to oe-core a while ago:
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/m=
aster&id=3D71debaa06cb6f0d8996527e6d3bd6634508bd4a5
> that's why it isn't failing for me, but it wasn't merged to oe-core and n=
ot
> sure if it ever will be.
>
> Regards,
>
>
> On Thu, Feb 22, 2018 at 9:30 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> > I've merged the fix for parsing issues immediately after sending it (6
> > days ago):
> > http://git.openembedded.org/meta-openembedded/commit/?id=3D2f7
> > de931885c1b9e63c4e4238f0f7ad1388e8b6d
> >
> > So it shouldn't fail to parse for you if you use new enough oe-core (it
> > doesn't fail for me).
> >
> > waf.bbclass is still broken in rocko and master, but that's different
> > issue and not as fatal as missing get_waf_parallel_make function.
> >
> > On Thu, Feb 22, 2018 at 3:48 AM, Tim Orling
> <timothy.t.orling@linux.intel.
> > com> wrote:
> >
> >> Still failing for me, which is a show stopper. :(
> >>
> >> > On Feb 21, 2018, at 5:36 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> >> >
> >> > Any updates on this one yet? Thanks.
> >> >
> >> > On Fri, Feb 16, 2018 at 02:18:32PM -0800, Tim Orling wrote:
> >> >> Expediting the fix is greatly appreciated.
> >> >>
> >> >> Thank you!
> >> >>
> >> >> --Tim
> >> >>
> >> >> On Fri, Feb 16, 2018 at 1:00 PM, Joshua Watt <jpewhacker@gmail.com>
> >> wrote:
> >> >>
> >> >>> On Fri, 2018-02-16 at 21:55 +0100, Martin Jansa wrote:
> >> >>>> Don't you want to update that one to use the new function from
> utils
> >> >>>> instead of re-introducing get_waf_parallel_make?
> >> >>>
> >> >>> .... yes. I guess I can do that now. It didn't exist when I wrote
> the
> >> >>> first version of this patch
> >> >>>> On Fri, Feb 16, 2018 at 9:18 PM, Joshua Watt <jpewhacker@gmail.co=
m
> >
> >> >>>> wrote:
> >> >>>>> On Fri, 2018-02-16 at 21:08 +0100, Martin Jansa wrote:
> >> >>>>>> And now it will fail to parse as well:
> >> >>>>>>
> http://git.openembedded.org/openembedded-core/commit/?id=3Dccd1142d
> >> >>>>>> 22b31ed85d8823b1bc9e11ccfd72b61f
> >> >>>>>>
> >> >>>>>> removed get_waf_parallel_make from waf.bbclass, so now all waf-
> >> >>>>>> samba.bbclass users will fail to parse with:
> >> >>>>>
> >> >>>>>
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-Feb
> >> >>>>> ruary/116701.html will fix that as well.... We probably need to
> >> >>>>> speed along that getting merged.
> >> >>>>> Armin can you help with that?
> >> >>>>>
> >> >>>>> This patch should resolve all of the waf issues that have been
> >> >>>>> discussed here, with exception of the one improvement proposed b=
y
> >> >>>>> Denys. While it should probably be improved, I don't beleive it
> >> >>>>> actually affects any recipes (some please give me an example if =
I
> >> >>>>> am wrong).
> >> >>>>>
> >> >>>>> Sorry for the churn. Hopefull this will be better in the future
> >> >>>>> since waf and samba-waf are no longer tied together.
> >> >>>>>
> >> >>>>> Joshua Watt
> >> >>>>>> bb.data_smart.ExpansionError: Failure expanding variable
> >> >>>>>> do_compile, expression was
> >> >>>>>>    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
> >> >>>>>> which triggered exception NameError: name
> >> >>>>>> 'get_waf_parallel_make' is not defined
> >> >>>>>> On Fri, Feb 16, 2018 at 9:45 AM, Martin Jansa <martin.jansa@gma=
il
> >> >>>>>> .com> wrote:
> >> >>>>>>> Check this thread:
> >> >>>>>>> http://lists.openembedded.org/pipermail/openembedded-commits/2=
0
> >> >>>>>>> 18-January/218460.html
> >> >>>>>>>
> >> >>>>>>> but my patch wasn't merged:
> >> >>>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2018=
-
> >> >>>>>>> January/146974.html
> >> >>>>>>> only the one from Joshua.
> >> >>>>>>>
> >> >>>>>>>
> >> >>>>>>> The original issue is still in rocko as well, the backported
> >> >>>>>>> waf change doesn't work and causes useless warning.
> >> >>>>>>>
> >> >>>>>>> Either the "waf.bbclass: explicitly pass bindir and libdir if
> >> >>>>>>> supported" should be reverted in rocko or all fixes for this
> >> >>>>>>> should be backported to rocko once they are all in oe-core and
> >> >>>>>>> meta-oe master.
> >> >>>>>>>
> >> >>>>>>> Regards,
> >> >>>>>>>
> >> >>>>>>> On Fri, Feb 16, 2018 at 2:03 AM, Denys Dmytriyenko <denis@deni=
x
> >> >>>>>>> .org> wrote:
> >> >>>>>>>> On Thu, Feb 15, 2018 at 06:37:11PM -0600, Joshua Watt wrote:
> >> >>>>>>>>
> >> >>>>>>>>> On Feb 15, 2018 17:42, "Denys Dmytriyenko" <denis@denix.org
> >> >>>>>>>>> wrote:
> >> >>>>>>>>
> >> >>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>> On Thu, Feb 15, 2018 at 03:30:06PM -0800, Khem Raj wrote:
> >> >>>>>>>>
> >> >>>>>>>>>> On Thu, Feb 15, 2018 at 3:24 PM, Denys Dmytriyenko <denis
> >> >>>>>>>> @denix.org>
> >> >>>>>>>>
> >> >>>>>>>>> wrote:
> >> >>>>>>>>
> >> >>>>>>>>>>> On Thu, Feb 15, 2018 at 11:20:49PM +0000, Tim Orling
> >> >>>>>>>> wrote:
> >> >>>>>>>>
> >> >>>>>>>>>>>> Then why did =E2=80=98sudo dnf install waf=E2=80=99 get m=
e past the
> >> >>>>>>>> error above? And
> >> >>>>>>>>
> >> >>>>>>>>> why
> >> >>>>>>>>
> >> >>>>>>>>>>>> does Fedora have a package for it?
> >> >>>>>>>>
> >> >>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>> https://src.fedoraproject.org/rpms/waf
> >> >>>>>>>>
> >> >>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>> Regardless, something broke.
> >> >>>>>>>>
> >> >>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>> I thought so too. As waf.bbclass from oe-core looks for
> >> >>>>>>>> waf binary in
> >> >>>>>>>>
> >> >>>>>>>>> the root
> >> >>>>>>>>
> >> >>>>>>>>>>> of the source package, I looked inside libtalloc 2.1.9
> >> >>>>>>>> and 2.1.10 and
> >> >>>>>>>>
> >> >>>>>>>>> neither
> >> >>>>>>>>
> >> >>>>>>>>>>> of them have any "waf" files at the root. How was it
> >> >>>>>>>> working before?
> >> >>>>>>>>
> >> >>>>>>>>> What
> >> >>>>>>>>
> >> >>>>>>>>>>> broke?
> >> >>>>>>>>
> >> >>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>> its using waf-samba.bbclass, there is a patch floating
> >> >>>>>>>> for that
> >> >>>>>>>>
> >> >>>>>>>>>> https://patchwork.openembedded.org/patch/148046/
> >> >>>>>>>>
> >> >>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>> So, it will fix libtalloc, but some other packages that
> >> >>>>>>>> still use
> >> >>>>>>>>
> >> >>>>>>>>> waf.bbclass
> >> >>>>>>>>
> >> >>>>>>>>> will keep on failing with an exception?
> >> >>>>>>>>
> >> >>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>> They shouldn't. I tested all the ones I could find. The way
> >> >>>>>>>> waf-samba uses
> >> >>>>>>>>
> >> >>>>>>>>> waf is more of the exception than the rule.... Most
> >> >>>>>>>> projects will follow
> >> >>>>>>>>
> >> >>>>>>>>> the waf.bbclass pattern of a wscript and waf in $S, but we
> >> >>>>>>>> can probably
> >> >>>>>>>>
> >> >>>>>>>>> parameterize it if necessary.
> >> >>>>>>>>
> >> >>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>> Do you know of a specific recipe that fails?
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>> No, but as Andre said here earlier, it should be more
> >> >>>>>>>> forgiving when ${S}/waf
> >> >>>>>>>>
> >> >>>>>>>> is not available or at least give a proper error message
> >> >>>>>>>> instead of dumping a
> >> >>>>>>>>
> >> >>>>>>>> cryptic exception stack...
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>> In other words, before this waf.bbclass change in oe-core it
> >> >>>>>>>> was handling such
> >> >>>>>>>>
> >> >>>>>>>> situation just fine and there was a warning "Unable to
> >> >>>>>>>> execute waf --version,
> >> >>>>>>>>
> >> >>>>>>>> exit code 127". Now it never reaches that code and just
> >> >>>>>>>> throws an exception.
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>> On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacke
> >> >>>>>>>> r@gmail.com>
> >> >>>>>>>>
> >> >>>>>>>>> wrote:
> >> >>>>>>>>
> >> >>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>> On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>> Seeing the same and trying to figure it out. Also,
> >> >>>>>>>> seems there is
> >> >>>>>>>>
> >> >>>>>>>>> no
> >> >>>>>>>>
> >> >>>>>>>>>>>>>> recipe
> >> >>>>>>>>
> >> >>>>>>>>>>>>>> for waf-native, so it becomes a new required host
> >> >>>>>>>> tool.
> >> >>>>>>>>
> >> >>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>> There is no "waf" tool, so a "waf-native" tool
> >> >>>>>>>> doesn't make sense...
> >> >>>>>>>>
> >> >>>>>>>>>>>>> it's not how waf works. Each project has their own
> >> >>>>>>>> copy of the waf
> >> >>>>>>>>
> >> >>>>>>>>>>>>> program, it's not something the host has to provide.
> >> >>>>>>>>
> >> >>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>> On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko
> >> >>>>>>>> <denis@denix.org>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>> wrote:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> Hi,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> I'm getting below stack dump building libtalloc
> >> >>>>>>>> 2.1.10 in master.
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> Works
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> fine in
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> rocko with libtalloc 2.1.9. I need it for cifs-
> >> >>>>>>>> utils. I'm not
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> familiar with
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> waf, any help? Thanks.
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> ERROR: libtalloc-2.1.10-r0 do_configure: Error
> >> >>>>>>>> executing a python
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> function
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> in exec_python_func() autogenerated:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> The stack trace of python calls that resulted in
> >> >>>>>>>> this
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> exception/failure
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> was:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> File: 'exec_python_func() autogenerated',
> >> >>>>>>>> lineno: 2, function:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> <module>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0001:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> *** 0002:waf_preconfigure(d)
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0003:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> File: '/OE/master/sources/oe-
> >> >>>>>>>> core/meta/classes/waf.bbclass',
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> lineno: 34,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> function: waf_preconfigure
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0030:    from distutils.version import
> >> >>>>>>>> StrictVersion
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0031:    subsrcdir =3D d.getVar('S')
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0032:    wafbin =3D os.path.join(subsrcdir,
> >> >>>>>>>> 'waf')
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0033:    try:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> *** 0034:        result =3D
> >> >>>>>>>> subprocess.check_output([wafbin, '
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> --version'],
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0035:        version =3D result.decode('utf-
> >> >>>>>>>> 8').split()[1]
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0036:        if StrictVersion(version) >=3D
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> StrictVersion("1.8.7"):
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0037:            d.setVar("WAF_EXTRA_CONF",
> >> >>>>>>>> "
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> --bindir=3D${bindir}
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> --libdir=3D${libdir}")
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0038:    except
> >> >>>>>>>> subprocess.CalledProcessError as e:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
> >> >>>>>>>> lineno: 626, function:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> check_output
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0622:        # empty string. That is
> >> >>>>>>>> maintained here for
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> backwards
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> compatibility.
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0623:        kwargs['input'] =3D '' if
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> kwargs.get('universal_newlines',
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> False) else b''
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0624:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0625:    return run(*popenargs,
> >> >>>>>>>> stdout=3DPIPE,
> >> >>>>>>>>
> >> >>>>>>>>> timeout=3Dtimeout,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> check=3DTrue,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> *** 0626:               **kwargs).stdout
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0627:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0628:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0629:class CompletedProcess(object):
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0630:    """A process that has finished
> >> >>>>>>>> running.
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
> >> >>>>>>>> lineno: 693, function:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> run
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0689:        if 'stdin' in kwargs:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0690:            raise ValueError('stdin
> >> >>>>>>>> and input arguments
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> may not
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> both be used.')
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0691:        kwargs['stdin'] =3D PIPE
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0692:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> *** 0693:    with Popen(*popenargs, **kwargs)
> >> >>>>>>>> as process:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0694:        try:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0695:            stdout, stderr =3D
> >> >>>>>>>> process.communicate(input,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> timeout=3Dtimeout)
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0696:        except TimeoutExpired:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0697:            process.kill()
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
> >> >>>>>>>> lineno: 947, function:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> __init__
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0943:
> >> >>>>>>>> startupinfo,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> creationflags,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> shell,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0944:
> >> >>>>>>>> p2cread, p2cwrite,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0945:
> >> >>>>>>>> c2pread, c2pwrite,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0946:
> >> >>>>>>>> errread, errwrite,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> *** 0947:
> >> >>>>>>>> restore_signals,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> start_new_session)
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0948:        except:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0949:            # Cleanup if the child
> >> >>>>>>>> failed starting.
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0950:            for f in filter(None,
> >> >>>>>>>> (self.stdin,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> self.stdout,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> self.stderr)):
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     0951:                try:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
> >> >>>>>>>> lineno: 1551, function:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> _execute_child
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     1547:                                # The
> >> >>>>>>>> error must be
> >> >>>>>>>>
> >> >>>>>>>>> from
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> chdir(cwd).
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     1548:
> >> >>>>>>>> err_msg +=3D ': ' +
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> repr(cwd)
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     1549:                            else:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     1550:
> >> >>>>>>>> err_msg +=3D ': ' +
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> repr(orig_executable)
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> *** 1551:                    raise
> >> >>>>>>>> child_exception_type(errno_
> >> >>>>>>>>
> >> >>>>>>>>> num,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> err_msg)
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     1552:                raise
> >> >>>>>>>> child_exception_type(err_msg)
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     1553:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     1554:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>     1555:        def _handle_exitstatus(self,
> >> >>>>>>>> sts,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> _WIFSIGNALED=3Dos.WIFSIGNALED,
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> Exception: FileNotFoundError: [Errno 2] No such
> >> >>>>>>>> file or
> >> >>>>>>>>
> >> >>>>>>>>> directory:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> '/OE/master/build/tmp-glibc/work/armv7ahf-neon-
> >> >>>>>>>> oe-linux-
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> ERROR: libtalloc-2.1.10-r0 do_configure:
> >> >>>>>>>> Function failed:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> waf_preconfigure
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> ERROR: Logfile of failure stored in:
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> /OE/master/build/tmp-glibc/work/armv7ahf-neon-
> >> >>>>>>>> oe-linux-
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> gnueabi/libtalloc/2.1.10-
> >> >>>>>>>> r0/temp/log.do_configure.52699
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> ERROR: Task
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> (/OE/master/sources/meta-openembedded/meta-
> >> >>>>>>>> networking/recipes-
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>
> >> >>>>>>>> support/libtalloc/libtalloc_2.1.10.bb:do_configure)
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> failed with exit code '1'
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> --
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> _______________________________________________
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> Openembedded-devel mailing list
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> Openembedded-devel@lists.openembedded.org
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/o
> >> >>>>>>>> penembedded-devel
> >> >>>>>>>>
> >> >>>>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>>>> --
> >> >>>>>>>>
> >> >>>>>>>>>>> _______________________________________________
> >> >>>>>>>>
> >> >>>>>>>>>>> Openembedded-devel mailing list
> >> >>>>>>>>
> >> >>>>>>>>>>> Openembedded-devel@lists.openembedded.org
> >> >>>>>>>>
> >> >>>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembe
> >> >>>>>>>> dded-devel
> >> >>>>>>>>
> >> >>>>>>>>>>
> >> >>>>>>>>
> >> >>>>>>>>> --
> >> >>>>>>>>
> >> >>>>>>>>> _______________________________________________
> >> >>>>>>>>
> >> >>>>>>>>> Openembedded-devel mailing list
> >> >>>>>>>>
> >> >>>>>>>>> Openembedded-devel@lists.openembedded.org
> >> >>>>>>>>
> >> >>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded
> >> >>>>>>>> -devel
> >> >>>>>>>>
> >> >>>>>>>> --
> >> >>>>>>>>
> >> >>>>>>>> _______________________________________________
> >> >>>>>>>>
> >> >>>>>>>> Openembedded-devel mailing list
> >> >>>>>>>>
> >> >>>>>>>> Openembedded-devel@lists.openembedded.org
> >> >>>>>>>>
> >> >>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-d
> >> >>>>>>>> evel
> >> >>>>>>>>
> >> >>> --
> >> >>> _______________________________________________
> >> >>> Openembedded-devel mailing list
> >> >>> Openembedded-devel@lists.openembedded.org
> >> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> >>>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-devel mailing list
> >> >> Openembedded-devel@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

