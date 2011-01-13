Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PdVi8-0002Bq-Sy
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 23:32:05 +0100
Received: by iyj18 with SMTP id 18so2027242iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=j4N/d6c6DSvzEULl4qXTLb97jG65eSODY3BmsVuqT2k=;
	b=YwtuMqdZFU2wNj4ObTupFszCywEXQyMEWmawMVGm7SGv+uYJE6qmRQYBmkJSqFaOhQ
	jDjOq6hgdmFUeTyhSBScp1t1IFhy/WighUlhfjTOwmBW1lWygxjpyUsrfmx2/HAVTVuE
	L3YsfJ+Ap9YY5sWbr6FD7qG13EBN1SwqASnlU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=IOat1J/BbcF7rB0AnewDgm79u0AaCFdG4MoHg/axlHAQjujC8IQKr1Az6Wh3Xv30jI
	KGMHLacUZp4F0wdJFpOLe8YT067qzqUhU7sMYcotKPUcq/7yCz0bvB8Gt/1cT62pGIB8
	YTVZ72PhkXZaD3a6qVru8OOSbeYT7I9WU1CEE=
Received: by 10.42.179.133 with SMTP id bq5mr23809icb.98.1294957887866; Thu,
	13 Jan 2011 14:31:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.175.69 with HTTP; Thu, 13 Jan 2011 14:31:07 -0800 (PST)
In-Reply-To: <AANLkTink4Hrjj0dCqj6j=4wMrrX13VrLmHxZiVNy_Dqw@mail.gmail.com>
References: <AANLkTi=npHcRdA9ehZLYendfUinkE30X_1L6DOLYGBBB@mail.gmail.com>
	<AANLkTi=p4U3CFO1sMP5mW-EKC-R5nHLqC=0QrN4kXnZK@mail.gmail.com>
	<AANLkTink4Hrjj0dCqj6j=4wMrrX13VrLmHxZiVNy_Dqw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jan 2011 14:31:07 -0800
Message-ID: <AANLkTikU98O-VwW=XufmnUOZY6cz=nKEEwRX=eC8cb9B@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Use of 'sem_open' failing
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
X-List-Received-Date: Thu, 13 Jan 2011 22:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2011 at 2:02 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Jan 13, 2011 at 19:56, Khem Raj <raj.khem@gmail.com> wrote:
>> It has been reported more than once for arm architecture. I think
>> there could be issue in the way we build eglibc
>>
>> For test purposes can you try it using uclibc and see if you still get s=
ame
>> failure ?
>
> It looks like it is due OLDEST_KERNEL being undefined by some machines.
>
> Mine (i586-generic based) didn't have it (I will push a fix for it
> later tomorrow).
>
> It seems that if OLDEST_KERNEL is older then 2.6.13 eglibc ends not
> enabling sem_open.
>
> Checking it.
>

thats plausible.

> --
> Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br=C2=A0 http://www.ossystems.com.br
> Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0http://projetos.ossystems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


