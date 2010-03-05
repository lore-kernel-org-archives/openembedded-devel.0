Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jesmith@kaon.com>) id 1NnOFD-0003Y5-2c
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 04:30:35 +0100
Received: by vws10 with SMTP id 10so984390vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Mar 2010 19:27:37 -0800 (PST)
Received: by 10.220.125.8 with SMTP id w8mr169691vcr.168.1267759657365;
	Thu, 04 Mar 2010 19:27:37 -0800 (PST)
Received: from [192.168.1.100] (66-189-73-230.dhcp.oxfr.ma.charter.com
	[66.189.73.230])
	by mx.google.com with ESMTPS id 28sm10366550vws.11.2010.03.04.19.27.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 04 Mar 2010 19:27:35 -0800 (PST)
From: Joshua Smith <jesmith@kaon.com>
Mime-Version: 1.0 (Apple Message framework v1077)
Date: Thu, 4 Mar 2010 22:27:32 -0500
In-Reply-To: <19c1b8a91003041839t233bdaf7g921c682c0abd2479@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <B22FA4FC-2DB7-49E8-AB09-3FF8FC3D36D9@kaon.com>
	<4CF74675-86F3-45C9-A837-5D5A3489F2A5@kaon.com>
	<19c1b8a91003032123t4e402cb0u8db75a6862dca799@mail.gmail.com>
	<0209FF33-B31E-4779-B339-F0D678A6A075@kaon.com>
	<19c1b8a91003041839t233bdaf7g921c682c0abd2479@mail.gmail.com>
Message-Id: <D232A5B2-17D9-4F5C-B062-34CE93A1B0AB@kaon.com>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jesmith@kaon.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,MIME_QP_LONG_LINE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Trying and Failing to enable Java with GCC 4.3.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Mar 2010 03:30:35 -0000
X-Groupsio-MsgNum: 17344
Content-Type: multipart/mixed; boundary=Apple-Mail-25--457839634

--Apple-Mail-25--457839634
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

I'm attaching the config.log from the gcc dir, as well as the config.log =
from zlib.  Hope this helps!

On Mar 4, 2010, at 9:39 PM, Khem Raj wrote:

> On Thu, Mar 4, 2010 at 6:41 AM, Joshua Smith <jesmith@kaon.com> wrote:
>> Oh, sorry about that.  I've attached the do_configure log for =
gcc_cross.  Doesn't look too helpful to me, but what do I know?  If you =
meant some other configure log, let me know!
>>=20
>> In case it helps: before trying to build gcj inside OE, I was trying =
to build a native GCC compiler on the target machine (TouchBook, based =
on the Beagleboard), and I got this same error when I tried configuring =
with --disable-shared (with --enabled-shared I had other problems).
>>=20
>=20
> its not config.log that you attached is it ?
>> Thanks.
>>=20
>> -Joshua
>>=20
>> On Mar 4, 2010, at 12:23 AM, Khem Raj wrote:
>>=20
>>> On Wed, Mar 3, 2010 at 9:19 AM, Joshua Smith <jesmith@kaon.com> =
wrote:
>>>> Update: I dug around in the log files and I think I have a more =
root cause of this error.
>>>>=20
>>>> configure: error: Link tests are not allowed after =
GCC_NO_EXECUTABLES.
>>>>=20
>>>> I've attached the whole log of the failing build.
>>>>=20
>>>> Any hints?
>>>>=20
>>>> On Mar 3, 2010, at 11:20 AM, Joshua Smith wrote:
>>>>=20
>>>>> Hello,
>>>>>=20
>>>>> I'm new to OE.  I'm trying to get GCJ compiled for the TouchBook =
(an ARM-based tablet).  After some searching and trial-and-error, I =
figured out that I need to add:
>>>>>=20
>>>>> JAVA_arm =3D ",java" to recipies/gcc-4.3.3.inc
>>>>>=20
>>>>> But now I'm getting an error when it tries to build =
gcc-cross-4.3.3:
>>>>>=20
>>>>> make[4]: Entering directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/64/zlib'
>>>>> make[4]: *** No rule to make target `all'.  Stop.
>>>>> make[4]: Leaving directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/64/zlib'
>>>>> make[3]: *** [multi-do] Error 1
>>>>> make[3]: Leaving directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/zlib'
>>>>> make[2]: *** [all-multi] Error 2
>>>>> make[2]: Leaving directory =
`/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/gcc=
-4.3.3/build.i686-linux.arm-angstrom-linux-gnueabi/zlib'
>>>>> make[1]: *** [all-zlib] Error 2
>>>>>=20
>>>>> (I can give you more of the log if it would help, but this is the =
first error)
>>>>>=20
>>>>> I can see why adding Java would cause GCC to need zlib when maybe =
it didn't before.  But I don't know what to change to get zlib =
configured as part of the gcc build process.
>>>=20
>>> for configure errors its better to post config.log which is =
generated
>>> in the build tree. Thats where we can find the cause of error.
>>> do_compile log wont help.
>>>=20
>>>=20
>>>>>=20
>>>>> Help?
>>>>>=20
>>>>> -Joshua Smith
>>>>>=20
>>>>=20
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>=20
>>>>=20
>>>=20
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>=20
>>=20
>>=20
>>=20
>>=20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> =
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>=20
>>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--Apple-Mail-25--457839634
Content-Disposition: attachment;
	filename=zlib.config.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="zlib.config.log"
Content-Transfer-Encoding: quoted-printable

This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by configure, which was
generated by GNU Autoconf 2.59.  Invocation command line was

  $ /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/g=
cc-4.3.3/zlib/configure --cache-file=3D./config.cache --prefix=3D/OE/build/=
tmp/cross/armv7a --exec_prefix=3D/OE/build/tmp/cross/armv7a --bindir=3D/OE/=
build/tmp/cross/armv7a/bin --sbindir=3D/OE/build/tmp/cross/armv7a/bin --lib=
execdir=3D/OE/build/tmp/cross/armv7a/libexec --datadir=3D/OE/build/tmp/cros=
s/armv7a/share --sysconfdir=3D/OE/build/tmp/cross/armv7a/etc --sharedstated=
ir=3D/OE/build/tmp/cross/armv7a/com --localstatedir=3D/OE/build/tmp/cross/a=
rmv7a/var --libdir=3D/OE/build/tmp/cross/armv7a/lib --includedir=3D/OE/buil=
d/tmp/cross/armv7a/include --oldincludedir=3D/OE/build/tmp/cross/armv7a/inc=
lude --infodir=3D/OE/build/tmp/cross/armv7a/share/info --mandir=3D/OE/build=
/tmp/cross/armv7a/share/man --with-gnu-ld --enable-shared --enable-target-o=
ptspace --enable-threads=3Dposix --enable-multilib --enable-c99 --enable-lo=
ng-long --enable-symvers=3Dgnu --enable-libstdcxx-pch --enable-libssp --dis=
able-bootstrap --disable-libgomp --disable-libmudflap --with-local-prefix=
=3D/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr --with-gxx-inclu=
de-dir=3D/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/include/c=
++ --with-sysroot=3D/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi --w=
ith-build-sysroot=3D/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi --e=
nable-cheaders=3Dc_std --disable-libunwind-exceptions --with-mpfr=3D/OE/bui=
ld/tmp/staging/i686-linux/usr --enable-__cxa_atexit --enable-languages=3Dc,=
c++,fortran,java,objc --program-transform-name=3Ds,^,arm-angstrom-linux-gnu=
eabi-, --build=3Di686-linux --host=3Di686-linux --target=3Darm-angstrom-lin=
ux-gnueabi --srcdir=3D/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
cross-4.3.3-r7.1/gcc-4.3.3/zlib

## --------- ##
## Platform. ##
## --------- ##

hostname =3D ubuntu
uname -m =3D i686
uname -r =3D 2.6.31-19-generic
uname -s =3D Linux
uname -v =3D #56-Ubuntu SMP Thu Jan 28 01:26:53 UTC 2010

/usr/bin/uname -p =3D unknown
/bin/uname -X     =3D unknown

/bin/arch              =3D unknown
/usr/bin/arch -k       =3D unknown
/usr/convex/getsysinfo =3D unknown
hostinfo               =3D unknown
/bin/machine           =3D unknown
/usr/bin/oslevel       =3D unknown
/bin/universe          =3D unknown

PATH: /OE/build/tmp/staging/i686-linux/usr/bin/armv7a-linux
PATH: /OE/build/tmp/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnueab=
i
PATH: /OE/build/tmp/staging/i686-linux/usr/sbin
PATH: /OE/build/tmp/staging/i686-linux/usr/bin
PATH: /OE/build/tmp/cross/armv7a//bin
PATH: /OE/build/tmp/staging/i686-linux/sbin
PATH: /OE/build/tmp/staging/i686-linux/bin
PATH: /usr/bin
PATH: /usr/local/sbin
PATH: /usr/local/bin
PATH: /usr/sbin
PATH: /usr/bin
PATH: /sbin
PATH: /bin
PATH: /usr/games


## ----------- ##
## Core tests. ##
## ----------- ##

