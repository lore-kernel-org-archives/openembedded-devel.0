Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MdIaC-0006UY-HY
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 08:54:15 +0200
Received: by qyk35 with SMTP id 35so2587391qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 23:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=G9SzKh3qYu3AjuvaYLnvf4pQ30IR6936AorAZiSECsw=;
	b=SdSUTZ5TWN94J75yX3V4FEgrGxb2I0B6riKGc6sNDPX6CndXIpMErFMmfqGMVr+9XG
	J37OmBXWvirOAf2Wbv22HOHSuwlz9PU/KW2RUhUbmQCqmEg6RKjrG0TM1hWsri5YX6lV
	/RJUd/Kz9Ry7cIQXovybA2qMGM/8BXg1vTVEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sq3e5gj8vv82sqMwTA1IBGDxz5roauxy2cPonRfK3kmoLIFgx5mf4p2Iwn1L/JtFy5
	TPuXXbrirwlqwZU1TWz5veYarCNQd6NhR16Gu0tz765sNfwMWN2MhCgbxggVEAnJJUTQ
	YsPuNzu3QeY22SHw7tzRMBqXTrvDNl+/cqVyY=
MIME-Version: 1.0
Received: by 10.229.11.16 with SMTP id r16mr2322501qcr.0.1250577423002; Mon, 
	17 Aug 2009 23:37:03 -0700 (PDT)
In-Reply-To: <20090817234217.GI2227@smtp.west.cox.net>
References: <1250547762-18690-1-git-send-email-msmith@cbnco.com>
	<20090817234217.GI2227@smtp.west.cox.net>
Date: Mon, 17 Aug 2009 23:37:02 -0700
Message-ID: <19c1b8a90908172337h6e1f5b81uc321c553141a3929@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] site/common-linux: centralize bash configure vars
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
X-List-Received-Date: Tue, 18 Aug 2009 06:54:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2009 at 4:42 PM, Tom Rini<trini@embeddedalley.com> wrote:
> On Mon, Aug 17, 2009 at 06:22:42PM -0400, Michael Smith wrote:
>
>> If the other site files are accurate, almost all of the bash vars
>> are universal across Linux.
>>
>> Did this to fix bash on x86_64. Also bump bash PRs to help track
>> breakage later.
>>
>> Signed-off-by: Michael Smith <msmith@cbnco.com>
>
> Acked-by: Tom Rini <trini@embeddedalley.com>
>

Acked-by: Khem Raj <raj.khem@gmail.com>

Did you test it by building/running uclibc based system as well ?

