Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1PUndU-0005Oc-O7
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 22:51:16 +0100
Received: by wyb40 with SMTP id 40so3398122wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 13:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=AgFtspwabiME5KF/BkrDimEcWG5im/jPwsGoJCMCyQk=;
	b=WKB0JHRk7WYErnyfTZlKbSVekAxL0i5Y0W8GUhv95ZQT4tevZj2MAY43nbt7zrsqsM
	bjFzUr9thC2HdoPspWxcqb7kRbFFfmn09Y4f3WGEWHDIJ8A4GBZCaw0cd+XHNzWuNj9J
	r7uX1TwS8h4Bo4iFgFXuQNR/uH5yqTS2nwxRw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=S7QhEjLouO6A+02i1oPtMyUB59CZLT0VLqHWTyJc0BvBA5L8rWjvQnHMUythBdvIba
	CkGyY0juQ/W2iTFHP9nObfc0cFBJ8RMX6Lr3c/NyXN/3e1asFHuEyLWQYoE4UdTZv30n
	FXbDbVWGPHlRGKaPKKYvoUPZ9cMbdSx2bx8a4=
Received: by 10.216.179.144 with SMTP id h16mr5172642wem.64.1292881869747;
	Mon, 20 Dec 2010 13:51:09 -0800 (PST)
Received: from [192.168.1.103] (243.204-242-81.adsl-dyn.isp.belgacom.be
	[81.242.204.243])
	by mx.google.com with ESMTPS id o51sm2139977wes.15.2010.12.20.13.51.08
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 13:51:08 -0800 (PST)
Message-ID: <4D0FCFCB.6020501@gmail.com>
Date: Mon, 20 Dec 2010 22:51:07 +0100
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101213 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D0FA44D.7000907@gmail.com> <20101220212958.GC17904@gmail.com>
In-Reply-To: <20101220212958.GC17904@gmail.com>
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
X-List-Received-Date: Mon, 20 Dec 2010 21:51:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/20/10 22:29, Khem Raj wrote:
> On (20/12/10 19:45), Jan Paesmans wrote:
>> Hi,
>>
>> I have a problem with building the openssl-native package. Seems like
>> there is something wrong when liking one of the openssl engines and that
>> the file openssl.ld is needed.
>>
>> I'm building the release-2010.12 branch for the ion platform. My host is
>> a ubuntu 10.10
>>
>> | make[3]: Entering directory
>> `/home/janp/hudson/openembedded/tmp/work/x86_64-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b/engines/ccgost'
>> | /usr/bin/ld: error: cannot open openssl.ld: No such file or directory
>> | /usr/bin/ld: fatal error: unable to parse version script file openssl.ld
>> | collect2: ld returned 1 exit status
>> | make[3]: *** [link_o.gnu] Error 1
>> | make[3]: Leaving directory
>> `/home/janp/hudson/openembedded/tmp/work/x86_64-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b/engines/ccgost'
>> | make[2]: *** [lib] Error 2
>> | make[2]: Leaving directory
>> `/home/janp/hudson/openembedded/tmp/work/x86_64-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b/engines/ccgost'
>> | make[1]: *** [subdirs] Error 1
>> | make[1]: Leaving directory
>> `/home/janp/hudson/openembedded/tmp/work/x86_64-linux/openssl-native-1.0.0b-r13.1/openssl-1.0.0b/engines'
>> | make: *** [build_engines] Error 1
>> | FATAL: oe_runmake failed
>> | ERROR: Function do_compile failed
>> NOTE: package openssl-native-1.0.0b-r13.1: task do_compile: Failed
>> ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> /home/janp/hudson/openembedded/recipes/openssl/openssl-native_1.0.0b.bb
>> do_compile failed
>> ERROR: Task 13
>> (/home/janp/hudson/openembedded/recipes/openssl/openssl-native_1.0.0b.bb, do_compile)
>> failed with 256
>> ERROR:
>> '/home/janp/hudson/openembedded/recipes/openssl/openssl-native_1.0.0b.bb' failed
>> ERROR:
>> '/home/janp/hudson/openembedded/recipes/openssl/openssl-native_1.0.0b.bb' failed
>>
>>
>> I traced the culprit down to the following command using strace:
>> execve("/usr/bin/ld", ["/usr/bin/ld", "--build-id", "--eh-frame-hdr",
>> "-m", "elf_x86_64", "--hash-style=gnu", "-shared", "-o", "libgost.so",
>> "-z", "relro",
>> "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../../../lib/crti.o",
>> "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/crtbeginS.o", "-L../..",
>> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5",
>> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5",
>> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../../../lib",
>> "-L/lib/../lib", "-L/usr/lib/../lib",
>> "-L/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../..",
>> "-L/usr/lib/x86_64-linux-gnu", "-lcrypto",
>> "--version-script=openssl.ld", "-Bsymbolic", "-soname=libgost.so",
>> "--whole-archive", "e_gost_err.o", "gost2001_keyx.o", "gost2001.o",
>> "gost89.o", "gost94_keyx.o", "gost_ameth.o", "gost_asn1.o",
>> "gost_crypt.o", "gost_ctl.o", "gost_eng.o", "gosthash.o",
>> "gost_keywrap.o", "gost_md.o", "gost_params.o", "gost_pmeth.o",
>> "gost_sign.o", "--no-whole-archive", "-lgcc", "--as-needed", "-lgcc_s",
>> "--no-as-needed", "-lc", "-lgcc", "--as-needed", "-lgcc_s",
>> "--no-as-needed", "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/crtendS.o",
>> "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/../../../../lib/crtn.o"], [/* 102
>> vars */]) = 0
>>
>> Seems like this file openssl.ld is needed for the --version-script.
>> I did a simple test that involved removing the offending linker flag
>> from the makefile and that did the trick. However it seems to me that
>> this is a very hackish solution.
>>
>> Any further ideas?
> Well removing it may not be a good thing to do. Can you make sure
> that this ld script exist in the build tree
Yes, it exists in 2 places, the root of openssl source dir and in the
engines directory


