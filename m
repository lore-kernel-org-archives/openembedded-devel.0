Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pztyi-0006zF-T6
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 17:53:45 +0100
Received: by pxi1 with SMTP id 1so444759pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=LU7gaV7/TUfZP+CK4xF1BXzTgitqc0npYYCg5eMgCCU=;
	b=c4a6bYE5TxrcxYy8H3FF/JWC2F7oClaO3mvJsiGYeBHs0tles3C1Gf0f9sxwWmGePB
	35k83okLp2G718C4oj0fIyL1CjZv5IOMDeis9649k0vTbYXVG9LflwcJpE6wwMrW9nyg
	rwKGscOPoDEOTb7r/XvZgQSxztes99vWJY6hA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=kY+12v+AZLfl1XlA5SRd+iD1l+e5GufV7blL60bQTeOIyVBCH/Wn1H1yRtN/EeQk9Q
	PREMJp3XygMnjWoRDZ610Z9Be3IrXGb9soO1QmhdZtBLuqVwk9ThCE81G77cKUHF1sMG
	5TLjh31hlQwpFAxBbdNLU+QoWhvoPPxnmeDso=
Received: by 10.142.141.3 with SMTP id o3mr109588wfd.327.1300294319682;
	Wed, 16 Mar 2011 09:51:59 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n4sm1364307wfl.14.2011.03.16.09.51.57
	(version=SSLv3 cipher=OTHER); Wed, 16 Mar 2011 09:51:58 -0700 (PDT)
Message-ID: <4D80EA9E.5080207@gmail.com>
Date: Wed, 16 Mar 2011 09:51:42 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300264546.3840.9.camel@mattotaupa> <4D80791E.2040803@gmail.com>
	<1300265560.3840.10.camel@mattotaupa>
In-Reply-To: <1300265560.3840.10.camel@mattotaupa>
Subject: Re: minimal-uclibc: gnutls-2.10.4-r11.0: task compile fails with `make[4]: *** [coding.lo] Error 1`
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
X-List-Received-Date: Wed, 16 Mar 2011 16:53:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/2011 1:52 AM, Paul Menzel wrote:
> Am Mittwoch, den 16.03.2011, 01:47 -0700 schrieb Khem Raj:
>> On 3/16/2011 1:35 AM, Paul Menzel wrote:
>>> Dear OE folks,
>>>
>>>
>>> using the following configuration
>>>
>>>           Build Configuration:
>>>           BB_VERSION        = "1.12.0"
>>>           METADATA_BRANCH   = "<unknown>"
>>>           METADATA_REVISION = "f621e5e"
>>>           TARGET_ARCH       = "arm"
>>>           TARGET_OS         = "linux-uclibceabi"
>>>           MACHINE           = "beagleboard"
>>>           DISTRO            = "minimal-uclibc"
>>>           DISTRO_VERSION    = "dev-snapshot-20110316"
>>>           TARGET_FPU        = "soft"
>>>
>>> task compile of `gnutls_2.10.4.bb` fails with the following error.
>>>
>>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT element.lo -MD -MP -MF .deps/element.Tpo -c element.c  -fPIC -DPIC -o .libs/element.o
>>>           mv -f .deps/parser_aux.Tpo .deps/parser_aux.Plo
>>>           /bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=CC   --mode=compile arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./..   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c -o coding.lo coding.c
>>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c  -fPIC -DPIC -o .libs/coding.o
>>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT element.lo -MD -MP -MF .deps/element.Tpo -c element.c -o element.o>/dev/null 2>&1
>>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT structure.lo -MD -MP -MF .deps/structure.Tpo -c structure.c -o structure.o>/dev/null 2>&1
>>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c -o coding.o>/dev/null 2>&1
>>>           mv -f .deps/element.Tpo .deps/element.Plo
>>>           /bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=CC   --mode=compile arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./..   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT version.lo -MD -MP -MF .deps/version.Tpo -c -o version.lo version.c
>>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT version.lo -MD -MP -MF .deps/version.Tpo -c version.c  -fPIC -DPIC -o .libs/version.o
>>>           make[4]: *** [coding.lo] Error 1
>>>
>>> I guess this has to do with the following commit [1], since it builds
>>> fine using `minimal` using EGLIBC.
>>>
>>>           commit f3ef166dca255f2e8518bb03655332273b1ef074
>>>           Author: Khem Raj<raj.khem@gmail.com>
>>>           Date:   Mon Mar 14 22:47:46 2011 -0700
>>>
>>>               uclibc_git: Upgrade to latest 0.9.32 snapshot
>>>
>>>               Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>
>>
>> and where/what is the error message ? what you posted does not help
>
> I am sorry. But I could not find an error message anywhere in
> `log.do_compile`. Please find the log file attached.
>
>

there is no explicit error mentioned in log.do_compile too. It could be 
a gcc ICE thats somehow being consumed by libtool. Can you execute


/bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=CC   --mode=compile 
arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon 
-mfloat-abi=softfp -mthumb-interwork -mno-thumb 
--sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi 
-DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./.. 
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os 
-pipe -g -MT decoding.lo -MD -MP -MF .deps/decoding.Tpo -c -o 
decoding.lo decoding.c


inside this directory
/oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibceabi/gnutls-2.10.4-r11.0/gnutls-2.10.4/lib/minitasn1

> Thanks,
>
> Paul
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