configure:1362: loading site script /OE/ai.openembedded.dev/site/endian-lit=
tle
| ac_cv_c_littleendian=3D${ac_cv_c_littleendian=3Dyes}
| ac_cv_c_bigendian=3D${ac_cv_c_bigendian=3Dno}
|=20
| # libnet
| ac_cv_libnet_endianess=3D${ac_cv_libnet_endianess=3Dlil}
|=20
configure:1362: loading site script /OE/ai.openembedded.dev/site/common-lin=
ux
| # apr
| ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
|=20
| # samba
| samba_cv_HAVE_IFACE_AIX=3D${samba_cv_HAVE_IFACE_AIX=3Dno}
| samba_cv_HAVE_IFACE_IFCONF=3D${samba_cv_HAVE_IFACE_IFCONF=3Dyes}
| samba_cv_HAVE_IFACE_IFREQ=3D${samba_cv_HAVE_IFACE_IFREQ=3Dyes}
| samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3D${samba_cv_HAVE_IRIX_SPECIFIC_=
CAPABILITIES=3Dno}
|=20
| # coreutils
| fu_cv_sys_stat_statfs2_bsize=3D${fu_cv_sys_stat_statfs2_bsize=3Dyes}
|=20
| # bash
| bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
| bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandlers=
=3Dno}
| bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
| bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
| bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
| bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
| bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
| bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
| bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
| bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
| bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
| bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
| bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
| bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
configure:1362: loading site script /OE/ai.openembedded.dev/site/common-gli=
bc
| # general
| ac_cv_have_decl_sys_siglist=3D${ac_cv_have_decl_sys_siglist=3Dyes}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
| ac_cv_type_uid_t=3D{ac_cv_type_uid_t=3Dyes}
|=20
| # bash
| bash_cv_under_sys_siglist=3D${bash_cv_under_sys_siglist=3Dyes}
| bash_cv_sys_siglist=3D${bash_cv_sys_siglist=3Dyes}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # glib
| glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
| ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
| ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
| ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
| glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=3D1=
}
| glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
|=20
| #dbus-glib
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
|=20
| # gnucash
| am_cv_scanf_lld=3D${am_cv_scanf_lld=3Dyes}
|=20
| # mono
| mono_cv_uscore=3D${mono_cv_uscore=3Dno}
|=20
| # guile
| ac_cv_func_pthread_attr_getstack=3D${ac_cv_func_pthread_attr_getstack=3Dy=
es}
|=20
| #gcc-zlib
| ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
| ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
| ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
|=20
| # squid
| ac_cv_af_unix_large_dgram=3D${ac_cv_af_unix_large_dgram=3Dyes}
| ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
| ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
| ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
| ac_cv_epoll_works=3D${ac_cv_epoll_works=3Dyes}
|=20
| #git
| ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes}
| # pth
| ac_cv_check_sjlj=3Dssjlj
|=20
| # va_copy and _va_copy
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
|=20
configure:1362: loading site script /OE/ai.openembedded.dev/site/ix86-commo=
n
| ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
| ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
| ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D4}
| ac_cv_sizeof_unsigned_char_p=3D${ac_cv_sizeof_unsigned_char_p=3D4}
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
| ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
| ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
| ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D4}
| ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
| ac_cv_sizeof_unsigned_long_long=3D${ac_cv_sizeof_unsigned_long_long=3D8}
| ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
| ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
| ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
| ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
| ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
| ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
| ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
| ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
|=20
| ac_cv_func_getpgrp_void=3D${ac_cv_func_getpgrp_void=3Dyes}
| ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
| ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_derefe=
rences_slashed_symlink=3Dyes}
| ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=
=3Dno}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_malloc_works=3D${ac_cv_func_malloc_works=3Dyes}
| ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
| ac_cv_func_setpgrp_void=3D${ac_cv_func_setpgrp_void=3Dyes}
| ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
| ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3Dn=
o}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_traili=
ng_slash=3Dno}
|=20
| ac_cv_header_netinet_sctp_h=3D${ac_cv_header_netinet_sctp_h=3Dno}
| ac_cv_header_netinet_sctp_uio_h=3D${ac_cv_header_netinet_sctp_uio_h=3Dno}
| ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
| ac_cv_sctp=3D${ac_cv_sctp=3Dno}
|=20
| apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
| apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
|=20
| ac_cv_path_ESD_CONFIG=3Dno
| lf_cv_sane_realloc=3Dyes
| jm_cv_func_gettimeofday_clobber=3Dno
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
| bf_lsbf=3D1
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # audacity
| ac_cv_file_lib_src_libmad_frame_h=3D${ac_cv_file_lib_src_libmad_frame_h=
=3Dno}
|=20
| # bash
| ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
| bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # cvs
| cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
|=20
| # db
| db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
| db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
| db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
| db_cv_mutex=3D${db_cv_mutex=3Dx86/gcc-assembly}
| db_cv_path_ar=3D${db_cv_path_ar=3D/usr/bin/ar}
| db_cv_path_chmod=3D${db_cv_path_chmod=3D/bin/chmod}
| db_cv_path_cp=3D${db_cv_path_cp=3D/bin/cp}
| db_cv_path_ln=3D${db_cv_path_ln=3D/bin/ln}
| db_cv_path_mkdir=3D${db_cv_path_mkdir=3D/bin/mkdir}
| db_cv_path_ranlib=3D${db_cv_path_ranlib=3D/usr/bin/ranlib}
| db_cv_path_rm=3D${db_cv_path_rm=3D/bin/rm}
| db_cv_path_sh=3D${db_cv_path_sh=3D/bin/sh}
| db_cv_path_strip=3D${db_cv_path_strip=3D/usr/bin/strip}
| db_cv_posixmutexes=3D${db_cv_posixmutexes=3Dno}
| db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
| db_cv_uimutexes=3D${db_cv_uimutexes=3Dno}
|=20
| # D-BUS
| ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
|=20
| dpkg_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| dpkg_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
|=20
| # ettercap
| ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
|=20
| # gettext
| am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
|=20
| # glib
| glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
| glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
| glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
| glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
| glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
| glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
| glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_tim=
edwait_posix=3Dyes}
| glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecific=
_posix=3Dyes}
| glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_try=
lock_posix=3Dyes}
| glib_cv_uscore=3D${glib_cv_uscore=3Dno}
| glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
| glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
| glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
| glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dyes}
|=20
| # glib-2.0
| glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
| utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
| ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
|=20
| # guile
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # intercom
| ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
|=20
| # ipsec-tools
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
| ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dyes}
| racoon_cv_bug_getaddrinfo=3D${racoon_cv_bug_getaddrinfo=3Dno}
|=20
| # jikes-native
| ac_cv_sizeof_wchar_t=3D4
|=20
| # lftp
| ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
| lftp_cv_va_copy=3D${lftp_cv_va_copy=3Dno}
| lftp_cv___va_copy=3D${lftp_cv___va_copy=3Dyes}
|=20
| # libidl
| libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
|=20
| # libnet=20
| ac_cv_lbl_unaligned_fail=3D${ac_cv_lbl_unaligned_fail=3Dno}
| ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
|=20
| # libxfce4util
| with_broken_putenv=3D${with_broken_putenv=3Dno}
|=20
| # mono
| cv_mono_sizeof_sunpath=3D108
| mono_cv_sizeof_sunpath=3D108
|=20
| # mysql
| mysql_cv_func_atomic_sub=3D${mysql_cv_func_atomic_sub=3Dyes}
| mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=3Dyes}
| ac_cv_conv_longlong_to_float=3D${ac_cv_conv_longlong_to_float=3Dyes}
|=20
| # ORBit2
| ac_cv_alignof_CORBA_boolean=3D1
| ac_cv_alignof_CORBA_char=3D1
| ac_cv_alignof_CORBA_double=3D4
| ac_cv_alignof_CORBA_float=3D4
| ac_cv_alignof_CORBA_long=3D4
| ac_cv_alignof_CORBA_long_double=3D4
| ac_cv_alignof_CORBA_long_long=3D4
| ac_cv_alignof_CORBA_octet=3D1
| ac_cv_alignof_CORBA_pointer=3D4
| ac_cv_alignof_CORBA_short=3D2
| ac_cv_alignof_CORBA_struct=3D4
| ac_cv_alignof_CORBA_wchar=3D2
| ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
|=20
| # p3scan
| ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dyes}
|=20
| # php
| ac_cv_pread=3D${ac_cv_pread=3Dno}
| ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
| php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_funct=
ions_use_off64_t=3Dyes}
|=20
| # rp-pppoe
| rpppoe_cv_pack_bitfields=3D${rpppoe_cv_pack_bitfields=3Drev}
|=20
| # rsync
| rsync_cv_HAVE_BROKEN_LARGEFILE=3D${rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno}
| rsync_cv_HAVE_SOCKETPAIR=3D${rsync_cv_HAVE_SOCKETPAIR=3Dyes}
| rsync_cv_HAVE_LONGLONG=3D${rsync_cv_HAVE_LONGLONG=3Dyes}
| rsync_cv_HAVE_OFF64_T=3D${rsync_cv_HAVE_OFF64_T=3Dno}
| rsync_cv_HAVE_SHORT_INO_T=3D${rsync_cv_HAVE_SHORT_INO_T=3Dno}
| rsync_cv_HAVE_UNSIGNED_CHAR=3D${rsync_cv_HAVE_UNSIGNED_CHAR=3Dno}
| rsync_cv_HAVE_BROKEN_READDIR=3D${rsync_cv_HAVE_BROKEN_READDIR=3Dno}
| rsync_cv_HAVE_GETTIMEOFDAY_TZ=3D${rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
| rsync_cv_HAVE_C99_VSNPRINTF=3D${rsync_cv_HAVE_C99_VSNPRINTF=3Dyes}
| rsync_cv_HAVE_SECURE_MKSTEMP=3D${rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes}
| rsync_cv_REPLACE_INET_NTOA=3D${rsync_cv_REPLACE_INET_NTOA=3Dno}
| rsync_cv_REPLACE_INET_ATON=3D${rsync_cv_REPLACE_INET_ATON=3Dno}
|=20
| # samba
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
|=20
| # screen
| screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
| screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
| screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
| screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes}
| screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
| screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
| screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
| screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
| screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
|=20
| # slrn
| slrn_cv___va_copy=3D${slrn_cv___va_copy=3Dyes}
| slrn_cv_va_copy=3D${slrn_cv_va_copy=3Dno}
| slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
|=20
| # ssh
| ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_dirent_have_space_d_na=
me=3Dyes}
| ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
| ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}
| ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
| ac_cv_type_struct_timespec=3D${ac_cv_type_struct_timespec=3Dyes}
| ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dyes}
|=20
| # startup-notification
| lf_cv_sane_realloc=3Dyes
|=20
| # sudo
| sudo_cv_uid_t_len=3D${sudo_cv_uid_t_len=3D10}
|=20
| # xffm
| jm_cv_func_working_readdir=3Dyes
|=20
| # xorg X11R7
| ac_cv_sys_linker_h=3D${ac_cv_sys_linker_h=3Dno}
| ac_cv_file__usr_share_X11_sgml_defs_ent=3D${ac_cv_file__usr_share_X11_sgm=
l_defs_ent=3Dno}
|=20
| # eds-dbus
| ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
|=20
| #dbus
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
configure:1362: loading site script /OE/ai.openembedded.dev/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # does compiler handle IEEE math?
| rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
configure:1362: loading site script /OE/ai.openembedded.dev/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # does compiler handle IEEE math?
| rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
configure:1362: loading site script /OE/ai.openembedded.dev/site/endian-lit=
tle
| ac_cv_c_littleendian=3D${ac_cv_c_littleendian=3Dyes}
| ac_cv_c_bigendian=3D${ac_cv_c_bigendian=3Dno}
|=20
| # libnet
| ac_cv_libnet_endianess=3D${ac_cv_libnet_endianess=3Dlil}
|=20
configure:1362: loading site script /OE/ai.openembedded.dev/site/common-lin=
ux
| # apr
| ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
|=20
| # samba
| samba_cv_HAVE_IFACE_AIX=3D${samba_cv_HAVE_IFACE_AIX=3Dno}
| samba_cv_HAVE_IFACE_IFCONF=3D${samba_cv_HAVE_IFACE_IFCONF=3Dyes}
| samba_cv_HAVE_IFACE_IFREQ=3D${samba_cv_HAVE_IFACE_IFREQ=3Dyes}
| samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3D${samba_cv_HAVE_IRIX_SPECIFIC_=
CAPABILITIES=3Dno}
|=20
| # coreutils
| fu_cv_sys_stat_statfs2_bsize=3D${fu_cv_sys_stat_statfs2_bsize=3Dyes}
|=20
| # bash
| bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
| bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandlers=
=3Dno}
| bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
| bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
| bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
| bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
| bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
| bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
| bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
| bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
| bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
| bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
| bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
| bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
configure:1362: loading site script /OE/ai.openembedded.dev/site/common-gli=
bc
| # general
| ac_cv_have_decl_sys_siglist=3D${ac_cv_have_decl_sys_siglist=3Dyes}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
| ac_cv_type_uid_t=3D{ac_cv_type_uid_t=3Dyes}
|=20
| # bash
| bash_cv_under_sys_siglist=3D${bash_cv_under_sys_siglist=3Dyes}
| bash_cv_sys_siglist=3D${bash_cv_sys_siglist=3Dyes}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # glib
| glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
| ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
| ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
| ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
| glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=3D1=
}
| glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
|=20
| #dbus-glib
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
|=20
| # gnucash
| am_cv_scanf_lld=3D${am_cv_scanf_lld=3Dyes}
|=20
| # mono
| mono_cv_uscore=3D${mono_cv_uscore=3Dno}
|=20
| # guile
| ac_cv_func_pthread_attr_getstack=3D${ac_cv_func_pthread_attr_getstack=3Dy=
es}
|=20
| #gcc-zlib
| ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
| ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
| ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
|=20
| # squid
| ac_cv_af_unix_large_dgram=3D${ac_cv_af_unix_large_dgram=3Dyes}
| ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
| ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
| ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
| ac_cv_epoll_works=3D${ac_cv_epoll_works=3Dyes}
|=20
| #git
| ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes}
| # pth
| ac_cv_check_sjlj=3Dssjlj
|=20
| # va_copy and _va_copy
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
|=20
configure:1362: loading site script /OE/ai.openembedded.dev/site/ix86-commo=
n
| ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
| ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
| ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D4}
| ac_cv_sizeof_unsigned_char_p=3D${ac_cv_sizeof_unsigned_char_p=3D4}
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
| ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
| ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
| ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D4}
| ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
| ac_cv_sizeof_unsigned_long_long=3D${ac_cv_sizeof_unsigned_long_long=3D8}
| ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
| ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
| ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
| ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
| ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
| ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
| ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
| ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
|=20
| ac_cv_func_getpgrp_void=3D${ac_cv_func_getpgrp_void=3Dyes}
| ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
| ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_derefe=
rences_slashed_symlink=3Dyes}
| ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=
=3Dno}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_malloc_works=3D${ac_cv_func_malloc_works=3Dyes}
| ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
| ac_cv_func_setpgrp_void=3D${ac_cv_func_setpgrp_void=3Dyes}
| ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
| ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3Dn=
o}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_traili=
ng_slash=3Dno}
|=20
| ac_cv_header_netinet_sctp_h=3D${ac_cv_header_netinet_sctp_h=3Dno}
| ac_cv_header_netinet_sctp_uio_h=3D${ac_cv_header_netinet_sctp_uio_h=3Dno}
| ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
| ac_cv_sctp=3D${ac_cv_sctp=3Dno}
|=20
| apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
| apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
|=20
| ac_cv_path_ESD_CONFIG=3Dno
| lf_cv_sane_realloc=3Dyes
| jm_cv_func_gettimeofday_clobber=3Dno
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
| bf_lsbf=3D1
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # audacity
| ac_cv_file_lib_src_libmad_frame_h=3D${ac_cv_file_lib_src_libmad_frame_h=
=3Dno}
|=20
| # bash
| ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
| bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # cvs
| cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
|=20
| # db
| db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
| db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
| db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
| db_cv_mutex=3D${db_cv_mutex=3Dx86/gcc-assembly}
| db_cv_path_ar=3D${db_cv_path_ar=3D/usr/bin/ar}
| db_cv_path_chmod=3D${db_cv_path_chmod=3D/bin/chmod}
| db_cv_path_cp=3D${db_cv_path_cp=3D/bin/cp}
| db_cv_path_ln=3D${db_cv_path_ln=3D/bin/ln}
| db_cv_path_mkdir=3D${db_cv_path_mkdir=3D/bin/mkdir}
| db_cv_path_ranlib=3D${db_cv_path_ranlib=3D/usr/bin/ranlib}
| db_cv_path_rm=3D${db_cv_path_rm=3D/bin/rm}
| db_cv_path_sh=3D${db_cv_path_sh=3D/bin/sh}
| db_cv_path_strip=3D${db_cv_path_strip=3D/usr/bin/strip}
| db_cv_posixmutexes=3D${db_cv_posixmutexes=3Dno}
| db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
| db_cv_uimutexes=3D${db_cv_uimutexes=3Dno}
|=20
| # D-BUS
| ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
|=20
| dpkg_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| dpkg_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
|=20
| # ettercap
| ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
|=20
| # gettext
| am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
|=20
| # glib
| glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
| glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
| glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
| glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
| glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
| glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
| glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_tim=
edwait_posix=3Dyes}
| glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecific=
_posix=3Dyes}
| glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_try=
lock_posix=3Dyes}
| glib_cv_uscore=3D${glib_cv_uscore=3Dno}
| glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
| glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
| glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
| glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dyes}
|=20
| # glib-2.0
| glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
| utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
| ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
|=20
| # guile
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # intercom
| ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
|=20
| # ipsec-tools
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
| ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dyes}
| racoon_cv_bug_getaddrinfo=3D${racoon_cv_bug_getaddrinfo=3Dno}
|=20
| # jikes-native
| ac_cv_sizeof_wchar_t=3D4
|=20
| # lftp
| ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
| lftp_cv_va_copy=3D${lftp_cv_va_copy=3Dno}
| lftp_cv___va_copy=3D${lftp_cv___va_copy=3Dyes}
|=20
| # libidl
| libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
|=20
| # libnet=20
| ac_cv_lbl_unaligned_fail=3D${ac_cv_lbl_unaligned_fail=3Dno}
| ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
|=20
| # libxfce4util
| with_broken_putenv=3D${with_broken_putenv=3Dno}
|=20
| # mono
| cv_mono_sizeof_sunpath=3D108
| mono_cv_sizeof_sunpath=3D108
|=20
| # mysql
| mysql_cv_func_atomic_sub=3D${mysql_cv_func_atomic_sub=3Dyes}
| mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=3Dyes}
| ac_cv_conv_longlong_to_float=3D${ac_cv_conv_longlong_to_float=3Dyes}
|=20
| # ORBit2
| ac_cv_alignof_CORBA_boolean=3D1
| ac_cv_alignof_CORBA_char=3D1
| ac_cv_alignof_CORBA_double=3D4
| ac_cv_alignof_CORBA_float=3D4
| ac_cv_alignof_CORBA_long=3D4
| ac_cv_alignof_CORBA_long_double=3D4
| ac_cv_alignof_CORBA_long_long=3D4
| ac_cv_alignof_CORBA_octet=3D1
| ac_cv_alignof_CORBA_pointer=3D4
| ac_cv_alignof_CORBA_short=3D2
| ac_cv_alignof_CORBA_struct=3D4
| ac_cv_alignof_CORBA_wchar=3D2
| ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
|=20
| # p3scan
| ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dyes}
|=20
| # php
| ac_cv_pread=3D${ac_cv_pread=3Dno}
| ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
| php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_funct=
ions_use_off64_t=3Dyes}
|=20
| # rp-pppoe
| rpppoe_cv_pack_bitfields=3D${rpppoe_cv_pack_bitfields=3Drev}
|=20
| # rsync
| rsync_cv_HAVE_BROKEN_LARGEFILE=3D${rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno}
| rsync_cv_HAVE_SOCKETPAIR=3D${rsync_cv_HAVE_SOCKETPAIR=3Dyes}
| rsync_cv_HAVE_LONGLONG=3D${rsync_cv_HAVE_LONGLONG=3Dyes}
| rsync_cv_HAVE_OFF64_T=3D${rsync_cv_HAVE_OFF64_T=3Dno}
| rsync_cv_HAVE_SHORT_INO_T=3D${rsync_cv_HAVE_SHORT_INO_T=3Dno}
| rsync_cv_HAVE_UNSIGNED_CHAR=3D${rsync_cv_HAVE_UNSIGNED_CHAR=3Dno}
| rsync_cv_HAVE_BROKEN_READDIR=3D${rsync_cv_HAVE_BROKEN_READDIR=3Dno}
| rsync_cv_HAVE_GETTIMEOFDAY_TZ=3D${rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
| rsync_cv_HAVE_C99_VSNPRINTF=3D${rsync_cv_HAVE_C99_VSNPRINTF=3Dyes}
| rsync_cv_HAVE_SECURE_MKSTEMP=3D${rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes}
| rsync_cv_REPLACE_INET_NTOA=3D${rsync_cv_REPLACE_INET_NTOA=3Dno}
| rsync_cv_REPLACE_INET_ATON=3D${rsync_cv_REPLACE_INET_ATON=3Dno}
|=20
| # samba
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
|=20
| # screen
| screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
| screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
| screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
| screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes}
| screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
| screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
| screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
| screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
| screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
|=20
| # slrn
| slrn_cv___va_copy=3D${slrn_cv___va_copy=3Dyes}
| slrn_cv_va_copy=3D${slrn_cv_va_copy=3Dno}
| slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
|=20
| # ssh
| ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_dirent_have_space_d_na=
me=3Dyes}
| ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
| ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}
| ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
| ac_cv_type_struct_timespec=3D${ac_cv_type_struct_timespec=3Dyes}
| ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dyes}
|=20
| # startup-notification
| lf_cv_sane_realloc=3Dyes
|=20
| # sudo
| sudo_cv_uid_t_len=3D${sudo_cv_uid_t_len=3D10}
|=20
| # xffm
| jm_cv_func_working_readdir=3Dyes
|=20
| # xorg X11R7
| ac_cv_sys_linker_h=3D${ac_cv_sys_linker_h=3Dno}
| ac_cv_file__usr_share_X11_sgml_defs_ent=3D${ac_cv_file__usr_share_X11_sgm=
l_defs_ent=3Dno}
|=20
| # eds-dbus
| ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
|=20
| #dbus
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
configure:1362: loading site script /OE/ai.openembedded.dev/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # does compiler handle IEEE math?
| rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
configure:1362: loading site script /OE/ai.openembedded.dev/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # does compiler handle IEEE math?
| rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
configure:1381: creating cache ./config.cache
configure:1534: checking build system type
configure:1552: result: i686-pc-linux-gnu
configure:1560: checking host system type
configure:1574: result: i686-pc-linux-gnu
configure:1582: checking target system type
configure:1596: result: arm-angstrom-linux-gnueabi
configure:1629: checking for a BSD-compatible install
configure:1684: result: /usr/bin/install -c
configure:1695: checking whether build environment is sane
configure:1738: result: yes
configure:1803: checking for gawk
configure:1819: found /usr/bin/gawk
configure:1829: result: gawk
configure:1839: checking whether make sets $(MAKE)
configure:1859: result: yes
configure:2028: checking whether to enable maintainer-specific portions of =
Makefiles
configure:2037: result: no
configure:2112: checking for i686-linux-gcc
configure:2138: result: gcc=20
configure:2420: checking for C compiler version
configure:2423: gcc  --version </dev/null >&5
gcc (Ubuntu 4.4.1-4ubuntu9) 4.4.1
Copyright (C) 2009 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:2426: $? =3D 0
configure:2428: gcc  -v </dev/null >&5
Using built-in specs.
Target: i486-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Ubuntu 4.4.1-4ubu=
ntu9' --with-bugurl=3Dfile:///usr/share/doc/gcc-4.4/README.Bugs --enable-la=
nguages=3Dc,c++,fortran,objc,obj-c++ --prefix=3D/usr --enable-shared --enab=
le-multiarch --enable-linker-build-id --with-system-zlib --libexecdir=3D/us=
r/lib --without-included-gettext --enable-threads=3Dposix --with-gxx-includ=
e-dir=3D/usr/include/c++/4.4 --program-suffix=3D-4.4 --enable-nls --enable-=
clocale=3Dgnu --enable-libstdcxx-debug --enable-objc-gc --enable-targets=3D=
all --disable-werror --with-arch-32=3Di486 --with-tune=3Dgeneric --enable-c=
hecking=3Drelease --build=3Di486-linux-gnu --host=3Di486-linux-gnu --target=
=3Di486-linux-gnu
Thread model: posix
gcc version 4.4.1 (Ubuntu 4.4.1-4ubuntu9)=20
configure:2431: $? =3D 0
configure:2433: gcc  -V </dev/null >&5
gcc: '-V' option must have argument
configure:2436: $? =3D 1
configure:2455: gcc  -o conftest -isystem/OE/build/tmp/staging/i686-linux/u=
sr/include -O2  -L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,=
/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i=
686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:2458: $? =3D 0
configure:2492: checking for C compiler default output file name
configure:2495: gcc  -isystem/OE/build/tmp/staging/i686-linux/usr/include -=
O2  -L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/OE/build/tm=
p/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i686-linux/us=
r/lib -Wl,-O1 conftest.c  >&5
configure:2498: $? =3D 0
configure:2544: result: a.out
configure:2549: checking whether the C compiler works
configure:2555: ./a.out
configure:2558: $? =3D 0
configure:2575: result: yes
configure:2582: checking whether we are cross compiling
configure:2584: result: no
configure:2587: checking for suffix of executables
configure:2589: gcc  -o conftest -isystem/OE/build/tmp/staging/i686-linux/u=
sr/include -O2  -L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,=
/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i=
686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:2592: $? =3D 0
configure:2617: result:=20
configure:2624: checking for suffix of object files
configure:2645: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:2648: $? =3D 0
configure:2670: result: o
configure:2674: checking whether we are using the GNU C compiler
configure:2698: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:2704: $? =3D 0
configure:2708: test -z=20
			 || test ! -s conftest.err
configure:2711: $? =3D 0
configure:2714: test -s conftest.o
configure:2717: $? =3D 0
configure:2730: result: yes
configure:2736: checking whether gcc  accepts -g
configure:2757: gcc  -c -g  conftest.c >&5
configure:2763: $? =3D 0
configure:2767: test -z=20
			 || test ! -s conftest.err
configure:2770: $? =3D 0
configure:2773: test -s conftest.o
configure:2776: $? =3D 0
configure:2787: result: yes
configure:2804: checking for gcc  option to accept ANSI C
configure:2874: gcc   -c -isystem/OE/build/tmp/staging/i686-linux/usr/inclu=
de -O2  conftest.c >&5
configure:2880: $? =3D 0
configure:2884: test -z=20
			 || test ! -s conftest.err
configure:2887: $? =3D 0
configure:2890: test -s conftest.o
configure:2893: $? =3D 0
configure:2911: result: none needed
configure:2929: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
conftest.c:2: error: expected '=3D', ',', ';', 'asm' or '__attribute__' bef=
ore 'me'
configure:2935: $? =3D 1
configure: failed program was:
| #ifndef __cplusplus
|   choke me
| #endif
configure:3079: checking for style of include used by make
configure:3107: result: GNU
configure:3135: checking dependency style of gcc=20
configure:3225: result: gcc3
configure:3382: checking for a sed that does not truncate output
configure:3438: result: /bin/sed
configure:3454: checking for egrep
configure:3464: result: grep -E
configure:3469: checking for fgrep
configure:3479: result: grep -F
configure:3514: checking for ld used by gcc=20
configure:3581: result: ld
configure:3590: checking if the linker (ld) is GNU ld
configure:3605: result: yes
configure:3618: checking for BSD- or MS-compatible name lister (nm)
configure:3667: result: nm
configure:3772: checking the name lister (nm) interface
configure:3779: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:3782: nm "conftest.o"
configure:3785: output
00000000 B some_variable
configure:3792: result: BSD nm
configure:3795: checking whether ln -s works
configure:3799: result: yes
configure:3807: checking the maximum length of command line arguments
configure:3927: result: 805306365
configure:3945: checking whether the shell understands some XSI constructs
configure:3953: result: yes
configure:3957: checking whether the shell understands "+=3D"
configure:3963: result: yes
configure:3998: checking for ld option to reload object files
configure:4005: result: -r
configure:4032: checking how to recognize dependent libraries
configure:4222: result: pass_all
configure:4242: checking for i686-linux-ar
configure:4268: result: ar
configure:4335: checking for i686-linux-strip
configure:4361: result: strip
configure:4422: checking for i686-linux-ranlib
configure:4448: result: ranlib
configure:4567: checking command to parse nm output from gcc  object
configure:4684: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:4687: $? =3D 0
configure:4691: nm conftest.o \| sed -n -e 's/^.*[	 ]\([ABCDGIRSTW][ABCDGIR=
STW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' \> conftest.nm
configure:4694: $? =3D 0
configure:4748: gcc  -o conftest -isystem/OE/build/tmp/staging/i686-linux/u=
sr/include -O2  -L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,=
/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i=
686-linux/usr/lib -Wl,-O1 conftest.c conftstm.o >&5
configure:4751: $? =3D 0
configure:4789: result: ok
configure:5037: checking how to run the C preprocessor
configure:5155: result: gcc -E
configure:5179: gcc -E  conftest.c
configure:5185: $? =3D 0
configure:5217: gcc -E  conftest.c
conftest.c:11:28: error: ac_nonexistent.h: No such file or directory
configure:5223: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
|=20
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "zlib"
| #define VERSION "1.1.4"
| /* end confdefs.h.  */
| #include <ac_nonexistent.h>
configure:5267: checking for ANSI C header files
configure:5292: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5298: $? =3D 0
configure:5302: test -z=20
			 || test ! -s conftest.err
