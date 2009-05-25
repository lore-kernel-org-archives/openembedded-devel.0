Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1M8fhn-0005YQ-Pq
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 May 2009 21:19:27 +0200
Received: by bwz19 with SMTP id 19so3302952bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2009 12:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=K+yUVN7Q3n8FLcHVLkXxa7Ys1sqwQClXQyBsEeSYWDQ=;
	b=ZkFqLTCSAXjHrnHEAQuqLHy5F2C2rKEnzfvrIWu//vwEjcLS1IUVddCN5IvWzv/9l1
	rt6D+5kDOKqr5mXl2L4qxHUGSwRs4Fqv2ZLhTZxxADlLKuem29fKu4gkZKBzCy3g2GQp
	g6C2j+1aG1ifJT9NAB1enknt4T2Pc7/YYRNTU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KOihRrJMFddHXWkMa6d3C1cznB2W60Olfx4EGKMNaVA+hqvsKpo+X+tzzizSJxxNqI
	jZa+2lTLkIdRG2KGiUO1IXY5CJT+BqBcp4l16YyyrS0+Z6YWUk3BGltT+438c/kyWmZA
	fXxRKQO7vLHHhj6UztJJDzIJ3phSi8Fh4fp5U=
MIME-Version: 1.0
Received: by 10.103.213.10 with SMTP id p10mr3889787muq.17.1243278683996; Mon, 
	25 May 2009 12:11:23 -0700 (PDT)
In-Reply-To: <be7a9f3d0905251157t7178a81ah22ff6ab699e2c5f2@mail.gmail.com>
References: <1243189985-19060-1-git-send-email-ihar.hrachyshka@gmail.com>
	<200905251125.45665.marcin@juszkiewicz.com.pl>
	<fce2a370905250254p4c51b706q399b14d9b0bb20e5@mail.gmail.com>
	<1243247426.4869.23.camel@lenovo.internal.reciva.com>
	<fce2a370905250355h5edd949cq40bcb52882e1e623@mail.gmail.com>
	<be7a9f3d0905250931wbedccdfg9f8b0a0f562b6aab@mail.gmail.com>
	<1243270407.4869.57.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905250959i19d01ebbr1b3b065f2135e294@mail.gmail.com>
	<1243272731.4869.59.camel@lenovo.internal.reciva.com>
	<be7a9f3d0905251157t7178a81ah22ff6ab699e2c5f2@mail.gmail.com>
Date: Mon, 25 May 2009 22:11:23 +0300
Message-ID: <fce2a370905251211v3c82c904j3e9944df2f9f7efb@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 May 2009 19:19:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2009 at 9:57 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> Hello,
>
> On Mon, May 25, 2009 at 2:32 PM, Phil Blundell <philb@gnu.org> wrote:
>> On Mon, 2009-05-25 at 13:59 -0300, Otavio Salvador wrote:
>>> Hello,
>>>
>>> On Mon, May 25, 2009 at 1:53 PM, Phil Blundell <philb@gnu.org> wrote:
>>> > On Mon, 2009-05-25 at 13:31 -0300, Otavio Salvador wrote:
>>> [...]
>>> >> I belive that the right way to fix it is add a binary package only f=
or
>>> >> udevadm
>>> >
>>> > That's pretty much what udev-utils is: it doesn't contain any binarie=
s
>>> > apart from udevadm.
>>>
>>> In this case the binary package is wrong.
>>
>> Why so?
>
> I think udev-udevadm is more sound for me.

It's not only udevadm:
FILES_udev-utils =3D "${usrbindir}/udevinfo ${sbindir}/udevadm
${usrbindir}/udevtest"

>
>>> >> and make udev depends on it and mdev suggests it.
>>> >
>>> > Mdev itself doesn't have any use for udevadm, so having mdev Recommen=
d
>>> > udev-utils wouldn't be the right thing; this would just be a waste of
>>> > space for people who are using mdev without HAL (which, I suspect, is
>>> > actually the majority of mdev users).
>>>
>>> Agreed. But AFAIK suggested packages do not get installed by bitbake by=
 default.
>>
>> Ah yes, sorry, I misread your first mail. =C2=A0Having mdev Suggest
>> udev-utils would indeed be harmless since you're right, ipkg doesn't
>> install suggestions automatically. =C2=A0It would still be fairly pointl=
ess
>> though since nothing in mdev makes any use of udev-utils.
>
> Or maybe hal ought to depends on udev-(utils|udevadm) instead ;-)

Not all hal users need these binaries, don't they?

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


