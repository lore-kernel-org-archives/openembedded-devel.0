Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NKVJA-00065c-No
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 12:11:16 +0100
Received: by pwi18 with SMTP id 18so2855010pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 03:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:date:to:subject
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=ugVKJFwJ8FhWyNoAMWMUWMYoRMpikJwJmbW3yE1jj30=;
	b=tvNbRFKahHf2SlqzfVyf6Ufqqz3coNLpd+my5aKbxyMrezg+1j3EJ1it87ZkbdKkUz
	aD5WKka7EIEhfM8MmX+MrpXnn4k/ulo3zVb382Sn4MNFnLPMwAF+3kboUTbOY8ejDwfq
	ESr3sG3GcK+CWVehol6m46zf8FomN61OU5Bts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:date:to:subject:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=Uqd5kaX+Jl+4MBRZEeMh2PXctKqX1OgPBeJ0juUSxo9UmCDazZihKN2r6YRapFh6Ci
	moU8ToTkgfOPiKJrKhDCMnM6E8Pl0wPy0SAy1e4UdYjx3X7W3LxsWFDoqlXKKj/CpDWm
	NaoCMe4Yj3F9QBcliYvXzTbmHSEpw7gls8uRE=
Received: by 10.115.117.9 with SMTP id u9mr542820wam.172.1260875364061;
	Tue, 15 Dec 2009 03:09:24 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.68.164])
	by mx.google.com with ESMTPS id 20sm5790636pzk.5.2009.12.15.03.09.21
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Dec 2009 03:09:23 -0800 (PST)
Date: Tue, 15 Dec 2009 19:09:14 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u4y7xof0mn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: undefined reference when installing eglibc on x86 platform
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
X-List-Received-Date: Tue, 15 Dec 2009 11:11:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
    I compiled eglibc for my x86 box. But when installing, the folllowing  
error occured. Anyone can give me some hints

Thanks a lot!

/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/connections.o:  
In function `nscd_init':
connections.c:(.text+0x2292): undefined reference to `inotify_init1'
connections.c:(.text+0x2b9f): undefined reference to `mkostemp'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/getpwnam_r.o:  
In function `getpwnam_r':
getpwnam_r.c:(.text+0xb2): undefined reference to `__nss_next2'
getpwnam_r.c:(.text+0x11c): undefined reference to `__nss_passwd_lookup2'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/getpwuid_r.o:  
In function `getpwuid_r':
getpwuid_r.c:(.text+0xb2): undefined reference to `__nss_next2'
getpwuid_r.c:(.text+0x11c): undefined reference to `__nss_passwd_lookup2'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/getgrnam_r.o:  
In function `getgrnam_r':
getgrnam_r.c:(.text+0xb2): undefined reference to `__nss_next2'
getgrnam_r.c:(.text+0x11c): undefined reference to `__nss_group_lookup2'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/getgrgid_r.o:  
In function `getgrgid_r':
getgrgid_r.c:(.text+0xb2): undefined reference to `__nss_next2'
getgrgid_r.c:(.text+0x11c): undefined reference to `__nss_group_lookup2'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/gethstbyad_r.o:  
In function `__gethostbyaddr2_r':
gethstbyad_r.c:(.text+0x87): undefined reference to `__nss_next2'
gethstbyad_r.c:(.text+0x148): undefined reference to `__nss_hosts_lookup2'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/gethstbynm3_r.o:  
In function `__gethostbyname3_r':
gethstbynm3_r.c:(.text+0xd6): undefined reference to `__nss_next2'
gethstbynm3_r.c:(.text+0x1e3): undefined reference to `__nss_hosts_lookup2'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/getsrvbynm_r.o:  
In function `getservbyname_r':
getsrvbynm_r.c:(.text+0xb7): undefined reference to `__nss_next2'
getsrvbynm_r.c:(.text+0x121): undefined reference to  
`__nss_services_lookup2'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/getsrvbypt_r.o:  
In function `getservbyport_r':
getsrvbypt_r.c:(.text+0xb7): undefined reference to `__nss_next2'
getsrvbypt_r.c:(.text+0x121): undefined reference to  
`__nss_services_lookup2'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/gai.o:  
In function `getaddrinfo':
gai.c:(.text+0x3ae6): undefined reference to `qsort_r'
gai.c:(.text+0x3bea): undefined reference to `qsort_r'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/res_hconf.o:  
In function `arg_bool':
res_hconf.c:(.text+0xa8): undefined reference to `__asprintf_chk'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/res_hconf.o:  
In function `arg_trimdomain_list':
res_hconf.c:(.text+0x2a9): undefined reference to `__asprintf_chk'
res_hconf.c:(.text+0x308): undefined reference to `__asprintf_chk'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/res_hconf.o:  
In function `do_init':
res_hconf.c:(.text+0x545): undefined reference to `__asprintf_chk'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nis/libnsl.so:  
undefined reference to `__libc_clntudp_bufcreate@GLIBC_PRIVATE'
/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/rt/librt.so:  
undefined reference to `__fortify_fail@GLIBC_PRIVATE'
collect2: ld returned 1 exit status
make[2]: ***  
[/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/build-i586-oe-linux/nscd/nscd]  
Error 1
make[2]: Leaving directory  
`/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/eglibc-2_9/libc/nscd'
make[1]: *** [nscd/subdir_install] Error 2
make[1]: Leaving directory  
`/media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r5/eglibc-2_9/libc'


-- 
Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


