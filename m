Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q74Va-0007OI-CI
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 13:33:18 +0200
Received: by iwn10 with SMTP id 10so283352iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 04:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=N3vBIAjM1FxWVZlTfuaamg5Iqx6DxEFdaMHEGcWHn8s=;
	b=lvXz6DnQ8vsFm5caRtsS0rb8j6fF8RjT/dYPhZA6D4W2Rs/MYezOkpjY0E+IWPKqaU
	JFzS1JdOdY6zlH8z87434FSgl7C9RoJLmR6WMPMhrWV/OwlwlX4r+vrI5HI9ILQDTOjK
	Tk455HTPpfzOy9b1SWg3L913VTfftyhZxQ2ec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=RJ/Vp3ETNpE8a2QLLUUvcq4jXsXqUttJ6UIB1p1Bhg3OsvhYRIb2lWlQ5ohx4GEkmH
	GyIh//5ArJUCel1+OaAgf5owG5SoST/NBJH+o6Notn8rUbNKDC0vhOqgg3Nzsw5OPDiP
	xriKcZuocpTTPu69l2oEmWBGesP5KmwKfRd48=
MIME-Version: 1.0
Received: by 10.231.184.156 with SMTP id ck28mr7797914ibb.141.1302003071918;
	Tue, 05 Apr 2011 04:31:11 -0700 (PDT)
Received: by 10.231.19.204 with HTTP; Tue, 5 Apr 2011 04:31:11 -0700 (PDT)
In-Reply-To: <inerh7$g3o$1@dough.gmane.org>
References: <1300981024-9111-2-git-send-email-obi@opendreambox.org>
	<1300983264-16652-1-git-send-email-obi@opendreambox.org>
	<4D99C0EA.5070902@opendreambox.org> <inciqg$3vi$2@dough.gmane.org>
	<4D99E05E.9020100@opendreambox.org> <ind0l0$io$1@dough.gmane.org>
	<4D9A0A1D.3020209@opendreambox.org> <inecec$sae$2@dough.gmane.org>
	<4D9ADC0D.6060603@opendreambox.org> <inen1t$mgv$1@dough.gmane.org>
	<1301995968.14449.293.camel@phil-desktop>
	<inerh7$g3o$1@dough.gmane.org>
Date: Tue, 5 Apr 2011 13:31:11 +0200
Message-ID: <BANLkTim1RWLBvJMhFrkgU4LoGhbB6Avjxw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCHv2] kernel/module-base: Append PR to MACHINE_KERNEL_PR
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
X-List-Received-Date: Tue, 05 Apr 2011 11:33:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/4/5 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05-04-11 11:32, Phil Blundell wrote:
>> On Tue, 2011-04-05 at 11:23 +0200, Koen Kooi wrote:
>>> On 05-04-11 11:08, Andreas Oberritter wrote:
>>>> Thereby making MACHINE_KERNEL_PR mandatory for all machines?
>>>
>>> I don't see why not.
>>
>> The majority of machines aren't using it at present so this would be an
>> unexpected (and presumably unwelcome) change for them. =A0That seems lik=
e
>> a bad idea unless there is a compelling reason why it needs to be done.
>
> First: You don't get to complain about broken kernel module PRs when you
> are against rebuilding them when the kernel changes.
>
> Second: the majority of machines doesn't even build, so those kind of
> arguments are bogus

In the tree I have handy there are 313 machines.
I'd be rather hesitant to make statements that the majority does not
build without having that tested (and if you have: how many do not
build).

These are the files that have M_K_PR in them:
ea3250.conf:MACHINE_KERNEL_PR		=3D "r0"
nokia900.conf:MACHINE_KERNEL_PR =3D "r58"
omap3-pandora.conf:MACHINE_KERNEL_PR =3D "r2"
smartq5.conf:MACHINE_KERNEL_PR =3D "r1"
smartqv7.conf:MACHINE_KERNEL_PR =3D "r0"
include/davinci.inc:MACHINE_KERNEL_PR =3D "r50"
include/kirkwood.inc:MACHINE_KERNEL_PR =3D "r19"
include/omap3.inc:MACHINE_KERNEL_PR =3D "r101"
include/omap4.inc:MACHINE_KERNEL_PR =3D "r101"
include/palmpre.inc:MACHINE_KERNEL_PR =3D "r93"
include/ti814x.inc:MACHINE_KERNEL_PR =3D "r1"
include/ti816x.inc:MACHINE_KERNEL_PR =3D "r1"

Actually it seems quite some machines used to test the 2011.3 release
do not seem to use M_K_PR
(http://wiki.openembedded.org/index.php/Release-2011.03).

Frans.

PS: the machines I feel responsible for, and use regularly all build.
Not all of them do use M_K_PR.

>
> So apart from handwaving ("presumably unwelcome") do you have any actual
> arguments against moving all machines to MACHINE_KERNEL_PR?
>
> -----BEGIN PGP SI-
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNmvFnMkyGM64RGpERAqqkAJ4vgIlyQ3cgVAnZS2rcjdGJHjn3uQCfTOjt
> UtUZ9dRa9XfWvnganZPrAbg=3D
> =3DKtE5
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