>> ---
>> =C2=A0recipes/bash/bash_3.0.bb | =C2=A0 =C2=A02 +-
>> =C2=A0recipes/bash/bash_3.2.bb | =C2=A0 =C2=A02 +-
>> =C2=A0site/arm-common =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 14 ----=
----------
>> =C2=A0site/avr32-common =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ---
>> =C2=A0site/common-linux =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 15 +++++++++=
++++++
>> =C2=A0site/ix86-common =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 14 ---------=
-----
>> =C2=A0site/mips-linux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 14 ----=
----------
>> =C2=A0site/mipsel-linux =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 14 ---------=
-----
>> =C2=A0site/mipsel-linux-uclibc | =C2=A0 14 --------------
>> =C2=A0site/powerpc-common =C2=A0 =C2=A0 =C2=A0| =C2=A0 14 --------------
>> =C2=A0site/sh-common =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 14 ----=
----------
>> =C2=A0site/sparc-linux =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 ---
>> =C2=A0site/x86_64-linux =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +++-
>> =C2=A0site/x86_64-linux-uclibc | =C2=A0 =C2=A01 -
>> =C2=A014 files changed, 20 insertions(+), 108 deletions(-)
>>
>> diff --git a/recipes/bash/bash_3.0.bb b/recipes/bash/bash_3.0.bb
>> index e23887a..8165d07 100644
>> --- a/recipes/bash/bash_3.0.bb
>> +++ b/recipes/bash/bash_3.0.bb
>> @@ -1,5 +1,5 @@
>> =C2=A0require bash.inc
>> -PR =3D "r11"
>> +PR =3D "r12"
>>
>> =C2=A0SRC_URI +=3D "\
>> =C2=A0 =C2=A0file://bash-3.0-fixes.patch;patch=3D1 \
>> diff --git a/recipes/bash/bash_3.2.bb b/recipes/bash/bash_3.2.bb
>> index 6a48a4b..e175467 100644
>> --- a/recipes/bash/bash_3.2.bb
>> +++ b/recipes/bash/bash_3.2.bb
>> @@ -1,6 +1,6 @@
>> =C2=A0require bash.inc
>>
>> -PR =3D "r7"
>> +PR =3D "r8"
>>
>> =C2=A0SRC_URI +=3D "\
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://builtins.patch;patch=3D=
1 \
>> diff --git a/site/arm-common b/site/arm-common
>> index 5d3e68a..39eb30b 100644
>> --- a/site/arm-common
>> +++ b/site/arm-common
>> @@ -14,21 +14,7 @@ apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_w=
ith_cork=3Dyes}
>>
>> =C2=A0# bash
>> =C2=A0ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> =C2=A0bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
>> -bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandle=
rs=3Dno}
>> -bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
>> -bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
>> -bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
>> -bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
>> -bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
>> -bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
>> -bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
>> -bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
>> -bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
>> -bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
>> -bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
>> -bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
>>
>> =C2=A0# coreutils
>> =C2=A0utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1019}
>> diff --git a/site/avr32-common b/site/avr32-common
>> index 2d26a3a..fedd104 100644
>> --- a/site/avr32-common
>> +++ b/site/avr32-common
>> @@ -16,9 +16,6 @@ ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_no=
nnull=3Dyes}
>> =C2=A0#gstreamer
>> =C2=A0as_cv_unaligned_access=3D${as_cv_unaligned_access=3Dno}
>>
>> -#readline
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> -
>> =C2=A0#libpcap
>> =C2=A0ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
>>
>> diff --git a/site/common-linux b/site/common-linux
>> index 8d915d0..ffb209b 100644
>> --- a/site/common-linux
>> +++ b/site/common-linux
>> @@ -10,3 +10,18 @@ samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3D${samba_cv=
_HAVE_IRIX_SPECIFIC_CAPABILIT
>> =C2=A0# coreutils
>> =C2=A0fu_cv_sys_stat_statfs2_bsize=3D${fu_cv_sys_stat_statfs2_bsize=3Dye=
s}
>>
>> +# bash
>> +bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> +bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandle=
rs=3Dno}
>> +bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
>> +bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
>> +bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
>> +bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
>> +bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
>> +bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
>> +bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
>> +bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
>> +bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
>> +bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
>> +bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
>> +bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
>> diff --git a/site/ix86-common b/site/ix86-common
>> index a5c4b60..de637ec 100644
>> --- a/site/ix86-common
>> +++ b/site/ix86-common
>> @@ -55,21 +55,7 @@ ac_cv_file_lib_src_libmad_frame_h=3D${ac_cv_file_lib_=
src_libmad_frame_h=3Dno}
>>
>> =C2=A0# bash
>> =C2=A0ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> =C2=A0bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
>> -bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandle=
rs=3Dno}
>> -bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
>> -bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
>> -bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
>> -bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
>> -bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
>> -bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
>> -bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
>> -bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
>> -bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
>> -bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
>> -bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
>> -bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
>>
>> =C2=A0# clamav
>> =C2=A0clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_sn=
printf_long=3Dyes}
>> diff --git a/site/mips-linux b/site/mips-linux
>> index 11c6033..43f4aef 100644
>> --- a/site/mips-linux
>> +++ b/site/mips-linux
>> @@ -8,21 +8,7 @@ ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_non=
null=3Dyes}
>>
>> =C2=A0# bash
>> =C2=A0ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> =C2=A0bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
>> -bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandle=
rs=3Dno}
>> -bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
>> -bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
>> -bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
>> -bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
>> -bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
>> -bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
>> -bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
>> -bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
>> -bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
>> -bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
>> -bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
>> -bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
>>
>> =C2=A0# openssh
>> =C2=A0ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=
=3Dno}
>> diff --git a/site/mipsel-linux b/site/mipsel-linux
>> index 06602ca..4685c75 100644
>> --- a/site/mipsel-linux
>> +++ b/site/mipsel-linux
>> @@ -8,21 +8,7 @@ ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_non=
null=3Dyes}
>>
>> =C2=A0# bash
>> =C2=A0ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> =C2=A0bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
>> -bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandle=
rs=3Dno}
>> -bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
>> -bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
>> -bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
>> -bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
>> -bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
>> -bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
>> -bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
>> -bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
>> -bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
>> -bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
>> -bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
>> -bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
>>
>> =C2=A0# openssh
>> =C2=A0ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=
=3Dno}
>> diff --git a/site/mipsel-linux-uclibc b/site/mipsel-linux-uclibc
>> index 9545fea..25fa8b5 100644
>> --- a/site/mipsel-linux-uclibc
>> +++ b/site/mipsel-linux-uclibc
>> @@ -8,21 +8,7 @@ ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_non=
null=3Dyes}
>>
>> =C2=A0# bash
>> =C2=A0ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dno}
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> =C2=A0bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
>> -bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandle=
rs=3Dno}
>> -bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
>> -bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
>> -bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
>> -bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
>> -bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
>> -bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
>> -bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
>> -bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
>> -bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
>> -bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
>> -bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
>> -bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
>>
>> =C2=A0# openssh
>> =C2=A0ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=
=3Dno}
>> diff --git a/site/powerpc-common b/site/powerpc-common
>> index cc523bc..f5acef8 100644
>> --- a/site/powerpc-common
>> +++ b/site/powerpc-common
>> @@ -208,21 +208,7 @@ cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=
=3Dyes}
>>
>> =C2=A0# bash
>> =C2=A0ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> =C2=A0bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
>> -bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandle=
rs=3Dno}
>> -bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
>> -bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
>> -bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
>> -bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
>> -bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
>> -bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
>> -bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
>> -bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
>> -bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
>> -bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
>> -bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
>> -bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
>>
>> =C2=A0# openssh
>> =C2=A0ac_cv_have_broken_dirname=3D${ac_cv_have_broken_dirname=3D'yes'}
>> diff --git a/site/sh-common b/site/sh-common
>> index a9ccf2f..02ea89d 100644
>> --- a/site/sh-common
>> +++ b/site/sh-common
>> @@ -223,21 +223,7 @@ cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=
=3Dyes}
>>
>> =C2=A0# bash
>> =C2=A0ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> =C2=A0bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
>> -bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighandle=
rs=3Dno}
>> -bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
>> -bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
>> -bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
>> -bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
>> -bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
>> -bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
>> -bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
>> -bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
>> -bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
>> -bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
>> -bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
>> -bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
>>
>> =C2=A0# mono
>> =C2=A0cv_mono_sizeof_sunpath=3D108
>> diff --git a/site/sparc-linux b/site/sparc-linux
>> index 491dc74..ea6386b 100644
>> --- a/site/sparc-linux
>> +++ b/site/sparc-linux
>> @@ -53,6 +53,3 @@ glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
>>
>> =C2=A0#linux
>> =C2=A0ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
>> -
>> -#bash
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> diff --git a/site/x86_64-linux b/site/x86_64-linux
>> index 83d1511..9180cd6 100644
>> --- a/site/x86_64-linux
>> +++ b/site/x86_64-linux
>> @@ -25,7 +25,6 @@ ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
>> =C2=A0ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D8}
>> =C2=A0ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D8}
>> =C2=A0ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> =C2=A0db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long long'}
>> =C2=A0db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
>> =C2=A0db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
>> @@ -93,3 +92,6 @@ ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_so=
ckets=3Dyes}
>>
>> =C2=A0# p3scan / quagga
>> =C2=A0ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dye=
s}
>> +
>> +# bash
>> +bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dpresent}
>> diff --git a/site/x86_64-linux-uclibc b/site/x86_64-linux-uclibc
>> index fe235d0..2f7bacd 100644
>> --- a/site/x86_64-linux-uclibc
>> +++ b/site/x86_64-linux-uclibc
>> @@ -24,7 +24,6 @@ ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
>> =C2=A0ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D8}
>> =C2=A0ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D8}
>> =C2=A0ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
>> -bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
>> =C2=A0db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long long'}
>> =C2=A0db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
>> =C2=A0db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
>> --
>> 1.6.3
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


