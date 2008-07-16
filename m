Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KJ2fR-0001Q4-Oc
	for openembedded-devel@openembedded.org; Wed, 16 Jul 2008 10:47:21 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KJ2eg-0005DZ-OK
	for openembedded-devel@openembedded.org; Wed, 16 Jul 2008 08:46:34 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 16 Jul 2008 08:46:34 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 16 Jul 2008 08:46:34 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 16 Jul 2008 10:46:26 +0200
Message-ID: <g5kch2$egl$1@ger.gmane.org>
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008062403)
In-Reply-To: <487DACFF.5010504@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 16 Jul 2008 08:47:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Khem Raj wrote:
>> Hi,
>>
>> I have faced a problem which took me a while to understand. I was
>> working on uclibc and therefore I needed to rebuild uclibc many times
>> and thats when I saw this issue.
>>
>> When I rebuilt only uclibc after a complete rebuild. Suddenly in the new
>> root file system with new uclibc application wont load properly
>> complaining about missing symbols (symbols were from libgcc like
>> __aeabi_*)
>>
>> Looking at it the problem is that right now we build uclibc with a
>> intermediate compiler(gcc-cross-initial) which is build with
>> --disable-shared. We use this uclibc and its headers and dev-libs and we
>> rebuild a fresh full cross-gcc (gcc-cross) with -shared-lib support to
>> build the rest of system/image.
>>
>> Therefore the uclibc we build in subsequent time will be build using
>> cross-gcc and not cross-gcc-initial.
>>
>> What happens is that some of the libgcc symbols get linked into
>> uclibc/libc.so when it is built with a gcc without shared lib
>> support(gcc-initial). When building whole sytem different
>> applications(e.g. gawk) which need these symbols link as if they will
>> get these symbols from libc.so at runtime, which is correct if I ran
>> with the first time build uclibc but when I rebuilt just uclibc all
>> these symbols were not being resolved by ld.so because there were no
>> DT_NEEDED entry for libgcc_s.so in the application binary as it was
>> build to get these symbols from libc.so, but rebuilt uclibc now do not
>> export these symbols because it was built with a compiler that supports
>> shared-libs(cross-gcc).
>>
>> Then I went to see the toolchain build order. Currently we do
>>
>> cross-binutils ->  kernel-headers ->  uclibc-headers ->  cross-gcc
>> (--disable-shared) ->  uclibc ->  cross-gcc
>>
>> I think this can be improved and I implemented the following steps.
>>
>> cross-binutils ->  cross-gcc (--disable-shared) ->  kernel-headers ->
>> eglibc/glibc/uclibc headers + startup files + dummy libc.so ->  cross-gcc
>> (--enable-shared) ->  glibc/eglibc/uclibc ->  cross-gcc
>>
>> These steps work same for uclibc as well as glibc/eglibc toolchains
>> irrespective of architectures.
>>
>> These steps work for both NPTL and LinuxThreads toolchains.
>>
>> Given we use these steps, we will have same toolchain build sequence in
>> all circumstances and will help to reduce the current complex toolchain
>> builds we have.
>>
>> We will not need glibc-intermediate step and we will introduce a new
>> step called cross-gcc-intermidiate.
>>
>> I have so far tested this sequence on arm uclibc and it works well and
>> understandably solves the issue I am seeing.
>>
>> I have used this sequence in external scripts to build toolchains too
>> and it has worked well.
>>
>> Now, I have a prototype patch for uclibc-0.9.29+gcc-4.2.4 based
>> toolchain which I am attaching here.
>>
>> If we agree on this aproach I can go ahead and do the same for
>> eglibc/glibc toolchains too.
>>
>> I have not tested it on older compiler/library combinations but I think
>> it will work there too as I have build various combinations in the past
>> with same sequence outside OE.
>>
>> Comments and feedback is welcome.
>>
>> Thanks
>>
>> -Khem
>
> Hello All,
>
> I have meanwhile developed a relatively complete patch. I have tested it on uclibc-0.9.29 glibc_2.6.1 and eglibc_svn and all have worked well. I have also booted the console-images produced.
>
> Here is the revised patch.
>
> As its a fundamental change and its not possible for me to test all combos. Any testing will be highly appreciated.

Thanks for your work on this!

I have a few comments on the patch without having tested it:


--- conf/distro/angstrom-2008.1.conf 
f64ebcf55e85b504d3be169befac3c7981aa74d9
+++ conf/distro/angstrom-2008.1.conf 
8703f595671685f632e51c96d1be75cdceddfe83
@@ -70,9 +70,8 @@ PREFERRED_VERSION_linux-libc-headers 	=
  PREFERRED_VERSION_linux-libc-headers 	= "2.6.23"

  #Prefer glibc 2.6 and uclibc 0.9.29, these have had the most testing.
-PREFERRED_VERSION_glibc 		?= "2.6.1"
-PREFERRED_VERSION_glibc-intermediate 	?= "2.6.1"
-PREFERRED_VERSION_glibc-initial 	?= "2.6.1"
+PREFERRED_VERSION_glibc 		?= "2.3.6"
+PREFERRED_VERSION_glibc-initial 	?= "2.3.6"

  #Everybody else can just use this:
-ANGSTROM_GCC_VERSION 			?= "4.2.4"
+ANGSTROM_GCC_VERSION 			?= "3.4.4"

@@ -123,6 +122,7 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREF
  # Virtuals:
  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = 
"gcc-cross-initial"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = 
"gcc-cross-intermediate"
  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"


You probably only want the PREFERRED_PROVIDER bit, not changing angstrom 
back to the dark ages :)

You also change handling of ctr*.o, but that was intended, right?

I see no obvious errors besides the above, but as I said, I haven't 
tested it.

regards,

Koen




