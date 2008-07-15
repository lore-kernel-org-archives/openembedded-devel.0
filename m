Received: from [64.233.178.251] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1KIm7B-0002Ea-GP
	for openembedded-devel@openembedded.org; Tue, 15 Jul 2008 17:06:53 +0200
Received: by hs-out-0708.google.com with SMTP id 23so1354234hsn.12
	for <openembedded-devel@openembedded.org>;
	Tue, 15 Jul 2008 08:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=nH+pe7e/BRF7sEOajMn4tHs9KUpadveb3i5rSLS0OMI=;
	b=IresTHH/HY2mxmwRXbBMf64kFbHyUem4Cud9bDwvzszz/OI/18bXvP2PLnAlpazhkU
	hThHx3ZPqrXc253dV2GLxrNs+2NUXn1RXdPquFq0/DT+Ju0CROMoK7S+2FxgOGi5y9MY
	EReCJfLFXZv1fkT1W/IxjWrsW0YfSrV11vWUE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=jyymMfVBCnoHI57S42fIG+uvRCppNue4/yy991NLXDjmO0NGXac6w9Ia10zHkTnhiU
	vHc2/vtBz87lqSEs5E/EJpo+4CGCSaaFICggnY/YMvatkv921WMZkLPnyEW5he5SuHom
	N7sHiPaBzF4ivaCM3yr4Rqfvq7NJj4akSsX2A=
Received: by 10.100.201.16 with SMTP id y16mr11541408anf.90.1216134376405;
	Tue, 15 Jul 2008 08:06:16 -0700 (PDT)
Received: by 10.100.137.1 with HTTP; Tue, 15 Jul 2008 08:06:16 -0700 (PDT)
Message-ID: <3972542e0807150806v67d607bbx5a43f147fa6f1c31@mail.gmail.com>
Date: Tue, 15 Jul 2008 10:06:16 -0500
From: "E Robertson" <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1216087571.10214.10.camel@isis>
MIME-Version: 1.0
References: <3972542e0807141258i256cab38kb2023270a0aa14e9@mail.gmail.com>
	<1216087571.10214.10.camel@isis>
Cc: openembedded-devel@openembedded.org
Subject: Re: Strange header file error
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
X-List-Received-Date: Tue, 15 Jul 2008 15:06:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 14, 2008 at 9:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Mon, 2008-07-14 at 14:58 -0500, E Robertson wrote:
>> Hi All,
>> I'm trying to explain this pthread.h header file error.
>> I include this header file in my program. The snip of interest is this:
>>
>> #ifndef _PTHREAD_H
>> #define _PTHREAD_H  1
>>
>> #include <features.h>
>>
>> #include <sched.h>
>> #include <time.h>
>>
>> #define __need_sigset_t
>> #include <signal.h>
>> #include <bits/pthreadtypes.h>
>> #include <bits/initspin.h>
>>
>> __BEGIN_DECLS
>>
>> /* Initializers.  */
>>
>> #define PTHREAD_MUTEX_INITIALIZER \
>>   {0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, __LOCK_INITIALIZER}
>> #ifdef __USE_GNU
>> # define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP \
>>   {0, 0, 0, PTHREAD_MUTEX_RECURSIVE_NP, __LOCK_INITIALIZER}
>> # define PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP \
>>   {0, 0, 0, PTHREAD_MUTEX_ERRORCHECK_NP, __LOCK_INITIALIZER}
>> # define PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP \
>>   {0, 0, 0, PTHREAD_MUTEX_ADAPTIVE_NP, __LOCK_INITIALIZER}
>> #endif
>>
>>
>> This is included in another header file where I place some #ifdef
>> statements for  _PTHREAD_H,
>> PTHREAD_MUTEX_INITIALIZER, PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP, and
>> __USE_GNU.
>> I also defined __USE_GNU just before the header file and none of these
>> are redefined anywhere else.
>>
>> >From this I notice all these defines are valid and present _except_
>> PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP.
>> I haven't figured out why this is so wired I don't see any possible
>> reason how this could be possible.
>> Am I out of my mind here? Is this really possible? Unless my
>> arm-uclibc is doing something strange, I don't see how this could be.
>> Anyone seen this before?  Thanks much.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
>
> Its not clear from your email what you might be facing. You can
> preprocess your source file with -E and see whats getting included
>
> what happens when you use  -D_GNU_SOURCE ?

I've always used -D_GNU_SOURCE to get around the problem but "why?" is
the question I'm trying to answer.
Clearly USE_GNU is defined so the only way I can try to determine
problem is to dig deeper.
I must point out however that if I use I define _GNU_SOURCE just
before the pthread.h header file is included
I get the same result (as oppose to -D_GNU_SOURCE in the cc path).

I tried the -E option and it appears that all the necessary files are
included. I don't see anything unusual.
These are the header files included:
/opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/stdio.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/features.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/uClibc_config.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/uClibc_arch_features.h
\
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/sys/cdefs.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/types.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/wordsize.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/kernel_types.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/typesizes.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/pthreadtypes.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/sched.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/uClibc_stdio.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/wchar.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/wchar.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/uClibc_mutex.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/pthread.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/sched.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/time.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/time.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/uClibc_clk_tck.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/signal.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/sigset.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/initspin.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/sigthread.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/uClibc_pthread.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/stdio_lim.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/stdlib.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/sys/types.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/endian.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/endian.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/sys/select.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/select.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/sys/sysmacros.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/alloca.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/signum.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/siginfo.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/sigaction.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/sigcontext.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/asm/sigcontext.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/sigstack.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/string.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/errno.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/errno.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/errno_values.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/unistd.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/posix_opt.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/confname.h \
  /opt/OE/stuff/tmp/staging/arm-linux-uclibc/usr/include/bits/getopt.h

Thanks.


