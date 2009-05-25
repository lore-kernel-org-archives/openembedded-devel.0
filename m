Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8gv4-0002N4-6G
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 22:37:14 +0200
Received: by fxm20 with SMTP id 20so3375812fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 13:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qDJNPPUKO3C6eG4TE0fNQ/OqLVN1qOLjqCbcRjastjA=;
	b=SYgFZToIQh4bNO3R/yXX3acivhf4jrfTLe+iQ9E/fMkGsEizOlM5b4Idmfdqhw3smF
	hTv3AN6jDdQ+dQ2EAreMbfENs62nhqw/2pRManqanu6W3eU9c/FR8X2yMdYwsn/XMIt6
	RnorL4ig+5De+tSqdJIrHdVAGdqfvEc2i3a/M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rBidK+cC6E+uKB/q2jI+tn7lIe4TieV9tolbs6WvQnO3aEIyHh8CUFnfHSiC1k7ltI
	IW++4dPb3NnCI1CZywCjIlCgQNxdyrdI9ftpZ9rLKZpE+GpL23jMNGjlYeH11/J1IT0i
	GuGwiXd/4MZz+oABKGwXpfqmL0ryaJ92fHm/M=
MIME-Version: 1.0
Received: by 10.103.244.19 with SMTP id w19mr3872890mur.133.1243283350309; 
	Mon, 25 May 2009 13:29:10 -0700 (PDT)
In-Reply-To: <be7a9f3d0905251322h27b36f0eyc780895bb05b50d7@mail.gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1243247426.4869.23.camel@lenovo.internal.reciva.com>
	<fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
	<be7a9f3d0905250931wbedccdfg9f8b0a0f562b6aab@mail.gmail.com>
	<1243270407.4869.57.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905250959i19d01ebbr1b3b065f2135e294@mail.gmail.com>
	<1243272731.4869.59.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905251157t7178a81ah22ff6ab699e2c5f2@mail.gmail.com>
	<1243281147.4869.64.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905251322h27b36f0eyc780895bb05b50d7@mail.gmail.com>
Date: Mon, 25 May 2009 23:29:10 +0300
Message-ID: <fce2a370905251329t2cd85ef1m943dc9a61ba7f8a8@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: moved udevadm to the main udev package
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
X-List-Received-Date: Mon, 25 May 2009 20:37:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2009 at 11:22 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> On Mon, May 25, 2009 at 4:52 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Mon, 2009-05-25 at 15:57 -0300, Otavio Salvador wrote:
>>> Hello,
>>>
>>> On Mon, May 25, 2009 at 2:32 PM, Phil Blundell <philb@gnu.org> wrote:
>>> > On Mon, 2009-05-25 at 13:59 -0300, Otavio Salvador wrote:
>>> >> Hello,
>>> >>
>>> >> On Mon, May 25, 2009 at 1:53 PM, Phil Blundell <philb@gnu.org> wrote=
:
>>> >> > On Mon, 2009-05-25 at 13:31 -0300, Otavio Salvador wrote:
>>> >> [...]
>>> >> >> I belive that the right way to fix it is add a binary package onl=
y for
>>> >> >> udevadm
>>> >> >
>>> >> > That's pretty much what udev-utils is: it doesn't contain any bina=
ries
>>> >> > apart from udevadm.
>>> >>
>>> >> In this case the binary package is wrong.
>>> >
>>> > Why so?
>>>
>>> I think udev-udevadm is more sound for me.
>>
>> Ah, you mean the package name? =C2=A0Yes, udev-udevadm would probably be
>> better if we were doing this again from scratch, but renaming an
>> existing package is a fairly disruptive thing to do and I don't think
>> the existing one is wrong enough to make it worthwhile.
>
> Well, I think it makes sense. What does not make sense to me is to
> install udevtest and udevinfo in a system that doesn't use them.

Do you suggest splitting uboot-utils like "uboot-udevadm +
uboot-utils" where uboot-utils contains udevinfo and udevtest? Or do
you suggest creating separate packages for every udev* binary? What's
your point?

>
> FILES_udev-utils =3D "${usrbindir}/udevinfo ${sbindir}/udevadm
> ${usrbindir}/udevtest"
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


