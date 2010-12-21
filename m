Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1PV7Mn-0006gM-5b
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 19:55:21 +0100
Received: by wwi17 with SMTP id 17so4253812wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 10:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=BM8rBSLTg+PCTwRgrGrRYH2K8ub/TaVDbnQjVaZz3n0=;
	b=PhWIFY2LCPKlhAtTxQlm/xykNuv7EAjPPnMhYCbViIv/qcsFon/Ap5ZmD5Anvy+88o
	tBzUeE7/KGIkSL3vzV1CCNG2zexPVCUDvTfaU9UYcLIa7larfT/Zq/aHxv3gIiTNoJ42
	JmVdNMR9sWA7rephcX5F7FugPRKgXm67ZxtY4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=FpjennAm/aHY0dNIYRBRiSUg9y2kswKx6AZCsBdDoxaY7VpH1de3MoLKs7yhmnD5c4
	54o2CZKmEUPKkWlkW9oufzfdnP14VYSCU7lKff4HAK0VeKZx3luaBKrAv191t3IY58lW
	X1DGL10eunbVjn2fzMg4DcT1hrSS1PAtqUKRs=
Received: by 10.227.96.212 with SMTP id i20mr3648028wbn.157.1292957714293;
	Tue, 21 Dec 2010 10:55:14 -0800 (PST)
Received: from [192.168.1.103] (243.204-242-81.adsl-dyn.isp.belgacom.be
	[81.242.204.243])
	by mx.google.com with ESMTPS id 11sm3824671wbi.6.2010.12.21.10.55.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 21 Dec 2010 10:55:12 -0800 (PST)
Message-ID: <4D10F80E.1000505@gmail.com>
Date: Tue, 21 Dec 2010 19:55:10 +0100
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
X-List-Received-Date: Tue, 21 Dec 2010 18:55:21 -0000
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
Well, seems that the files openssl.ld are created by the debian.patch.
Any idea why that is applied?

Regards,

Jan


