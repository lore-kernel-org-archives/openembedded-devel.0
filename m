Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NKkti-0002MX-GI
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 04:50:01 +0100
Received: by yxe5 with SMTP id 5so594569yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 19:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=rUFY7Aod2GCQkPfCI8QVRLcleOZ1B7VKQdFUkDYkuwo=;
	b=IgufIzCs8e9nnHdQ3w3t6qXn283Gqhurfg9k6Q7quQYzzmzdGO9bIO8jAubKti3Bbm
	gL/BjSX9tZqMdDCPeSu9dS0tEYW/QH6lqJ7wuqjZaqZEygSGWiwSiCGSYBQLgc0SaEu9
	NJV7xRJVtQeCKyGcwq38h7Q+tGcx2hu1dGsEg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=izyTfvcmUZNUQb2KeSuUeGC9zr4OCqkfSkdUzn+Y/8bRHmjSH1+kr1NPsfBhC9zEv8
	YvUjejRwZ4sR2/CYasDM9MjV19AnD3BokDxHOVm9wUAmmfovjkkMWS7JVZNGBkgzE99U
	6KV5YK9q6UP6P7CtSIml1H3+u9SjB7pSYf8JQ=
Received: by 10.150.234.15 with SMTP id g15mr835345ybh.194.1260935290938;
	Tue, 15 Dec 2009 19:48:10 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.250])
	by mx.google.com with ESMTPS id 8sm240269yxg.42.2009.12.15.19.48.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Dec 2009 19:48:10 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u4y7xof0mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a90912150944l4488a139vcb3602869da3844c@mail.gmail.com>
Date: Wed, 16 Dec 2009 11:48:00 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u40h6aehmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <19c1b8a90912150944l4488a139vcb3602869da3844c@mail.gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
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
X-List-Received-Date: Wed, 16 Dec 2009 03:50:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

This error has not been reproduced on org.openembedded.dev branch of  =

openembedded. I used to meet this error at stable/2009 branch when  =

MACHINE=3Dqemux86 DISTRO=3Dminimal-eglibc

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


