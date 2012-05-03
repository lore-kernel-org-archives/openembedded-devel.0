Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPqaW-0002Vh-O5
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 09:36:32 +0200
Received: by laai10 with SMTP id i10so336227laa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 00:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6UJVbQFMIXqzT//6tLLf1u7z3lv6H6J4LvEBkGY/K+4=;
	b=T3kfNmgKwrDch3Jp4e9l3CIMu4+3OFhF7D91WQuuUlU4xcRNuV1p3yd3yXPkqupXC6
	A/5nocAb2qb5juE6LbdcOYZ4tYCfDIa4cGtKfJ41qfclJVaE9U8SEgcl/qcM+tyPpLzl
	kMwMl9XpusO8RYAK8El3YgcQ5K709h6JaBuPCveT4ysyifxTCtZSblpnxSDYtbmHcF+T
	snuQcr8Qrq5qAMPBTP+2ScpIvqDrNAw6u4qw/KE5H1l47VeTG6u+7MWROvAFcWJm1Ajj
	VvETD8uzMqP8UWBZ19GEGekyXBf/teoJE6HvvdkI5LIDGeZapvhseKWpl4kdMWxfLc/l
	fRgQ==
Received: by 10.112.103.8 with SMTP id fs8mr548659lbb.29.1336030007513; Thu,
	03 May 2012 00:26:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 00:26:17 -0700 (PDT)
In-Reply-To: <4FA226C0.80407@nedap.com>
References: <4FA226C0.80407@nedap.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 00:26:17 -0700
Message-ID: <CAMKF1sr1DGqUtxsCxSmqAXmkM+k36GTyj1551zEZ4dJMss2SgQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: llvm fails to build
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
X-List-Received-Date: Thu, 03 May 2012 07:36:32 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 2, 2012 at 11:33 PM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> Hi all,
>
> trying to compile openjdk-6, it fails with:
>
> |
> /media/OpenEmbedded/oe-core/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/llvm2.8-2.8-r0/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp:
> In constructor '{anonymous}::StatSymbols::StatSymbols()':
> |
> /media/OpenEmbedded/oe-core/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/llvm2.8-2.8-r0/llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp:69:67:
> error: 'lseek64' was not declared in this scope
> | make[2]: ***
> [lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/Intercept.cpp.o] Error 1
> | make[2]: Leaving directory
> `/media/OpenEmbedded/oe-core/build/tmp-angstrom_2010_x-eglibc/work/armv5te-angstrom-linux-gnueabi/llvm2.8-2.8-r0/llvm-2.8/build'
> | make[1]: *** [lib/ExecutionEngine/JIT/CMakeFiles/LLVMJIT.dir/all] Error 2
> | make[1]: *** Waiting for unfinished jobs....
>
> I'm using master branches.
> Is this a known issue?
> Any ideas how to solve?

you are using gcc 4.7 I guess. Fix is to add #include <unistd.h> in
Intercept.cpp
if that works then submit it to meta-java
>
> Thanks,
> Jaap
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


