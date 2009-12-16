Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NKmPT-0001XJ-LF
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 06:26:54 +0100
Received: by gxk7 with SMTP id 7so1229071gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 21:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=GWuP0fI3eikEklEBib1RYX0P5Ly6qjFDLKv/RmeXqe0=;
	b=rkUSD1LJegFf3RK/THncC4Gj0/BT+cuALFl28Sq2l+VHSRP/j+y+1uLrEEpoqWuuQs
	B9EO1gXUTdIvkOqkPfpFCA20deriFb8TdXi8/UcZqxIo+3ImfmXryNEqoa4iDP4jeMrW
	Z2q3GQ9V5vziutlXCJN/8h6tRCFBEh17/J/D8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=X7L///dEI8L+QyBeBuBiRK+MeSuG3W9xn7NaXaiJj6HNDlTT0wgEay+jlkMfTv7glE
	Ym5WwOx8mFYtfHa+0M2eU9Cc6XlEqCfy9ZvPUZN+cvcFWdo4TYSooCuT+YWgtSdn50LR
	odi32HeeHpIUfrMzWUvaWXO9DVOFyEZzCbB/8=
Received: by 10.90.37.33 with SMTP id k33mr593637agk.114.1260941104143;
	Tue, 15 Dec 2009 21:25:04 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.250])
	by mx.google.com with ESMTPS id 22sm334300iwn.8.2009.12.15.21.25.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Dec 2009 21:25:03 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u4y7xof0mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a90912150944l4488a139vcb3602869da3844c@mail.gmail.com>
Date: Wed, 16 Dec 2009 13:24:51 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u40mnpo7mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a90912150944l4488a139vcb3602869da3844c@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: undefined reference when installing eglibc on x86 platform
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
X-List-Received-Date: Wed, 16 Dec 2009 05:26:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I found the cause. it is caused by the incorrect libc-initial defination=
.

PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D "eglibc-init=
ial"

=E5=9C=A8 Wed, 16 Dec 2009 01:44:09 +0800=EF=BC=8CKhem Raj <raj.khem@gma=
il.com> =E5=86=99=E9=81=93:

> On Tue, Dec 15, 2009 at 3:09 AM, Guo Hongruan <camelguo@gmail.com> wro=
te:
>> Hi guys,
>>   I compiled eglibc for my x86 box. But when installing, the folllowi=
ng
>> error occured. Anyone can give me some hints
>>
>> Thanks a lot!
>>
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/connections.o:
>> In function `nscd_init':
>> connections.c:(.text+0x2292): undefined reference to `inotify_init1'
>> connections.c:(.text+0x2b9f): undefined reference to `mkostemp'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/getpwnam_r.o:
>> In function `getpwnam_r':
>> getpwnam_r.c:(.text+0xb2): undefined reference to `__nss_next2'
>> getpwnam_r.c:(.text+0x11c): undefined reference to  =

>> `__nss_passwd_lookup2'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/getpwuid_r.o:
>> In function `getpwuid_r':
>> getpwuid_r.c:(.text+0xb2): undefined reference to `__nss_next2'
>> getpwuid_r.c:(.text+0x11c): undefined reference to  =

>> `__nss_passwd_lookup2'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/getgrnam_r.o:
>> In function `getgrnam_r':
>> getgrnam_r.c:(.text+0xb2): undefined reference to `__nss_next2'
>> getgrnam_r.c:(.text+0x11c): undefined reference to `__nss_group_looku=
p2'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/getgrgid_r.o:
>> In function `getgrgid_r':
>> getgrgid_r.c:(.text+0xb2): undefined reference to `__nss_next2'
>> getgrgid_r.c:(.text+0x11c): undefined reference to `__nss_group_looku=
p2'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/gethstbyad_r.o:
>> In function `__gethostbyaddr2_r':
>> gethstbyad_r.c:(.text+0x87): undefined reference to `__nss_next2'
>> gethstbyad_r.c:(.text+0x148): undefined reference to  =

>> `__nss_hosts_lookup2'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/gethstbynm3_r.o:
>> In function `__gethostbyname3_r':
>> gethstbynm3_r.c:(.text+0xd6): undefined reference to `__nss_next2'
>> gethstbynm3_r.c:(.text+0x1e3): undefined reference to  =

>> `__nss_hosts_lookup2'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/getsrvbynm_r.o:
>> In function `getservbyname_r':
>> getsrvbynm_r.c:(.text+0xb7): undefined reference to `__nss_next2'
>> getsrvbynm_r.c:(.text+0x121): undefined reference to
>> `__nss_services_lookup2'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/getsrvbypt_r.o:
>> In function `getservbyport_r':
>> getsrvbypt_r.c:(.text+0xb7): undefined reference to `__nss_next2'
>> getsrvbypt_r.c:(.text+0x121): undefined reference to
>> `__nss_services_lookup2'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/gai.o:
>> In function `getaddrinfo':
>> gai.c:(.text+0x3ae6): undefined reference to `qsort_r'
>> gai.c:(.text+0x3bea): undefined reference to `qsort_r'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/res_hconf.o:
>> In function `arg_bool':
>> res_hconf.c:(.text+0xa8): undefined reference to `__asprintf_chk'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/res_hconf.o:
>> In function `arg_trimdomain_list':
>> res_hconf.c:(.text+0x2a9): undefined reference to `__asprintf_chk'
>> res_hconf.c:(.text+0x308): undefined reference to `__asprintf_chk'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nscd/res_hconf.o:
>> In function `do_init':
>> res_hconf.c:(.text+0x545): undefined reference to `__asprintf_chk'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/nis/libnsl.so:
>> undefined reference to `__libc_clntudp_bufcreate@GLIBC_PRIVATE'
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bui=
ld-i586-oe-linux/rt/librt.so:
>> undefined reference to `__fortify_fail@GLIBC_PRIVATE'
>> collect2: ld returned 1 exit status
>> make[2]: ***
>> [/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/bu=
ild-i586-oe-linux/nscd/nscd]
>> Error 1
>> make[2]: Leaving directory
>> `/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/eg=
libc-2_9/libc/nscd'
>> make[1]: *** [nscd/subdir_install] Error 2
>> make[1]: Leaving directory
>> `/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/eg=
libc-2_9/libc'
>>
>
> post your log files and run files somewhere
>
> -Khem
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


