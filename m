Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PVJhp-00021G-Rx
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 09:05:54 +0100
Received: by iyj18 with SMTP id 18so4029164iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 00:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=dAB14z448GqdpVZQSFjmLidH/flZpUX6Tnx0LGpbwIU=;
	b=myudPjLm1DWn0kEh5LCUgh+riChfqGrwCKdmqg25qGVybBKDvckK14EpgR7MJrV4PZ
	D5ecCZULST5KkIh7Z3rHHufjkQiFg1b6w1uHsITZqU2VEBSJZW1UpCsNBJUDV4YHGl82
	PVdIDxc7/LJd8W9eU4RIYf5GXzHVXQ/Un9Or8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=l/jRegNUSc3JpcTZ4UnqV+ePLAWKPYtWQ4hAZWElzyvSiSytRitRHD6SWeWMpwpa1n
	IYK4b8jjaE03e5vbNjMvVJlh9R64IAz9IuIWPRWFKLB9wtj9x7yTRNKFMxOgkzN4pxZ4
	AEug/iZ87UcwpCJxhOR0l9PHHI70hMP58gQto=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr6609631ibc.7.1293005139431; Wed, 22
	Dec 2010 00:05:39 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 22 Dec 2010 00:05:39 -0800 (PST)
In-Reply-To: <20101222065627.GA28822@gmail.com>
References: <AANLkTimMz5m27fxSGVw-YyOAH2=Wbye2Ug71mZ9t+py1@mail.gmail.com>
	<AANLkTinQRHzSyLwso9MBC2JDRd76056_T2Nutfedtrn_@mail.gmail.com>
	<AANLkTin5G7ObMsQAE-DZEi8K4hA=gDcHs1gDRaKG_-yJ@mail.gmail.com>
	<1292996573.13721.0.camel@eha> <20101222065627.GA28822@gmail.com>
Date: Wed, 22 Dec 2010 09:05:39 +0100
Message-ID: <AANLkTimwiMhJ4kc6s1inQdNjWM4qSRa1WWUFAEJdYFP7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Stop Libtool relinking against host's /usr/lib (file format not recognised)
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
X-List-Received-Date: Wed, 22 Dec 2010 08:05:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/22 Khem Raj <raj.khem@gmail.com>:
> On (22/12/10 06:42), Esben Haabendal wrote:
>> On Wed, 2010-12-15 at 11:10 +0100, Frans Meulenbroeks wrote:
>>
>> > As the reporter of the gettext problem it at least gives me a
>> > suggestion on where to look.
>>
>> Any news on resolving this for gettext?
>>
> I think it was wrong usage of libtool 2.4 it should be workin now I think
>

I'm not sure if I would qualify using libtool 2.4 without the sysroot
support as "wong usage".
Anyway, if you use oe head or libtool 2.4 with sysroot support enabeld
the problem is gone.
Not that all my libtool problems are gone though...

Frans