configure:5305: $? =3D 0
configure:5308: test -s conftest.o
configure:5311: $? =3D 0
configure:5400: gcc  -o conftest -isystem/OE/build/tmp/staging/i686-linux/u=
sr/include -O2  -L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,=
/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i=
686-linux/usr/lib -Wl,-O1 conftest.c  >&5
conftest.c: In function 'main':
conftest.c:28: warning: incompatible implicit declaration of built-in funct=
ion 'exit'
configure:5403: $? =3D 0
configure:5405: ./conftest
configure:5408: $? =3D 0
configure:5423: result: yes
configure:5447: checking for sys/types.h
configure:5463: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5469: $? =3D 0
configure:5473: test -z=20
			 || test ! -s conftest.err
configure:5476: $? =3D 0
configure:5479: test -s conftest.o
configure:5482: $? =3D 0
configure:5493: result: yes
configure:5447: checking for sys/stat.h
configure:5463: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5469: $? =3D 0
configure:5473: test -z=20
			 || test ! -s conftest.err
configure:5476: $? =3D 0
configure:5479: test -s conftest.o
configure:5482: $? =3D 0
configure:5493: result: yes
configure:5447: checking for stdlib.h
configure:5463: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5469: $? =3D 0
configure:5473: test -z=20
			 || test ! -s conftest.err
configure:5476: $? =3D 0
configure:5479: test -s conftest.o
configure:5482: $? =3D 0
configure:5493: result: yes
configure:5447: checking for string.h
configure:5463: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5469: $? =3D 0
configure:5473: test -z=20
			 || test ! -s conftest.err
configure:5476: $? =3D 0
configure:5479: test -s conftest.o
configure:5482: $? =3D 0
configure:5493: result: yes
configure:5447: checking for memory.h
configure:5463: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5469: $? =3D 0
configure:5473: test -z=20
			 || test ! -s conftest.err
configure:5476: $? =3D 0
configure:5479: test -s conftest.o
configure:5482: $? =3D 0
configure:5493: result: yes
configure:5447: checking for strings.h
configure:5463: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5469: $? =3D 0
configure:5473: test -z=20
			 || test ! -s conftest.err
configure:5476: $? =3D 0
configure:5479: test -s conftest.o
configure:5482: $? =3D 0
configure:5493: result: yes
configure:5447: checking for inttypes.h
configure:5463: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5469: $? =3D 0
configure:5473: test -z=20
			 || test ! -s conftest.err
configure:5476: $? =3D 0
configure:5479: test -s conftest.o
configure:5482: $? =3D 0
configure:5493: result: yes
configure:5447: checking for stdint.h
configure:5463: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5469: $? =3D 0
configure:5473: test -z=20
			 || test ! -s conftest.err
configure:5476: $? =3D 0
configure:5479: test -s conftest.o
configure:5482: $? =3D 0
configure:5493: result: yes
configure:5447: checking for unistd.h
configure:5463: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5469: $? =3D 0
configure:5473: test -z=20
			 || test ! -s conftest.err
configure:5476: $? =3D 0
configure:5479: test -s conftest.o
configure:5482: $? =3D 0
configure:5493: result: yes
configure:5509: checking for dlfcn.h
configure:5525: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:5531: $? =3D 0
configure:5535: test -z=20
			 || test ! -s conftest.err
configure:5538: $? =3D 0
configure:5541: test -s conftest.o
configure:5544: $? =3D 0
configure:5555: result: yes
configure:5617: checking for objdir
configure:5632: result: .libs
configure:5928: checking if gcc  supports -fno-rtti -fno-exceptions
configure:5946: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  -fno-rtti -fno-exceptions conftest.c >&5
cc1: warning: command line option "-fno-rtti" is valid for C++/ObjC++ but n=
ot for C
configure:5950: $? =3D 0
configure:5963: result: no
configure:5983: checking for gcc  option to produce PIC
configure:6238: result: -fPIC -DPIC
configure:6250: checking if gcc  PIC flag -fPIC -DPIC works
configure:6268: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  -fPIC -DPIC -DPIC conftest.c >&5
configure:6272: $? =3D 0
configure:6285: result: yes
configure:6309: checking if gcc  static flag -static works
configure:6337: result: yes
configure:6352: checking if gcc  supports -c -o file.o
configure:6373: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  -o out/conftest2.o conftest.c >&5
configure:6377: $? =3D 0
configure:6399: result: yes
configure:6407: checking if gcc  supports -c -o file.o
configure:6454: result: yes
configure:6487: checking whether the gcc  linker (ld) supports shared libra=
ries
configure:7582: result: yes
configure:7619: checking whether -lc should be explicitly linked in
configure:7624: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:7627: $? =3D 0
configure:7642: gcc  -shared conftest.o  -v -Wl,-soname -Wl,conftest -o con=
ftest 2\>\&1 \| grep  -lc  \>/dev/null 2\>\&1
configure:7645: $? =3D 0
configure:7657: result: no
configure:7821: checking dynamic linker characteristics
configure:8259: gcc  -o conftest -isystem/OE/build/tmp/staging/i686-linux/u=
sr/include -O2  -L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,=
/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i=
686-linux/usr/lib -Wl,-O1 -Wl,-rpath -Wl,/foo conftest.c  >&5
configure:8265: $? =3D 0
configure:8269: test -z=20
			 || test ! -s conftest.err
configure:8272: $? =3D 0
configure:8275: test -s conftest
configure:8278: $? =3D 0
configure:8502: result: GNU/Linux ld.so
configure:8597: checking how to hardcode library paths into programs
configure:8622: result: immediate
configure:9503: checking whether stripping libraries is possible
configure:9508: result: yes
configure:9543: checking if libtool supports shared libraries
configure:9545: result: yes
configure:9548: checking whether to build shared libraries
configure:9569: result: yes
configure:9572: checking whether to build static libraries
configure:9576: result: yes
configure:9619: checking how to run the C preprocessor
configure:9737: result: gcc -E
configure:9761: gcc -E  conftest.c
configure:9767: $? =3D 0
configure:9799: gcc -E  conftest.c
conftest.c:23:28: error: ac_nonexistent.h: No such file or directory
configure:9805: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
|=20
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "zlib"
| #define VERSION "1.1.4"
| #define STDC_HEADERS 1
| #define HAVE_SYS_TYPES_H 1
| #define HAVE_SYS_STAT_H 1
| #define HAVE_STDLIB_H 1
| #define HAVE_STRING_H 1
| #define HAVE_MEMORY_H 1
| #define HAVE_STRINGS_H 1
| #define HAVE_INTTYPES_H 1
| #define HAVE_STDINT_H 1
| #define HAVE_UNISTD_H 1
| #define HAVE_DLFCN_H 1
| #define LT_OBJDIR ".libs/"
| /* end confdefs.h.  */
| #include <ac_nonexistent.h>
configure:9880: checking for stdlib.h
configure:9885: result: yes
configure:9880: checking for unistd.h
configure:9885: result: yes
configure:10029: checking for getpagesize
configure:10122: result: yes
configure:10132: checking for working mmap
configure:10296: result: yes
configure:10313: checking for memcpy
configure:10406: result: yes
configure:10313: checking for strerror
configure:10406: result: yes
configure:10505: checking for unistd.h
configure:10510: result: yes
configure:10844: creating ./config.status

## ---------------------- ##
## Running config.status. ##
## ---------------------- ##

This file was extended by config.status, which was
generated by GNU Autoconf 2.59.  Invocation command line was

  CONFIG_FILES    =3D=20
  CONFIG_HEADERS  =3D=20
  CONFIG_LINKS    =3D=20
  CONFIG_COMMANDS =3D=20
  $ ./config.status=20

on ubuntu

