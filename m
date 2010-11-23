Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PKyAq-0003qq-2P
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 20:05:04 +0100
Received: by ywo32 with SMTP id 32so599093ywo.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 11:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=gOyXQleHzn60sMQleA5J+d3HPEJcRIPLjNlZyCFG55s=;
	b=cw9qOWK7GDSly2PI209QC822LeTfErhIbUUC5pZ0x7/T7X33qS1dFp/3V4DQcl+dyF
	8p0a+K2xVG+lQM7ahHGXMzgFpPP/uNAKfqH7OyW+r7JZt+513vpudzodD+y0CyTH4ZBM
	XCoMnqY/sACZkvu3hi1jyAiKc7QKxJp6s26ew=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=WteJ6R6p0bnMPmeFx9IzFc/EbSaUFX+FWw+xvplKkd5kWcFzGA2c09yg5YU9KP/HZd
	FbjTNQMhEGmhXN8IDQxxlObsGm0jvhbeLMrdSjF6h6kbX2+XBb/iC7Iy9pcKJuQh/ueF
	OwVuA9NosNGFeSAxYEbSyfQErHUKNO+4nE/N4=
Received: by 10.90.9.22 with SMTP id 22mr538168agi.102.1290539029871; Tue, 23
	Nov 2010 11:03:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 23 Nov 2010 11:03:23 -0800 (PST)
In-Reply-To: <AANLkTiknZQDSiVKOyNPysN5cNjDKn2LwAk5ODAs8cRSN@mail.gmail.com>
References: <20101123113706.GA3533@lit.local.igalia.com>
	<4CEBD252.7000502@mentor.com>
	<20101123145713.GA3032@lit.local.igalia.com>
	<4CEBDABB.1060607@mentor.com>
	<6EB1C564-9BA3-4833-B7F3-72EA4B2F8C51@dominion.thruhere.net>
	<20101123160525.GB3032@lit.local.igalia.com>
	<ich14q$f5b$2@dough.gmane.org>
	<AANLkTiknZQDSiVKOyNPysN5cNjDKn2LwAk5ODAs8cRSN@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Nov 2010 11:03:23 -0800
Message-ID: <AANLkTi=HNQnOVhUjU=Mrpkk-m5H=xiwzRndg6oZk1=iN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: external-toolchain-csl-1.0-r6 fails
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
X-List-Received-Date: Tue, 23 Nov 2010 19:05:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2010 at 10:57 AM, Daniel D=C3=ADaz <mrchapp@gmail.com> wrot=
e:
> Hello!
>
>
> On Tue, Nov 23, 2010 at 12:28 PM, Koen Kooi <k.kooi@student.utwente.nl> w=
rote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 23-11-10 17:05, V=C3=ADctor M. J=C3=A1quez L. wrote:
>>> On Tue, Nov 23, 2010 at 04:58:54PM +0100, Koen Kooi wrote:
>>>>
>>>> Op 23 nov 2010, om 16:16 heeft Tom Rini het volgende geschreven:
>>>>
>>>>> On 11/23/2010 07:57 AM, V=C3=ADctor M. J=C3=A1quez L. wrote:
>>>>>> On Tue, Nov 23, 2010 at 07:40:18AM -0700, Tom Rini wrote:
>>>>>>> On 11/23/2010 04:37 AM, V=C3=ADctor M. J=C3=A1quez L. wrote:
>>>>>>>> I'm trying to build minimal-image with CSL toolchain, but I got th=
is error:
>>>>>>>>
>>>>>>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Star=
ted
>>>>>>>> ERROR: TaskFailed event exception, aborting
>>>>>>>> ERROR: Build of /media/DISK/vjaquez-angstrom-setup-scripts/sources=
/openembedded/recipes/meta/external-toolchain-csl.bb do_install failed
>>>>>>>> ERROR: Task 187 (/media/DISK/vjaquez-angstrom-setup-scripts/source=
s/openembedded/recipes/meta/external-toolchain-csl.bb, do_install) failed w=
ith 256
>>>>>>>> ERROR: '/media/DISK/vjaquez-angstrom-setup-scripts/sources/openemb=
edded/recipes/meta/external-toolchain-csl.bb' failed
>>>>>>>> ERROR: Function do_install failed
>>>>>>>> NOTE: Task failed: ('function do_install failed', '/media/DISK/vja=
quez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-=
linux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227')
>>>>>>>> ERROR: Logfile of failure stored in: /media/DISK/vjaquez-angstrom-=
setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/=
external-toolchain-csl-1.0-r6/temp/log.do_install.22227
>>>>>>>> Log data follows:
>>>>>>>> | cp: cannot stat `/media/DISK/sgpp/arm-2010q1/arm-angstrom-linux-=
gnueabi/libc/lib/*': No such file or directory
>>>>>>>> | ERROR: Function do_install failed
>>>>>>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Fail=
ed
>>>>>>>> ERROR: TaskFailed event exception, aborting
>>>>>>>>
>>>>>>>> For some reason the variable ${TARGET_SYS} is evaluated as
>>>>>>>> arm-angstrom-linux-gnueabi instead of arm-none-linux-gnueabi which=
 is the
>>>>>>>> correct value.
>>>>>>>
>>>>>>> Please post your local.conf settings as well as what version of
>>>>>>> openembedded (and what branch) you are using.
>>>>>>
>>>>>> I'm using the openembedded's branch org.openembedded.dev (HEAD)
>>>>> [snip]
>>>>>>
>>>>>> If I apply this patch[1] the problem seems to be solved.
>>>>>>
>>>>>> 1. http://www.mail-archive.com/openembedded-devel@lists.openembedded=
.org/msg11415.html
>>>>>
>>>>> I thought the patch had been applied. =C2=A0Koen, do you still object=
 after it was explained that currently angstrom is always going to win sett=
ing that variable unless it's made a ?=3D ? =C2=A0Thanks!
>>>>
>>>> I still object to that patch, since a different solution has been appl=
ied
>>>> already.
>>>
>>> But they not seem to work (at least for me).
>>>
>>>> And I still don't see why people want to use known broken
>>>> toolchains...
>>>
>>> If you make the statement that angstrom distribution _cannot_ be built =
using any
>>> external toolchain,
>>
>> It builds fine using external angstrom toolchains :)
>
> I too need CSL support.
>
> Do you mean to say that OE will NOT support CodeSourcery toolchains?

No, its never said like that for OE. You might have to keep local
solution for your setups
and depending upon distros the solution might vary a bit remember OE
is not a distro
its infrastructure to make distros.

> It is already there for Poky and V=C3=ADctor has shown it works with OE a=
s
> well.
>
> Greetings!
>
> Daniel D=C3=ADaz
> yosoy@danieldiaz.org
>
>
>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.5 (Darwin)
>>
>> iD8DBQFM7AfaMkyGM64RGpERAsotAKCIK8UfxwWuUX6JUFPiVnB3FuflnwCglOLE
>> q/rixioxsF0CT/cg+gxgIj0=3D
>> =3DZ0T+
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


