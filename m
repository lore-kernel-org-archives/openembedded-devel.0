Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8fGq-00049l-8T
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 20:51:36 +0200
Received: by fxm20 with SMTP id 20so3322403fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 11:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TDZxqe6Gj63VJFtuXIuTxKN6HihraFAWh769QCJrVgQ=;
	b=Xm4pRw2M4U7vqsxqWlyZrwhO5EB3FkNBC3JH2BHUU0fC3xf8lpT+ApaDJ/Lxa4Pcqb
	Q51w1ewQex0XXvw4TLtTjhLICzlCWvbELvIHkIsEl01OI2cmYEz2YQS7u8H0IugSR4ER
	oXbyw9sEWF8a8T28TYazmuZxICjrqIfe1Q5lA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=otQNC0GxKIIiM3D8yx4W1/ahjtL5ndcwjMsLLDJ+RjrOshnQwPTSbAyz1QCDeYGOhu
	72r8TqC4o2mDXGY8+bHHPwSEKlRdBIXz45vCrg3OM6R2jQ3Y9KxtyCCH5Hz841fDTYmN
	ohiyIKM0xTgLwvJGGaC8Ospidx/3sLU/jdNHk=
MIME-Version: 1.0
Received: by 10.103.105.1 with SMTP id h1mr3870597mum.13.1243277013057; Mon, 
	25 May 2009 11:43:33 -0700 (PDT)
In-Reply-To: <be7a9f3d0905250928h62ec5d0ev2b7103c5be4abb5a@mail.gmail.com>
References: <1243248515-28181-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243248679-28230-1-git-send-email-ihar.hrachyshka@gmail.com>
	<gvduim$pdi$1@ger.gmane.org>
	<be7a9f3d0905250928h62ec5d0ev2b7103c5be4abb5a@mail.gmail.com>
Date: Mon, 25 May 2009 21:43:33 +0300
Message-ID: <fce2a370905251143td440c67kb6ed67897e4e69d5@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] udev: include udev-utils into udev rootfs
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
X-List-Received-Date: Mon, 25 May 2009 18:51:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2009 at 7:28 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> NACK!
>
> On Mon, May 25, 2009 at 8:14 AM, Koen Kooi <k.kooi@student.utwente.nl> wr=
ote:
>> On 25-05-09 12:51, Ihar Hrachyshka wrote:
>>>
>>> The reason for the move is that udevadm binary is executed from udev
>>> init.d script.
>
> Wouldn't be better to move udevadm to udev binary?
>
> It makes non-sense to have another package installed by default and
> bring more things then required. If it is used by init.d, and this is
> ok, so please move the required binary for the udev package and that's
> solved.

We *already* clarified the reasons to do the exact thing (in another
thread): some people (f.e. with mdev rather udev) wants to be able to
install udev stuff needed by HAL but with no udev as a default device
manager.

>
> My 2c.
>
> --
> Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br =C2=A0http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://projetos.ossy=
stems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