config.status:907: creating Makefile
config.status:1083: executing default-1 commands

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv___va_copy=3Dyes
ac_cv_af_unix_large_dgram=3Dyes
ac_cv_alignof_CORBA_boolean=3D1
ac_cv_alignof_CORBA_char=3D1
ac_cv_alignof_CORBA_double=3D4
ac_cv_alignof_CORBA_float=3D4
ac_cv_alignof_CORBA_long=3D4
ac_cv_alignof_CORBA_long_double=3D4
ac_cv_alignof_CORBA_long_long=3D4
ac_cv_alignof_CORBA_octet=3D1
ac_cv_alignof_CORBA_pointer=3D4
ac_cv_alignof_CORBA_short=3D2
ac_cv_alignof_CORBA_struct=3D4
ac_cv_alignof_CORBA_wchar=3D2
ac_cv_build=3Di686-pc-linux-gnu
ac_cv_build_alias=3Di686-linux
ac_cv_c_bigendian=3Dno
ac_cv_c_compiler_gnu=3Dyes
ac_cv_c_littleendian=3Dyes
ac_cv_c_long_double=3Dyes
ac_cv_check_sjlj=3Dssjlj
ac_cv_conv_longlong_to_float=3Dyes
ac_cv_dirent_have_space_d_name=3Dyes
ac_cv_env_CPPFLAGS_set=3D
ac_cv_env_CPPFLAGS_value=3D
ac_cv_env_CPP_set=3Dset
ac_cv_env_CPP_value=3D'gcc -E'
ac_cv_env_build_alias_set=3Dset
ac_cv_env_build_alias_value=3Di686-linux
ac_cv_env_host_alias_set=3Dset
ac_cv_env_host_alias_value=3Di686-linux
ac_cv_env_target_alias_set=3Dset
ac_cv_env_target_alias_value=3Darm-angstrom-linux-gnueabi
ac_cv_epoll_works=3Dyes
ac_cv_exeext=3D
ac_cv_file__dev_random=3Dyes
ac_cv_file__dev_zero=3Dyes
ac_cv_file__usr_share_X11_sgml_defs_ent=3Dno
ac_cv_file_lib_src_libmad_frame_h=3Dno
ac_cv_fread_reads_directories=3Dyes
ac_cv_func___va_copy=3Dyes
ac_cv_func_fnmatch_works=3Dyes
ac_cv_func_getaddrinfo=3Dyes
ac_cv_func_getpagesize=3Dyes
ac_cv_func_getpgrp_void=3Dyes
ac_cv_func_getpwuid_r=3Dyes
ac_cv_func_lstat_dereferences_slashed_symlink=3Dyes
ac_cv_func_lstat_empty_string_bug=3Dno
ac_cv_func_malloc_0_nonnull=3Dyes
ac_cv_func_malloc_works=3Dyes
ac_cv_func_memcmp_working=3Dyes
ac_cv_func_memcpy=3Dyes
ac_cv_func_mmap_fixed_mapped=3Dyes
ac_cv_func_posix_getgrgid_r=3Dyes
ac_cv_func_posix_getpwnam_r=3Dyes
ac_cv_func_posix_getpwuid_r=3Dyes
ac_cv_func_printf_unix98=3Dyes
ac_cv_func_pthread_attr_getstack=3Dyes
ac_cv_func_pthread_key_delete=3Dyes
ac_cv_func_realloc_0_nonnull=3Dyes
ac_cv_func_setpgrp_void=3Dyes
ac_cv_func_setresuid=3Dyes
ac_cv_func_setvbuf_reversed=3Dno
ac_cv_func_snprintf_c99=3Dyes
ac_cv_func_stat_empty_string_bug=3Dno
ac_cv_func_stat_ignores_trailing_slash=3Dno
ac_cv_func_strerror=3Dyes
ac_cv_func_va_copy=3Dyes
ac_cv_func_vsnprintf_c99=3Dyes
ac_cv_have_abstract_sockets=3Dyes
ac_cv_have_accrights_in_msghdr=3Dno
ac_cv_have_broken_snprintf=3Dno
ac_cv_have_control_in_msghdr=3Dyes
ac_cv_have_decl_sys_siglist=3Dyes
ac_cv_have_openpty_ctty_bug=3Dyes
ac_cv_have_space_d_name_in_struct_dirent=3Dyes
ac_cv_header_dlfcn_h=3Dyes
ac_cv_header_inttypes_h=3Dyes
ac_cv_header_memory_h=3Dyes
ac_cv_header_netinet_sctp_h=3Dno
ac_cv_header_netinet_sctp_uio_h=3Dno
ac_cv_header_stdc=3Dyes
ac_cv_header_stdint_h=3Dyes
ac_cv_header_stdlib_h=3Dyes
ac_cv_header_string_h=3Dyes
ac_cv_header_strings_h=3Dyes
ac_cv_header_sys_stat_h=3Dyes
ac_cv_header_sys_types_h=3Dyes
ac_cv_header_unistd_h=3Dyes
ac_cv_host=3Di686-pc-linux-gnu
ac_cv_host_alias=3Di686-linux
ac_cv_lbl_unaligned_fail=3Dno
ac_cv_libiconv_utf8=3Dyes
ac_cv_libnet_endianess=3Dlil
ac_cv_linux_vers=3D2
ac_cv_need_trio=3Dno
ac_cv_objext=3Do
ac_cv_path_ESD_CONFIG=3Dno
ac_cv_pread=3Dno
ac_cv_prog_AR=3Dar
ac_cv_prog_AWK=3Dgawk
ac_cv_prog_CC=3D'gcc '
ac_cv_prog_CPP=3D'gcc -E'
ac_cv_prog_RANLIB=3Dranlib
ac_cv_prog_STRIP=3Dstrip
ac_cv_prog_cc_g=3Dyes
ac_cv_prog_cc_stdc=3D
ac_cv_prog_egrep=3D'grep -E'
ac_cv_prog_fgrep=3D'grep -F'
ac_cv_prog_make_make_set=3Dyes
ac_cv_pwrite=3Dno
ac_cv_sctp=3Dno
ac_cv_sizeof_char=3D1
ac_cv_sizeof_char_p=3D4
ac_cv_sizeof_float=3D4
ac_cv_sizeof_int=3D4
ac_cv_sizeof_int_p=3D4
ac_cv_sizeof_long=3D4
ac_cv_sizeof_long_long=3D8
ac_cv_sizeof_long_p=3D4
ac_cv_sizeof_off_t=3D4
ac_cv_sizeof_short=3D2
ac_cv_sizeof_size_t=3D4
ac_cv_sizeof_ssize_t=3D4
ac_cv_sizeof_unsigned_char=3D1
ac_cv_sizeof_unsigned_char_p=3D4
ac_cv_sizeof_unsigned_int=3D4
ac_cv_sizeof_unsigned_long=3D4
ac_cv_sizeof_unsigned_long_long=3D8
ac_cv_sizeof_unsigned_short=3D2
ac_cv_sizeof_void_p=3D4
ac_cv_sizeof_wchar_t=3D4
ac_cv_sys_linker_h=3Dno
ac_cv_sys_restartable_syscalls=3Dyes
ac_cv_target=3Darm-angstrom-linux-gnueabi
ac_cv_target_alias=3Darm-angstrom-linux-gnueabi
ac_cv_type_struct_timespec=3Dyes
ac_cv_type_uid_t=3D'{ac_cv_type_uid_t=3Dyes}'
ac_cv_uchar=3Dno
ac_cv_uint=3Dyes
ac_cv_ulong=3Dyes
ac_cv_ushort=3Dyes
ac_cv_va_copy=3Dyes
ac_cv_va_val_copy=3Dyes
am_cv_CC_dependencies_compiler_type=3Dgcc3
am_cv_func_working_getline=3Dyes
am_cv_scanf_lld=3Dyes
apr_cv_process_shared_works=3Dno
apr_cv_tcp_nodelay_with_cork=3Dyes
bash_cv_dup2_broken=3Dno
bash_cv_func_sigsetjmp=3Dmissing
bash_cv_func_strcoll_broken=3Dno
bash_cv_getcwd_calls_popen=3Dno
bash_cv_getenv_redef=3Dyes
bash_cv_have_mbstate_t=3Dyes
bash_cv_job_control_missing=3Dpresent
bash_cv_must_reinstall_sighandlers=3Dno
bash_cv_opendir_not_robust=3Dno
bash_cv_pgrp_pipe=3Dno
bash_cv_printf_a_format=3Dyes
bash_cv_sys_named_pipes=3Dpresent
bash_cv_sys_siglist=3Dyes
bash_cv_type_rlimit=3Drlim_t
bash_cv_ulimit_maxfds=3Dyes
bash_cv_under_sys_siglist=3Dyes
bash_cv_unusable_rtsigs=3Dno
cvs_cv_func_printf_ptr=3Dyes
db_cv_align_t=3D'unsigned long long'
db_cv_alignp_t=3D'unsigned long'
db_cv_fcntl_f_setfd=3Dyes
db_cv_mutex=3Dx86/gcc-assembly
db_cv_path_ar=3D/usr/bin/ar
db_cv_path_chmod=3D/bin/chmod
db_cv_path_cp=3D/bin/cp
db_cv_path_ln=3D/bin/ln
db_cv_path_mkdir=3D/bin/mkdir
db_cv_path_ranlib=3D/usr/bin/ranlib
db_cv_path_rm=3D/bin/rm
db_cv_path_sh=3D/bin/sh
db_cv_path_strip=3D/usr/bin/strip
db_cv_posixmutexes=3Dno
db_cv_sprintf_count=3Dyes
db_cv_uimutexes=3Dno
dpkg_cv___va_copy=3Dyes
dpkg_cv_va_copy=3Dyes
ettercap_cv_type_socklen_t=3Dyes
fu_cv_sys_stat_statfs2_bsize=3Dyes
glib_cv___va_copy=3Dyes
glib_cv_compliant_posix_memalign=3D1
glib_cv_has__inline=3Dyes
glib_cv_has__inline__=3Dyes
glib_cv_hasinline=3Dyes
glib_cv_long_long_format=3Dll
glib_cv_rtldglobal_broken=3Dyes
glib_cv_sane_realloc=3Dyes
glib_cv_sizeof_gmutex=3D24
glib_cv_sizeof_system_thread=3D4
glib_cv_stack_grows=3Dno
glib_cv_strlcpy=3Dno
glib_cv_sys_pthread_cond_timedwait_posix=3Dyes
glib_cv_sys_pthread_getspecific_posix=3Dyes
glib_cv_sys_pthread_mutex_trylock_posix=3Dyes
glib_cv_uscore=3Dno
glib_cv_use_pid_surrogate=3Dyes
glib_cv_va_copy=3Dyes
glib_cv_va_val_copy=3Dyes
jm_cv_func_gettimeofday_clobber=3Dno
jm_cv_func_working_readdir=3Dyes
lf_cv_sane_realloc=3Dyes
lftp_cv___va_copy=3Dyes
lftp_cv_va_copy=3Dno
libIDL_cv_long_long_format=3Dll
lt_cv_deplibs_check_method=3Dpass_all
lt_cv_file_magic_cmd=3D'$MAGIC_CMD'
lt_cv_file_magic_test_file=3D
lt_cv_ld_reload_flag=3D-r
lt_cv_nm_interface=3D'BSD nm'
lt_cv_objdir=3D.libs
lt_cv_path_LD=3Dld
lt_cv_path_NM=3Dnm
lt_cv_path_SED=3D/bin/sed
lt_cv_prog_compiler_c_o=3Dyes
lt_cv_prog_compiler_rtti_exceptions=3Dno
lt_cv_prog_gnu_ld=3Dyes
lt_cv_sys_global_symbol_pipe=3D'sed -n -e '\''s/^.*[	 ]\([ABCDGIRSTW][ABCDG=
IRSTW]*\)[	 ][	 ]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p'\'''
lt_cv_sys_global_symbol_to_c_name_address=3D'sed -n -e '\''s/^: \([^ ]*\) $=
/  {\"\1\", (void *) 0},/p'\'' -e '\''s/^[ABCDGIRSTW]* \([^ ]*\) \([^ ]*\)$=
/  {"\2", (void *) \&\2},/p'\'''
lt_cv_sys_global_symbol_to_cdecl=3D'sed -n -e '\''s/^T .* \(.*\)$/extern in=
t \1();/p'\'' -e '\''s/^[ABCDGIRSTW]* .* \(.*\)$/extern char \1;/p'\'''
lt_cv_sys_max_cmd_len=3D805306365
mono_cv_sizeof_sunpath=3D108
mono_cv_uscore=3Dno
mr_cv_target_elf=3Dyes
mysql_cv_func_atomic_add=3Dyes
mysql_cv_func_atomic_sub=3Dyes
php_cv_lib_cookie_io_functions_use_off64_t=3Dyes
racoon_cv_bug_getaddrinfo=3Dno
rd_cv_ieee_works=3Dyes
rpppoe_cv_pack_bitfields=3Drev
rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno
rsync_cv_HAVE_BROKEN_READDIR=3Dno
rsync_cv_HAVE_C99_VSNPRINTF=3Dyes
rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
rsync_cv_HAVE_LONGLONG=3Dyes
rsync_cv_HAVE_OFF64_T=3Dno
rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes
rsync_cv_HAVE_SHORT_INO_T=3Dno
rsync_cv_HAVE_SOCKETPAIR=3Dyes
rsync_cv_HAVE_UNSIGNED_CHAR=3Dno
rsync_cv_REPLACE_INET_ATON=3Dno
rsync_cv_REPLACE_INET_NTOA=3Dno
samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
samba_cv_HAVE_IFACE_AIX=3Dno
samba_cv_HAVE_IFACE_IFCONF=3Dyes
samba_cv_HAVE_IFACE_IFREQ=3Dyes
samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3Dno
screen_cv_sys_bcopy_overlap=3Dno
screen_cv_sys_fifo_broken_impl=3Dyes
screen_cv_sys_fifo_usable=3Dyes
screen_cv_sys_memcpy_overlap=3Dno
screen_cv_sys_memmove_overlap=3Dno
screen_cv_sys_select_broken_retval=3Dno
screen_cv_sys_sockets_nofs=3Dno
screen_cv_sys_sockets_usable=3Dyes
screen_cv_sys_terminfo_used=3Dyes
slrn_cv___va_copy=3Dyes
slrn_cv_va_copy=3Dno
slrn_cv_va_val_copy=3Dyes
sudo_cv_uid_t_len=3D10
utils_cv_sys_open_max=3D1015

## ----------------- ##
## Output variables. ##
## ----------------- ##

ACLOCAL=3D'${SHELL} /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cr=
oss-4.3.3-r7.1/gcc-4.3.3/missing --run aclocal-1.9'
AMDEPBACKSLASH=3D'\'
AMDEP_FALSE=3D'#'
AMDEP_TRUE=3D''
AMTAR=3D'${SHELL} /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cros=
s-4.3.3-r7.1/gcc-4.3.3/missing --run tar'
AR=3D'ar'
AUTOCONF=3D'${SHELL} /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-c=
ross-4.3.3-r7.1/gcc-4.3.3/missing --run autoconf'
AUTOHEADER=3D'${SHELL} /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc=
-cross-4.3.3-r7.1/gcc-4.3.3/missing --run autoheader'
AUTOMAKE=3D'${SHELL} /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-c=
ross-4.3.3-r7.1/gcc-4.3.3/missing --run automake-1.9'
AWK=3D'gawk'
CC=3D'gcc '
CCDEPMODE=3D'depmode=3Dgcc3'
CFLAGS=3D'-isystem/OE/build/tmp/staging/i686-linux/usr/include -O2'
COMPPATH=3D'.'
CPP=3D'gcc -E'
CPPFLAGS=3D''
CYGPATH_W=3D'echo'
DEFS=3D'-DPACKAGE_NAME=3D\"\" -DPACKAGE_TARNAME=3D\"\" -DPACKAGE_VERSION=3D=
\"\" -DPACKAGE_STRING=3D\"\" -DPACKAGE_BUGREPORT=3D\"\" -DPACKAGE=3D\"zlib\=
" -DVERSION=3D\"1.1.4\" -DSTDC_HEADERS=3D1 -DHAVE_SYS_TYPES_H=3D1 -DHAVE_SY=
S_STAT_H=3D1 -DHAVE_STDLIB_H=3D1 -DHAVE_STRING_H=3D1 -DHAVE_MEMORY_H=3D1 -D=
HAVE_STRINGS_H=3D1 -DHAVE_INTTYPES_H=3D1 -DHAVE_STDINT_H=3D1 -DHAVE_UNISTD_=
H=3D1 -DHAVE_DLFCN_H=3D1 -DLT_OBJDIR=3D\".libs/\" -DHAVE_STDLIB_H=3D1 -DHAV=
E_UNISTD_H=3D1 -DHAVE_GETPAGESIZE=3D1 -DHAVE_MMAP=3D1 -DHAVE_MEMCPY=3D1 -DH=
AVE_STRERROR=3D1 -DHAVE_UNISTD_H=3D1 '
DEPDIR=3D'.deps'
DUMPBIN=3D''
ECHO_C=3D''
ECHO_N=3D'-n'
ECHO_T=3D''
EGREP=3D'grep -E'
EXEEXT=3D''
FGREP=3D'grep -F'
GREP=3D'grep'
INSTALL_DATA=3D'/usr/bin/install -c -m 644'
INSTALL_PROGRAM=3D'/usr/bin/install -c'
INSTALL_SCRIPT=3D'/usr/bin/install -c'
INSTALL_STRIP_PROGRAM=3D'${SHELL} $(install_sh) -c -s'
LD=3D'ld'
LIBOBJS=3D''
LIBS=3D''
LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
LN_S=3D'ln -s'
LTLIBOBJS=3D''
MAINT=3D'#'
MAINTAINER_MODE_FALSE=3D''
MAINTAINER_MODE_TRUE=3D'#'
MAKEINFO=3D'makeinfo --split-size=3D5000000'
NM=3D'nm'
OBJEXT=3D'o'
PACKAGE=3D'zlib'
PACKAGE_BUGREPORT=3D''
PACKAGE_NAME=3D''
PACKAGE_STRING=3D''
PACKAGE_TARNAME=3D''
PACKAGE_VERSION=3D''
PATH_SEPARATOR=3D':'
RANLIB=3D'ranlib'
SED=3D'/bin/sed'
SET_MAKE=3D''
SHELL=3D'/bin/sh'
STRIP=3D'strip'
TARGET_LIBRARY_FALSE=3D''
TARGET_LIBRARY_TRUE=3D'#'
VERSION=3D'1.1.4'
ac_ct_AR=3D''
ac_ct_CC=3D''
ac_ct_DUMPBIN=3D''
ac_ct_RANLIB=3D''
ac_ct_STRIP=3D''
am__fastdepCC_FALSE=3D'#'
am__fastdepCC_TRUE=3D''
am__include=3D'include'
am__leading_dot=3D'.'
am__quote=3D''
am__tar=3D'${AMTAR} chof - "$$tardir"'
am__untar=3D'${AMTAR} xf -'
bindir=3D'/OE/build/tmp/cross/armv7a/bin'
build=3D'i686-pc-linux-gnu'
build_alias=3D'i686-linux'
build_cpu=3D'i686'
build_os=3D'linux-gnu'
build_vendor=3D'pc'
datadir=3D'/OE/build/tmp/cross/armv7a/share'
exec_prefix=3D'/OE/build/tmp/cross/armv7a'
host=3D'i686-pc-linux-gnu'
host_alias=3D'i686-linux'
host_cpu=3D'i686'
host_os=3D'linux-gnu'
host_vendor=3D'pc'
includedir=3D'/OE/build/tmp/cross/armv7a/include'
infodir=3D'/OE/build/tmp/cross/armv7a/share/info'
install_sh=3D'/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.=
3.3-r7.1/gcc-4.3.3/install-sh'
libdir=3D'/OE/build/tmp/cross/armv7a/lib'
libexecdir=3D'/OE/build/tmp/cross/armv7a/libexec'
localstatedir=3D'/OE/build/tmp/cross/armv7a/var'
lt_ECHO=3D'echo'
mandir=3D'/OE/build/tmp/cross/armv7a/share/man'
mkdir_p=3D'mkdir -p --'
mkinstalldirs=3D'/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross=
-4.3.3-r7.1/gcc-4.3.3/mkinstalldirs'
multi_basedir=3D'/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross=
-4.3.3-r7.1/gcc-4.3.3/zlib/..'
oldincludedir=3D'/OE/build/tmp/cross/armv7a/include'
prefix=3D'/OE/build/tmp/cross/armv7a'
program_transform_name=3D's,^,arm-angstrom-linux-gnueabi-,'
sbindir=3D'/OE/build/tmp/cross/armv7a/bin'
sharedstatedir=3D'/OE/build/tmp/cross/armv7a/com'
sysconfdir=3D'/OE/build/tmp/cross/armv7a/etc'
target=3D'arm-angstrom-linux-gnueabi'
target_alias=3D'arm-angstrom-linux-gnueabi'
target_all=3D'libzgcj.la'
target_cpu=3D'arm'
target_os=3D'linux-gnueabi'
target_vendor=3D'angstrom'
toolexecdir=3D'$(libdir)/gcc-lib/$(target_alias)'
toolexeclibdir=3D'$(libdir)/../lib'

## ----------- ##
## confdefs.h. ##
## ----------- ##

#define HAVE_DLFCN_H 1
#define HAVE_GETPAGESIZE 1
#define HAVE_INTTYPES_H 1
#define HAVE_MEMCPY 1
#define HAVE_MEMORY_H 1
#define HAVE_MMAP 1
#define HAVE_STDINT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRERROR 1
#define HAVE_STRINGS_H 1
#define HAVE_STRING_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_UNISTD_H 1
#define HAVE_UNISTD_H 1
#define HAVE_UNISTD_H 1
#define LT_OBJDIR ".libs/"
#define PACKAGE "zlib"
#define PACKAGE_BUGREPORT ""
#define PACKAGE_NAME ""
#define PACKAGE_STRING ""
#define PACKAGE_TARNAME ""
#define PACKAGE_VERSION ""
#define STDC_HEADERS 1
#define VERSION "1.1.4"

configure: exit 1

--Apple-Mail-25--457839634
Content-Disposition: attachment;
	filename=config.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="config.log"
Content-Transfer-Encoding: quoted-printable

This file contains any messages produced by compilers while
running configure, to aid debugging if configure makes a mistake.

It was created by configure, which was
generated by GNU Autoconf 2.59.  Invocation command line was

  $ /OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4.3.3-r7.1/g=
cc-4.3.3/configure --build=3Di686-linux --host=3Di686-linux --target=3Darm-=
angstrom-linux-gnueabi --prefix=3D/OE/build/tmp/cross/armv7a --exec_prefix=
=3D/OE/build/tmp/cross/armv7a --bindir=3D/OE/build/tmp/cross/armv7a/bin --s=
bindir=3D/OE/build/tmp/cross/armv7a/bin --libexecdir=3D/OE/build/tmp/cross/=
armv7a/libexec --datadir=3D/OE/build/tmp/cross/armv7a/share --sysconfdir=3D=
/OE/build/tmp/cross/armv7a/etc --sharedstatedir=3D/OE/build/tmp/cross/armv7=
a/com --localstatedir=3D/OE/build/tmp/cross/armv7a/var --libdir=3D/OE/build=
/tmp/cross/armv7a/lib --includedir=3D/OE/build/tmp/cross/armv7a/include --o=
ldincludedir=3D/OE/build/tmp/cross/armv7a/include --infodir=3D/OE/build/tmp=
/cross/armv7a/share/info --mandir=3D/OE/build/tmp/cross/armv7a/share/man --=
with-gnu-ld --enable-shared --enable-target-optspace --enable-languages=3Dc=
,c++,objc,fortran,java --enable-threads=3Dposix --enable-multilib --enable-=
c99 --enable-long-long --enable-symvers=3Dgnu --enable-libstdcxx-pch --prog=
ram-prefix=3Darm-angstrom-linux-gnueabi- --enable-cheaders=3Dc_std --enable=
-libssp --disable-bootstrap --disable-libgomp --disable-libmudflap --with-l=
ocal-prefix=3D/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr --wit=
h-gxx-include-dir=3D/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi//us=
r/include/c++ --with-sysroot=3D/OE/build/tmp/staging/armv7a-angstrom-linux-=
gnueabi --with-build-sysroot=3D/OE/build/tmp/staging/armv7a-angstrom-linux-=
gnueabi --enable-cheaders=3Dc_std --disable-libunwind-exceptions --with-mpf=
r=3D/OE/build/tmp/staging/i686-linux/usr --enable-__cxa_atexit

## --------- ##
## Platform. ##
## --------- ##

hostname =3D ubuntu
uname -m =3D i686
uname -r =3D 2.6.31-19-generic
uname -s =3D Linux
uname -v =3D #56-Ubuntu SMP Thu Jan 28 01:26:53 UTC 2010

/usr/bin/uname -p =3D unknown
/bin/uname -X     =3D unknown

/bin/arch              =3D unknown
/usr/bin/arch -k       =3D unknown
/usr/convex/getsysinfo =3D unknown
hostinfo               =3D unknown
/bin/machine           =3D unknown
/usr/bin/oslevel       =3D unknown
/bin/universe          =3D unknown

PATH: /OE/build/tmp/staging/i686-linux/usr/bin/armv7a-linux
PATH: /OE/build/tmp/staging/i686-linux/usr/bin/armv7a-angstrom-linux-gnueab=
i
PATH: /OE/build/tmp/staging/i686-linux/usr/sbin
PATH: /OE/build/tmp/staging/i686-linux/usr/bin
PATH: /OE/build/tmp/cross/armv7a//bin
PATH: /OE/build/tmp/staging/i686-linux/sbin
PATH: /OE/build/tmp/staging/i686-linux/bin
PATH: /usr/bin
PATH: /usr/local/sbin
PATH: /usr/local/bin
PATH: /usr/sbin
PATH: /usr/bin
PATH: /sbin
PATH: /bin
PATH: /usr/games


## ----------- ##
## Core tests. ##
## ----------- ##

configure:1372: loading site script /OE/ai.openembedded.dev/site/endian-lit=
tle
| ac_cv_c_littleendian=3D${ac_cv_c_littleendian=3Dyes}
| ac_cv_c_bigendian=3D${ac_cv_c_bigendian=3Dno}
|=20
| # libnet
| ac_cv_libnet_endianess=3D${ac_cv_libnet_endianess=3Dlil}
|=20
configure:1372: loading site script /OE/ai.openembedded.dev/site/common-lin=
ux
| # apr
| ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
|=20
| # samba
| samba_cv_HAVE_IFACE_AIX=3D${samba_cv_HAVE_IFACE_AIX=3Dno}
| samba_cv_HAVE_IFACE_IFCONF=3D${samba_cv_HAVE_IFACE_IFCONF=3Dyes}
| samba_cv_HAVE_IFACE_IFREQ=3D${samba_cv_HAVE_IFACE_IFREQ=3Dyes}
| samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3D${samba_cv_HAVE_IRIX_SPECIFIC_=
CAPABILITIES=3Dno}
|=20
| # coreutils
| fu_cv_sys_stat_statfs2_bsize=3D${fu_cv_sys_stat_statfs2_bsize=3Dyes}
|=20
| # bash
| bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
| bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandlers=
=3Dno}
| bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
| bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
| bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
| bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
| bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
| bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
| bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
| bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
| bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
| bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
| bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
| bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
configure:1372: loading site script /OE/ai.openembedded.dev/site/common-gli=
bc
| # general
| ac_cv_have_decl_sys_siglist=3D${ac_cv_have_decl_sys_siglist=3Dyes}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
| ac_cv_type_uid_t=3D{ac_cv_type_uid_t=3Dyes}
|=20
| # bash
| bash_cv_under_sys_siglist=3D${bash_cv_under_sys_siglist=3Dyes}
| bash_cv_sys_siglist=3D${bash_cv_sys_siglist=3Dyes}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # glib
| glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
| ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
| ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
| ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
| glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=3D1=
}
| glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
|=20
| #dbus-glib
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
|=20
| # gnucash
| am_cv_scanf_lld=3D${am_cv_scanf_lld=3Dyes}
|=20
| # mono
| mono_cv_uscore=3D${mono_cv_uscore=3Dno}
|=20
| # guile
| ac_cv_func_pthread_attr_getstack=3D${ac_cv_func_pthread_attr_getstack=3Dy=
es}
|=20
| #gcc-zlib
| ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
| ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
| ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
|=20
| # squid
| ac_cv_af_unix_large_dgram=3D${ac_cv_af_unix_large_dgram=3Dyes}
| ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
| ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
| ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
| ac_cv_epoll_works=3D${ac_cv_epoll_works=3Dyes}
|=20
| #git
| ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes}
| # pth
| ac_cv_check_sjlj=3Dssjlj
|=20
| # va_copy and _va_copy
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
|=20
configure:1372: loading site script /OE/ai.openembedded.dev/site/ix86-commo=
n
| ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
| ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
| ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D4}
| ac_cv_sizeof_unsigned_char_p=3D${ac_cv_sizeof_unsigned_char_p=3D4}
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
| ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
| ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
| ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D4}
| ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
| ac_cv_sizeof_unsigned_long_long=3D${ac_cv_sizeof_unsigned_long_long=3D8}
| ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
| ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
| ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
| ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
| ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
| ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
| ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
| ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
|=20
| ac_cv_func_getpgrp_void=3D${ac_cv_func_getpgrp_void=3Dyes}
| ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
| ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_derefe=
rences_slashed_symlink=3Dyes}
| ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=
=3Dno}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_malloc_works=3D${ac_cv_func_malloc_works=3Dyes}
| ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
| ac_cv_func_setpgrp_void=3D${ac_cv_func_setpgrp_void=3Dyes}
| ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
| ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3Dn=
o}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_traili=
ng_slash=3Dno}
|=20
| ac_cv_header_netinet_sctp_h=3D${ac_cv_header_netinet_sctp_h=3Dno}
| ac_cv_header_netinet_sctp_uio_h=3D${ac_cv_header_netinet_sctp_uio_h=3Dno}
| ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
| ac_cv_sctp=3D${ac_cv_sctp=3Dno}
|=20
| apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
| apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
|=20
| ac_cv_path_ESD_CONFIG=3Dno
| lf_cv_sane_realloc=3Dyes
| jm_cv_func_gettimeofday_clobber=3Dno
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
| bf_lsbf=3D1
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # audacity
| ac_cv_file_lib_src_libmad_frame_h=3D${ac_cv_file_lib_src_libmad_frame_h=
=3Dno}
|=20
| # bash
| ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
| bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # cvs
| cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
|=20
| # db
| db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
| db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
| db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
| db_cv_mutex=3D${db_cv_mutex=3Dx86/gcc-assembly}
| db_cv_path_ar=3D${db_cv_path_ar=3D/usr/bin/ar}
| db_cv_path_chmod=3D${db_cv_path_chmod=3D/bin/chmod}
| db_cv_path_cp=3D${db_cv_path_cp=3D/bin/cp}
| db_cv_path_ln=3D${db_cv_path_ln=3D/bin/ln}
| db_cv_path_mkdir=3D${db_cv_path_mkdir=3D/bin/mkdir}
| db_cv_path_ranlib=3D${db_cv_path_ranlib=3D/usr/bin/ranlib}
| db_cv_path_rm=3D${db_cv_path_rm=3D/bin/rm}
| db_cv_path_sh=3D${db_cv_path_sh=3D/bin/sh}
| db_cv_path_strip=3D${db_cv_path_strip=3D/usr/bin/strip}
| db_cv_posixmutexes=3D${db_cv_posixmutexes=3Dno}
| db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
| db_cv_uimutexes=3D${db_cv_uimutexes=3Dno}
|=20
| # D-BUS
| ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
|=20
| dpkg_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| dpkg_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
|=20
| # ettercap
| ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
|=20
| # gettext
| am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
|=20
| # glib
| glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
| glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
| glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
| glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
| glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
| glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
| glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_tim=
edwait_posix=3Dyes}
| glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecific=
_posix=3Dyes}
| glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_try=
lock_posix=3Dyes}
| glib_cv_uscore=3D${glib_cv_uscore=3Dno}
| glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
| glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
| glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
| glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dyes}
|=20
| # glib-2.0
| glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
| utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
| ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
|=20
| # guile
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # intercom
| ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
|=20
| # ipsec-tools
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
| ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dyes}
| racoon_cv_bug_getaddrinfo=3D${racoon_cv_bug_getaddrinfo=3Dno}
|=20
| # jikes-native
| ac_cv_sizeof_wchar_t=3D4
|=20
| # lftp
| ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
| lftp_cv_va_copy=3D${lftp_cv_va_copy=3Dno}
| lftp_cv___va_copy=3D${lftp_cv___va_copy=3Dyes}
|=20
| # libidl
| libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
|=20
| # libnet=20
| ac_cv_lbl_unaligned_fail=3D${ac_cv_lbl_unaligned_fail=3Dno}
| ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
|=20
| # libxfce4util
| with_broken_putenv=3D${with_broken_putenv=3Dno}
|=20
| # mono
| cv_mono_sizeof_sunpath=3D108
| mono_cv_sizeof_sunpath=3D108
|=20
| # mysql
| mysql_cv_func_atomic_sub=3D${mysql_cv_func_atomic_sub=3Dyes}
| mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=3Dyes}
| ac_cv_conv_longlong_to_float=3D${ac_cv_conv_longlong_to_float=3Dyes}
|=20
| # ORBit2
| ac_cv_alignof_CORBA_boolean=3D1
| ac_cv_alignof_CORBA_char=3D1
| ac_cv_alignof_CORBA_double=3D4
| ac_cv_alignof_CORBA_float=3D4
| ac_cv_alignof_CORBA_long=3D4
| ac_cv_alignof_CORBA_long_double=3D4
| ac_cv_alignof_CORBA_long_long=3D4
| ac_cv_alignof_CORBA_octet=3D1
| ac_cv_alignof_CORBA_pointer=3D4
| ac_cv_alignof_CORBA_short=3D2
| ac_cv_alignof_CORBA_struct=3D4
| ac_cv_alignof_CORBA_wchar=3D2
| ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
|=20
| # p3scan
| ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dyes}
|=20
| # php
| ac_cv_pread=3D${ac_cv_pread=3Dno}
| ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
| php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_funct=
ions_use_off64_t=3Dyes}
|=20
| # rp-pppoe
| rpppoe_cv_pack_bitfields=3D${rpppoe_cv_pack_bitfields=3Drev}
|=20
| # rsync
| rsync_cv_HAVE_BROKEN_LARGEFILE=3D${rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno}
| rsync_cv_HAVE_SOCKETPAIR=3D${rsync_cv_HAVE_SOCKETPAIR=3Dyes}
| rsync_cv_HAVE_LONGLONG=3D${rsync_cv_HAVE_LONGLONG=3Dyes}
| rsync_cv_HAVE_OFF64_T=3D${rsync_cv_HAVE_OFF64_T=3Dno}
| rsync_cv_HAVE_SHORT_INO_T=3D${rsync_cv_HAVE_SHORT_INO_T=3Dno}
| rsync_cv_HAVE_UNSIGNED_CHAR=3D${rsync_cv_HAVE_UNSIGNED_CHAR=3Dno}
| rsync_cv_HAVE_BROKEN_READDIR=3D${rsync_cv_HAVE_BROKEN_READDIR=3Dno}
| rsync_cv_HAVE_GETTIMEOFDAY_TZ=3D${rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
| rsync_cv_HAVE_C99_VSNPRINTF=3D${rsync_cv_HAVE_C99_VSNPRINTF=3Dyes}
| rsync_cv_HAVE_SECURE_MKSTEMP=3D${rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes}
| rsync_cv_REPLACE_INET_NTOA=3D${rsync_cv_REPLACE_INET_NTOA=3Dno}
| rsync_cv_REPLACE_INET_ATON=3D${rsync_cv_REPLACE_INET_ATON=3Dno}
|=20
| # samba
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
|=20
| # screen
| screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
| screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
| screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
| screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes}
| screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
| screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
| screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
| screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
| screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
|=20
| # slrn
| slrn_cv___va_copy=3D${slrn_cv___va_copy=3Dyes}
| slrn_cv_va_copy=3D${slrn_cv_va_copy=3Dno}
| slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
|=20
| # ssh
| ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_dirent_have_space_d_na=
me=3Dyes}
| ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
| ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}
| ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
| ac_cv_type_struct_timespec=3D${ac_cv_type_struct_timespec=3Dyes}
| ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dyes}
|=20
| # startup-notification
| lf_cv_sane_realloc=3Dyes
|=20
| # sudo
| sudo_cv_uid_t_len=3D${sudo_cv_uid_t_len=3D10}
|=20
| # xffm
| jm_cv_func_working_readdir=3Dyes
|=20
| # xorg X11R7
| ac_cv_sys_linker_h=3D${ac_cv_sys_linker_h=3Dno}
| ac_cv_file__usr_share_X11_sgml_defs_ent=3D${ac_cv_file__usr_share_X11_sgm=
l_defs_ent=3Dno}
|=20
| # eds-dbus
| ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
|=20
| #dbus
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
configure:1372: loading site script /OE/ai.openembedded.dev/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # does compiler handle IEEE math?
| rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
configure:1372: loading site script /OE/ai.openembedded.dev/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # does compiler handle IEEE math?
| rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
configure:1372: loading site script /OE/ai.openembedded.dev/site/endian-lit=
tle
| ac_cv_c_littleendian=3D${ac_cv_c_littleendian=3Dyes}
| ac_cv_c_bigendian=3D${ac_cv_c_bigendian=3Dno}
|=20
| # libnet
| ac_cv_libnet_endianess=3D${ac_cv_libnet_endianess=3Dlil}
|=20
configure:1372: loading site script /OE/ai.openembedded.dev/site/common-lin=
ux
| # apr
| ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
|=20
| # samba
| samba_cv_HAVE_IFACE_AIX=3D${samba_cv_HAVE_IFACE_AIX=3Dno}
| samba_cv_HAVE_IFACE_IFCONF=3D${samba_cv_HAVE_IFACE_IFCONF=3Dyes}
| samba_cv_HAVE_IFACE_IFREQ=3D${samba_cv_HAVE_IFACE_IFREQ=3Dyes}
| samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3D${samba_cv_HAVE_IRIX_SPECIFIC_=
CAPABILITIES=3Dno}
|=20
| # coreutils
| fu_cv_sys_stat_statfs2_bsize=3D${fu_cv_sys_stat_statfs2_bsize=3Dyes}
|=20
| # bash
| bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
| bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandlers=
=3Dno}
| bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
| bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
| bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
| bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
| bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
| bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
| bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
| bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
| bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
| bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
| bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
| bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
configure:1372: loading site script /OE/ai.openembedded.dev/site/common-gli=
bc
| # general
| ac_cv_have_decl_sys_siglist=3D${ac_cv_have_decl_sys_siglist=3Dyes}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
| ac_cv_type_uid_t=3D{ac_cv_type_uid_t=3Dyes}
|=20
| # bash
| bash_cv_under_sys_siglist=3D${bash_cv_under_sys_siglist=3Dyes}
| bash_cv_sys_siglist=3D${bash_cv_sys_siglist=3Dyes}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # glib
| glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
| ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
| ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
| ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
| glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=3D1=
}
| glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
|=20
| #dbus-glib
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
|=20
| # gnucash
| am_cv_scanf_lld=3D${am_cv_scanf_lld=3Dyes}
|=20
| # mono
| mono_cv_uscore=3D${mono_cv_uscore=3Dno}
|=20
| # guile
| ac_cv_func_pthread_attr_getstack=3D${ac_cv_func_pthread_attr_getstack=3Dy=
es}
|=20
| #gcc-zlib
| ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
| ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
| ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
|=20
| # squid
| ac_cv_af_unix_large_dgram=3D${ac_cv_af_unix_large_dgram=3Dyes}
| ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
| ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
| ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
| ac_cv_epoll_works=3D${ac_cv_epoll_works=3Dyes}
|=20
| #git
| ac_cv_fread_reads_directories=3D${ac_cv_fread_reads_directories=3Dyes}
| # pth
| ac_cv_check_sjlj=3Dssjlj
|=20
| # va_copy and _va_copy
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
|=20
configure:1372: loading site script /OE/ai.openembedded.dev/site/ix86-commo=
n
| ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
| ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
| ac_cv_sizeof_char_p=3D${ac_cv_sizeof_char_p=3D4}
| ac_cv_sizeof_unsigned_char_p=3D${ac_cv_sizeof_unsigned_char_p=3D4}
| ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
| ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
| ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
| ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
| ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D4}
| ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
| ac_cv_sizeof_unsigned_long_long=3D${ac_cv_sizeof_unsigned_long_long=3D8}
| ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
| ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
| ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
| ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
| ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
| ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
| ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
| ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
|=20
| ac_cv_func_getpgrp_void=3D${ac_cv_func_getpgrp_void=3Dyes}
| ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
| ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_derefe=
rences_slashed_symlink=3Dyes}
| ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_bug=
=3Dno}
| ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
| ac_cv_func_malloc_works=3D${ac_cv_func_malloc_works=3Dyes}
| ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
| ac_cv_func_setpgrp_void=3D${ac_cv_func_setpgrp_void=3Dyes}
| ac_cv_func_setvbuf_reversed=3D${ac_cv_func_setvbuf_reversed=3Dno}
| ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=3Dn=
o}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_traili=
ng_slash=3Dno}
|=20
| ac_cv_header_netinet_sctp_h=3D${ac_cv_header_netinet_sctp_h=3Dno}
| ac_cv_header_netinet_sctp_uio_h=3D${ac_cv_header_netinet_sctp_uio_h=3Dno}
| ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
| ac_cv_sctp=3D${ac_cv_sctp=3Dno}
|=20
| apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
| apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
|=20
| ac_cv_path_ESD_CONFIG=3Dno
| lf_cv_sane_realloc=3Dyes
| jm_cv_func_gettimeofday_clobber=3Dno
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
| bf_lsbf=3D1
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # audacity
| ac_cv_file_lib_src_libmad_frame_h=3D${ac_cv_file_lib_src_libmad_frame_h=
=3Dno}
|=20
| # bash
| ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
| bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
|=20
| # clamav
| clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snprintf_=
long=3Dyes}
| clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
| clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
| ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
|=20
| # cvs
| cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
|=20
| # db
| db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
| db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
| db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
| db_cv_mutex=3D${db_cv_mutex=3Dx86/gcc-assembly}
| db_cv_path_ar=3D${db_cv_path_ar=3D/usr/bin/ar}
| db_cv_path_chmod=3D${db_cv_path_chmod=3D/bin/chmod}
| db_cv_path_cp=3D${db_cv_path_cp=3D/bin/cp}
| db_cv_path_ln=3D${db_cv_path_ln=3D/bin/ln}
| db_cv_path_mkdir=3D${db_cv_path_mkdir=3D/bin/mkdir}
| db_cv_path_ranlib=3D${db_cv_path_ranlib=3D/usr/bin/ranlib}
| db_cv_path_rm=3D${db_cv_path_rm=3D/bin/rm}
| db_cv_path_sh=3D${db_cv_path_sh=3D/bin/sh}
| db_cv_path_strip=3D${db_cv_path_strip=3D/usr/bin/strip}
| db_cv_posixmutexes=3D${db_cv_posixmutexes=3Dno}
| db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
| db_cv_uimutexes=3D${db_cv_uimutexes=3Dno}
|=20
| # D-BUS
| ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
|=20
| dpkg_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| dpkg_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
|=20
| # ettercap
| ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
|=20
| # gettext
| am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
|=20
| # glib
| glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
| glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
| glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
| glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
| glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
| glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
| glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond_tim=
edwait_posix=3Dyes}
| glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspecific=
_posix=3Dyes}
| glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex_try=
lock_posix=3Dyes}
| glib_cv_uscore=3D${glib_cv_uscore=3Dno}
| glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
| glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
| glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
| glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dyes}
|=20
| # glib-2.0
| glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
| utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1015}
| ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
| glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
| ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
|=20
| # guile
| ac_cv_sys_restartable_syscalls=3Dyes
| ac_cv_uchar=3D${ac_cv_uchar=3Dno}
| ac_cv_uint=3D${ac_cv_uint=3Dyes}
| ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
| ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
|=20
| # intercom
| ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
|=20
| # ipsec-tools
| ac_cv_va_copy=3D${ac_cv_va_copy=3Dno}
| ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
| ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dyes}
| racoon_cv_bug_getaddrinfo=3D${racoon_cv_bug_getaddrinfo=3Dno}
|=20
| # jikes-native
| ac_cv_sizeof_wchar_t=3D4
|=20
| # lftp
| ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
| lftp_cv_va_copy=3D${lftp_cv_va_copy=3Dno}
| lftp_cv___va_copy=3D${lftp_cv___va_copy=3Dyes}
|=20
| # libidl
| libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
|=20
| # libnet=20
| ac_cv_lbl_unaligned_fail=3D${ac_cv_lbl_unaligned_fail=3Dno}
| ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
|=20
| # libxfce4util
| with_broken_putenv=3D${with_broken_putenv=3Dno}
|=20
| # mono
| cv_mono_sizeof_sunpath=3D108
| mono_cv_sizeof_sunpath=3D108
|=20
| # mysql
| mysql_cv_func_atomic_sub=3D${mysql_cv_func_atomic_sub=3Dyes}
| mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=3Dyes}
| ac_cv_conv_longlong_to_float=3D${ac_cv_conv_longlong_to_float=3Dyes}
|=20
| # ORBit2
| ac_cv_alignof_CORBA_boolean=3D1
| ac_cv_alignof_CORBA_char=3D1
| ac_cv_alignof_CORBA_double=3D4
| ac_cv_alignof_CORBA_float=3D4
| ac_cv_alignof_CORBA_long=3D4
| ac_cv_alignof_CORBA_long_double=3D4
| ac_cv_alignof_CORBA_long_long=3D4
| ac_cv_alignof_CORBA_octet=3D1
| ac_cv_alignof_CORBA_pointer=3D4
| ac_cv_alignof_CORBA_short=3D2
| ac_cv_alignof_CORBA_struct=3D4
| ac_cv_alignof_CORBA_wchar=3D2
| ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
|=20
| # p3scan
| ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dyes}
|=20
| # php
| ac_cv_pread=3D${ac_cv_pread=3Dno}
| ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
| php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_funct=
ions_use_off64_t=3Dyes}
|=20
| # rp-pppoe
| rpppoe_cv_pack_bitfields=3D${rpppoe_cv_pack_bitfields=3Drev}
|=20
| # rsync
| rsync_cv_HAVE_BROKEN_LARGEFILE=3D${rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno}
| rsync_cv_HAVE_SOCKETPAIR=3D${rsync_cv_HAVE_SOCKETPAIR=3Dyes}
| rsync_cv_HAVE_LONGLONG=3D${rsync_cv_HAVE_LONGLONG=3Dyes}
| rsync_cv_HAVE_OFF64_T=3D${rsync_cv_HAVE_OFF64_T=3Dno}
| rsync_cv_HAVE_SHORT_INO_T=3D${rsync_cv_HAVE_SHORT_INO_T=3Dno}
| rsync_cv_HAVE_UNSIGNED_CHAR=3D${rsync_cv_HAVE_UNSIGNED_CHAR=3Dno}
| rsync_cv_HAVE_BROKEN_READDIR=3D${rsync_cv_HAVE_BROKEN_READDIR=3Dno}
| rsync_cv_HAVE_GETTIMEOFDAY_TZ=3D${rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
| rsync_cv_HAVE_C99_VSNPRINTF=3D${rsync_cv_HAVE_C99_VSNPRINTF=3Dyes}
| rsync_cv_HAVE_SECURE_MKSTEMP=3D${rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes}
| rsync_cv_REPLACE_INET_NTOA=3D${rsync_cv_REPLACE_INET_NTOA=3Dno}
| rsync_cv_REPLACE_INET_ATON=3D${rsync_cv_REPLACE_INET_ATON=3Dno}
|=20
| # samba
| samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
|=20
| # screen
| screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
| screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
| screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
| screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dyes}
| screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
| screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_retval=
=3Dno}
| screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
| screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
| screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
|=20
| # slrn
| slrn_cv___va_copy=3D${slrn_cv___va_copy=3Dyes}
| slrn_cv_va_copy=3D${slrn_cv_va_copy=3Dno}
| slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
|=20
| # ssh
| ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_dirent_have_space_d_na=
me=3Dyes}
| ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
| ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dno}
| ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
| ac_cv_type_struct_timespec=3D${ac_cv_type_struct_timespec=3Dyes}
| ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dyes}
|=20
| # startup-notification
| lf_cv_sane_realloc=3Dyes
|=20
| # sudo
| sudo_cv_uid_t_len=3D${sudo_cv_uid_t_len=3D10}
|=20
| # xffm
| jm_cv_func_working_readdir=3Dyes
|=20
| # xorg X11R7
| ac_cv_sys_linker_h=3D${ac_cv_sys_linker_h=3Dno}
| ac_cv_file__usr_share_X11_sgml_defs_ent=3D${ac_cv_file__usr_share_X11_sgm=
l_defs_ent=3Dno}
|=20
| # eds-dbus
| ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
|=20
| #dbus
| ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
configure:1372: loading site script /OE/ai.openembedded.dev/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # does compiler handle IEEE math?
| rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
configure:1372: loading site script /OE/ai.openembedded.dev/site/common
| # libelf
| mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
|=20
| # Normally kernels have /dev/random enabled
| ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
|=20
| # does compiler handle IEEE math?
| rd_cv_ieee_works=3D${rd_cv_ieee_works=3Dyes}
configure:1505: checking build system type
configure:1523: result: i686-pc-linux-gnu
configure:1558: checking host system type
configure:1572: result: i686-pc-linux-gnu
configure:1580: checking target system type
configure:1594: result: arm-angstrom-linux-gnueabi
configure:1637: checking for a BSD-compatible install
configure:1692: result: /usr/bin/install -c
configure:1703: checking whether ln works
configure:1725: result: yes
configure:1729: checking whether ln -s works
configure:1733: result: yes
configure:2847: checking for i686-linux-gcc
configure:2873: result: gcc=20
configure:3155: checking for C compiler version
configure:3158: gcc  --version </dev/null >&5
gcc (Ubuntu 4.4.1-4ubuntu9) 4.4.1
Copyright (C) 2009 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:3161: $? =3D 0
configure:3163: gcc  -v </dev/null >&5
Using built-in specs.
Target: i486-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Ubuntu 4.4.1-4ubu=
ntu9' --with-bugurl=3Dfile:///usr/share/doc/gcc-4.4/README.Bugs --enable-la=
nguages=3Dc,c++,fortran,objc,obj-c++ --prefix=3D/usr --enable-shared --enab=
le-multiarch --enable-linker-build-id --with-system-zlib --libexecdir=3D/us=
r/lib --without-included-gettext --enable-threads=3Dposix --with-gxx-includ=
e-dir=3D/usr/include/c++/4.4 --program-suffix=3D-4.4 --enable-nls --enable-=
clocale=3Dgnu --enable-libstdcxx-debug --enable-objc-gc --enable-targets=3D=
all --disable-werror --with-arch-32=3Di486 --with-tune=3Dgeneric --enable-c=
hecking=3Drelease --build=3Di486-linux-gnu --host=3Di486-linux-gnu --target=
=3Di486-linux-gnu
Thread model: posix
gcc version 4.4.1 (Ubuntu 4.4.1-4ubuntu9)=20
configure:3166: $? =3D 0
configure:3168: gcc  -V </dev/null >&5
gcc: '-V' option must have argument
configure:3171: $? =3D 1
configure:3194: checking for C compiler default output file name
configure:3197: gcc  -isystem/OE/build/tmp/staging/i686-linux/usr/include -=
O2  -L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/OE/build/tm=
p/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i686-linux/us=
r/lib -Wl,-O1 conftest.c  >&5
configure:3200: $? =3D 0
configure:3246: result: a.out
configure:3251: checking whether the C compiler works
configure:3257: ./a.out
configure:3260: $? =3D 0
configure:3277: result: yes
configure:3284: checking whether we are cross compiling
configure:3286: result: no
configure:3289: checking for suffix of executables
configure:3291: gcc  -o conftest -isystem/OE/build/tmp/staging/i686-linux/u=
sr/include -O2  -L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,=
/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i=
686-linux/usr/lib -Wl,-O1 conftest.c  >&5
configure:3294: $? =3D 0
configure:3319: result:=20
configure:3325: checking for suffix of object files
configure:3346: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:3349: $? =3D 0
configure:3371: result: o
configure:3375: checking whether we are using the GNU C compiler
configure:3399: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
configure:3405: $? =3D 0
configure:3409: test -z=20
			 || test ! -s conftest.err
