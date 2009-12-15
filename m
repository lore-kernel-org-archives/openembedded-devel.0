Received: from mail-iw0-f194.google.com ([209.85.223.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NKbTA-0000SI-66
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 18:45:59 +0100
Received: by iwn32 with SMTP id 32so76152iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 09:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Qn9BSLqWOmTpiVGaDm1QhctCbYcJ/dW6SMSxZx4gxkM=;
	b=N9Elfe+tnaycqg+FSm/AEtNIXpRfNmmPT4OO9uzxfHJj5/nBm0ikqqUx9kblIN41cZ
	igtt17xb+yZ2QktAbUi65oU+Z88/bSXSD1sqImx5wt6BvAPLnVi3xnmKkJyoTMEYmypp
	X524n+cWq5qTMUAUjZ8f88COL3C5liHoaEvDk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wDd5nIGslZ0xpXnjNEZzJO6/eYwDS/dd6fhlhhiKm6so8BOXUapV95RcpSMpNaPcW1
	o9PSddoogALY/sieAJDdl9k6FEWVsEWI9ec6w4yEajtHieiHOsYZDS9HHfR+RZWIlD3L
	d6nPdHTnXafdlR/9jltvGIZlMj3mVQ+M8rcvE=
MIME-Version: 1.0
Received: by 10.231.190.83 with SMTP id g61mr3798123iba.6.1260899049069; Tue, 
	15 Dec 2009 09:44:09 -0800 (PST)
In-Reply-To: <op.u4y7xof0mn1qzu@guohr-laptop-ubuntu>
References: <op.u4y7xof0mn1qzu@guohr-laptop-ubuntu>
Date: Tue, 15 Dec 2009 09:44:09 -0800
Message-ID: <19c1b8a90912150944l4488a139vcb3602869da3844c@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.194
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Tue, 15 Dec 2009 17:45:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2009 at 3:09 AM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys,
> =C2=A0 I compiled eglibc for my x86 box. But when installing, the folllow=
ing
> error occured. Anyone can give me some hints
>
> Thanks a lot!
>
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/connections.o:
> In function `nscd_init':
> connections.c:(.text+0x2292): undefined reference to `inotify_init1'
> connections.c:(.text+0x2b9f): undefined reference to `mkostemp'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/getpwnam_r.o:
> In function `getpwnam_r':
> getpwnam_r.c:(.text+0xb2): undefined reference to `__nss_next2'
> getpwnam_r.c:(.text+0x11c): undefined reference to `__nss_passwd_lookup2'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/getpwuid_r.o:
> In function `getpwuid_r':
> getpwuid_r.c:(.text+0xb2): undefined reference to `__nss_next2'
> getpwuid_r.c:(.text+0x11c): undefined reference to `__nss_passwd_lookup2'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/getgrnam_r.o:
> In function `getgrnam_r':
> getgrnam_r.c:(.text+0xb2): undefined reference to `__nss_next2'
> getgrnam_r.c:(.text+0x11c): undefined reference to `__nss_group_lookup2'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/getgrgid_r.o:
> In function `getgrgid_r':
> getgrgid_r.c:(.text+0xb2): undefined reference to `__nss_next2'
> getgrgid_r.c:(.text+0x11c): undefined reference to `__nss_group_lookup2'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/gethstbyad_r.o:
> In function `__gethostbyaddr2_r':
> gethstbyad_r.c:(.text+0x87): undefined reference to `__nss_next2'
> gethstbyad_r.c:(.text+0x148): undefined reference to `__nss_hosts_lookup2=
'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/gethstbynm3_r.o:
> In function `__gethostbyname3_r':
> gethstbynm3_r.c:(.text+0xd6): undefined reference to `__nss_next2'
> gethstbynm3_r.c:(.text+0x1e3): undefined reference to `__nss_hosts_lookup=
2'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/getsrvbynm_r.o:
> In function `getservbyname_r':
> getsrvbynm_r.c:(.text+0xb7): undefined reference to `__nss_next2'
> getsrvbynm_r.c:(.text+0x121): undefined reference to
> `__nss_services_lookup2'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/getsrvbypt_r.o:
> In function `getservbyport_r':
> getsrvbypt_r.c:(.text+0xb7): undefined reference to `__nss_next2'
> getsrvbypt_r.c:(.text+0x121): undefined reference to
> `__nss_services_lookup2'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/gai.o:
> In function `getaddrinfo':
> gai.c:(.text+0x3ae6): undefined reference to `qsort_r'
> gai.c:(.text+0x3bea): undefined reference to `qsort_r'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/res_hconf.o:
> In function `arg_bool':
> res_hconf.c:(.text+0xa8): undefined reference to `__asprintf_chk'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/res_hconf.o:
> In function `arg_trimdomain_list':
> res_hconf.c:(.text+0x2a9): undefined reference to `__asprintf_chk'
> res_hconf.c:(.text+0x308): undefined reference to `__asprintf_chk'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nscd/res_hconf.o:
> In function `do_init':
> res_hconf.c:(.text+0x545): undefined reference to `__asprintf_chk'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/nis/libnsl.so:
> undefined reference to `__libc_clntudp_bufcreate@GLIBC_PRIVATE'
> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i=
586-oe-linux/rt/librt.so:
> undefined reference to `__fortify_fail@GLIBC_PRIVATE'
> collect2: ld returned 1 exit status
> make[2]: ***
> [/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-=
i586-oe-linux/nscd/nscd]
> Error 1
> make[2]: Leaving directory
> `/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/eglibc=
-2_9/libc/nscd'
> make[1]: *** [nscd/subdir_install] Error 2
> make[1]: Leaving directory
> `/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/eglibc=
-2_9/libc'
>

post your log files and run files somewhere

-Khem
>


