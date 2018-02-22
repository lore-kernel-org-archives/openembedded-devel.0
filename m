Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 613967871B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 08:30:57 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id s206so1343990wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 00:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mhuc97oXtQ1FnHAFZM9D+5F4SQCGe78HO+9HGFzpj/0=;
	b=pNNNZU9WoKK5R6BhfVKKngSWbkol2xCLJAolbNnpPhT0kAku+QavlAV1ic+jw4PVkM
	2eFOJixJHu9mmq6yXhytTmr3fVmAAysrm81IMR8oKTaOPlyYErBI8DPZ7y0IZZBAwKnV
	pPzTLlccxIMgF5PFdOC4L03MHF2vW1/XR5H0d1SeKsfqcdUzb5NJmvy7V2WIuRApQT3o
	4yUalGrrN96vbK2EVkfAuleMQqnWkXZr74sO2vDpqr1fnfsdVf9LtlD+Rz8wWcuZqKal
	HKA95s5nFccH0BX4xZ3jxOSMuk8BOSJy79wbteTCL0kGq64tLslslW+ZvD1FtugS/5ME
	vqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mhuc97oXtQ1FnHAFZM9D+5F4SQCGe78HO+9HGFzpj/0=;
	b=pvlComsF70d/tIGJFTdmuEy+zfbTspHWIkFrhGB+4kgDi3hyn/H1EX2BG65gyNY4zH
	RGOzxSNREInLgEHGCHCnPTHaZOm7IolmonjQBMLpc8ci81boKzPNBepvemH0PP2nZdYC
	Fu9ozY98d5YL+uQrXRzU02u9I16HejIsM7fuV5m1inTl9qzO9k7B7PTiERvin8NfNa6E
	ntLzwHrqHXga2mmmFKOmlqHCWWLBVjPTwKT5YH1XTMg3gWvep+szDT+mSXE99dDXxf+2
	yrvm2HQplQ1gPsLqB46dIgdY9aqC81Z1e6wnBQNmUTKzj0T/Frjdl/pKd0KgLdx6GQOC
	0juA==
X-Gm-Message-State: APf1xPDpQhI64UwQViIT7Gr7BHcPywtdjUU07U8i/+SbwCV4oCJ/xRD/
	WXgh+kcvzGQWgKzCpn2Y6U00t88yJxiAOqD5CggtWw==
X-Google-Smtp-Source: AH8x225QFBHKWshtq9WIYAmV3Q787emG7oLEzaWbqr4ohT9oXOUxi9cBiYME7mrvmFhZ+LhB3Da/XoMLpTOB2S3D2pQ=
X-Received: by 10.28.8.137 with SMTP id 131mr4524814wmi.79.1519288258892; Thu,
	22 Feb 2018 00:30:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 22 Feb 2018 00:30:58 -0800 (PST)
In-Reply-To: <1AE70E4D-231C-4E48-866C-CFBA4E266FB9@linux.intel.com>
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
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Feb 2018 09:30:58 +0100
Message-ID: <CA+chaQfJmAXa_vftmhidupmdpL9SSYrwyfjq1r4dv9dk6PywLg@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
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
X-List-Received-Date: Thu, 22 Feb 2018 08:30:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've merged the fix for parsing issues immediately after sending it (6 days
ago):
http://git.openembedded.org/meta-openembedded/commit/?id=3D2f7de931885c1b9e=
63c4e4238f0f7ad1388e8b6d

So it shouldn't fail to parse for you if you use new enough oe-core (it
doesn't fail for me).

waf.bbclass is still broken in rocko and master, but that's different issue
and not as fatal as missing get_waf_parallel_make function.

On Thu, Feb 22, 2018 at 3:48 AM, Tim Orling <
timothy.t.orling@linux.intel.com> wrote:

> Still failing for me, which is a show stopper. :(
>
> > On Feb 21, 2018, at 5:36 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > Any updates on this one yet? Thanks.
> >
> > On Fri, Feb 16, 2018 at 02:18:32PM -0800, Tim Orling wrote:
> >> Expediting the fix is greatly appreciated.
> >>
> >> Thank you!
> >>
> >> --Tim
> >>
> >> On Fri, Feb 16, 2018 at 1:00 PM, Joshua Watt <jpewhacker@gmail.com>
> wrote:
> >>
> >>> On Fri, 2018-02-16 at 21:55 +0100, Martin Jansa wrote:
> >>>> Don't you want to update that one to use the new function from utils
> >>>> instead of re-introducing get_waf_parallel_make?
> >>>
> >>> .... yes. I guess I can do that now. It didn't exist when I wrote the
> >>> first version of this patch
> >>>> On Fri, Feb 16, 2018 at 9:18 PM, Joshua Watt <jpewhacker@gmail.com>
> >>>> wrote:
> >>>>> On Fri, 2018-02-16 at 21:08 +0100, Martin Jansa wrote:
> >>>>>> And now it will fail to parse as well:
> >>>>>> http://git.openembedded.org/openembedded-core/commit/?id=3Dccd1142=
d
> >>>>>> 22b31ed85d8823b1bc9e11ccfd72b61f
> >>>>>>
> >>>>>> removed get_waf_parallel_make from waf.bbclass, so now all waf-
> >>>>>> samba.bbclass users will fail to parse with:
> >>>>>
> >>>>> http://lists.openembedded.org/pipermail/openembedded-devel/2018-Feb
> >>>>> ruary/116701.html will fix that as well.... We probably need to
> >>>>> speed along that getting merged.
> >>>>> Armin can you help with that?
> >>>>>
> >>>>> This patch should resolve all of the waf issues that have been
> >>>>> discussed here, with exception of the one improvement proposed by
> >>>>> Denys. While it should probably be improved, I don't beleive it
> >>>>> actually affects any recipes (some please give me an example if I
> >>>>> am wrong).
> >>>>>
> >>>>> Sorry for the churn. Hopefull this will be better in the future
> >>>>> since waf and samba-waf are no longer tied together.
> >>>>>
> >>>>> Joshua Watt
> >>>>>> bb.data_smart.ExpansionError: Failure expanding variable
> >>>>>> do_compile, expression was
> >>>>>>    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
> >>>>>> which triggered exception NameError: name
> >>>>>> 'get_waf_parallel_make' is not defined
> >>>>>> On Fri, Feb 16, 2018 at 9:45 AM, Martin Jansa <martin.jansa@gmail
> >>>>>> .com> wrote:
> >>>>>>> Check this thread:
> >>>>>>> http://lists.openembedded.org/pipermail/openembedded-commits/20
> >>>>>>> 18-January/218460.html
> >>>>>>>
> >>>>>>> but my patch wasn't merged:
> >>>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2018-
> >>>>>>> January/146974.html
> >>>>>>> only the one from Joshua.
> >>>>>>>
> >>>>>>>
> >>>>>>> The original issue is still in rocko as well, the backported
> >>>>>>> waf change doesn't work and causes useless warning.
> >>>>>>>
> >>>>>>> Either the "waf.bbclass: explicitly pass bindir and libdir if
> >>>>>>> supported" should be reverted in rocko or all fixes for this
> >>>>>>> should be backported to rocko once they are all in oe-core and
> >>>>>>> meta-oe master.
> >>>>>>>
> >>>>>>> Regards,
> >>>>>>>
> >>>>>>> On Fri, Feb 16, 2018 at 2:03 AM, Denys Dmytriyenko <denis@denix
> >>>>>>> .org> wrote:
> >>>>>>>> On Thu, Feb 15, 2018 at 06:37:11PM -0600, Joshua Watt wrote:
> >>>>>>>>
> >>>>>>>>> On Feb 15, 2018 17:42, "Denys Dmytriyenko" <denis@denix.org
> >>>>>>>>> wrote:
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>>> On Thu, Feb 15, 2018 at 03:30:06PM -0800, Khem Raj wrote:
> >>>>>>>>
> >>>>>>>>>> On Thu, Feb 15, 2018 at 3:24 PM, Denys Dmytriyenko <denis
> >>>>>>>> @denix.org>
> >>>>>>>>
> >>>>>>>>> wrote:
> >>>>>>>>
> >>>>>>>>>>> On Thu, Feb 15, 2018 at 11:20:49PM +0000, Tim Orling
> >>>>>>>> wrote:
> >>>>>>>>
> >>>>>>>>>>>> Then why did =E2=80=98sudo dnf install waf=E2=80=99 get me p=
ast the
> >>>>>>>> error above? And
> >>>>>>>>
> >>>>>>>>> why
> >>>>>>>>
> >>>>>>>>>>>> does Fedora have a package for it?
> >>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>> https://src.fedoraproject.org/rpms/waf
> >>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>> Regardless, something broke.
> >>>>>>>>
> >>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>> I thought so too. As waf.bbclass from oe-core looks for
> >>>>>>>> waf binary in
> >>>>>>>>
> >>>>>>>>> the root
> >>>>>>>>
> >>>>>>>>>>> of the source package, I looked inside libtalloc 2.1.9
> >>>>>>>> and 2.1.10 and
> >>>>>>>>
> >>>>>>>>> neither
> >>>>>>>>
> >>>>>>>>>>> of them have any "waf" files at the root. How was it
> >>>>>>>> working before?
> >>>>>>>>
> >>>>>>>>> What
> >>>>>>>>
> >>>>>>>>>>> broke?
> >>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>> its using waf-samba.bbclass, there is a patch floating
> >>>>>>>> for that
> >>>>>>>>
> >>>>>>>>>> https://patchwork.openembedded.org/patch/148046/
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>>> So, it will fix libtalloc, but some other packages that
> >>>>>>>> still use
> >>>>>>>>
> >>>>>>>>> waf.bbclass
> >>>>>>>>
> >>>>>>>>> will keep on failing with an exception?
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>>> They shouldn't. I tested all the ones I could find. The way
> >>>>>>>> waf-samba uses
> >>>>>>>>
> >>>>>>>>> waf is more of the exception than the rule.... Most
> >>>>>>>> projects will follow
> >>>>>>>>
> >>>>>>>>> the waf.bbclass pattern of a wscript and waf in $S, but we
> >>>>>>>> can probably
> >>>>>>>>
> >>>>>>>>> parameterize it if necessary.
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>>> Do you know of a specific recipe that fails?
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> No, but as Andre said here earlier, it should be more
> >>>>>>>> forgiving when ${S}/waf
> >>>>>>>>
> >>>>>>>> is not available or at least give a proper error message
> >>>>>>>> instead of dumping a
> >>>>>>>>
> >>>>>>>> cryptic exception stack...
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> In other words, before this waf.bbclass change in oe-core it
> >>>>>>>> was handling such
> >>>>>>>>
> >>>>>>>> situation just fine and there was a warning "Unable to
> >>>>>>>> execute waf --version,
> >>>>>>>>
> >>>>>>>> exit code 127". Now it never reaches that code and just
> >>>>>>>> throws an exception.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>> On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacke
> >>>>>>>> r@gmail.com>
> >>>>>>>>
> >>>>>>>>> wrote:
> >>>>>>>>
> >>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>> On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
> >>>>>>>>
> >>>>>>>>>>>>>> Seeing the same and trying to figure it out. Also,
> >>>>>>>> seems there is
> >>>>>>>>
> >>>>>>>>> no
> >>>>>>>>
> >>>>>>>>>>>>>> recipe
> >>>>>>>>
> >>>>>>>>>>>>>> for waf-native, so it becomes a new required host
> >>>>>>>> tool.
> >>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>> There is no "waf" tool, so a "waf-native" tool
> >>>>>>>> doesn't make sense...
> >>>>>>>>
> >>>>>>>>>>>>> it's not how waf works. Each project has their own
> >>>>>>>> copy of the waf
> >>>>>>>>
> >>>>>>>>>>>>> program, it's not something the host has to provide.
> >>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>>> On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko
> >>>>>>>> <denis@denix.org>
> >>>>>>>>
> >>>>>>>>>>>>>> wrote:
> >>>>>>>>
> >>>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>>>> Hi,
> >>>>>>>>
> >>>>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>>>> I'm getting below stack dump building libtalloc
> >>>>>>>> 2.1.10 in master.
> >>>>>>>>
> >>>>>>>>>>>>>>> Works
> >>>>>>>>
> >>>>>>>>>>>>>>> fine in
> >>>>>>>>
> >>>>>>>>>>>>>>> rocko with libtalloc 2.1.9. I need it for cifs-
> >>>>>>>> utils. I'm not
> >>>>>>>>
> >>>>>>>>>>>>>>> familiar with
> >>>>>>>>
> >>>>>>>>>>>>>>> waf, any help? Thanks.
> >>>>>>>>
> >>>>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>>>> ERROR: libtalloc-2.1.10-r0 do_configure: Error
> >>>>>>>> executing a python
> >>>>>>>>
> >>>>>>>>>>>>>>> function
> >>>>>>>>
> >>>>>>>>>>>>>>> in exec_python_func() autogenerated:
> >>>>>>>>
> >>>>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>>>> The stack trace of python calls that resulted in
> >>>>>>>> this
> >>>>>>>>
> >>>>>>>>>>>>>>> exception/failure
> >>>>>>>>
> >>>>>>>>>>>>>>> was:
> >>>>>>>>
> >>>>>>>>>>>>>>> File: 'exec_python_func() autogenerated',
> >>>>>>>> lineno: 2, function:
> >>>>>>>>
> >>>>>>>>>>>>>>> <module>
> >>>>>>>>
> >>>>>>>>>>>>>>>     0001:
> >>>>>>>>
> >>>>>>>>>>>>>>> *** 0002:waf_preconfigure(d)
> >>>>>>>>
> >>>>>>>>>>>>>>>     0003:
> >>>>>>>>
> >>>>>>>>>>>>>>> File: '/OE/master/sources/oe-
> >>>>>>>> core/meta/classes/waf.bbclass',
> >>>>>>>>
> >>>>>>>>>>>>>>> lineno: 34,
> >>>>>>>>
> >>>>>>>>>>>>>>> function: waf_preconfigure
> >>>>>>>>
> >>>>>>>>>>>>>>>     0030:    from distutils.version import
> >>>>>>>> StrictVersion
> >>>>>>>>
> >>>>>>>>>>>>>>>     0031:    subsrcdir =3D d.getVar('S')
> >>>>>>>>
> >>>>>>>>>>>>>>>     0032:    wafbin =3D os.path.join(subsrcdir,
> >>>>>>>> 'waf')
> >>>>>>>>
> >>>>>>>>>>>>>>>     0033:    try:
> >>>>>>>>
> >>>>>>>>>>>>>>> *** 0034:        result =3D
> >>>>>>>> subprocess.check_output([wafbin, '
> >>>>>>>>
> >>>>>>>>>>>>>>> --version'],
> >>>>>>>>
> >>>>>>>>>>>>>>> cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)
> >>>>>>>>
> >>>>>>>>>>>>>>>     0035:        version =3D result.decode('utf-
> >>>>>>>> 8').split()[1]
> >>>>>>>>
> >>>>>>>>>>>>>>>     0036:        if StrictVersion(version) >=3D
> >>>>>>>>
> >>>>>>>>>>>>>>> StrictVersion("1.8.7"):
> >>>>>>>>
> >>>>>>>>>>>>>>>     0037:            d.setVar("WAF_EXTRA_CONF",
> >>>>>>>> "
> >>>>>>>>
> >>>>>>>>>>>>>>> --bindir=3D${bindir}
> >>>>>>>>
> >>>>>>>>>>>>>>> --libdir=3D${libdir}")
> >>>>>>>>
> >>>>>>>>>>>>>>>     0038:    except
> >>>>>>>> subprocess.CalledProcessError as e:
> >>>>>>>>
> >>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
> >>>>>>>> lineno: 626, function:
> >>>>>>>>
> >>>>>>>>>>>>>>> check_output
> >>>>>>>>
> >>>>>>>>>>>>>>>     0622:        # empty string. That is
> >>>>>>>> maintained here for
> >>>>>>>>
> >>>>>>>>>>>>>>> backwards
> >>>>>>>>
> >>>>>>>>>>>>>>> compatibility.
> >>>>>>>>
> >>>>>>>>>>>>>>>     0623:        kwargs['input'] =3D '' if
> >>>>>>>>
> >>>>>>>>>>>>>>> kwargs.get('universal_newlines',
> >>>>>>>>
> >>>>>>>>>>>>>>> False) else b''
> >>>>>>>>
> >>>>>>>>>>>>>>>     0624:
> >>>>>>>>
> >>>>>>>>>>>>>>>     0625:    return run(*popenargs,
> >>>>>>>> stdout=3DPIPE,
> >>>>>>>>
> >>>>>>>>> timeout=3Dtimeout,
> >>>>>>>>
> >>>>>>>>>>>>>>> check=3DTrue,
> >>>>>>>>
> >>>>>>>>>>>>>>> *** 0626:               **kwargs).stdout
> >>>>>>>>
> >>>>>>>>>>>>>>>     0627:
> >>>>>>>>
> >>>>>>>>>>>>>>>     0628:
> >>>>>>>>
> >>>>>>>>>>>>>>>     0629:class CompletedProcess(object):
> >>>>>>>>
> >>>>>>>>>>>>>>>     0630:    """A process that has finished
> >>>>>>>> running.
> >>>>>>>>
> >>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
> >>>>>>>> lineno: 693, function:
> >>>>>>>>
> >>>>>>>>>>>>>>> run
> >>>>>>>>
> >>>>>>>>>>>>>>>     0689:        if 'stdin' in kwargs:
> >>>>>>>>
> >>>>>>>>>>>>>>>     0690:            raise ValueError('stdin
> >>>>>>>> and input arguments
> >>>>>>>>
> >>>>>>>>>>>>>>> may not
> >>>>>>>>
> >>>>>>>>>>>>>>> both be used.')
> >>>>>>>>
> >>>>>>>>>>>>>>>     0691:        kwargs['stdin'] =3D PIPE
> >>>>>>>>
> >>>>>>>>>>>>>>>     0692:
> >>>>>>>>
> >>>>>>>>>>>>>>> *** 0693:    with Popen(*popenargs, **kwargs)
> >>>>>>>> as process:
> >>>>>>>>
> >>>>>>>>>>>>>>>     0694:        try:
> >>>>>>>>
> >>>>>>>>>>>>>>>     0695:            stdout, stderr =3D
> >>>>>>>> process.communicate(input,
> >>>>>>>>
> >>>>>>>>>>>>>>> timeout=3Dtimeout)
> >>>>>>>>
> >>>>>>>>>>>>>>>     0696:        except TimeoutExpired:
> >>>>>>>>
> >>>>>>>>>>>>>>>     0697:            process.kill()
> >>>>>>>>
> >>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
> >>>>>>>> lineno: 947, function:
> >>>>>>>>
> >>>>>>>>>>>>>>> __init__
> >>>>>>>>
> >>>>>>>>>>>>>>>     0943:
> >>>>>>>> startupinfo,
> >>>>>>>>
> >>>>>>>>>>>>>>> creationflags,
> >>>>>>>>
> >>>>>>>>>>>>>>> shell,
> >>>>>>>>
> >>>>>>>>>>>>>>>     0944:
> >>>>>>>> p2cread, p2cwrite,
> >>>>>>>>
> >>>>>>>>>>>>>>>     0945:
> >>>>>>>> c2pread, c2pwrite,
> >>>>>>>>
> >>>>>>>>>>>>>>>     0946:
> >>>>>>>> errread, errwrite,
> >>>>>>>>
> >>>>>>>>>>>>>>> *** 0947:
> >>>>>>>> restore_signals,
> >>>>>>>>
> >>>>>>>>>>>>>>> start_new_session)
> >>>>>>>>
> >>>>>>>>>>>>>>>     0948:        except:
> >>>>>>>>
> >>>>>>>>>>>>>>>     0949:            # Cleanup if the child
> >>>>>>>> failed starting.
> >>>>>>>>
> >>>>>>>>>>>>>>>     0950:            for f in filter(None,
> >>>>>>>> (self.stdin,
> >>>>>>>>
> >>>>>>>>>>>>>>> self.stdout,
> >>>>>>>>
> >>>>>>>>>>>>>>> self.stderr)):
> >>>>>>>>
> >>>>>>>>>>>>>>>     0951:                try:
> >>>>>>>>
> >>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
> >>>>>>>> lineno: 1551, function:
> >>>>>>>>
> >>>>>>>>>>>>>>> _execute_child
> >>>>>>>>
> >>>>>>>>>>>>>>>     1547:                                # The
> >>>>>>>> error must be
> >>>>>>>>
> >>>>>>>>> from
> >>>>>>>>
> >>>>>>>>>>>>>>> chdir(cwd).
> >>>>>>>>
> >>>>>>>>>>>>>>>     1548:
> >>>>>>>> err_msg +=3D ': ' +
> >>>>>>>>
> >>>>>>>>>>>>>>> repr(cwd)
> >>>>>>>>
> >>>>>>>>>>>>>>>     1549:                            else:
> >>>>>>>>
> >>>>>>>>>>>>>>>     1550:
> >>>>>>>> err_msg +=3D ': ' +
> >>>>>>>>
> >>>>>>>>>>>>>>> repr(orig_executable)
> >>>>>>>>
> >>>>>>>>>>>>>>> *** 1551:                    raise
> >>>>>>>> child_exception_type(errno_
> >>>>>>>>
> >>>>>>>>> num,
> >>>>>>>>
> >>>>>>>>>>>>>>> err_msg)
> >>>>>>>>
> >>>>>>>>>>>>>>>     1552:                raise
> >>>>>>>> child_exception_type(err_msg)
> >>>>>>>>
> >>>>>>>>>>>>>>>     1553:
> >>>>>>>>
> >>>>>>>>>>>>>>>     1554:
> >>>>>>>>
> >>>>>>>>>>>>>>>     1555:        def _handle_exitstatus(self,
> >>>>>>>> sts,
> >>>>>>>>
> >>>>>>>>>>>>>>> _WIFSIGNALED=3Dos.WIFSIGNALED,
> >>>>>>>>
> >>>>>>>>>>>>>>> Exception: FileNotFoundError: [Errno 2] No such
> >>>>>>>> file or
> >>>>>>>>
> >>>>>>>>> directory:
> >>>>>>>>
> >>>>>>>>>>>>>>> '/OE/master/build/tmp-glibc/work/armv7ahf-neon-
> >>>>>>>> oe-linux-
> >>>>>>>>
> >>>>>>>>>>>>>>> gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
> >>>>>>>>
> >>>>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>>>> ERROR: libtalloc-2.1.10-r0 do_configure:
> >>>>>>>> Function failed:
> >>>>>>>>
> >>>>>>>>>>>>>>> waf_preconfigure
> >>>>>>>>
> >>>>>>>>>>>>>>> ERROR: Logfile of failure stored in:
> >>>>>>>>
> >>>>>>>>>>>>>>> /OE/master/build/tmp-glibc/work/armv7ahf-neon-
> >>>>>>>> oe-linux-
> >>>>>>>>
> >>>>>>>>>>>>>>> gnueabi/libtalloc/2.1.10-
> >>>>>>>> r0/temp/log.do_configure.52699
> >>>>>>>>
> >>>>>>>>>>>>>>> ERROR: Task
> >>>>>>>>
> >>>>>>>>>>>>>>> (/OE/master/sources/meta-openembedded/meta-
> >>>>>>>> networking/recipes-
> >>>>>>>>
> >>>>>>>>>>>>>>>
> >>>>>>>> support/libtalloc/libtalloc_2.1.10.bb:do_configure)
> >>>>>>>>
> >>>>>>>>>>>>>>> failed with exit code '1'
> >>>>>>>>
> >>>>>>>>>>>>>>> --
> >>>>>>>>
> >>>>>>>>>>>>>>> _______________________________________________
> >>>>>>>>
> >>>>>>>>>>>>>>> Openembedded-devel mailing list
> >>>>>>>>
> >>>>>>>>>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>>
> >>>>>>>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/o
> >>>>>>>> penembedded-devel
> >>>>>>>>
> >>>>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>>>>
> >>>>>>>>
> >>>>>>>>>>> --
> >>>>>>>>
> >>>>>>>>>>> _______________________________________________
> >>>>>>>>
> >>>>>>>>>>> Openembedded-devel mailing list
> >>>>>>>>
> >>>>>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>>
> >>>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembe
> >>>>>>>> dded-devel
> >>>>>>>>
> >>>>>>>>>>
> >>>>>>>>
> >>>>>>>>> --
> >>>>>>>>
> >>>>>>>>> _______________________________________________
> >>>>>>>>
> >>>>>>>>> Openembedded-devel mailing list
> >>>>>>>>
> >>>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>>
> >>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded
> >>>>>>>> -devel
> >>>>>>>>
> >>>>>>>> --
> >>>>>>>>
> >>>>>>>> _______________________________________________
> >>>>>>>>
> >>>>>>>> Openembedded-devel mailing list
> >>>>>>>>
> >>>>>>>> Openembedded-devel@lists.openembedded.org
> >>>>>>>>
> >>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-d
> >>>>>>>> evel
> >>>>>>>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