configure:3412: $? =3D 0
configure:3415: test -s conftest.o
configure:3418: $? =3D 0
configure:3431: result: yes
configure:3437: checking whether gcc  accepts -g
configure:3458: gcc  -c -g  conftest.c >&5
configure:3464: $? =3D 0
configure:3468: test -z=20
			 || test ! -s conftest.err
configure:3471: $? =3D 0
configure:3474: test -s conftest.o
configure:3477: $? =3D 0
configure:3488: result: yes
configure:3505: checking for gcc  option to accept ANSI C
configure:3575: gcc   -c -isystem/OE/build/tmp/staging/i686-linux/usr/inclu=
de -O2  conftest.c >&5
configure:3581: $? =3D 0
configure:3585: test -z=20
			 || test ! -s conftest.err
configure:3588: $? =3D 0
configure:3591: test -s conftest.o
configure:3594: $? =3D 0
configure:3612: result: none needed
configure:3630: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2  conftest.c >&5
conftest.c:2: error: expected '=3D', ',', ';', 'asm' or '__attribute__' bef=
ore 'me'
configure:3636: $? =3D 1
configure: failed program was:
| #ifndef __cplusplus
|   choke me
| #endif
configure:3779: checking for i686-linux-g++
configure:3805: result: g++
configure:3863: checking for C++ compiler version
configure:3866: g++ --version </dev/null >&5
g++ (Ubuntu 4.4.1-4ubuntu9) 4.4.1
Copyright (C) 2009 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

