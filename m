Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PnGi9-0001UV-Bw
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 21:32:25 +0100
Received: by yie16 with SMTP id 16so266818yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 12:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=7+P37DFuu8MrEP+qrJUi5qPSbbzLAboD/1O3it8IIIc=;
	b=V3mr85jjr8/4dJfzNg5ZxQT1twyJE7Dq2rOvE04PpLBGulsVwSgMU9s/CGi0g/UX10
	ylVoaQqEOVM8ZsXt43DrOTvsMlRuSyVV0aF54J1qDgTP1KGguxugIz2NN3FaU6606Zug
	Ub7u6lEhGEGzco+5A8HP+HEPcAI8RKBu+MLJk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=d9y8tpWVtcxY//dJkwCXRGb0/VuMw/LPxVNpJfD38afF3PFXIDbge31/NinsHXLCMl
	42o5l2XEBWadv+GwzpyJ/tWsrmSvAfW8VWaHrTIeKc/NqQdqbMIRT8XT49M+A4PvR5gk
	HCRIGZXn7ToJLuEavIQ90U1Thms6xMPrEighI=
Received: by 10.91.1.2 with SMTP id d2mr217182agi.169.1297283479414; Wed, 09
	Feb 2011 12:31:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Wed, 9 Feb 2011 12:30:59 -0800 (PST)
In-Reply-To: <iitplc$ago$1@dough.gmane.org>
References: <4D519C83.9060502@mentor.com>
	<09D9BE2AC4AA764DABAA8C91E48D819E011A79A329@DEMCHP99E35MSX.ww902.siemens.net>
	<20110209095644.GE28019@excalibur.local> <iitplc$ago$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2011 12:30:59 -0800
Message-ID: <AANLkTinrp6netE73j_iQmHu+sA5T4sUDEJJbijL45dKR@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: 2011.03 release testing, starts soon!
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
X-List-Received-Date: Wed, 09 Feb 2011 20:32:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 9, 2011 at 2:18 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote=
:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09-02-11 10:56, Stefan Schmidt wrote:
>
>>> 2. Do not delete the release branch after 2011.03 will be released (jus=
t like
>>> =C2=A0 =C2=A0it was done for 2010.12), but let it live and allow develo=
ppers committing
>>> =C2=A0 =C2=A0bug-fixes (backporting choosen things?) reported back by O=
E users (some would
>>> =C2=A0 =C2=A0would be happy to contribute this way)
>>
>> That was already discussed. We make a tag with the release rev from whic=
h can be
>> branched again _if_ people are stepping up to support this branch on a m=
id or
>> long term base.
>>
>> The branch Tom is using until the release is pretty useless froma histor=
y point
>> of view (all changes must be in master as well). When he thinks the rele=
ase is
>> good enough the tag gets added and the old branch deleted. For the last =
release
>> nobody cared to support it afterwards with bugfixes so no release branch=
 was
>> created.
>>
>> I'm thinking about this for the upcoming release. If all works well we w=
ill base
>> a product on it which I would like to support directly from such a relea=
se
>> branch.
>>
>> The hard part is how people could decide on pooling resources on this. D=
efining
>> goals for such a branch and stuff. E.g. only take serious fixes? What ab=
out
>> package updates? Security fixes? changes on the toolchain or classes?
>>

I would suggest to take only bugfixes and refrain from infrastructure
changes which usually
happen metadata wide and toolchain and classes are biggest part of
this and with time backports
into long term branches become more and more complex and painful and
it may be that you have to do
entirely different patch to solve the same issue in this branch which
has been fixed differently upstream
I think if such a branch is to be created it should be created from
the release tag after the release happens

>> This is up to the group who wants to support such a branch. Anyone else
>> interested in doing this for 2011-03?

If such a branch is expected for long term then its better to decide
its policies on patches
from upstream pov all fixes that go into this branch should first go
into master if its not
a direct backport of some sort. That way we can be sure that we dont
lose changes that should be in master.

>
> I discussed this with Philip and Graeme and the idea is to retire
> angstrom-2008.1.conf into that branch. I still have customers (you
> indirectly :)) using that, so having it in that branch would be very neat=
.
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNUmnrMkyGM64RGpERAuT/AJ9mytn+0MD+p0r5wIHO9ZGZ+faHWwCfaok8
> s2oPs47xZ2Ud4um/cqA8G4U=3D
> =3DJpX4
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


