Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUnIn-0004qb-IP
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 22:29:53 +0100
Received: by pxi9 with SMTP id 9so1053914pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 13:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=0wjG28nl613oCMfrq68SZmlN10xxtVPOTzylMKdaId4=;
	b=w2j3p5jyrBMmdzPkBKiviIEtsoIKp1AHYMVR/IwlDcQj89psRDaNAzfWS3ekHxOVna
	zo5OgJY4jeSexUHGoPw4+zMCyZ18VrUHWEqxdA2+liFJFk/Rqhi+3BN5zTue2UULx5uz
	6vCwVXcaRjiTtWap3WRT3hkrXr4ZsPqX2ZfKs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wKwz5byS8OtH3iSmyOvZCb9zxt8ZI+170huTUTpENtuFIkaKcEv1h/KjnMqbJrbqHI
	s+6Zk2/9A7ZKI+rjOGvu281RVNJ7K7YNbSVJRKp0OG6L4PdZ/t7lTf/XrVS32lUBOx/l
	n4a6fJMLrz2Z6jLNvwKYmxeWbf21ADhoqufwQ=
Received: by 10.142.141.14 with SMTP id o14mr3835865wfd.396.1292880585130;
	Mon, 20 Dec 2010 13:29:45 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x35sm6431426wfd.1.2010.12.20.13.29.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 13:29:44 -0800 (PST)
Date: Mon, 20 Dec 2010 13:29:58 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101220212958.GC17904@gmail.com>
References: <4D0FA44D.7000907@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4D0FA44D.7000907@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: openssl-native_1.0.0b.bb do_compile failed
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
X-List-Received-Date: Mon, 20 Dec 2010 21:29:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (20/12/10 19:45), Jan Paesmans wrote:
> Hi,
> 
> I have a problem with building the openssl-native package. Seems like
> there is something wrong when liking one of the openssl engines and that
> the file openssl.ld is needed.
> 
> I'm building the release-2010.12 branch for the ion platform. My host is
> a ubuntu 10.10
> 
> | make[3]: Entering directory
> `/home/janp/hudson/openembedded/tmp/work/x86_64-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b/engines/ccgost'
> | /usr/bin/ld: error: cannot open openssl.ld: No such file or directory
> | /usr/bin/ld: fatal error: unable to parse version script file openssl.ld
> | collect2: ld returned 1 exit status
> | make[3]: *** [link_o.gnu] Error 1
> | make[3]: Leaving directory
> `/home/janp/hudson/openembedded/tmp/work/x86_64-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b/engines/ccgost'
> | make[2]: *** [lib] Error 2
> | make[2]: Leaving directory
> `/home/janp/hudson/openembedded/tmp/work/x86_64-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b/engines/ccgost'
> | make[1]: *** [subdirs] Error 1
> | make[1]: Leaving directory
> `/home/janp/hudson/openembedded/tmp/work/x86_64-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b/engines'
> | make: *** [build_engines] Error 1
> | FATAL: oe_runmake failed
> | ERROR: Function do_compile failed
> NOTE: package openssl-native-1.0.0b-r13.1: task do_compile: Failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/janp/hudson/openembedded/recipes/openssl/openssl-native_1.0.0b.bb
> do_compile failed
> ERROR: Task 13
> (/home/janp/hudson/openembedded/recipes/openssl/openssl-native_1.0.0b.bb, do_compile)
> failed with 256
> ERROR:
> '/home/janp/hudson/openembedded/recipes/openssl/openssl-native_1.0.0b.bb' failed
> ERROR:
> '/home/janp/hudson/openembedded/recipes/openssl/openssl-native_1.0.0b.bb' failed
> 
> 
> I traced the culprit down to the following command using strace:
> execve("/usr/bin/ld", ["/usr/bin/ld", "--build-id", "--eh-frame-hdr",
> "-m", "elf_x86_64", "--hash-style=gnu", "-shared", "-o", "libgost.so",
> "-z", "relro",
> "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../../../lib/crti.o",
> "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/crtbeginS.o", "-L../..",
> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5",
> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5",
> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../../../lib",
> "-L/lib/../lib", "-L/usr/lib/../lib",
> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../..",
> "-L/usr/lib/x86_64-linux-gnu", "-lcrypto",
> "--version-script=openssl.ld", "-Bsymbolic", "-soname=libgost.so",
> "--whole-archive", "e_gost_err.o", "gost2001_keyx.o", "gost2001.o",
> "gost89.o", "gost94_keyx.o", "gost_ameth.o", "gost_asn1.o",
> "gost_crypt.o", "gost_ctl.o", "gost_eng.o", "gosthash.o",
> "gost_keywrap.o", "gost_md.o", "gost_params.o", "gost_pmeth.o",
> "gost_sign.o", "--no-whole-archive", "-lgcc", "--as-needed", "-lgcc_s",
> "--no-as-needed", "-lc", "-lgcc", "--as-needed", "-lgcc_s",
> "--no-as-needed", "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/crtendS.o",
> "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../../../lib/crtn.o"], [/* 102
> vars */]) = 0
> 
> Seems like this file openssl.ld is needed for the --version-script.
> I did a simple test that involved removing the offending linker flag
> from the makefile and that did the trick. However it seems to me that
> this is a very hackish solution.
> 
> Any further ideas?

Well removing it may not be a good thing to do. Can you make sure
that this ld script exist in the build tree