configure:3869: $? =3D 0
configure:3871: g++ -v </dev/null >&5
Using built-in specs.
Target: i486-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Ubuntu 4.4.1-4ubu=
ntu9' --with-bugurl=3Dfile:///usr/share/doc/gcc-4.4/README.Bugs --enable-la=
nguages=3Dc,c++,fortran,objc,obj-c++ --prefix=3D/usr --enable-shared --enab=
le-multiarch --enable-linker-build-id --with-system-zlib --libexecdir=3D/us=
r/lib --without-included-gettext --enable-threads=3Dposix --with-gxx-includ=
e-dir=3D/usr/include/c++/4.4 --program-suffix=3D-4.4 --enable-nls --enable-=
clocale=3Dgnu --enable-libstdcxx-debug --enable-objc-gc --enable-targets=3D=
all --disable-werror --with-arch-32=3Di486 --with-tune=3Dgeneric --enable-c=
hecking=3Drelease --build=3Di486-linux-gnu --host=3Di486-linux-gnu --target=
=3Di486-linux-gnu
Thread model: posix
gcc version 4.4.1 (Ubuntu 4.4.1-4ubuntu9)=20
configure:3874: $? =3D 0
configure:3876: g++ -V </dev/null >&5
g++: '-V' option must have argument
configure:3879: $? =3D 1
configure:3882: checking whether we are using the GNU C++ compiler
configure:3906: g++ -c -isystem/OE/build/tmp/staging/i686-linux/usr/include=
 -O2  conftest.cc >&5
configure:3912: $? =3D 0
configure:3916: test -z=20
			 || test ! -s conftest.err
configure:3919: $? =3D 0
configure:3922: test -s conftest.o
configure:3925: $? =3D 0
configure:3938: result: yes
configure:3944: checking whether g++ accepts -g
configure:3965: g++ -c -g  conftest.cc >&5
configure:3971: $? =3D 0
configure:3975: test -z=20
			 || test ! -s conftest.err
configure:3978: $? =3D 0
configure:3981: test -s conftest.o
configure:3984: $? =3D 0
configure:3995: result: yes
configure:4037: g++ -c -isystem/OE/build/tmp/staging/i686-linux/usr/include=
 -O2  conftest.cc >&5
configure:4043: $? =3D 0
configure:4047: test -z=20
			 || test ! -s conftest.err
configure:4050: $? =3D 0
configure:4053: test -s conftest.o
configure:4056: $? =3D 0
configure:4082: g++ -c -isystem/OE/build/tmp/staging/i686-linux/usr/include=
 -O2  conftest.cc >&5
conftest.cc: In function 'int main()':
conftest.cc:13: error: 'exit' was not declared in this scope
configure:4088: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
|=20
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| /* end confdefs.h.  */
|=20
| int
| main ()
| {
| exit (42);
|   ;
|   return 0;
| }
configure:4037: g++ -c -isystem/OE/build/tmp/staging/i686-linux/usr/include=
 -O2  conftest.cc >&5
conftest.cc:9: error: 'void std::exit(int)' should have been declared insid=
e 'std'
configure:4043: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
|=20
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| /* end confdefs.h.  */
| extern "C" void std::exit (int) throw (); using std::exit;
| #include <stdlib.h>
| int
| main ()
| {
| exit (42);
|   ;
|   return 0;
| }
configure:4037: g++ -c -isystem/OE/build/tmp/staging/i686-linux/usr/include=
 -O2  conftest.cc >&5
conftest.cc:9: error: 'void std::exit(int)' should have been declared insid=
e 'std'
In file included from conftest.cc:10:
/usr/include/stdlib.h:543: error: declaration of 'void std::exit(int) throw=
 ()' throws different exceptions
conftest.cc:9: error: from previous declaration 'void std::exit(int)'
configure:4043: $? =3D 1
configure: failed program was:
| /* confdefs.h.  */
|=20
| #define PACKAGE_NAME ""
| #define PACKAGE_TARNAME ""
| #define PACKAGE_VERSION ""
| #define PACKAGE_STRING ""
| #define PACKAGE_BUGREPORT ""
| /* end confdefs.h.  */
| extern "C" void std::exit (int); using std::exit;
| #include <stdlib.h>
| int
| main ()
| {
| exit (42);
|   ;
|   return 0;
| }
configure:4037: g++ -c -isystem/OE/build/tmp/staging/i686-linux/usr/include=
 -O2  conftest.cc >&5
configure:4043: $? =3D 0
configure:4047: test -z=20
			 || test ! -s conftest.err
configure:4050: $? =3D 0
configure:4053: test -s conftest.o
configure:4056: $? =3D 0
configure:4082: g++ -c -isystem/OE/build/tmp/staging/i686-linux/usr/include=
 -O2  conftest.cc >&5
configure:4088: $? =3D 0
configure:4092: test -z=20
			 || test ! -s conftest.err
configure:4095: $? =3D 0
configure:4098: test -s conftest.o
configure:4101: $? =3D 0
configure:4150: checking for i686-linux-gnatbind
configure:4179: result: no
configure:4188: checking for gnatbind
configure:4215: result: no
configure:4230: checking for i686-linux-gnatmake
configure:4259: result: no
configure:4268: checking for gnatmake
configure:4295: result: no
configure:4307: checking whether compiler driver understands Ada
configure:4330: result: no
configure:4339: checking how to compare bootstrapped objects
configure:4364: result: cmp --ignore-initial=3D16 $$f1 $$f2
configure:4484: checking for correct version of gmp.h
configure:4507: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2 -I/OE/build/tmp/staging/i686-linux/usr/include  conftest.c >&5
configure:4513: $? =3D 0
configure:4517: test -z=20
			 || test ! -s conftest.err
configure:4520: $? =3D 0
configure:4523: test -s conftest.o
configure:4526: $? =3D 0
configure:4528: result: yes
configure:4542: checking for correct version of mpfr.h
configure:4573: gcc  -o conftest -isystem/OE/build/tmp/staging/i686-linux/u=
sr/include -O2 -I/OE/build/tmp/staging/i686-linux/usr/include  -L/OE/build/=
tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/OE/build/tmp/staging/i686-l=
inux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 co=
nftest.c  -L/OE/build/tmp/staging/i686-linux/usr/lib -lmpfr -lgmp >&5
configure:4579: $? =3D 0
configure:4583: test -z=20
			 || test ! -s conftest.err
configure:4586: $? =3D 0
configure:4589: test -s conftest
configure:4592: $? =3D 0
configure:4616: gcc  -o conftest -isystem/OE/build/tmp/staging/i686-linux/u=
sr/include -O2 -I/OE/build/tmp/staging/i686-linux/usr/include  -L/OE/build/=
tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/OE/build/tmp/staging/i686-l=
inux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-O1 co=
nftest.c  -L/OE/build/tmp/staging/i686-linux/usr/lib -lmpfr -lgmp >&5
configure:4622: $? =3D 0
configure:4626: test -z=20
			 || test ! -s conftest.err
configure:4629: $? =3D 0
configure:4632: test -s conftest
configure:4635: $? =3D 0
configure:4637: result: yes
configure:6005: checking for bison
configure:6021: found /OE/build/tmp/staging/i686-linux/usr/bin/bison
configure:6031: result: bison -y
configure:6051: checking for bison
configure:6067: found /OE/build/tmp/staging/i686-linux/usr/bin/bison
configure:6077: result: bison
configure:6096: checking for gm4
configure:6125: result: no
configure:6096: checking for gnum4
configure:6125: result: no
configure:6096: checking for m4
configure:6112: found /OE/build/tmp/staging/i686-linux/usr/bin/m4
configure:6122: result: m4
configure:6141: checking for flex
configure:6157: found /OE/build/tmp/staging/i686-linux/usr/bin/flex
configure:6167: result: flex
configure:6187: checking for flex
configure:6203: found /OE/build/tmp/staging/i686-linux/usr/bin/flex
configure:6213: result: flex
configure:6232: checking for makeinfo
configure:6248: found /usr/bin/makeinfo
configure:6258: result: makeinfo
configure:6291: checking for expect
configure:6320: result: no
configure:6338: checking for runtest
configure:6367: result: no
configure:6400: checking for ar
configure:6426: result: ar
configure:6440: checking for i686-linux-ar
configure:6466: result: ar
configure:6535: checking for as
configure:6561: result: as
configure:6575: checking for i686-linux-as
configure:6601: result: as
configure:6710: checking for i686-linux-dlltool
configure:6739: result: no
configure:6747: checking for dlltool
configure:6776: result: no
configure:6805: checking for ld
configure:6831: result: ld
configure:6845: checking for i686-linux-ld
configure:6871: result: ld
configure:6980: checking for i686-linux-lipo
configure:7009: result: no
configure:7017: checking for lipo
configure:7046: result: no
configure:7075: checking for nm
configure:7101: result: nm
configure:7115: checking for i686-linux-nm
configure:7141: result: nm
configure:7210: checking for ranlib
configure:7236: result: ranlib
configure:7250: checking for i686-linux-ranlib
configure:7276: result: ranlib
configure:7340: checking for strip
configure:7366: result: strip
configure:7380: checking for i686-linux-strip
configure:7406: result: strip
configure:7510: checking for i686-linux-windres
configure:7539: result: no
configure:7547: checking for windres
configure:7576: result: no
configure:7645: checking for i686-linux-windmc
configure:7674: result: no
configure:7682: checking for windmc
configure:7711: result: no
configure:7740: checking for objcopy
configure:7766: result: objcopy
configure:7780: checking for i686-linux-objcopy
configure:7806: result: objcopy
configure:7875: checking for objdump
configure:7901: result: objdump
configure:7915: checking for i686-linux-objdump
configure:7941: result: objdump
configure:8032: checking for cc
configure:8058: result:  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -m=
tune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp
configure:8032: checking for gcc
configure:8058: result:  arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -m=
tune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp
configure:8244: checking for arm-angstrom-linux-gnueabi-c++
configure:8273: result: no
configure:8244: checking for arm-angstrom-linux-gnueabi-g++
configure:8273: result: no
configure:8244: checking for arm-angstrom-linux-gnueabi-cxx
configure:8273: result: no
configure:8244: checking for arm-angstrom-linux-gnueabi-gxx
configure:8273: result: no
configure:8399: checking for arm-angstrom-linux-gnueabi-gcc
configure:8415: found /OE/build/tmp/cross/armv7a//bin/arm-angstrom-linux-gn=
ueabi-gcc
configure:8425: result: arm-angstrom-linux-gnueabi-gcc
configure:8549: checking for arm-angstrom-linux-gnueabi-gcj
configure:8578: result: no
configure:8704: checking for arm-angstrom-linux-gnueabi-gfortran
configure:8733: result: no
configure:8830: checking for ar
configure:8848: found /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi=
/bin/ar
configure:8860: result: /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnuea=
bi/bin/ar
configure:9053: checking for as
configure:9071: found /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi=
/bin/as
configure:9083: result: /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnuea=
bi/bin/as
configure:9276: checking for dlltool
configure:9309: result: no
configure:9384: checking for arm-angstrom-linux-gnueabi-dlltool
configure:9413: result: no
configure:9499: checking for ld
configure:9517: found /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi=
/bin/ld
configure:9529: result: /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnuea=
bi/bin/ld
configure:9722: checking for lipo
configure:9755: result: no
configure:9830: checking for arm-angstrom-linux-gnueabi-lipo
configure:9859: result: no
configure:9945: checking for nm
configure:9963: found /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi=
/bin/nm
configure:9975: result: /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnuea=
bi/bin/nm
configure:10168: checking for objdump
configure:10186: found /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueab=
i/bin/objdump
configure:10198: result: /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnue=
abi/bin/objdump
configure:10391: checking for ranlib
configure:10409: found /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueab=
i/bin/ranlib
configure:10421: result: /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnue=
abi/bin/ranlib
configure:10614: checking for strip
configure:10632: found /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueab=
i/bin/strip
configure:10644: result: /OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnue=
abi/bin/strip
configure:10837: checking for windres
configure:10870: result: no
configure:10945: checking for arm-angstrom-linux-gnueabi-windres
configure:10974: result: no
configure:11060: checking for windmc
configure:11093: result: no
configure:11168: checking for arm-angstrom-linux-gnueabi-windmc
configure:11197: result: no
configure:11261: checking where to find the target ar
configure:11289: result: pre-installed in /OE/build/tmp/cross/armv7a/arm-an=
gstrom-linux-gnueabi/bin
configure:11303: checking where to find the target as
configure:11331: result: pre-installed in /OE/build/tmp/cross/armv7a/arm-an=
gstrom-linux-gnueabi/bin
configure:11345: checking where to find the target cc
configure:11368: result: just compiled
configure:11387: checking where to find the target c++
configure:11413: result: just compiled
configure:11432: checking where to find the target c++ for libstdc++
configure:11458: result: just compiled
configure:11477: checking where to find the target dlltool
configure:11514: result: pre-installed
configure:11519: checking where to find the target gcc
configure:11542: result: just compiled
configure:11561: checking where to find the target gcj
configure:11587: result: just compiled
configure:11606: checking where to find the target gfortran
configure:11632: result: just compiled
configure:11651: checking where to find the target ld
configure:11679: result: pre-installed in /OE/build/tmp/cross/armv7a/arm-an=
gstrom-linux-gnueabi/bin
configure:11693: checking where to find the target lipo
configure:11719: result: pre-installed
configure:11724: checking where to find the target nm
configure:11752: result: pre-installed in /OE/build/tmp/cross/armv7a/arm-an=
gstrom-linux-gnueabi/bin
configure:11766: checking where to find the target objdump
configure:11794: result: pre-installed in /OE/build/tmp/cross/armv7a/arm-an=
gstrom-linux-gnueabi/bin
configure:11808: checking where to find the target ranlib
configure:11836: result: pre-installed in /OE/build/tmp/cross/armv7a/arm-an=
gstrom-linux-gnueabi/bin
configure:11850: checking where to find the target strip
configure:11878: result: pre-installed in /OE/build/tmp/cross/armv7a/arm-an=
gstrom-linux-gnueabi/bin
configure:11892: checking where to find the target windres
configure:11929: result: pre-installed
configure:11934: checking where to find the target windmc
configure:11971: result: pre-installed
configure:12004: checking whether to enable maintainer-specific portions of=
 Makefiles
configure:12013: result: no
configure:12046: checking whether -fkeep-inline-functions is supported
configure:12070: gcc  -c -isystem/OE/build/tmp/staging/i686-linux/usr/inclu=
de -O2 -fkeep-inline-functions  conftest.c >&5
configure:12076: $? =3D 0
configure:12080: test -z=20
			 || test ! -s conftest.err
configure:12083: $? =3D 0
configure:12086: test -s conftest.o
configure:12089: $? =3D 0
configure:12091: result: yes
configure:12308: creating ./config.status

## ---------------------- ##
## Running config.status. ##
## ---------------------- ##

This file was extended by config.status, which was
generated by GNU Autoconf 2.59.  Invocation command line was

  CONFIG_FILES    =3D=20
  CONFIG_HEADERS  =3D=20
  CONFIG_LINKS    =3D=20
  CONFIG_COMMANDS =3D=20
  $ ./config.status=20

on ubuntu

config.status:765: creating Makefile

## ---------------- ##
## Cache variables. ##
## ---------------- ##

