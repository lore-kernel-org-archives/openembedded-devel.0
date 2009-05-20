Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6tNm-00046I-5M
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 May 2009 23:31:26 +0200
Received: by an-out-0708.google.com with SMTP id b6so402408ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 14:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GDFWFNMHkM7vkwvn46MZWUZ0rtQ5D24N0ZTuoGwzTa0=;
	b=lNJ1D46AxP1JDFB2R6gzNtQGNcY1Q4QktWUWryQHmGR32O5dYmdkU1+f9qXLTxdDJ6
	FipbtOnIxt+AFkO463ViaScMDyeuiFWZmnRoPZzXlD+3qLxpg1mSGrj5p5+Np3pmoFN3
	e28OXg5lHI6v4vfjT3unMUHw0VKtLqsoqkP0Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Rd/PDgAgQSxam9mfVr3oSB8AzxVYdzsWsQF4jCdbpP8rcKdz0eH2KvaWtWlj3Md7dx
	6IUUqrs7nH07i9OvmW8vl62PhHC0yocGcWncQU3592X8DfEvk6eH+xvFwLiiZ/ZoxlW3
	ug0HWlAkswUMZQDNrq9N1StrMQ+tQVpvgVhbw=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.131.13 with SMTP id e13mr3501856and.93.1242854635485; Wed, 
	20 May 2009 14:23:55 -0700 (PDT)
In-Reply-To: <200905201528180000@3248121022>
References: <200905201528180000@3248121022>
Date: Wed, 20 May 2009 18:23:55 -0300
X-Google-Sender-Auth: f99e8dc70acb73d5
Message-ID: <be7a9f3d0905201423g6af4f666o754449e1b8519b23@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH] kernel, module-base class, bitbake.conf: 	introduce MACHINE_KERNEL_PR
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
X-List-Received-Date: Wed, 20 May 2009 21:31:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Wed, May 20, 2009 at 4:28 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Acked-by: Denys Dmytriyenko <denis@denix.org>
>
>> ------- Original Message -------
>> From: Koen Kooi <koen.kooi@gmail.com>
>> To: openembedded-devel@lists.openembedded.org
>> Sent: 20-May-09, 14:51:23
>> Subject: [oe] [STABLE][PATCH] kernel, module-base class,bitbake.conf: in=
troduce MACHINE_KERNEL_PR
>>
>> From: Koen Kooi <koen@openembedded.org>
>>
>>
>> Signed-off-by: Koen Kooi <koen@openembedded.org>
>> ---
>> =A0classes/kernel.bbclass =A0 =A0 =A0| =A0 =A04 ++++
>> =A0classes/module-base.bbclass | =A0 =A04 ++++
>> =A0conf/bitbake.conf =A0 =A0 =A0 =A0 =A0 | =A0 =A04 ++++
>> =A03 files changed, 12 insertions(+), 0 deletions(-)
>>
>> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
>> index 17e8941..954c407 100644
>> --- a/classes/kernel.bbclass
>> +++ b/classes/kernel.bbclass
>> @@ -64,6 +64,10 @@ export CMDLINE_CONSOLE =3D "console=3D${@bb.data.getV=
ar("KERNEL_CONSOLE",d,1) or "tt
>> =A0KERNEL_VERSION =3D "${@get_kernelversion('${S}')}"
>> =A0KERNEL_MAJOR_VERSION =3D "${@get_kernelmajorversion('${KERNEL_VERSION=
}')}"
>>
>> +# A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
>> +# rebuilds for kernel and external modules
>> +PR =3D "${MACHINE_KERNEL_PR}"
>> +
>> =A0KERNEL_LOCALVERSION ?=3D ""
>>
>> =A0# kernels are generally machine specific
>> diff --git a/classes/module-base.bbclass b/classes/module-base.bbclass
>> index c98bace..bc53e1b 100644
>> --- a/classes/module-base.bbclass
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


