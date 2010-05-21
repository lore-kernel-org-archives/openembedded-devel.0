Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OFYZ5-0002IK-75
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 22:11:27 +0200
Received: by iwn2 with SMTP id 2so1418893iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 13:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=H33b/Qq/RPv87VhsEhF1NNUNRt3a7BsluTkafQCsiNc=;
	b=Yr9KTJGHP05ALd8aXht8sRxgfWibq3ftxzx2UNjg8Bm+r3WPBw8+VuYFQqUUkTp5r/
	fEGbH6X9PFdSfJfkFJzj8n7OTWGn5Utyg/OyEIZmrwRGwHZdW+16kpmB49mfhy5Ooxfu
	YAn0uG7HQ6Z1+4fbc/EaCSrdjDE2TuZ2N68jw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=TmsjcsKaTcwEovvcRV6y0UskINvXDrCU9n+4yJgEMA/azzaqnJkUbI8DaOtHWGlBra
	g7OsiL8MgrvB6ycNW/cGa1AnurgOXxL1xxU6UV+U2pZ9mxolhheIsHA3sXwINeIgeSUR
	WnpWuO/mpRyPAVZlMjobcKWYqlblGMOCkqIWo=
MIME-Version: 1.0
Received: by 10.231.125.167 with SMTP id y39mr1533481ibr.93.1274472445046; 
	Fri, 21 May 2010 13:07:25 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Fri, 21 May 2010 13:07:24 -0700 (PDT)
In-Reply-To: <AANLkTinLm-qzDz71WT2ji8DrZvWNlsAs2q0VqQa9UGVL@mail.gmail.com>
References: <AANLkTinLm-qzDz71WT2ji8DrZvWNlsAs2q0VqQa9UGVL@mail.gmail.com>
Date: Fri, 21 May 2010 13:07:24 -0700
Message-ID: <AANLkTimXk5ig2FvamjzzmYmiAmdHW9GcV4F9UPHnjsgO@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Old system on Colibri - new cross-compilers from Angstrom, shall it works?
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
X-List-Received-Date: Fri, 21 May 2010 20:11:28 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

2010/5/21 Grzegorz Toporek <top.grzechu@gmail.com>:
> I have one important question.
>
> On Colibri I have an old system already installed (Linux version 2.6.24.7=
,
> gcc 4.2.2). When I'll build my own one for angstrom, thus getting
> cross-compilers, can I just simply run programs compiled for angstrom =A0=
on
> Colibri board?
>
> Lets say I will cross compile sth using cross-compilers from directory
> /tmp/cross/bin and then upload it on my board. Shall this work for me?
> Should I change gcc version in /conf/distro/angstrom-2008.1.conf to 4.2.2=
?

We don't know how existing root file system was compiled so its hard to say
but if ABI is compatible you may be able to run it but I think angstrom use=
s
4.3.x compilers as default. So to avoid uninvited troubles I would suggest
to match the version of gcc if you want to go this route.

>
> Looking forward to your reply.
>
>
> Kind Regards,
> Grzegorz
>
>
> W dniu 21 maja 2010 12:08 u=BFytkownik Grzegorz Toporek <top.grzechu@gmai=
l.com
>> napisa=B3:
>
>> Thanks, I'll do as you recommend.
>>
>> And do not get flooded by Wis=B3a :D
>>>
>>
>> Luckily I am far away from it...
>>
>>
>> 2010/5/21 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
>>
>> Dnia pi=B1tek, 21 maja 2010 o 11:48:24 Grzegorz Toporek napisa=B3(a):
>>>
>>> > I would love to work with angstrom, however I'm using Colibri evaluat=
ion
>>> > board with Intel(R) PXA270 Processor (this is a students project and =
I
>>> can't
>>> > change it). Is it possible to run system built for angstrom on my boa=
rd
>>> or
>>> > I just miss something?!
>>>
>>> Angstrom supports nearly every board which OpenEmbedded supports. Colib=
ri
>>> is
>>> just another device. Build Angstrom for it, use it and you will soon fi=
nd
>>> out
>>> how much work you do not have to do due to feeds with already built
>>> software.
>>>
>>> Making own distribution and then properly maintain it is lot of work an=
d I
>>> would never suggest that for someone who just started with OpenEmbedded=
.
>>>
>>> Also one thing: do not use tune-iwmmxt for Colibri. This does not give =
any
>>> special improvements for system. Add "iwmmxt" to MACHINE_FEATURES like =
it
>>> is
>>> in few machines already - this will give you optimized versions of thos=
e
>>> packages where it is really worth to enable that.
>>>
>>> And do not get flooded by Wis=B3a :D
>>>
>>> Regards,
>>> --
>>> JID: =A0 =A0 =A0hrw@jabber.org
>>> Website: =A0http://marcin.juszkiewicz.com.pl/
>>> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