ac_cv___va_copy=3Dyes
ac_cv_af_unix_large_dgram=3Dyes
ac_cv_alignof_CORBA_boolean=3D1
ac_cv_alignof_CORBA_char=3D1
ac_cv_alignof_CORBA_double=3D4
ac_cv_alignof_CORBA_float=3D4
ac_cv_alignof_CORBA_long=3D4
ac_cv_alignof_CORBA_long_double=3D4
ac_cv_alignof_CORBA_long_long=3D4
ac_cv_alignof_CORBA_octet=3D1
ac_cv_alignof_CORBA_pointer=3D4
ac_cv_alignof_CORBA_short=3D2
ac_cv_alignof_CORBA_struct=3D4
ac_cv_alignof_CORBA_wchar=3D2
ac_cv_build=3Di686-pc-linux-gnu
ac_cv_build_alias=3Di686-linux
ac_cv_c_bigendian=3Dno
ac_cv_c_compiler_gnu=3Dyes
ac_cv_c_littleendian=3Dyes
ac_cv_c_long_double=3Dyes
ac_cv_check_sjlj=3Dssjlj
ac_cv_conv_longlong_to_float=3Dyes
ac_cv_cxx_compiler_gnu=3Dyes
ac_cv_dirent_have_space_d_name=3Dyes
ac_cv_env_AR_FOR_TARGET_set=3Dset
ac_cv_env_AR_FOR_TARGET_value=3Darm-angstrom-linux-gnueabi-ar
ac_cv_env_AR_set=3Dset
ac_cv_env_AR_value=3Dar
ac_cv_env_AS_FOR_TARGET_set=3Dset
ac_cv_env_AS_FOR_TARGET_value=3Darm-angstrom-linux-gnueabi-as
ac_cv_env_AS_set=3Dset
ac_cv_env_AS_value=3Das
ac_cv_env_CC_FOR_TARGET_set=3Dset
ac_cv_env_CC_FOR_TARGET_value=3D' arm-angstrom-linux-gnueabi-gcc -march=3Da=
rmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp'
ac_cv_env_CC_set=3Dset
ac_cv_env_CC_value=3D'gcc '
ac_cv_env_CFLAGS_set=3Dset
ac_cv_env_CFLAGS_value=3D'-isystem/OE/build/tmp/staging/i686-linux/usr/incl=
ude -O2'
ac_cv_env_CPPFLAGS_set=3D
ac_cv_env_CPPFLAGS_value=3D
ac_cv_env_CXXFLAGS_set=3Dset
ac_cv_env_CXXFLAGS_value=3D'-isystem/OE/build/tmp/staging/i686-linux/usr/in=
clude -O2'
ac_cv_env_CXX_FOR_TARGET_set=3D
ac_cv_env_CXX_FOR_TARGET_value=3D
ac_cv_env_CXX_set=3Dset
ac_cv_env_CXX_value=3Dg++
ac_cv_env_DLLTOOL_FOR_TARGET_set=3D
ac_cv_env_DLLTOOL_FOR_TARGET_value=3D
ac_cv_env_DLLTOOL_set=3D
ac_cv_env_DLLTOOL_value=3D
ac_cv_env_GCC_FOR_TARGET_set=3D
ac_cv_env_GCC_FOR_TARGET_value=3D
ac_cv_env_GCJ_FOR_TARGET_set=3D
ac_cv_env_GCJ_FOR_TARGET_value=3D
ac_cv_env_GFORTRAN_FOR_TARGET_set=3D
ac_cv_env_GFORTRAN_FOR_TARGET_value=3D
ac_cv_env_LDFLAGS_set=3Dset
ac_cv_env_LDFLAGS_value=3D'-L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-=
rpath-link,/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tm=
p/staging/i686-linux/usr/lib -Wl,-O1'
ac_cv_env_LD_FOR_TARGET_set=3Dset
ac_cv_env_LD_FOR_TARGET_value=3Darm-angstrom-linux-gnueabi-ld
ac_cv_env_LD_set=3Dset
ac_cv_env_LD_value=3Dld
ac_cv_env_LIPO_FOR_TARGET_set=3D
ac_cv_env_LIPO_FOR_TARGET_value=3D
ac_cv_env_LIPO_set=3D
ac_cv_env_LIPO_value=3D
ac_cv_env_NM_FOR_TARGET_set=3Dset
ac_cv_env_NM_FOR_TARGET_value=3Darm-angstrom-linux-gnueabi-nm
ac_cv_env_NM_set=3Dset
ac_cv_env_NM_value=3Dnm
ac_cv_env_OBJCOPY_set=3Dset
ac_cv_env_OBJCOPY_value=3Dobjcopy
ac_cv_env_OBJDUMP_FOR_TARGET_set=3Dset
ac_cv_env_OBJDUMP_FOR_TARGET_value=3Darm-angstrom-linux-gnueabi-objdump
ac_cv_env_OBJDUMP_set=3Dset
ac_cv_env_OBJDUMP_value=3Dobjdump
ac_cv_env_RANLIB_FOR_TARGET_set=3Dset
ac_cv_env_RANLIB_FOR_TARGET_value=3Darm-angstrom-linux-gnueabi-ranlib
ac_cv_env_RANLIB_set=3Dset
ac_cv_env_RANLIB_value=3Dranlib
ac_cv_env_STRIP_FOR_TARGET_set=3Dset
ac_cv_env_STRIP_FOR_TARGET_value=3Darm-angstrom-linux-gnueabi-strip
ac_cv_env_STRIP_set=3Dset
ac_cv_env_STRIP_value=3Dstrip
ac_cv_env_WINDMC_FOR_TARGET_set=3D
ac_cv_env_WINDMC_FOR_TARGET_value=3D
ac_cv_env_WINDMC_set=3D
ac_cv_env_WINDMC_value=3D
ac_cv_env_WINDRES_FOR_TARGET_set=3D
ac_cv_env_WINDRES_FOR_TARGET_value=3D
ac_cv_env_WINDRES_set=3D
ac_cv_env_WINDRES_value=3D
ac_cv_env_build_alias_set=3Dset
ac_cv_env_build_alias_value=3Di686-linux
ac_cv_env_host_alias_set=3Dset
ac_cv_env_host_alias_value=3Di686-linux
ac_cv_env_target_alias_set=3Dset
ac_cv_env_target_alias_value=3Darm-angstrom-linux-gnueabi
ac_cv_epoll_works=3Dyes
ac_cv_exeext=3D
ac_cv_file__dev_random=3Dyes
ac_cv_file__dev_zero=3Dyes
ac_cv_file__usr_share_X11_sgml_defs_ent=3Dno
ac_cv_file_lib_src_libmad_frame_h=3Dno
ac_cv_fread_reads_directories=3Dyes
ac_cv_func___va_copy=3Dyes
ac_cv_func_fnmatch_works=3Dyes
ac_cv_func_getaddrinfo=3Dyes
ac_cv_func_getpagesize=3Dyes
ac_cv_func_getpgrp_void=3Dyes
ac_cv_func_getpwuid_r=3Dyes
ac_cv_func_lstat_dereferences_slashed_symlink=3Dyes
ac_cv_func_lstat_empty_string_bug=3Dno
ac_cv_func_malloc_0_nonnull=3Dyes
ac_cv_func_malloc_works=3Dyes
ac_cv_func_memcmp_working=3Dyes
ac_cv_func_memcpy=3Dyes
ac_cv_func_mmap_fixed_mapped=3Dyes
ac_cv_func_posix_getgrgid_r=3Dyes
ac_cv_func_posix_getpwnam_r=3Dyes
ac_cv_func_posix_getpwuid_r=3Dyes
ac_cv_func_printf_unix98=3Dyes
ac_cv_func_pthread_attr_getstack=3Dyes
ac_cv_func_pthread_key_delete=3Dyes
ac_cv_func_realloc_0_nonnull=3Dyes
ac_cv_func_setpgrp_void=3Dyes
ac_cv_func_setresuid=3Dyes
ac_cv_func_setvbuf_reversed=3Dno
ac_cv_func_snprintf_c99=3Dyes
ac_cv_func_stat_empty_string_bug=3Dno
ac_cv_func_stat_ignores_trailing_slash=3Dno
ac_cv_func_strerror=3Dyes
ac_cv_func_va_copy=3Dyes
ac_cv_func_vsnprintf_c99=3Dyes
ac_cv_have_abstract_sockets=3Dyes
ac_cv_have_accrights_in_msghdr=3Dno
ac_cv_have_broken_snprintf=3Dno
ac_cv_have_control_in_msghdr=3Dyes
ac_cv_have_decl_sys_siglist=3Dyes
ac_cv_have_openpty_ctty_bug=3Dyes
ac_cv_have_space_d_name_in_struct_dirent=3Dyes
ac_cv_header_netinet_sctp_h=3Dno
ac_cv_header_netinet_sctp_uio_h=3Dno
ac_cv_host=3Di686-pc-linux-gnu
ac_cv_host_alias=3Di686-linux
ac_cv_lbl_unaligned_fail=3Dno
ac_cv_libiconv_utf8=3Dyes
ac_cv_libnet_endianess=3Dlil
ac_cv_linux_vers=3D2
ac_cv_need_trio=3Dno
ac_cv_objext=3Do
ac_cv_path_AR_FOR_TARGET=3D/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gn=
ueabi/bin/ar
ac_cv_path_AS_FOR_TARGET=3D/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gn=
ueabi/bin/as
ac_cv_path_ESD_CONFIG=3Dno
ac_cv_path_LD_FOR_TARGET=3D/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gn=
ueabi/bin/ld
ac_cv_path_NM_FOR_TARGET=3D/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gn=
ueabi/bin/nm
ac_cv_path_OBJDUMP_FOR_TARGET=3D/OE/build/tmp/cross/armv7a/arm-angstrom-lin=
ux-gnueabi/bin/objdump
ac_cv_path_RANLIB_FOR_TARGET=3D/OE/build/tmp/cross/armv7a/arm-angstrom-linu=
x-gnueabi/bin/ranlib
ac_cv_path_STRIP_FOR_TARGET=3D/OE/build/tmp/cross/armv7a/arm-angstrom-linux=
-gnueabi/bin/strip
ac_cv_path_install=3D'/usr/bin/install -c'
ac_cv_pread=3Dno
ac_cv_prog_AR=3Dar
ac_cv_prog_AS=3Das
ac_cv_prog_BISON=3Dbison
ac_cv_prog_CC=3D'gcc '
ac_cv_prog_CC_FOR_TARGET=3D' arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-=
a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp'
ac_cv_prog_CXX=3Dg++
ac_cv_prog_FLEX=3Dflex
ac_cv_prog_GCC_FOR_TARGET=3Darm-angstrom-linux-gnueabi-gcc
ac_cv_prog_LD=3Dld
ac_cv_prog_LEX=3Dflex
ac_cv_prog_M4=3Dm4
ac_cv_prog_MAKEINFO=3Dmakeinfo
ac_cv_prog_NM=3Dnm
ac_cv_prog_OBJCOPY=3Dobjcopy
ac_cv_prog_OBJDUMP=3Dobjdump
ac_cv_prog_RANLIB=3Dranlib
ac_cv_prog_STRIP=3Dstrip
ac_cv_prog_YACC=3D'bison -y'
ac_cv_prog_ac_ct_GNATBIND=3Dno
ac_cv_prog_ac_ct_GNATMAKE=3Dno
ac_cv_prog_cc_g=3Dyes
ac_cv_prog_cc_stdc=3D
ac_cv_prog_cxx_g=3Dyes
ac_cv_pwrite=3Dno
ac_cv_sctp=3Dno
ac_cv_sizeof_char=3D1
ac_cv_sizeof_char_p=3D4
ac_cv_sizeof_float=3D4
ac_cv_sizeof_int=3D4
ac_cv_sizeof_int_p=3D4
ac_cv_sizeof_long=3D4
ac_cv_sizeof_long_long=3D8
ac_cv_sizeof_long_p=3D4
ac_cv_sizeof_off_t=3D4
ac_cv_sizeof_short=3D2
ac_cv_sizeof_size_t=3D4
ac_cv_sizeof_ssize_t=3D4
ac_cv_sizeof_unsigned_char=3D1
ac_cv_sizeof_unsigned_char_p=3D4
ac_cv_sizeof_unsigned_int=3D4
ac_cv_sizeof_unsigned_long=3D4
ac_cv_sizeof_unsigned_long_long=3D8
ac_cv_sizeof_unsigned_short=3D2
ac_cv_sizeof_void_p=3D4
ac_cv_sizeof_wchar_t=3D4
ac_cv_sys_linker_h=3Dno
ac_cv_sys_restartable_syscalls=3Dyes
ac_cv_target=3Darm-angstrom-linux-gnueabi
ac_cv_target_alias=3Darm-angstrom-linux-gnueabi
ac_cv_type_struct_timespec=3Dyes
ac_cv_type_uid_t=3D'{ac_cv_type_uid_t=3Dyes}'
ac_cv_uchar=3Dno
ac_cv_uint=3Dyes
ac_cv_ulong=3Dyes
ac_cv_ushort=3Dyes
ac_cv_va_copy=3Dyes
ac_cv_va_val_copy=3Dyes
acx_cv_cc_gcc_supports_ada=3Dno
acx_cv_prog_LN=3Dln
am_cv_func_working_getline=3Dyes
am_cv_scanf_lld=3Dyes
apr_cv_process_shared_works=3Dno
apr_cv_tcp_nodelay_with_cork=3Dyes
bash_cv_dup2_broken=3Dno
bash_cv_func_sigsetjmp=3Dmissing
bash_cv_func_strcoll_broken=3Dno
bash_cv_getcwd_calls_popen=3Dno
bash_cv_getenv_redef=3Dyes
bash_cv_have_mbstate_t=3Dyes
bash_cv_job_control_missing=3Dpresent
bash_cv_must_reinstall_sighandlers=3Dno
bash_cv_opendir_not_robust=3Dno
bash_cv_pgrp_pipe=3Dno
bash_cv_printf_a_format=3Dyes
bash_cv_sys_named_pipes=3Dpresent
bash_cv_sys_siglist=3Dyes
bash_cv_type_rlimit=3Drlim_t
bash_cv_ulimit_maxfds=3Dyes
bash_cv_under_sys_siglist=3Dyes
bash_cv_unusable_rtsigs=3Dno
cvs_cv_func_printf_ptr=3Dyes
db_cv_align_t=3D'unsigned long long'
db_cv_alignp_t=3D'unsigned long'
db_cv_fcntl_f_setfd=3Dyes
db_cv_mutex=3Dx86/gcc-assembly
db_cv_path_ar=3D/usr/bin/ar
db_cv_path_chmod=3D/bin/chmod
db_cv_path_cp=3D/bin/cp
db_cv_path_ln=3D/bin/ln
db_cv_path_mkdir=3D/bin/mkdir
db_cv_path_ranlib=3D/usr/bin/ranlib
db_cv_path_rm=3D/bin/rm
db_cv_path_sh=3D/bin/sh
db_cv_path_strip=3D/usr/bin/strip
db_cv_posixmutexes=3Dno
db_cv_sprintf_count=3Dyes
db_cv_uimutexes=3Dno
dpkg_cv___va_copy=3Dyes
dpkg_cv_va_copy=3Dyes
ettercap_cv_type_socklen_t=3Dyes
fu_cv_sys_stat_statfs2_bsize=3Dyes
gcc_cv_prog_cmp_skip=3D'cmp --ignore-initial=3D16 $$f1 $$f2'
gcc_cv_tool_dirs=3D/OE/build/tmp/cross/armv7a/libexec/gcc/arm-angstrom-linu=
x-gnueabi/4.3.3:/OE/build/tmp/cross/armv7a/libexec/gcc/arm-angstrom-linux-g=
nueabi:/usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3:/usr/lib/gcc/arm-angst=
rom-linux-gnueabi:/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin=
/arm-angstrom-linux-gnueabi/4.3.3:/OE/build/tmp/cross/armv7a/arm-angstrom-l=
inux-gnueabi/bin:
gcc_cv_tool_prefix=3D/OE/build/tmp/cross/armv7a
glib_cv___va_copy=3Dyes
glib_cv_compliant_posix_memalign=3D1
glib_cv_has__inline=3Dyes
glib_cv_has__inline__=3Dyes
glib_cv_hasinline=3Dyes
glib_cv_long_long_format=3Dll
glib_cv_rtldglobal_broken=3Dyes
glib_cv_sane_realloc=3Dyes
glib_cv_sizeof_gmutex=3D24
glib_cv_sizeof_system_thread=3D4
glib_cv_stack_grows=3Dno
glib_cv_strlcpy=3Dno
glib_cv_sys_pthread_cond_timedwait_posix=3Dyes
glib_cv_sys_pthread_getspecific_posix=3Dyes
glib_cv_sys_pthread_mutex_trylock_posix=3Dyes
glib_cv_uscore=3Dno
glib_cv_use_pid_surrogate=3Dyes
glib_cv_va_copy=3Dyes
glib_cv_va_val_copy=3Dyes
jm_cv_func_gettimeofday_clobber=3Dno
jm_cv_func_working_readdir=3Dyes
lf_cv_sane_realloc=3Dyes
lftp_cv___va_copy=3Dyes
lftp_cv_va_copy=3Dno
libIDL_cv_long_long_format=3Dll
mono_cv_sizeof_sunpath=3D108
mono_cv_uscore=3Dno
mr_cv_target_elf=3Dyes
mysql_cv_func_atomic_add=3Dyes
mysql_cv_func_atomic_sub=3Dyes
php_cv_lib_cookie_io_functions_use_off64_t=3Dyes
racoon_cv_bug_getaddrinfo=3Dno
rd_cv_ieee_works=3Dyes
rpppoe_cv_pack_bitfields=3Drev
rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno
rsync_cv_HAVE_BROKEN_READDIR=3Dno
rsync_cv_HAVE_C99_VSNPRINTF=3Dyes
rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
rsync_cv_HAVE_LONGLONG=3Dyes
rsync_cv_HAVE_OFF64_T=3Dno
rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes
rsync_cv_HAVE_SHORT_INO_T=3Dno
rsync_cv_HAVE_SOCKETPAIR=3Dyes
rsync_cv_HAVE_UNSIGNED_CHAR=3Dno
rsync_cv_REPLACE_INET_ATON=3Dno
rsync_cv_REPLACE_INET_NTOA=3Dno
samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
samba_cv_HAVE_IFACE_AIX=3Dno
samba_cv_HAVE_IFACE_IFCONF=3Dyes
samba_cv_HAVE_IFACE_IFREQ=3Dyes
samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3Dno
screen_cv_sys_bcopy_overlap=3Dno
screen_cv_sys_fifo_broken_impl=3Dyes
screen_cv_sys_fifo_usable=3Dyes
screen_cv_sys_memcpy_overlap=3Dno
screen_cv_sys_memmove_overlap=3Dno
screen_cv_sys_select_broken_retval=3Dno
screen_cv_sys_sockets_nofs=3Dno
screen_cv_sys_sockets_usable=3Dyes
screen_cv_sys_terminfo_used=3Dyes
slrn_cv___va_copy=3Dyes
slrn_cv_va_copy=3Dno
slrn_cv_va_val_copy=3Dyes
sudo_cv_uid_t_len=3D10
utils_cv_sys_open_max=3D1015

## ----------------- ##
## Output variables. ##
## ----------------- ##

