Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mickael.chazaux@gmail.com>) id 1PsDZG-0005u6-8v
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 13:11:42 +0100
Received: by vxd7 with SMTP id 7so3305844vxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 04:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=yiNygVRL013WMKjAETgtOBwqHWO9jLXxQyKE8jWzXY4=;
	b=MbzNfhC8JrNLGcumYbkqqMh9DtOD0vGeTkYhb55SJNiOZQZdq+X7+M8M3TFXqSFg7s
	6mKCVlylcrcUBgsviXzJHp0J6ik6Tn47tAG+k8ggxVDGWVkb/B3a7MMY3WG0CtjW41aD
	p+h2w2TwwHPJGCdenNagD0JWQ7+qoQ2uCiAhE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aTyoXUtnJ/xoud6rjSwqJVRZVf54Tf6ty+sH/noWneHSb++b9y4NFHowKliFGlUbLf
	7ZMd3I2krD1eG3dkM97+nB9yqS5ZY/S3B+StUFn1QkVDmeiRZMQx8ccZNbgg3Oj+DS1O
	K/yWi6iG/D/6B4FIT7qNKd8necUyRGuAkCkPI=
MIME-Version: 1.0
Received: by 10.52.167.42 with SMTP id zl10mr5850893vdb.299.1298463022279;
	Wed, 23 Feb 2011 04:10:22 -0800 (PST)
Received: by 10.220.180.7 with HTTP; Wed, 23 Feb 2011 04:10:22 -0800 (PST)
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819E011A91BF89@DEMCHP99E35MSX.ww902.siemens.net>
References: <AANLkTimy_TtONvPFjaGCUV0qxaM7qF0ENBx7A6wzRnPZ@mail.gmail.com>
	<4D63F7F9.7000804@eukrea.com> <4D63FF5C.30400@opendreambox.org>
	<20110222201107.GB3970@localhost.jama.net>
	<AANLkTi=E2wEw8oCD8r8fzuD9GykdaJiz3JDehbiAR3sY@mail.gmail.com>
	<09D9BE2AC4AA764DABAA8C91E48D819E011A91BF89@DEMCHP99E35MSX.ww902.siemens.net>
Date: Wed, 23 Feb 2011 13:10:22 +0100
Message-ID: <AANLkTimtTwTX47GshHbym-xCKsMDNPo=B734WV49xLLS@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Weird behaviour with PPP
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
X-List-Received-Date: Wed, 23 Feb 2011 12:11:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2011/2/23 Aeschbacher, Fabrice <Fabrice.Aeschbacher@siemens.com>:
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] Im
>> Auftrag von Mickael Chazaux
>> Gesendet: Mittwoch, 23. Februar 2011 10:19
>> An: openembedded-devel@lists.openembedded.org
>> Betreff: Re: [oe] Weird behaviour with PPP
>>
>> Hi,
>>
>> 2011/2/22 Martin Jansa <martin.jansa@gmail.com>:
>> > On Tue, Feb 22, 2011 at 07:24:28PM +0100, Andreas Oberritter wrote:
>> >> Hi,
>> >>
>> >> On 02/22/2011 06:52 PM, Eric Benard wrote:
>> >> > On 22/02/2011 18:22, Mickael Chazaux wrote:
>> >> >> I have a hard time figuring out why bitbake seems to
>> mix versions of
>> >> >> ppp... Any ideas?
>> >> >>
>> >> > strange, which distro, git tag, bitbake version are you using ?
>> >> >
>> >> > Both bitbake ppp-2.4.5 & bitbake -b
>> >> > openembedded/recipes/ppp/ppp_2.4.5.bb work fine here
>> (angstrom 2008.1,
>> >> > armv5 target, bitbake 1.12.0).
>> >>
>> >> I don't think this has anything to do with ppp. I faced
>> the same issue
>> >> with a local recipe, of which an older version had been
>> built before.
>> >> When packaging, the old version was used. A new workdir
>> was created for
>> >> the old version during this step and the resulting
>> packages were empty.
>> >> No recipe existed for this old version at that time, i.e.
>> PR had already
>> >> been increased to 1.0, but 0.0 was used by bitbake.
>> >>
>> >> In the end, I deleted bitbake's cache and all files matching the
>> >> package's name to get rid of the annoying problem. I think
>> there were
>> >> pstage packages of the old version lying around.
>> >
>> > This wrong behavior is quite common ie after changing
>> PACKAGE_ARCH, see:
>> >
>> http://www.mail-archive.com/openembedded-devel@lists.openembed
>> ded.org/msg04280.html
>> >
>> As I often switch architectures (arm, x86) to work on different
>> boards, should I use a different TMPDIR for each?
>
> I am using one different TMPDIR for each MACHINE:
> =C2=A0build/mach1, build/mach2, ...
>
> I still have to find a way to make two different machines with same arch =
(hence same cross-toolchain) share the same pstage, so that the toolchain d=
oes not get built twice
>

Thanks for all the help. A fresh rebuild in a new TMPDIR builds the
right version of PPP.

Regards,

Mickael


