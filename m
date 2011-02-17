Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PqCSz-0005St-8K
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 23:36:53 +0100
Received: by fxm17 with SMTP id 17so2966256fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 14:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=DelwhFnMS5lUzn+V1BgDI9MMQsVMG7Tk5o1QJjXBWOo=;
	b=L/Q4hQk63RCkNx/UfZ5zZBp11E+K1t2Nt6wzXf5AaVTebnwmAXGPFLRn3ZWjN1uCjG
	Ooi/hSSsYpNtZelSz7dCHummo8Y6vsVDqv725s3grKHwvw6QptOK2BClGBcXM9BHOHsM
	CF5BfMSrCLIw2uP86zn9EDgD4KPMHjnhP82Po=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=gzuhtP8KqwS3arvOTkw/dKSEtg2JsZX5aXsWX5ksbW2LkZpkoTbwL/OF0eERh5ksJV
	1r7qDP96hWlVEL2xtQdwynNyWCN6BQMV11A8m1dWz9o9LEcX5eY75GVt3ZZxzdiNvwE4
	0oUdlQIHqYPpXxNz7sNu2DLtNk/r5LcNXEIBU=
Received: by 10.223.96.199 with SMTP id i7mr3113459fan.101.1297982139994; Thu,
	17 Feb 2011 14:35:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Thu, 17 Feb 2011 14:35:18 -0800 (PST)
In-Reply-To: <4D5D9706.80504@opensimpad.org>
References: <4D51566B.9060603@mentor.com>
	<20110208145355.GF2050@xora-build.xora.org.uk>
	<4D515A17.3060203@mentor.com> <4D523623.7030509@opensimpad.org>
	<4D59543B.50506@mentor.com> <4D5D9706.80504@opensimpad.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Feb 2011 14:35:18 -0800
Message-ID: <AANLkTin27UL+v4PxngkBc94RN3Ni9QpRzogof74cek_W@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Feb 2011 22:36:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2011 at 1:45 PM, Bernhard Guillon
<Bernhard.Guillon@opensimpad.org> wrote:
> On 14.02.2011 17:11, Tom Rini wrote:
>>
>> On 02/08/2011 11:37 PM, Bernhard Guillon wrote:
>>>
>>>
>>> I have access to such a device and can test booting of console-image

>>
>> Fails to build with: http://pastebin.com/rjsmt0M9
>>
>
> Hi,
> I just build a console-image and it booted fine on my atngw100.

great so you can try avr stuff. I see that avr now supports gcc 4.4
and binutils 2.20.1
would you test if toolchain was upgrade (ofcource after release)

>
> I had one issue with libpam. Libpam requires libprelude and libprelude di=
d
> not build for me (see log attached). I added --disable-prelude to

this error seems to be gcc related to me. Somehow C++ header inclusion
is not ok it seems

> OE_EXTRACONF at the libpam recipe and had no further problems.
>
> Btw. the libpam recipe has no libprelude at DEPENDS so we should add it o=
r
> disable it by default. Unfortunately I did not found time to fix the
> libprelude error :/
>
> Buildmachine:
> Ubuntu lucid i686
>
> Build Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.10.2"
> METADATA_BRANCH =C2=A0 =3D "testing-release-2011.03"
> METADATA_REVISION =3D "af8541c"
> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D "avr32"
> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-uclibc"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "atngw100"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
> DISTRO_VERSION =C2=A0 =C2=A0=3D "2010.7-test-20110217"
>
> local.conf:
> MACHINE =3D "atngw100"
> DISTRO =3D "angstrom-2008.1"
> ANGSTROMLIBC =3D "uclibc"
>
> Best regards
> Bernhard
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


