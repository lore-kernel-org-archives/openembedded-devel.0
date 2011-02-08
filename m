Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PmrSv-0000e1-ML
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 18:35:01 +0100
Received: by gwaa12 with SMTP id a12so2362723gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 09:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=5tCw7lPKPt5OKbmm0raE29/S4sKMXtIil2oKQZOq+nw=;
	b=pTBUvvgprN2l3Xc7fUGI1gn0eDBeSYP3qHHG2qjcU3aiby26M6toMO37DwuW+lMtIf
	ZJ5Sfw9+kGeMjLKafEWHjTl7og5gsSgJvXpVIuqAkrxLK2t96zwsiIW7GLG0HnXecq4w
	KnIkVcoeBfctIarNIbBTH8R5VH5KzA5Ghff+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=CJsnnKdWyHCixvSETv6PRZZXYa8NO7FPnBodlFpZlLpaWWeRvhkHPwhYHVu09v3Zyy
	GTYx3jlLoeL18VR14nUyNBKvOEKdY+QDi+zWY0tddLLcE3PGuidF+jh0wl1b1EsZo/WQ
	EO2qEyWGV82n1mFiykhHs98KH1pVmrWQ3ctJ8=
Received: by 10.90.51.20 with SMTP id y20mr209687agy.115.1297186437796; Tue,
	08 Feb 2011 09:33:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Tue, 8 Feb 2011 09:33:37 -0800 (PST)
In-Reply-To: <4D517961.7020000@mentor.com>
References: <4D51566B.9060603@mentor.com> <4D516F8B.4090703@gmail.com>
	<4D517961.7020000@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2011 09:33:37 -0800
Message-ID: <AANLkTimzzjRgbpJS-fXKYk=tOMUgCihB8=M=V7gLGyuP@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Tue, 08 Feb 2011 17:35:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 8, 2011 at 9:12 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 02/08/2011 09:30 AM, Marco Cavallini wrote:
>>
>> Tom Rini ha scritto, Il 08/02/2011 15:42:
>>>
>>> Hey all,
>>>
>>> As March is fast approaching I want to gather the list of DISTRO /
>>> MACHINE / BBPKGS targets that the various distributions would like to
>>> see at least compile tested (volunteers for HW testing welcome!). Today=
,
>>> I have the following setup to be built:
>>>
>>> minimal / minimal-uclibc:
>>> qemux86/ppc/arm/mips/mips64/sh4/mipsel, mpc8315e-rdb, p2020ds, p2020rdb
>>> +
>>>
>>> nas-server-image/native-sdk-image/console-image/minimal-image/x11-image=
/meta-toolchain/qt4-x11-demo-image/qt4e-demo-image
>>>
>>>
>>> angstrom-2008.1 / angstrom-2010.x:
>>> hawkboard, mini2440, mini6410, beagleboard + console-image /
>>> qt4-x11-demo-image / qt4e-demo-image
>>>
>>> slugos / ucslug:
>>> nslu2be/le + slugos-image
>>>
>>> I'm building all of these for 32bit Ubuntu 8.04, RHEL5 and will be
>>> adding Ubuntu 10.04 for the next run. =C2=A0What more do people want ad=
ded?
>>> I'm looking to fill this matrix out to something that runs "over the
>>> weekend" and I've still got plenty of room to spare (which is why I've
>>> bcc'd everyone in the MAINTAINERS file with a Distro by their name).
>>>
>>> And of course if you wish to handle building what you care about
>>> yourself instead, that's great! =C2=A0Please just take this as a gentle
>>> reminder that there's a release coming up so it's time to crank the
>>> builders up and make sure your stuff is working.
>>>
>>
>> Tom,
>> I periodically test the following with Debian Lenny 5.0 x86_64, but I'd
>> like to see them in your list too.
>>
>> DISTRO: kaeilos
>> MACHINE : ronetix-pm9263/at91sam9263ek
>> IMAGE: minimal-image/x11-image/meta-toolchain/qt4e-demo-image
>
> Added, thanks!
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Tom

You should create a wiki page like this

http://wiki.openembedded.org/index.php/Release-2010.12

and everyone who is building some combination for release is welcome
to populate the matrix with their combinations

Thanks
-Khem


