Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1KIn5a-0006dL-1N
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Jul 2008 18:09:18 +0200
Received: by an-out-0708.google.com with SMTP id b38so984296ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2008 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=7+Gc4PmydKChTApVYIr147RN7Gua09NwF5Jywef8S1s=;
	b=VwYzZhXTBN5SC2C2kAF+pT88YLfu+bCnPOoYfeDrjb5tsdWsuf/09avAwdlQirLQEO
	bV1RBanJY/mRF/WUx4VnAwr01IkzWncVIGrWR3Pp20p37aPN+cQUdxebV+N6Uw3ht3En
	5OUINfVrjVtuRTF8isE30nNCKsg8wlowEx7v8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=ur6+OsiFVHESREQDgeUQ3np+JJIraG4jQaGpr9Dmqh5ZOuwdwDNmYzoIqkgPXmduXL
	/SJ8mHufNVo/tLl3mimbNff7UscTDQcEMZeNNHWKMR7voLhGwo7rigaAaWu+9hPhPcfu
	250aVeIqO68Ww5CTHZHYOnnZ03h46kPzOiz34=
Received: by 10.100.251.5 with SMTP id y5mr11653580anh.125.1216138115095;
	Tue, 15 Jul 2008 09:08:35 -0700 (PDT)
Received: by 10.100.137.1 with HTTP; Tue, 15 Jul 2008 09:08:34 -0700 (PDT)
Message-ID: <3972542e0807150908l71547f0bx79eff8d13cc25dac@mail.gmail.com>
Date: Tue, 15 Jul 2008 11:08:34 -0500
From: "E Robertson" <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1216135379.22877.3.camel@isis>
MIME-Version: 1.0
References: <3972542e0807141258i256cab38kb2023270a0aa14e9@mail.gmail.com>
	<1216087571.10214.10.camel@isis>
	<3972542e0807150806v67d607bbx5a43f147fa6f1c31@mail.gmail.com>
	<1216135379.22877.3.camel@isis>
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
X-List-Received-Date: Tue, 15 Jul 2008 16:09:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jul 15, 2008 at 10:22 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, 2008-07-15 at 10:06 -0500, E Robertson wrote:
>
>> > Its not clear from your email what you might be facing. You can
>> > preprocess your source file with -E and see whats getting included
>> >
>> > what happens when you use  -D_GNU_SOURCE ?
>>
>> I've always used -D_GNU_SOURCE to get around the problem but "why?" is
>> the question I'm trying to answer.
>
> These are Non Posix noticed (_NP) ? thats why you need _GNU_SOURCE which
> tells compiler that you want this code.
>
>> Clearly USE_GNU is defined so the only way I can try to determine
>> problem is to dig deeper.
>
> Can you formulate the problem once again

Sure.
I got the error 'PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP' undeclared
from src/nanox/srvmain.c
when compiling the microwindow source. For threadsafe support,
pthread.h is needed which is included
in lock.h. Here is also where USE_GNU is defined so as to include the
thread _NP.
In any case in this file (lock.h) I added several directives similar to this one
#ifndef __USE_GNU
#error USE_GNU not defines
#endif
I this this for the _NPs as well, before and after the include. It's a
bit crude but it works.
I noticed __USE_GNU was defined before and after the pthread.h is
included but not inside pthread.h (edited for #ifdef).
as a result the _NPs are not defined.

Now this sort of make sense because #include <features.h> undefined
__USE_GNU and if __GNU_SOURCE is not defined
then __USE_GNU will remain undefined. In such a case the the __USE_GNU
should not be defined after the header file, correct?
This behaviour is consistent because if I define _GNU_SOURCE also
before the pthread.h is defined but it did not have any effect.

Thanks.

>> I must point out however that if I use I define _GNU_SOURCE just
>> before the pthread.h header file is included
>> I get the same result (as oppose to -D_GNU_SOURCE in the cc path).
>
> having this define on GCC commandline is correct thing to do.
>>
>> I tried the -E option and it appears that all the necessary files are
>> included. I don't see anything unusual.
>
> Khem
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


