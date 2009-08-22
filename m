Received: from [74.125.78.146] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1MelYF-0005BW-7k
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 10:02:15 +0200
Received: by ey-out-1920.google.com with SMTP id 3so268732eyh.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 00:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=bgI+1IT/pjIcgl8/DNAMn3nd2nBbztayFrHs+DxVCFw=;
	b=u5f5h+wz8fP323eQHaTUFQfpwy4EaGgkiFmXWEQ1J5N0Dq/19vJftSe0LImeqoFtc4
	OqwnXbm6hMyv6NPKw09+7QLFX3+p2+cZItKE145GDZZYoepLyGDD9vNkvGlSDKb+zyDh
	7ENfMBdARTPqdP/I10buKZOoIC50ezhy5JO8Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=IrrnvvCceKd5k1kb8XTB+lcNa7weK8qsg595Xb+4Y9tG17i0PixafaQMENQ8VjATN3
	SvuAI6cbtQpeiuj+P6PkZ8LOzGChTLU6CQMn+7TS2flWQHfFXAN3JqE3QkIymHzg/CeM
	tSVktko/c8NAOCXPGWrbQNtzZrPeys7icooSE=
Received: by 10.210.76.7 with SMTP id y7mr2435816eba.75.1250927086442;
	Sat, 22 Aug 2009 00:44:46 -0700 (PDT)
Received: from ?192.168.0.7? ([92.255.141.100])
	by mx.google.com with ESMTPS id 7sm4394456eyg.55.2009.08.22.00.44.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 22 Aug 2009 00:44:46 -0700 (PDT)
Message-ID: <4A8FA20F.5050401@gmail.com>
Date: Sat, 22 Aug 2009 13:45:19 +0600
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8D4947.5030108@gmail.com>	<200908201526.46349.holger+oe@freyther.de>	<4A8D98FB.5000400@gmail.com>
	<200908210343.48652.holger+oe@freyther.de>
	<4A8F9BE3.1020606@gmail.com>
In-Reply-To: <4A8F9BE3.1020606@gmail.com>
Subject: Re: LPC3250, helloworld-image, configure: error: cannot run C compiled programs
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
X-List-Received-Date: Sat, 22 Aug 2009 08:02:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Dmitry Vinokurov wrote:
> Holger Hans Peter Freyther wrote:
>> On Thursday 20 August 2009 20:42:03 Dmitry Vinokurov wrote:
>>
>> I will update the documentation with these bits:
>>
>>
>> ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
>> ASSUME_PROVIDED += " virtual/libc "
>> ASSUME_PROVIDED += "linux-libc-headers "
>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc "
>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-initial "
>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}gcc-intermediate "
>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}binutils "
>> ASSUME_PROVIDED += "virtual/${TARGET_PREFIX}libc-for-gcc "
>> ASSUME_PROVIDED += "virtual/libintl "
>> ASSUME_PROVIDED += "virtual/libiconv "
>>
>> TARGET_PREFIX = "arm-linux-gnueabi-"
>> ASSUME_SHLIBS = "libc.so.6:libc"
>>
>>
>> The main difference are. Assume provided more binaries/libraries, use 
>> the TARGET_PREFIX instead of CC, CXX, NM....
>>
>>
>> does this work any better?
>>     z.
>>
>>   
> I changed my config according to your advises, final version attached. 
> Tried to build helloworld application: 'bitbake -v -DDD helloworld', 
> it compiles and runs on target board fine. Tried to build linux 
> kernel: 'bitbake -v -DDD linux-2.6.27', it fails with
> --------
> checking build system type... i686-pc-linux-gnu
> checking host system type... i686-pc-linux-gnu
> checking target system type... arm-oe-linux-gnueabi
> checking for a BSD-compatible install... 
> /home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/install 
> -c
> checking whether build environment is sane... yes
> checking for a thread-safe mkdir -p... 
> /home/raydan/work/oe/build-linux/tmp/staging/i686-linux/usr/bin/mkdir -p
> checking for gawk... gawk
> checking whether make sets $(MAKE)... yes
> checking for i686-linux-gcc... 
> /opt/nxp/gcc-4.3.2-glibc-2.7/arm-vfp-linux-gnu/../bin/arm-vfp-linux-gnu-gcc 
>
> checking for C compiler default output file name... a.out
> checking whether the C compiler works... configure: error: cannot run 
> C compiled programs.
> If you meant to cross compile, use `--host'.
> See `config.log' for more details.
> + oefatal 'oe_runconf failed'
> + echo FATAL: 'oe_runconf failed'
> FATAL: oe_runconf failed
> + exit 1
> ERROR: function do_configure failed
> ERROR: see log in 
> /home/raydan/work/oe/build-linux/tmp/work/arm-oe-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_configure.30320 
>
> NOTE: Task failed: 
> /home/raydan/work/oe/build-linux/tmp/work/arm-oe-linux-gnueabi/module-init-tools-cross-3.2.2-r5/temp/log.do_configure.30320 
>
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of 
> /home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb 
> do_configure failed
> ERROR: Task 107 
> (/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb, 
> do_configure) failed
> NOTE: Tasks Summary: Attempted 86 tasks of which 21 didn't need to be 
> rerun and 1 failed.
> ERROR: 
> '/home/raydan/work/oe/openembedded/recipes/module-init-tools/module-init-tools-cross_3.2.2.bb' 
> failed
> --------
>
> I.e. bitbake again confused cross-gcc and x86-gcc. Updated my OE with 
> git pull, removed tmp/ and made rebuild -- same result.
Looks like error is in wrong ./configure parameter:  --host=i686-linux 
instead of --host=arm-oe-linux-gnueabi .
Now I'm trying to find, why --host was set to i686 and where it can be 
changed.

--
Best Regards,
Dmitry Vinokurov


