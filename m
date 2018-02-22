Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4E66FF56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2018 02:48:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 18:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,376,1515484800"; d="scan'208";a="202845620"
Received: from jrkenne1-mobl.amr.corp.intel.com ([10.254.232.30])
	by orsmga005.jf.intel.com with ESMTP; 21 Feb 2018 18:48:07 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <20180222013650.GE2786@denix.org>
Date: Wed, 21 Feb 2018 18:48:06 -0800
Message-Id: <1AE70E4D-231C-4E48-866C-CFBA4E266FB9@linux.intel.com>
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
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Thu, 22 Feb 2018 02:48:08 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Still failing for me, which is a show stopper. :(

> On Feb 21, 2018, at 5:36 PM, Denys Dmytriyenko <denis@denix.org> =
wrote:
>=20
> Any updates on this one yet? Thanks.
>=20
> On Fri, Feb 16, 2018 at 02:18:32PM -0800, Tim Orling wrote:
>> Expediting the fix is greatly appreciated.
>>=20
>> Thank you!
>>=20
>> --Tim
>>=20
>> On Fri, Feb 16, 2018 at 1:00 PM, Joshua Watt <jpewhacker@gmail.com> =
wrote:
>>=20
>>> On Fri, 2018-02-16 at 21:55 +0100, Martin Jansa wrote:
>>>> Don't you want to update that one to use the new function from =
utils
>>>> instead of re-introducing get_waf_parallel_make?
>>>=20
>>> .... yes. I guess I can do that now. It didn't exist when I wrote =
the
>>> first version of this patch
>>>> On Fri, Feb 16, 2018 at 9:18 PM, Joshua Watt <jpewhacker@gmail.com>
>>>> wrote:
>>>>> On Fri, 2018-02-16 at 21:08 +0100, Martin Jansa wrote:
>>>>>> And now it will fail to parse as well:
>>>>>> http://git.openembedded.org/openembedded-core/commit/?id=3Dccd1142d=

>>>>>> 22b31ed85d8823b1bc9e11ccfd72b61f
>>>>>>=20
>>>>>> removed get_waf_parallel_make from waf.bbclass, so now all waf-
>>>>>> samba.bbclass users will fail to parse with:
>>>>>=20
>>>>> =
http://lists.openembedded.org/pipermail/openembedded-devel/2018-Feb
>>>>> ruary/116701.html will fix that as well.... We probably need to
>>>>> speed along that getting merged.
>>>>> Armin can you help with that?
>>>>>=20
>>>>> This patch should resolve all of the waf issues that have been
>>>>> discussed here, with exception of the one improvement proposed by
>>>>> Denys. While it should probably be improved, I don't beleive it
>>>>> actually affects any recipes (some please give me an example if I
>>>>> am wrong).
>>>>>=20
>>>>> Sorry for the churn. Hopefull this will be better in the future
>>>>> since waf and samba-waf are no longer tied together.
>>>>>=20
>>>>> Joshua Watt
>>>>>> bb.data_smart.ExpansionError: Failure expanding variable
>>>>>> do_compile, expression was
>>>>>>    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
>>>>>> which triggered exception NameError: name
>>>>>> 'get_waf_parallel_make' is not defined
>>>>>> On Fri, Feb 16, 2018 at 9:45 AM, Martin Jansa <martin.jansa@gmail
>>>>>> .com> wrote:
>>>>>>> Check this thread:
>>>>>>> http://lists.openembedded.org/pipermail/openembedded-commits/20
>>>>>>> 18-January/218460.html
>>>>>>>=20
>>>>>>> but my patch wasn't merged:
>>>>>>> http://lists.openembedded.org/pipermail/openembedded-core/2018-
>>>>>>> January/146974.html
>>>>>>> only the one from Joshua.
>>>>>>>=20
>>>>>>>=20
>>>>>>> The original issue is still in rocko as well, the backported
>>>>>>> waf change doesn't work and causes useless warning.
>>>>>>>=20
>>>>>>> Either the "waf.bbclass: explicitly pass bindir and libdir if
>>>>>>> supported" should be reverted in rocko or all fixes for this
>>>>>>> should be backported to rocko once they are all in oe-core and
>>>>>>> meta-oe master.
>>>>>>>=20
>>>>>>> Regards,
>>>>>>>=20
>>>>>>> On Fri, Feb 16, 2018 at 2:03 AM, Denys Dmytriyenko <denis@denix
>>>>>>> .org> wrote:
>>>>>>>> On Thu, Feb 15, 2018 at 06:37:11PM -0600, Joshua Watt wrote:
>>>>>>>>=20
>>>>>>>>> On Feb 15, 2018 17:42, "Denys Dmytriyenko" <denis@denix.org
>>>>>>>>> wrote:
>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> On Thu, Feb 15, 2018 at 03:30:06PM -0800, Khem Raj wrote:
>>>>>>>>=20
>>>>>>>>>> On Thu, Feb 15, 2018 at 3:24 PM, Denys Dmytriyenko <denis
>>>>>>>> @denix.org>
>>>>>>>>=20
>>>>>>>>> wrote:
>>>>>>>>=20
>>>>>>>>>>> On Thu, Feb 15, 2018 at 11:20:49PM +0000, Tim Orling
>>>>>>>> wrote:
>>>>>>>>=20
>>>>>>>>>>>> Then why did =E2=80=98sudo dnf install waf=E2=80=99 get me =
past the
>>>>>>>> error above? And
>>>>>>>>=20
>>>>>>>>> why
>>>>>>>>=20
>>>>>>>>>>>> does Fedora have a package for it?
>>>>>>>>=20
>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>> https://src.fedoraproject.org/rpms/waf
>>>>>>>>=20
>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>> Regardless, something broke.
>>>>>>>>=20
>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>> I thought so too. As waf.bbclass from oe-core looks for
>>>>>>>> waf binary in
>>>>>>>>=20
>>>>>>>>> the root
>>>>>>>>=20
>>>>>>>>>>> of the source package, I looked inside libtalloc 2.1.9
>>>>>>>> and 2.1.10 and
>>>>>>>>=20
>>>>>>>>> neither
>>>>>>>>=20
>>>>>>>>>>> of them have any "waf" files at the root. How was it
>>>>>>>> working before?
>>>>>>>>=20
>>>>>>>>> What
>>>>>>>>=20
>>>>>>>>>>> broke?
>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>> its using waf-samba.bbclass, there is a patch floating
>>>>>>>> for that
>>>>>>>>=20
>>>>>>>>>> https://patchwork.openembedded.org/patch/148046/
>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> So, it will fix libtalloc, but some other packages that
>>>>>>>> still use
>>>>>>>>=20
>>>>>>>>> waf.bbclass
>>>>>>>>=20
>>>>>>>>> will keep on failing with an exception?
>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> They shouldn't. I tested all the ones I could find. The way
>>>>>>>> waf-samba uses
>>>>>>>>=20
>>>>>>>>> waf is more of the exception than the rule.... Most
>>>>>>>> projects will follow
>>>>>>>>=20
>>>>>>>>> the waf.bbclass pattern of a wscript and waf in $S, but we
>>>>>>>> can probably
>>>>>>>>=20
>>>>>>>>> parameterize it if necessary.
>>>>>>>>=20
>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> Do you know of a specific recipe that fails?
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>> No, but as Andre said here earlier, it should be more
>>>>>>>> forgiving when ${S}/waf
>>>>>>>>=20
>>>>>>>> is not available or at least give a proper error message
>>>>>>>> instead of dumping a
>>>>>>>>=20
>>>>>>>> cryptic exception stack...
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>> In other words, before this waf.bbclass change in oe-core it
>>>>>>>> was handling such
>>>>>>>>=20
>>>>>>>> situation just fine and there was a warning "Unable to
>>>>>>>> execute waf --version,
>>>>>>>>=20
>>>>>>>> exit code 127". Now it never reaches that code and just
>>>>>>>> throws an exception.
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>> On Thu, Feb 15, 2018 at 3:16 PM Joshua Watt <jpewhacke
>>>>>>>> r@gmail.com>
>>>>>>>>=20
>>>>>>>>> wrote:
>>>>>>>>=20
>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>> On Thu, 2018-02-15 at 23:10 +0000, Tim Orling wrote:
>>>>>>>>=20
>>>>>>>>>>>>>> Seeing the same and trying to figure it out. Also,
>>>>>>>> seems there is
>>>>>>>>=20
>>>>>>>>> no
>>>>>>>>=20
>>>>>>>>>>>>>> recipe
>>>>>>>>=20
>>>>>>>>>>>>>> for waf-native, so it becomes a new required host
>>>>>>>> tool.
>>>>>>>>=20
>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>> There is no "waf" tool, so a "waf-native" tool
>>>>>>>> doesn't make sense...
>>>>>>>>=20
>>>>>>>>>>>>> it's not how waf works. Each project has their own
>>>>>>>> copy of the waf
>>>>>>>>=20
>>>>>>>>>>>>> program, it's not something the host has to provide.
>>>>>>>>=20
>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>>> On Thu, Feb 15, 2018 at 2:57 PM Denys Dmytriyenko
>>>>>>>> <denis@denix.org>
>>>>>>>>=20
>>>>>>>>>>>>>> wrote:
>>>>>>>>=20
>>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>>>> Hi,
>>>>>>>>=20
>>>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>>>> I'm getting below stack dump building libtalloc
>>>>>>>> 2.1.10 in master.
>>>>>>>>=20
>>>>>>>>>>>>>>> Works
>>>>>>>>=20
>>>>>>>>>>>>>>> fine in
>>>>>>>>=20
>>>>>>>>>>>>>>> rocko with libtalloc 2.1.9. I need it for cifs-
>>>>>>>> utils. I'm not
>>>>>>>>=20
>>>>>>>>>>>>>>> familiar with
>>>>>>>>=20
>>>>>>>>>>>>>>> waf, any help? Thanks.
>>>>>>>>=20
>>>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>>>> ERROR: libtalloc-2.1.10-r0 do_configure: Error
>>>>>>>> executing a python
>>>>>>>>=20
>>>>>>>>>>>>>>> function
>>>>>>>>=20
>>>>>>>>>>>>>>> in exec_python_func() autogenerated:
>>>>>>>>=20
>>>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>>>> The stack trace of python calls that resulted in
>>>>>>>> this
>>>>>>>>=20
>>>>>>>>>>>>>>> exception/failure
>>>>>>>>=20
>>>>>>>>>>>>>>> was:
>>>>>>>>=20
>>>>>>>>>>>>>>> File: 'exec_python_func() autogenerated',
>>>>>>>> lineno: 2, function:
>>>>>>>>=20
>>>>>>>>>>>>>>> <module>
>>>>>>>>=20
>>>>>>>>>>>>>>>     0001:
>>>>>>>>=20
>>>>>>>>>>>>>>> *** 0002:waf_preconfigure(d)
>>>>>>>>=20
>>>>>>>>>>>>>>>     0003:
>>>>>>>>=20
>>>>>>>>>>>>>>> File: '/OE/master/sources/oe-
>>>>>>>> core/meta/classes/waf.bbclass',
>>>>>>>>=20
>>>>>>>>>>>>>>> lineno: 34,
>>>>>>>>=20
>>>>>>>>>>>>>>> function: waf_preconfigure
>>>>>>>>=20
>>>>>>>>>>>>>>>     0030:    from distutils.version import
>>>>>>>> StrictVersion
>>>>>>>>=20
>>>>>>>>>>>>>>>     0031:    subsrcdir =3D d.getVar('S')
>>>>>>>>=20
>>>>>>>>>>>>>>>     0032:    wafbin =3D os.path.join(subsrcdir,
>>>>>>>> 'waf')
>>>>>>>>=20
>>>>>>>>>>>>>>>     0033:    try:
>>>>>>>>=20
>>>>>>>>>>>>>>> *** 0034:        result =3D
>>>>>>>> subprocess.check_output([wafbin, '
>>>>>>>>=20
>>>>>>>>>>>>>>> --version'],
>>>>>>>>=20
>>>>>>>>>>>>>>> cwd=3Dsubsrcdir, stderr=3Dsubprocess.STDOUT)
>>>>>>>>=20
>>>>>>>>>>>>>>>     0035:        version =3D result.decode('utf-
>>>>>>>> 8').split()[1]
>>>>>>>>=20
>>>>>>>>>>>>>>>     0036:        if StrictVersion(version) >=3D
>>>>>>>>=20
>>>>>>>>>>>>>>> StrictVersion("1.8.7"):
>>>>>>>>=20
>>>>>>>>>>>>>>>     0037:            d.setVar("WAF_EXTRA_CONF",
>>>>>>>> "
>>>>>>>>=20
>>>>>>>>>>>>>>> --bindir=3D${bindir}
>>>>>>>>=20
>>>>>>>>>>>>>>> --libdir=3D${libdir}")
>>>>>>>>=20
>>>>>>>>>>>>>>>     0038:    except
>>>>>>>> subprocess.CalledProcessError as e:
>>>>>>>>=20
>>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
>>>>>>>> lineno: 626, function:
>>>>>>>>=20
>>>>>>>>>>>>>>> check_output
>>>>>>>>=20
>>>>>>>>>>>>>>>     0622:        # empty string. That is
>>>>>>>> maintained here for
>>>>>>>>=20
>>>>>>>>>>>>>>> backwards
>>>>>>>>=20
>>>>>>>>>>>>>>> compatibility.
>>>>>>>>=20
>>>>>>>>>>>>>>>     0623:        kwargs['input'] =3D '' if
>>>>>>>>=20
>>>>>>>>>>>>>>> kwargs.get('universal_newlines',
>>>>>>>>=20
>>>>>>>>>>>>>>> False) else b''
>>>>>>>>=20
>>>>>>>>>>>>>>>     0624:
>>>>>>>>=20
>>>>>>>>>>>>>>>     0625:    return run(*popenargs,
>>>>>>>> stdout=3DPIPE,
>>>>>>>>=20
>>>>>>>>> timeout=3Dtimeout,
>>>>>>>>=20
>>>>>>>>>>>>>>> check=3DTrue,
>>>>>>>>=20
>>>>>>>>>>>>>>> *** 0626:               **kwargs).stdout
>>>>>>>>=20
>>>>>>>>>>>>>>>     0627:
>>>>>>>>=20
>>>>>>>>>>>>>>>     0628:
>>>>>>>>=20
>>>>>>>>>>>>>>>     0629:class CompletedProcess(object):
>>>>>>>>=20
>>>>>>>>>>>>>>>     0630:    """A process that has finished
>>>>>>>> running.
>>>>>>>>=20
>>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
>>>>>>>> lineno: 693, function:
>>>>>>>>=20
>>>>>>>>>>>>>>> run
>>>>>>>>=20
>>>>>>>>>>>>>>>     0689:        if 'stdin' in kwargs:
>>>>>>>>=20
>>>>>>>>>>>>>>>     0690:            raise ValueError('stdin
>>>>>>>> and input arguments
>>>>>>>>=20
>>>>>>>>>>>>>>> may not
>>>>>>>>=20
>>>>>>>>>>>>>>> both be used.')
>>>>>>>>=20
>>>>>>>>>>>>>>>     0691:        kwargs['stdin'] =3D PIPE
>>>>>>>>=20
>>>>>>>>>>>>>>>     0692:
>>>>>>>>=20
>>>>>>>>>>>>>>> *** 0693:    with Popen(*popenargs, **kwargs)
>>>>>>>> as process:
>>>>>>>>=20
>>>>>>>>>>>>>>>     0694:        try:
>>>>>>>>=20
>>>>>>>>>>>>>>>     0695:            stdout, stderr =3D
>>>>>>>> process.communicate(input,
>>>>>>>>=20
>>>>>>>>>>>>>>> timeout=3Dtimeout)
>>>>>>>>=20
>>>>>>>>>>>>>>>     0696:        except TimeoutExpired:
>>>>>>>>=20
>>>>>>>>>>>>>>>     0697:            process.kill()
>>>>>>>>=20
>>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
>>>>>>>> lineno: 947, function:
>>>>>>>>=20
>>>>>>>>>>>>>>> __init__
>>>>>>>>=20
>>>>>>>>>>>>>>>     0943:
>>>>>>>> startupinfo,
>>>>>>>>=20
>>>>>>>>>>>>>>> creationflags,
>>>>>>>>=20
>>>>>>>>>>>>>>> shell,
>>>>>>>>=20
>>>>>>>>>>>>>>>     0944:
>>>>>>>> p2cread, p2cwrite,
>>>>>>>>=20
>>>>>>>>>>>>>>>     0945:
>>>>>>>> c2pread, c2pwrite,
>>>>>>>>=20
>>>>>>>>>>>>>>>     0946:
>>>>>>>> errread, errwrite,
>>>>>>>>=20
>>>>>>>>>>>>>>> *** 0947:
>>>>>>>> restore_signals,
>>>>>>>>=20
>>>>>>>>>>>>>>> start_new_session)
>>>>>>>>=20
>>>>>>>>>>>>>>>     0948:        except:
>>>>>>>>=20
>>>>>>>>>>>>>>>     0949:            # Cleanup if the child
>>>>>>>> failed starting.
>>>>>>>>=20
>>>>>>>>>>>>>>>     0950:            for f in filter(None,
>>>>>>>> (self.stdin,
>>>>>>>>=20
>>>>>>>>>>>>>>> self.stdout,
>>>>>>>>=20
>>>>>>>>>>>>>>> self.stderr)):
>>>>>>>>=20
>>>>>>>>>>>>>>>     0951:                try:
>>>>>>>>=20
>>>>>>>>>>>>>>> File: '/usr/lib/python3.5/subprocess.py',
>>>>>>>> lineno: 1551, function:
>>>>>>>>=20
>>>>>>>>>>>>>>> _execute_child
>>>>>>>>=20
>>>>>>>>>>>>>>>     1547:                                # The
>>>>>>>> error must be
>>>>>>>>=20
>>>>>>>>> from
>>>>>>>>=20
>>>>>>>>>>>>>>> chdir(cwd).
>>>>>>>>=20
>>>>>>>>>>>>>>>     1548:
>>>>>>>> err_msg +=3D ': ' +
>>>>>>>>=20
>>>>>>>>>>>>>>> repr(cwd)
>>>>>>>>=20
>>>>>>>>>>>>>>>     1549:                            else:
>>>>>>>>=20
>>>>>>>>>>>>>>>     1550:
>>>>>>>> err_msg +=3D ': ' +
>>>>>>>>=20
>>>>>>>>>>>>>>> repr(orig_executable)
>>>>>>>>=20
>>>>>>>>>>>>>>> *** 1551:                    raise
>>>>>>>> child_exception_type(errno_
>>>>>>>>=20
>>>>>>>>> num,
>>>>>>>>=20
>>>>>>>>>>>>>>> err_msg)
>>>>>>>>=20
>>>>>>>>>>>>>>>     1552:                raise
>>>>>>>> child_exception_type(err_msg)
>>>>>>>>=20
>>>>>>>>>>>>>>>     1553:
>>>>>>>>=20
>>>>>>>>>>>>>>>     1554:
>>>>>>>>=20
>>>>>>>>>>>>>>>     1555:        def _handle_exitstatus(self,
>>>>>>>> sts,
>>>>>>>>=20
>>>>>>>>>>>>>>> _WIFSIGNALED=3Dos.WIFSIGNALED,
>>>>>>>>=20
>>>>>>>>>>>>>>> Exception: FileNotFoundError: [Errno 2] No such
>>>>>>>> file or
>>>>>>>>=20
>>>>>>>>> directory:
>>>>>>>>=20
>>>>>>>>>>>>>>> '/OE/master/build/tmp-glibc/work/armv7ahf-neon-
>>>>>>>> oe-linux-
>>>>>>>>=20
>>>>>>>>>>>>>>> gnueabi/libtalloc/2.1.10-r0/talloc-2.1.10/waf'
>>>>>>>>=20
>>>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>>>> ERROR: libtalloc-2.1.10-r0 do_configure:
>>>>>>>> Function failed:
>>>>>>>>=20
>>>>>>>>>>>>>>> waf_preconfigure
>>>>>>>>=20
>>>>>>>>>>>>>>> ERROR: Logfile of failure stored in:
>>>>>>>>=20
>>>>>>>>>>>>>>> /OE/master/build/tmp-glibc/work/armv7ahf-neon-
>>>>>>>> oe-linux-
>>>>>>>>=20
>>>>>>>>>>>>>>> gnueabi/libtalloc/2.1.10-
>>>>>>>> r0/temp/log.do_configure.52699
>>>>>>>>=20
>>>>>>>>>>>>>>> ERROR: Task
>>>>>>>>=20
>>>>>>>>>>>>>>> (/OE/master/sources/meta-openembedded/meta-
>>>>>>>> networking/recipes-
>>>>>>>>=20
>>>>>>>>>>>>>>>=20
>>>>>>>> support/libtalloc/libtalloc_2.1.10.bb:do_configure)
>>>>>>>>=20
>>>>>>>>>>>>>>> failed with exit code '1'
>>>>>>>>=20
>>>>>>>>>>>>>>> --
>>>>>>>>=20
>>>>>>>>>>>>>>> _______________________________________________
>>>>>>>>=20
>>>>>>>>>>>>>>> Openembedded-devel mailing list
>>>>>>>>=20
>>>>>>>>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>>=20
>>>>>>>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/o
>>>>>>>> penembedded-devel
>>>>>>>>=20
>>>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>>>> --
>>>>>>>>=20
>>>>>>>>>>> _______________________________________________
>>>>>>>>=20
>>>>>>>>>>> Openembedded-devel mailing list
>>>>>>>>=20
>>>>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>>=20
>>>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembe
>>>>>>>> dded-devel
>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>=20
>>>>>>>>> --
>>>>>>>>=20
>>>>>>>>> _______________________________________________
>>>>>>>>=20
>>>>>>>>> Openembedded-devel mailing list
>>>>>>>>=20
>>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>>=20
>>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded
>>>>>>>> -devel
>>>>>>>>=20
>>>>>>>> --
>>>>>>>>=20
>>>>>>>> _______________________________________________
>>>>>>>>=20
>>>>>>>> Openembedded-devel mailing list
>>>>>>>>=20
>>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>>>=20
>>>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-d
>>>>>>>> evel
>>>>>>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>=20
>> --=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


