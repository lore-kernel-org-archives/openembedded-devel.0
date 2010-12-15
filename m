Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PSwJv-0004zQ-Di
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Dec 2010 19:43:23 +0100
Received: by iyj18 with SMTP id 18so1068983iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 10:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6O/xE11f3KYgTomoVvv+oNtx2giH1FqOe53KCJpkwfk=;
	b=g8K+7kJyki8iQLhB8U+fQvtmba8ysxHaMx7F3SVzQiK4a9Px2Upbr41vfMwNaRVC80
	oz55HK+S7quyDbJBE1iMTM6lEj9gsWS0ap5Al3ezuGdkO/FBe4IiAjSkRZw7muPq8PgO
	yPzc65yFhfVMOgFOYZtmIoGcQP5yI5ONJrkNg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZlKZgnK9bH/RMlQoKkqNCk/rPMzkgNRAHjBA7q1hUYXcn92meozbaT+GOP4zZoYYnD
	Z66JZHOLgDyOYssYj0gHB/NRXSNOx3st1vx7ri52X9khuAbpIUhM/573G58hAbpye5BQ
	sKD3uf7mIIs6XT5S8Y52s1etd1dZSR2E/dIbE=
MIME-Version: 1.0
Received: by 10.231.38.10 with SMTP id z10mr5246164ibd.107.1292438502123; Wed,
	15 Dec 2010 10:41:42 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 15 Dec 2010 10:41:42 -0800 (PST)
In-Reply-To: <4D08F9A6.1010607@mentor.com>
References: <AANLkTimTaZyPywc_B8g4k4QO+gTJq67K=OgcoSe6BpJh@mail.gmail.com>
	<4D08D3F5.1060608@mentor.com>
	<AANLkTim5ChRd3XDTo+E25HiWwpnmyMDgeg17xXd0=GxA@mail.gmail.com>
	<4D08F9A6.1010607@mentor.com>
Date: Wed, 15 Dec 2010 19:41:42 +0100
Message-ID: <AANLkTimWn_duyaL30DF0uhHNj6sVb1F5-TG4jKReKD+w@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing 2010-12-10 (wiki, results, bluez-libs)
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
X-List-Received-Date: Wed, 15 Dec 2010 18:43:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/15 Tom Rini <tom_rini@mentor.com>:
> On 12/15/2010 08:33 AM, Frans Meulenbroeks wrote:
>>
>> 2010/12/15 Tom Rini<tom_rini@mentor.com>:
>>>
>>> On 12/15/2010 12:51 AM, Frans Meulenbroeks wrote:
>>>>
>>>> Dear all,
>>>>
>>>> I just wanted to update the testing table with my entries and I
>>>> noticed two (possibly related) things.
>>>> - no other entries for 2010-12-10 are there yet (and it is already
>>>> wednesday)
>>>
>>> I haven't updated the stuff we're building since just about everything
>>> failed due to the gcc issue Khem fixed in
>>> 2c8570552549da2e11428d08b2bc08849cac39b1. =A0This is why I sometimes wo=
nder
>>> if
>>> it would be desirable to cherry-pick a few things in to the testing-nex=
t
>>> branch.
>>
>> Hm. Yeah. I've re-checked and I am definitely building the
>> testing-next branch, not git head.
>> Then again I only build console-image and no high end images.
>> My james-image also had quite some issues (js, samba) which are now
>> resolved.
>> Only issue left for now seems to be gettext/libtool related.
>
> What distro? =A0Almost _everything_ was broken for me since it was
> micro/minimal (including console-image).

Distro minimal, targets mpc8313e-rds, sheevaplug, calamari, neek
(latter does not build) recipe console-image
distro slugos, targets nlsu2le nslu2be, target slugos-image.

Frans


