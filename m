Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PzmQ1-0003yw-U1
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 09:49:26 +0100
Received: by pxi1 with SMTP id 1so350683pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 01:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hQRlVS7o2Nx6Dv9lPWztuxgamywCOZfupV1XQI672Ew=;
	b=pVHZvzI/+mqF7GN5kcHMKJzOh02qXnAcB9OfIXz+mAEkCKutMwogtad/JI8+USr88g
	JA3X5i1dZVEJyixikOhK8I66M3ia0SoLraG6Y4e+y2fRvlGuyPEblAwyJUQCA5aIyj75
	cdCc/B+J7lC9aHGJuUZS+dsZwEANMoWdL5Qhw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=HUCsjfc7QfRdSX7QAN65+fhfmuB6GxV3pPyRCssCCe8zdv9hcSDDSp2ImJHGrIfbr3
	5pbAs26je/piXx+57jM6zTPTDL+BfgcwATEg19pDrcasX7GA32GmzIA2lTK4ZcOyA7kP
	coeKFDziF8Qg9uyO6QbjSoRtzcYkqtsEf+Nhs=
Received: by 10.142.75.2 with SMTP id x2mr447388wfa.201.1300265260944;
	Wed, 16 Mar 2011 01:47:40 -0700 (PDT)
Received: from [172.23.0.199] (natint3.juniper.net [66.129.224.36])
	by mx.google.com with ESMTPS id d35sm882893wfj.21.2011.03.16.01.47.38
	(version=SSLv3 cipher=OTHER); Wed, 16 Mar 2011 01:47:39 -0700 (PDT)
Message-ID: <4D80791E.2040803@gmail.com>
Date: Wed, 16 Mar 2011 01:47:26 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300264546.3840.9.camel@mattotaupa>
In-Reply-To: <1300264546.3840.9.camel@mattotaupa>
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
X-List-Received-Date: Wed, 16 Mar 2011 08:49:26 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/2011 1:35 AM, Paul Menzel wrote:
> Dear OE folks,
>
>
> using the following configuration
>
>          Build Configuration:
>          BB_VERSION        = "1.12.0"
>          METADATA_BRANCH   = "<unknown>"
>          METADATA_REVISION = "f621e5e"
>          TARGET_ARCH       = "arm"
>          TARGET_OS         = "linux-uclibceabi"
>          MACHINE           = "beagleboard"
>          DISTRO            = "minimal-uclibc"
>          DISTRO_VERSION    = "dev-snapshot-20110316"
>          TARGET_FPU        = "soft"
>
> task compile of `gnutls_2.10.4.bb` fails with the following error.
>
>          arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT element.lo -MD -MP -MF .deps/element.Tpo -c element.c  -fPIC -DPIC -o .libs/element.o
>          mv -f .deps/parser_aux.Tpo .deps/parser_aux.Plo
>          /bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=CC   --mode=compile arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./..   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c -o coding.lo coding.c
>          arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c  -fPIC -DPIC -o .libs/coding.o
>          arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT element.lo -MD -MP -MF .deps/element.Tpo -c element.c -o element.o>/dev/null 2>&1
>          arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT structure.lo -MD -MP -MF .deps/structure.Tpo -c structure.c -o structure.o>/dev/null 2>&1
>          arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c -o coding.o>/dev/null 2>&1
>          mv -f .deps/element.Tpo .deps/element.Plo
>          /bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=CC   --mode=compile arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./..   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT version.lo -MD -MP -MF .deps/version.Tpo -c -o version.lo version.c
>          arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp -mthumb-interwork -mno-thumb --sysroot=/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -MT version.lo -MD -MP -MF .deps/version.Tpo -c version.c  -fPIC -DPIC -o .libs/version.o
>          make[4]: *** [coding.lo] Error 1
>
> I guess this has to do with the following commit [1], since it builds
> fine using `minimal` using EGLIBC.
>
>          commit f3ef166dca255f2e8518bb03655332273b1ef074
>          Author: Khem Raj<raj.khem@gmail.com>
>          Date:   Mon Mar 14 22:47:46 2011 -0700
>
>              uclibc_git: Upgrade to latest 0.9.32 snapshot
>
>              Signed-off-by: Khem Raj<raj.khem@gmail.com>
>


and where/what is the error message ? what you posted does not help


