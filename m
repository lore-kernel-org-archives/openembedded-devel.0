Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuQCc-0004Z6-Qs
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 16:37:42 +0200
Received: by gyg4 with SMTP id 4so2154384gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 07:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=bqwZEEpLoFlHC2fHFnabceMJBvGkPc8ZVlzHjXAykeg=;
	b=Amx3K9zy89MZJRin5eO//r+UicREg2bO/UZYy2jNnvOGXOcz54SsCzp2qn20PheKmR
	+kdgiAZNX/n2MIblyHSIfi9K/RCRkdGAui3pcvnnLDz58NrdYTQ1jBWTKM/+wGe8XVLs
	2TeCbTF6DDGJJn1kPHu2WrT+I+OQNxkyDo340=
Received: by 10.101.143.26 with SMTP id v26mr2380807ann.23.1313764378789;
	Fri, 19 Aug 2011 07:32:58 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v5sm1684742ibk.44.2011.08.19.07.32.57
	(version=SSLv3 cipher=OTHER); Fri, 19 Aug 2011 07:32:58 -0700 (PDT)
Message-ID: <4E4E7416.1070105@gmail.com>
Date: Fri, 19 Aug 2011 07:32:54 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110818131043.GC26690@golden>	<1313689684.7918.2.camel@eng-phousel-ubuntu>
	<4E4E2DFB.5050106@cit-ec.uni-bielefeld.de>
	<4E4E62AB.1050603@balister.org>
In-Reply-To: <4E4E62AB.1050603@balister.org>
Subject: Re: [beagleboard] Unable to build Angstrom meta-toolchain
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
X-List-Received-Date: Fri, 19 Aug 2011 14:37:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/19/2011 6:18 AM, Philip Balister wrote:
> On 08/19/2011 02:33 AM, Stefan Herbrechtsmeier wrote:
>> Am 18.08.2011 19:48, schrieb Peter Housel:
>>> On Thu, 2011-08-18 at 15:10 +0200, fabian büttner wrote:
>>>> Hi,
>>>>
>>>> I am having troubles compiling the Angstrom SDK.
>>>>
>>>> I used the angstrom-setup-scripts to configure OE, sourced the
>>>> environment settings and built the base-image/console-image with
>>>> bitbake.
>>>>
>>>> While trying to compile the meta-toolchain, just when bitmake finishes
>>>> downloading task-sdk-bare_1.0-r2.6_armv7a.ipk, I am getting an error
>>>> output like this:
>>>>
>>>> http://pastie.org/2390409
>>>>
>>>> After that, I tried building the meta-toolchain(i did a bitmake clean
>>>> meta-toolchain) without '-j2' but the error I receive is ultimately
>>>> the same:
>>>> * satisfy_dependencies_for: Cannot satisfy the following dependencies
>>>> * for task-sdk-bare:
>>>> * libstdc++-dev *
>>>> * opkg_install_cmd: Cannot install package task-sdk-bare.
>>>>
>>>> Unfortunately I am too unexperienced with OE/Angstrom to fix bugs
>>>> like that.
>>>> Maybe someone could give me a hint how to get around this show-stopper?
>>> I can confirm that I've been seeing this as well on recent
>>> 2011.03-maintenance, but haven't had a chance to troubleshoot the root
>>> cause yet.
>>>
>> It was inbtroduced with commit 105d881227d06f31c180dffb777ee63361b2f2b8
>> "gcc: Package libstdc++ gdb python helpers into dev package".
>> If no helpers exist the empty package will not be generated.
>> I have try to add
>> ALLOW_EMPTY_libstdc++-dev = "1"
>> to gcc-package-cross.inc but this breaks meta-toolchain as the files in
>> ${prefix}/${TARGET_SYS}/usr/include/c++ are missing.
>>
>> Only removing libstdc++-dev package from gcc-package-cross.inc fix the
>> problem.
>
> Does anyone know if dv has the same problem? I can't check easily at the
> moment.

what happens if you remove  libstdc++-dev libgcc-dev from PACKAGES in 
recipes/gcc/gcc-package-cross.inc ?
I will see if I can reproduce it here
>
> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



