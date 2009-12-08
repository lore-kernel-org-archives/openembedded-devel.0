Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NI1Bd-0005Uh-De
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 15:37:13 +0100
Received: by pwi11 with SMTP id 11so895379pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2009 06:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=0tcyHROvxRX9yRQ4n3wn1k2aGM6Lpgf0RuhpBaFtkt4=;
	b=K2lkd34WAB+mm20Eiy3L9q1ueWmAm1aA4KTEeFnYY2GHpaTB31lKxkl6/rt0srQ4TM
	m+9tFwXheG4U0MSz/bq7nW1Rr7S4qHGgphNmht28Xn0QfI9OrSSUqzGaUJrSNcER/CGv
	A6snNdKHM0ADenpgj1utQ2zf/EywwH2K1KjNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=coY/ojGDcm7fA41i2OLf555Hj8hYw2y+rlbbE7yvf/ZSyedAuHRzzOIDyNIOWB/XUy
	Uz4gMJFzHPmqK/HPp/HfvykUVmI38r0KdDqZi4OhLJD9T1WnX4WOTfdaZw2gIi8shR+1
	IrpN89jrF6gqAq/lRCdtebbgQ2m6PZd8elwL8=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.202.17 with SMTP id z17mr885658wff.190.1260282928147; Tue, 
	08 Dec 2009 06:35:28 -0800 (PST)
In-Reply-To: <op.u4l49bhamn1qzu@guohr-laptop-ubuntu>
References: <op.u4lz932emn1qzu@guohr-laptop-ubuntu>
	<hfl1ft$sog$2@ger.gmane.org> 
	<op.u4l246yhmn1qzu@guohr-laptop-ubuntu>
	<ac9c93b10912080106s655aba70kbed46f8a0c93c229@mail.gmail.com> 
	<op.u4l49bhamn1qzu@guohr-laptop-ubuntu>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 8 Dec 2009 07:35:08 -0700
X-Google-Sender-Auth: f0517bb8c177b756
Message-ID: <b6ebd0a50912080635w25cb6bbevc6af244346a87c9b@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Does it possible to use pre-built native tools
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
X-List-Received-Date: Tue, 08 Dec 2009 14:37:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

You'd likely be better off looking into the use of packaged staging package=
s
than using ASSUME_PROVIDED.

On Tue, Dec 8, 2009 at 2:42 AM, Guo Hongruan <camelguo@gmail.com> wrote:

> Hi frans,
>  In fact, I need to build completely different images for different
> architecture in different tmp directories. We need to do nightly build on
> build machine. So I think it would be better for several builds using the
> same one native tools set. It does not need to build native tools from ze=
ro
> on every time.
>
>
>
> =E5=9C=A8 Tue, 08 Dec 2009 17:06:27 +0800=EF=BC=8CFrans Meulenbroeks <
> fransmeulenbroeks@gmail.com> =E5=86=99=E9=81=93:
>
>
>  2009/12/8 Guo Hongruan <camelguo@gmail.com>:
>>
>>> Hi Koen,
>>>  Thanks for your information.
>>>  I think it will save my time. Consider I have to build several platfor=
ms
>>> for different architecture, in fact the native tools is architecture
>>> independent. So I think it is more reasonable to avoid building native
>>> tools
>>> for other platforms. Is there anything wrong with me.
>>>
>>
>> If you build different machines in the same tmp dir the system will
>> normally not rebuild native packages.
>> Also if it is the same architecture you won't get a new compiler (e.g.
>> if you have two armv5 systems).
>> Thinking of it, not sure what would happen if one version would insist
>> on using an older version of gcc
>>
>> Frans
>>
>>>
>>>
>>>  I tried to use ASSUME_PROVIDED to avoid compiling some native tools, b=
ut
>>> it seems that there are some building failure. I am trying to figure th=
em
>>> out.
>>>
>>> =E5=9C=A8 Tue, 08 Dec 2009 16:07:25 +0800=EF=BC=8CKoen Kooi <k.kooi@stu=
dent.utwente.nl>
>>> =E5=86=99=E9=81=93:
>>>
>>>  On 08-12-09 08:55, Guo Hongruan wrote:
>>>>
>>>>>
>>>>> Hi guys,
>>>>> I want to configure openembedded to use the pre-built native tools.
>>>>> e.g: qemu-native, quilt-native when building the whole image, so that
>>>>> the
>>>>> building can save lots of time. Is there anyone know how to achieve i=
t?
>>>>>
>>>>
>>>> It won't save you any time, since every tool OE builds for it self is
>>>> built for a reason. If you think a 10 minute buildtime improvement
>>>> outweighs
>>>> a month more of bughunting then look into ASSUME_PROVIDED.
>>>>
>>>> regards,
>>>>
>>>> Koen
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>>
>>> --
>>> Guo Hongruan, Embedded Linux Consultant
>>> Mobile: +86-0-13484056007
>>> Skype: camelguo
>>> Twitter: camelguo
>>> http://www.gulessoft.com
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Mobile: +86-0-13484056007
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