AR=3D'ar'
AR_FOR_BUILD=3D'$(AR)'
AR_FOR_TARGET=3D'/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin/=
ar'
AS=3D'as'
AS_FOR_BUILD=3D'$(AS)'
AS_FOR_TARGET=3D'/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin/=
as'
BISON=3D'bison'
CC=3D'gcc '
CC_FOR_BUILD=3D'$(CC)'
CC_FOR_TARGET=3D'$$r/$(HOST_SUBDIR)/gcc/xgcc -B$$r/$(HOST_SUBDIR)/gcc/'
CFLAGS=3D'-isystem/OE/build/tmp/staging/i686-linux/usr/include -O2'
CFLAGS_FOR_BUILD=3D'-isystem/OE/build/tmp/staging/i686-linux/usr/include -O=
2'
CFLAGS_FOR_TARGET=3D'-g -isystem/OE/build/tmp/staging/i686-linux/usr/includ=
e -O2'
COMPILER_AS_FOR_TARGET=3D'$$r/$(HOST_SUBDIR)/gcc/as'
COMPILER_LD_FOR_TARGET=3D'$$r/$(HOST_SUBDIR)/gcc/collect-ld'
COMPILER_NM_FOR_TARGET=3D'$$r/$(HOST_SUBDIR)/gcc/nm'
CONFIGURE_GDB_TK=3D''
CPPFLAGS=3D''
CPPFLAGS_FOR_BUILD=3D'-isystem/OE/build/tmp/staging/i686-linux/usr/include'
CXX=3D'g++'
CXXFLAGS=3D'-isystem/OE/build/tmp/staging/i686-linux/usr/include -O2'
CXXFLAGS_FOR_BUILD=3D'-isystem/OE/build/tmp/staging/i686-linux/usr/include =
-O2 -fpermissive'
CXXFLAGS_FOR_TARGET=3D'-g -isystem/OE/build/tmp/staging/i686-linux/usr/incl=
ude -O2'
CXX_FOR_BUILD=3D'$(CXX)'
CXX_FOR_TARGET=3D'$$r/$(HOST_SUBDIR)/gcc/g++ -B$$r/$(HOST_SUBDIR)/gcc/ -nos=
tdinc++ `test ! -f $$r/$(TARGET_SUBDIR)/libstdc++-v3/scripts/testsuite_flag=
s || $(SHELL) $$r/$(TARGET_SUBDIR)/libstdc++-v3/scripts/testsuite_flags --b=
uild-includes` -L$$r/$(TARGET_SUBDIR)/libstdc++-v3/src -L$$r/$(TARGET_SUBDI=
R)/libstdc++-v3/src/.libs'
DEBUG_PREFIX_CFLAGS_FOR_TARGET=3D''
DEFS=3D'-DPACKAGE_NAME=3D\"\" -DPACKAGE_TARNAME=3D\"\" -DPACKAGE_VERSION=3D=
\"\" -DPACKAGE_STRING=3D\"\" -DPACKAGE_BUGREPORT=3D\"\" '
DLLTOOL=3D'dlltool'
DLLTOOL_FOR_BUILD=3D'$(DLLTOOL)'
DLLTOOL_FOR_TARGET=3D'arm-angstrom-linux-gnueabi-dlltool'
ECHO_C=3D''
ECHO_N=3D'-n'
ECHO_T=3D''
EXEEXT=3D''
EXPECT=3D'expect'
FLAGS_FOR_TARGET=3D'-march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloa=
t-abi=3Dsoftfp -isystem/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/=
usr/include -B$(build_tooldir)/bin/ -B$(build_tooldir)/lib/ -isystem $(buil=
d_tooldir)/include -isystem $(build_tooldir)/sys-include'
FLEX=3D'flex'
GCC_FOR_TARGET=3D'$$r/$(HOST_SUBDIR)/gcc/xgcc -B$$r/$(HOST_SUBDIR)/gcc/'
GCJ_FOR_BUILD=3D'$(GCJ)'
GCJ_FOR_TARGET=3D'$$r/$(HOST_SUBDIR)/gcc/gcj -B$$r/$(HOST_SUBDIR)/gcc/'
GDB_TK=3D''
GFORTRAN_FOR_BUILD=3D'$(GFORTRAN)'
GFORTRAN_FOR_TARGET=3D'$$r/$(HOST_SUBDIR)/gcc/gfortran -B$$r/$(HOST_SUBDIR)=
/gcc/'
GNATBIND=3D'no'
GNATMAKE=3D'no'
INSTALL_DATA=3D'${INSTALL} -m 644'
INSTALL_GDB_TK=3D''
INSTALL_PROGRAM=3D'${INSTALL}'
INSTALL_SCRIPT=3D'${INSTALL}'
LD=3D'ld'
LDFLAGS=3D'-L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-link,/OE/b=
uild/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/staging/i686-l=
inux/usr/lib -Wl,-O1'
LDFLAGS_FOR_BUILD=3D'-L/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath-=
link,/OE/build/tmp/staging/i686-linux/usr/lib -Wl,-rpath,/OE/build/tmp/stag=
ing/i686-linux/usr/lib -Wl,-O1'
LD_FOR_BUILD=3D'$(LD)'
LD_FOR_TARGET=3D'/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin/=
ld'
LEX=3D'flex'
LIBOBJS=3D''
LIBS=3D''
LIPO=3D'lipo'
LIPO_FOR_TARGET=3D'arm-angstrom-linux-gnueabi-lipo'
LN=3D'ln'
LN_S=3D'ln -s'
LTLIBOBJS=3D''
M4=3D'm4'
MAINT=3D'#'
MAINTAINER_MODE_FALSE=3D''
MAINTAINER_MODE_TRUE=3D'#'
MAKEINFO=3D'makeinfo'
NM=3D'nm'
NM_FOR_BUILD=3D'$(NM)'
NM_FOR_TARGET=3D'/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/bin/=
nm'
OBJCOPY=3D'objcopy'
OBJDUMP=3D'objdump'
OBJDUMP_FOR_TARGET=3D'/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi=
/bin/objdump'
OBJEXT=3D'o'
PACKAGE_BUGREPORT=3D''
PACKAGE_NAME=3D''
PACKAGE_STRING=3D''
PACKAGE_TARNAME=3D''
PACKAGE_VERSION=3D''
PATH_SEPARATOR=3D':'
RANLIB=3D'ranlib'
RANLIB_FOR_BUILD=3D'$(RANLIB)'
RANLIB_FOR_TARGET=3D'/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/=
bin/ranlib'
RAW_CXX_FOR_TARGET=3D'$$r/$(HOST_SUBDIR)/gcc/xgcc -shared-libgcc -B$$r/$(HO=
ST_SUBDIR)/gcc -nostdinc++ -L$$r/$(TARGET_SUBDIR)/libstdc++-v3/src -L$$r/$(=
TARGET_SUBDIR)/libstdc++-v3/src/.libs'
RPATH_ENVVAR=3D'LD_LIBRARY_PATH'
RUNTEST=3D'runtest'
SHELL=3D'/bin/sh'
STRIP=3D'strip'
STRIP_FOR_TARGET=3D'/OE/build/tmp/cross/armv7a/arm-angstrom-linux-gnueabi/b=
in/strip'
SYSROOT_CFLAGS_FOR_TARGET=3D'--sysroot=3D/OE/build/tmp/staging/armv7a-angst=
rom-linux-gnueabi'
TOPLEVEL_CONFIGURE_ARGUMENTS=3D'/OE/build/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/configure --build=3Di686-linux --host=
=3Di686-linux --target=3Darm-angstrom-linux-gnueabi --prefix=3D/OE/build/tm=
p/cross/armv7a --exec_prefix=3D/OE/build/tmp/cross/armv7a --bindir=3D/OE/bu=
ild/tmp/cross/armv7a/bin --sbindir=3D/OE/build/tmp/cross/armv7a/bin --libex=
ecdir=3D/OE/build/tmp/cross/armv7a/libexec --datadir=3D/OE/build/tmp/cross/=
armv7a/share --sysconfdir=3D/OE/build/tmp/cross/armv7a/etc --sharedstatedir=
=3D/OE/build/tmp/cross/armv7a/com --localstatedir=3D/OE/build/tmp/cross/arm=
v7a/var --libdir=3D/OE/build/tmp/cross/armv7a/lib --includedir=3D/OE/build/=
tmp/cross/armv7a/include --oldincludedir=3D/OE/build/tmp/cross/armv7a/inclu=
de --infodir=3D/OE/build/tmp/cross/armv7a/share/info --mandir=3D/OE/build/t=
mp/cross/armv7a/share/man --with-gnu-ld --enable-shared --enable-target-opt=
space --enable-languages=3Dc,c++,objc,fortran,java --enable-threads=3Dposix=
 --enable-multilib --enable-c99 --enable-long-long --enable-symvers=3Dgnu -=
-enable-libstdcxx-pch --program-prefix=3Darm-angstrom-linux-gnueabi- --enab=
le-cheaders=3Dc_std --enable-libssp --disable-bootstrap --disable-libgomp -=
-disable-libmudflap --with-local-prefix=3D/OE/build/tmp/staging/armv7a-angs=
trom-linux-gnueabi/usr --with-gxx-include-dir=3D/OE/build/tmp/staging/armv7=
a-angstrom-linux-gnueabi//usr/include/c++ --with-sysroot=3D/OE/build/tmp/st=
aging/armv7a-angstrom-linux-gnueabi --with-build-sysroot=3D/OE/build/tmp/st=
aging/armv7a-angstrom-linux-gnueabi --enable-cheaders=3Dc_std --disable-lib=
unwind-exceptions --with-mpfr=3D/OE/build/tmp/staging/i686-linux/usr --enab=
le-__cxa_atexit'
WINDMC=3D'windmc'
WINDMC_FOR_BUILD=3D'$(WINDMC)'
WINDMC_FOR_TARGET=3D'arm-angstrom-linux-gnueabi-windmc'
WINDRES=3D'windres'
WINDRES_FOR_BUILD=3D'$(WINDRES)'
WINDRES_FOR_TARGET=3D'arm-angstrom-linux-gnueabi-windres'
YACC=3D'bison -y'
ac_ct_CC=3D''
ac_ct_CXX=3D''
ac_ct_GNATBIND=3D'no'
ac_ct_GNATMAKE=3D'no'
bindir=3D'/OE/build/tmp/cross/armv7a/bin'
build=3D'i686-pc-linux-gnu'
build_alias=3D'i686-linux'
build_configargs=3D'--cache-file=3D../config.cache '--prefix=3D/OE/build/tm=
p/cross/armv7a' '--exec_prefix=3D/OE/build/tmp/cross/armv7a' '--bindir=3D/O=
E/build/tmp/cross/armv7a/bin' '--sbindir=3D/OE/build/tmp/cross/armv7a/bin' =
'--libexecdir=3D/OE/build/tmp/cross/armv7a/libexec' '--datadir=3D/OE/build/=
tmp/cross/armv7a/share' '--sysconfdir=3D/OE/build/tmp/cross/armv7a/etc' '--=
sharedstatedir=3D/OE/build/tmp/cross/armv7a/com' '--localstatedir=3D/OE/bui=
ld/tmp/cross/armv7a/var' '--libdir=3D/OE/build/tmp/cross/armv7a/lib' '--inc=
ludedir=3D/OE/build/tmp/cross/armv7a/include' '--oldincludedir=3D/OE/build/=
tmp/cross/armv7a/include' '--infodir=3D/OE/build/tmp/cross/armv7a/share/inf=
o' '--mandir=3D/OE/build/tmp/cross/armv7a/share/man' '--with-gnu-ld' '--ena=
ble-shared' '--enable-target-optspace' '--enable-threads=3Dposix' '--enable=
-multilib' '--enable-c99' '--enable-long-long' '--enable-symvers=3Dgnu' '--=
enable-libstdcxx-pch' '--enable-libssp' '--disable-bootstrap' '--disable-li=
bgomp' '--disable-libmudflap' '--with-local-prefix=3D/OE/build/tmp/staging/=
armv7a-angstrom-linux-gnueabi/usr' '--with-gxx-include-dir=3D/OE/build/tmp/=
staging/armv7a-angstrom-linux-gnueabi//usr/include/c++' '--with-sysroot=3D/=
OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi' '--with-build-sysroot=
=3D/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi' '--enable-cheaders=
=3Dc_std' '--disable-libunwind-exceptions' '--with-mpfr=3D/OE/build/tmp/sta=
ging/i686-linux/usr' '--enable-__cxa_atexit' '--enable-languages=3Dc,c++,fo=
rtran,java,objc' --program-transform-name=3D's,^,arm-angstrom-linux-gnueabi=
-,''
build_configdirs=3D' libiberty fixincludes'
build_cpu=3D'i686'
build_libsubdir=3D'build-i686-linux'
build_noncanonical=3D'i686-linux'
build_os=3D'linux-gnu'
build_subdir=3D'build-i686-linux'
build_tooldir=3D'${exec_prefix}/arm-angstrom-linux-gnueabi'
build_vendor=3D'pc'
config_shell=3D'/bin/sh'
configdirs=3D' intl libiberty zlib libcpp libdecnumber fixincludes gcc'
datadir=3D'/OE/build/tmp/cross/armv7a/share'
datarootdir=3D'${prefix}/share'
do_compare=3D'cmp --ignore-initial=3D16 $$f1 $$f2'
docdir=3D'${datarootdir}/doc'
exec_prefix=3D'/OE/build/tmp/cross/armv7a'
gmpinc=3D'-I/OE/build/tmp/staging/i686-linux/usr/include'
gmplibs=3D'-L/OE/build/tmp/staging/i686-linux/usr/lib -lmpfr -lgmp'
host=3D'i686-pc-linux-gnu'
host_alias=3D'i686-linux'
host_configargs=3D'--cache-file=3D./config.cache  '--prefix=3D/OE/build/tmp=
/cross/armv7a' '--exec_prefix=3D/OE/build/tmp/cross/armv7a' '--bindir=3D/OE=
/build/tmp/cross/armv7a/bin' '--sbindir=3D/OE/build/tmp/cross/armv7a/bin' '=
--libexecdir=3D/OE/build/tmp/cross/armv7a/libexec' '--datadir=3D/OE/build/t=
mp/cross/armv7a/share' '--sysconfdir=3D/OE/build/tmp/cross/armv7a/etc' '--s=
haredstatedir=3D/OE/build/tmp/cross/armv7a/com' '--localstatedir=3D/OE/buil=
d/tmp/cross/armv7a/var' '--libdir=3D/OE/build/tmp/cross/armv7a/lib' '--incl=
udedir=3D/OE/build/tmp/cross/armv7a/include' '--oldincludedir=3D/OE/build/t=
mp/cross/armv7a/include' '--infodir=3D/OE/build/tmp/cross/armv7a/share/info=
' '--mandir=3D/OE/build/tmp/cross/armv7a/share/man' '--with-gnu-ld' '--enab=
le-shared' '--enable-target-optspace' '--enable-threads=3Dposix' '--enable-=
multilib' '--enable-c99' '--enable-long-long' '--enable-symvers=3Dgnu' '--e=
nable-libstdcxx-pch' '--enable-libssp' '--disable-bootstrap' '--disable-lib=
gomp' '--disable-libmudflap' '--with-local-prefix=3D/OE/build/tmp/staging/a=
rmv7a-angstrom-linux-gnueabi/usr' '--with-gxx-include-dir=3D/OE/build/tmp/s=
taging/armv7a-angstrom-linux-gnueabi//usr/include/c++' '--with-sysroot=3D/O=
E/build/tmp/staging/armv7a-angstrom-linux-gnueabi' '--with-build-sysroot=3D=
/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi' '--enable-cheaders=3Dc=
_std' '--disable-libunwind-exceptions' '--with-mpfr=3D/OE/build/tmp/staging=
/i686-linux/usr' '--enable-__cxa_atexit' '--enable-languages=3Dc,c++,fortra=
n,java,objc' --program-transform-name=3D's,^,arm-angstrom-linux-gnueabi-,''
host_cpu=3D'i686'
host_noncanonical=3D'i686-linux'
host_os=3D'linux-gnu'
host_subdir=3D'.'
host_vendor=3D'pc'
htmldir=3D'${docdir}'
includedir=3D'/OE/build/tmp/cross/armv7a/include'
infodir=3D'/OE/build/tmp/cross/armv7a/share/info'
libdir=3D'/OE/build/tmp/cross/armv7a/lib'
libexecdir=3D'/OE/build/tmp/cross/armv7a/libexec'
localstatedir=3D'/OE/build/tmp/cross/armv7a/var'
mandir=3D'/OE/build/tmp/cross/armv7a/share/man'
oldincludedir=3D'/OE/build/tmp/cross/armv7a/include'
pdfdir=3D'${docdir}'
prefix=3D'/OE/build/tmp/cross/armv7a'
program_transform_name=3D's,^,arm-angstrom-linux-gnueabi-,'
sbindir=3D'/OE/build/tmp/cross/armv7a/bin'
sharedstatedir=3D'/OE/build/tmp/cross/armv7a/com'
stage1_cflags=3D'-g -fkeep-inline-functions'
stage1_checking=3D'--enable-checking=3Dyes,types'
stage1_languages=3D'c'
stage2_werror_flag=3D''
sysconfdir=3D'/OE/build/tmp/cross/armv7a/etc'
target=3D'arm-angstrom-linux-gnueabi'
target_alias=3D'arm-angstrom-linux-gnueabi'
target_configargs=3D'--cache-file=3D./config.cache --with-cross-host=3Di686=
-linux '--prefix=3D/OE/build/tmp/cross/armv7a' '--exec_prefix=3D/OE/build/t=
mp/cross/armv7a' '--bindir=3D/OE/build/tmp/cross/armv7a/bin' '--sbindir=3D/=
OE/build/tmp/cross/armv7a/bin' '--libexecdir=3D/OE/build/tmp/cross/armv7a/l=
ibexec' '--datadir=3D/OE/build/tmp/cross/armv7a/share' '--sysconfdir=3D/OE/=
build/tmp/cross/armv7a/etc' '--sharedstatedir=3D/OE/build/tmp/cross/armv7a/=
com' '--localstatedir=3D/OE/build/tmp/cross/armv7a/var' '--libdir=3D/OE/bui=
ld/tmp/cross/armv7a/lib' '--includedir=3D/OE/build/tmp/cross/armv7a/include=
' '--oldincludedir=3D/OE/build/tmp/cross/armv7a/include' '--infodir=3D/OE/b=
uild/tmp/cross/armv7a/share/info' '--mandir=3D/OE/build/tmp/cross/armv7a/sh=
are/man' '--with-gnu-ld' '--enable-shared' '--enable-target-optspace' '--en=
able-threads=3Dposix' '--enable-multilib' '--enable-c99' '--enable-long-lon=
g' '--enable-symvers=3Dgnu' '--enable-libstdcxx-pch' '--enable-libssp' '--d=
isable-bootstrap' '--disable-libgomp' '--disable-libmudflap' '--with-local-=
prefix=3D/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi/usr' '--with-g=
xx-include-dir=3D/OE/build/tmp/staging/armv7a-angstrom-linux-gnueabi//usr/i=
nclude/c++' '--with-sysroot=3D/OE/build/tmp/staging/armv7a-angstrom-linux-g=
nueabi' '--with-build-sysroot=3D/OE/build/tmp/staging/armv7a-angstrom-linux=
-gnueabi' '--enable-cheaders=3Dc_std' '--disable-libunwind-exceptions' '--w=
ith-mpfr=3D/OE/build/tmp/staging/i686-linux/usr' '--enable-__cxa_atexit' '-=
-enable-languages=3Dc,c++,fortran,java,objc' --program-transform-name=3D's,=
^,arm-angstrom-linux-gnueabi-,''
target_cpu=3D'arm'
target_noncanonical=3D'arm-angstrom-linux-gnueabi'
target_os=3D'linux-gnueabi'
target_subdir=3D'arm-angstrom-linux-gnueabi'
target_vendor=3D'angstrom'
tooldir=3D'${exec_prefix}/arm-angstrom-linux-gnueabi'

## ------------- ##
## Output files. ##
## ------------- ##

alphaieee_frag=3D'/dev/null'
host_makefile_frag=3D'/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-=
cross-4.3.3-r7.1/gcc-4.3.3/config/mh-x86omitfp'
ospace_frag=3D'/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-4=
.3.3-r7.1/gcc-4.3.3/config/mt-ospace'
serialization_dependencies=3D'serdep.tmp'
target_makefile_frag=3D'/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gc=
c-cross-4.3.3-r7.1/gcc-4.3.3/config/mt-gnu'

## ----------- ##
## confdefs.h. ##
## ----------- ##

#define PACKAGE_BUGREPORT ""
#define PACKAGE_NAME ""
#define PACKAGE_STRING ""
#define PACKAGE_TARNAME ""
#define PACKAGE_VERSION ""
#endif
#ifdef __cplusplus
extern "C" void exit (int) throw ();

configure: exit 0

--Apple-Mail-25--457839634--
