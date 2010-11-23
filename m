Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mrchapp@gmail.com>) id 1PKy5A-0003LK-N9
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 19:59:13 +0100
Received: by fxm7 with SMTP id 7so1589253fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 10:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Pkxi5S+ZHbtFE9Xmp9Qq0e+QUYBbjikbWJS7Kq7ON1E=;
	b=pnSyFeCplssdu7Ddfa5lUBjuP08zNPD2LkTakrdJxFATCzb5F97eAPwstghoRYqutj
	rk7Nzylh11/uEjwN3GOXiLRTmE62LECLKKFmU/p6kKmc/pTUog5gAaeOFjAN1Jz8DPD0
	3bAgPHASBLmavdcAeeZQw68ihENayrYiEJ/jc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=RvFnd5z35EA4laedDGHcAWS4MPs8K2n0JNlv7A9VnJnxV9P53P+UxftDpqpLfIT1+6
	7iB0Z+Sa5z3O7S5/FK3jwJ3fwG61yaDYwZ5EosKt3ZVDQIbTpCgBJW7YSuUG4vzNMaUR
	i/XHMIqHJKlAHxu1pob7uEymBAtMdta+0XfP4=
Received: by 10.223.125.132 with SMTP id y4mr497744far.148.1290538676519; Tue,
	23 Nov 2010 10:57:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.115.209 with HTTP; Tue, 23 Nov 2010 10:57:36 -0800 (PST)
In-Reply-To: <ich14q$f5b$2@dough.gmane.org>
References: <20101123113706.GA3533@lit.local.igalia.com>
	<4CEBD252.7000502@mentor.com>
	<20101123145713.GA3032@lit.local.igalia.com>
	<4CEBDABB.1060607@mentor.com>
	<6EB1C564-9BA3-4833-B7F3-72EA4B2F8C51@dominion.thruhere.net>
	<20101123160525.GB3032@lit.local.igalia.com>
	<ich14q$f5b$2@dough.gmane.org>
From: =?ISO-8859-1?Q?Daniel_D=EDaz?= <mrchapp@gmail.com>
Date: Tue, 23 Nov 2010 12:57:36 -0600
Message-ID: <AANLkTiknZQDSiVKOyNPysN5cNjDKn2LwAk5ODAs8cRSN@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: mrchapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
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
X-List-Received-Date: Tue, 23 Nov 2010 18:59:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello!


On Tue, Nov 23, 2010 at 12:28 PM, Koen Kooi <k.kooi@student.utwente.nl> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 23-11-10 17:05, V=EDctor M. J=E1quez L. wrote:
>> On Tue, Nov 23, 2010 at 04:58:54PM +0100, Koen Kooi wrote:
>>>
>>> Op 23 nov 2010, om 16:16 heeft Tom Rini het volgende geschreven:
>>>
>>>> On 11/23/2010 07:57 AM, V=EDctor M. J=E1quez L. wrote:
>>>>> On Tue, Nov 23, 2010 at 07:40:18AM -0700, Tom Rini wrote:
>>>>>> On 11/23/2010 04:37 AM, V=EDctor M. J=E1quez L. wrote:
>>>>>>> I'm trying to build minimal-image with CSL toolchain, but I got thi=
s error:
>>>>>>>
>>>>>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Start=
ed
>>>>>>> ERROR: TaskFailed event exception, aborting
>>>>>>> ERROR: Build of /media/DISK/vjaquez-angstrom-setup-scripts/sources/=
openembedded/recipes/meta/external-toolchain-csl.bb do_install failed
>>>>>>> ERROR: Task 187 (/media/DISK/vjaquez-angstrom-setup-scripts/sources=
/openembedded/recipes/meta/external-toolchain-csl.bb, do_install) failed wi=
th 256
>>>>>>> ERROR: '/media/DISK/vjaquez-angstrom-setup-scripts/sources/openembe=
dded/recipes/meta/external-toolchain-csl.bb' failed
>>>>>>> ERROR: Function do_install failed
>>>>>>> NOTE: Task failed: ('function do_install failed', '/media/DISK/vjaq=
uez-angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-l=
inux-gnueabi/external-toolchain-csl-1.0-r6/temp/log.do_install.22227')
>>>>>>> ERROR: Logfile of failure stored in: /media/DISK/vjaquez-angstrom-s=
etup-scripts/build/tmp-angstrom_2008_1/work/armv7a-angstrom-linux-gnueabi/e=
xternal-toolchain-csl-1.0-r6/temp/log.do_install.22227
>>>>>>> Log data follows:
>>>>>>> | cp: cannot stat `/media/DISK/sgpp/arm-2010q1/arm-angstrom-linux-g=
nueabi/libc/lib/*': No such file or directory
>>>>>>> | ERROR: Function do_install failed
>>>>>>> NOTE: package external-toolchain-csl-1.0-r6: task do_install: Faile=
d
>>>>>>> ERROR: TaskFailed event exception, aborting
>>>>>>>
>>>>>>> For some reason the variable ${TARGET_SYS} is evaluated as
>>>>>>> arm-angstrom-linux-gnueabi instead of arm-none-linux-gnueabi which =
is the
>>>>>>> correct value.
>>>>>>
>>>>>> Please post your local.conf settings as well as what version of
>>>>>> openembedded (and what branch) you are using.
>>>>>
>>>>> I'm using the openembedded's branch org.openembedded.dev (HEAD)
>>>> [snip]
>>>>>
>>>>> If I apply this patch[1] the problem seems to be solved.
>>>>>
>>>>> 1. http://www.mail-archive.com/openembedded-devel@lists.openembedded.=
org/msg11415.html
>>>>
>>>> I thought the patch had been applied. =A0Koen, do you still object aft=
er it was explained that currently angstrom is always going to win setting =
that variable unless it's made a ?=3D ? =A0Thanks!
>>>
>>> I still object to that patch, since a different solution has been appli=
ed
>>> already.
>>
>> But they not seem to work (at least for me).
>>
>>> And I still don't see why people want to use known broken
>>> toolchains...
>>
>> If you make the statement that angstrom distribution _cannot_ be built u=
sing any
>> external toolchain,
>
> It builds fine using external angstrom toolchains :)

I too need CSL support.

Do you mean to say that OE will NOT support CodeSourcery toolchains?
It is already there for Poky and V=EDctor has shown it works with OE as
well.

Greetings!

Daniel D=EDaz
yosoy@danieldiaz.org



> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFM7AfaMkyGM64RGpERAsotAKCIK8UfxwWuUX6JUFPiVnB3FuflnwCglOLE
> q/rixioxsF0CT/cg+gxgIj0=3D
> =3DZ0T+
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


