Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q8kbo-000455-9h
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 04:42:40 +0200
Received: by pxi1 with SMTP id 1so2471595pxi.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2011 19:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Yt7Qdh/v6T71964Pzb0+6xpszFnnMJGKDF+jhvZlRVg=;
	b=Zj5eMFkQBHE48+4G8nIoZmgBPnq8J/JIyoPDD7CmVEy6o9/3TwC7dm/r5Dm9K0E+LE
	XajB9G90mdYuoVwNcyfXDgCX2NL74/xa4X3X9WH5IhBgZUgjMWU31HscLnR5pvpWCHyC
	Cov+GPw4Vfy5gCjNx5ey+rAaO6RnB+qN0gZis=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=ZCLj7xABUjRcSnM2QsogLRTX3PcXK2EYTu9Ags5BMajBBwtWNeNit1GszqON92AarY
	g1+ROsmzXg76B2EdsG1nQ3aMHOtkYRvV0gMwOlF5KNundW01CEa7qoiA6H7DofR36st+
	FA0DHJFvyVJERwORRek2XRmaFgrkuqfWtyIwM=
Received: by 10.142.250.6 with SMTP id x6mr1808139wfh.229.1302403228635;
	Sat, 09 Apr 2011 19:40:28 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 25sm6023717wfb.22.2011.04.09.19.40.26
	(version=SSLv3 cipher=OTHER); Sat, 09 Apr 2011 19:40:27 -0700 (PDT)
Message-ID: <4DA1189E.5050703@gmail.com>
Date: Sat, 09 Apr 2011 19:40:30 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BANLkTimPVgqbjMhJnBcniZgJBbRd_1D8yQ@mail.gmail.com>
In-Reply-To: <BANLkTimPVgqbjMhJnBcniZgJBbRd_1D8yQ@mail.gmail.com>
Subject: Re: python-distutils_2.6.6: config/Makefile contains sysroot
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
X-List-Received-Date: Sun, 10 Apr 2011 02:42:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/2011 3:04 PM, Kartik Mohta wrote:
> The Makefile (in /usr/lib/python2.6/config) used by distutils to
> compile modules contains the original sysroot used while compiling
> Python on the host:
>
> CC=        arm-angstrom-linux-gnueabi-gcc -march=armv7-a
> -mtune=cortex-a8 -mfpu=neon -mfloat-abi=hard -mthumb-interwork
> -mno-thumb --sysroot=/home/kartikmohta/overo-oe/tmp/sysroots/armv7a-hardfp-angstrom-linux-gnueabi
> CXX=       arm-angstrom-linux-gnueabi-g++ -march=armv7-a
> -mtune=cortex-a8 -mfpu=neon -mfloat-abi=hard -mthumb-interwork
> -mno-thumb --sysroot=/home/kartikmohta/overo-oe/tmp/sysroots/armv7a-hardfp-angstrom-linux-gnueabi
>
> This leads to the following error when compiling modules using distutils:
> /usr/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> this linker was not configured to use sysroots
>
>
> Can these sysroot arguments be removed in the do_install_append() step
> using a simple sed script?
>

you should try to figure out why binutils was build without sysroot. 
Check the configure args for binutils-cross


