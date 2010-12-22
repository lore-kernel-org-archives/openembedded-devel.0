Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PVO7Y-0003pI-5k
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 13:48:44 +0100
Received: by iyj18 with SMTP id 18so4220794iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 04:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1V2KIFxANSvCDcSn9hUdQDLDJBvue4d7VMxmoMNrulk=;
	b=JL4ocyxKOb2o+bVwz1ZZEkNNdOnpmWe1wORuhAIx73D37EdrQzQqrQkSuksvGiarb6
	DpTEwvEFk/C3CVtB2x2rNG1C/pbaDQV/558txo59flybmBenpwFRYgY9N/ewVJUgVSk1
	PkqX9ooX8dU3mcl9fGXzI0yjbMXT/j4uthVR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gFYYqK8LHsktPjwqQnUOSa8ADWQWpXgda8bV5LA/aMjWFHvMypjTF5yPHuqPVH8jBm
	JIKcLcZTL3JPO0VZbCSWmiHtuQTHyhdODhKYoDSEPzZmGiYGe3ym63MeHq3JDjMdOgrt
	1fEEAixDCmSr3Z718rIRIbfM0x2oAp1XPZR1g=
MIME-Version: 1.0
Received: by 10.231.206.7 with SMTP id fs7mr162183ibb.82.1293022115816; Wed,
	22 Dec 2010 04:48:35 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 22 Dec 2010 04:48:35 -0800 (PST)
In-Reply-To: <iesrb1$mue$1@dough.gmane.org>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<AANLkTinhDm2O+71-+ec_LX1DOQ9bO6gpiwNOE3fauswA@mail.gmail.com>
	<iesrb1$mue$1@dough.gmane.org>
Date: Wed, 22 Dec 2010 13:48:35 +0100
Message-ID: <AANLkTinurP-H+XiaeLgaUe6Uq6oN5xYd1H0QnqiyhEW_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sanity: release 2010.12 is out, so bump minimum bitbake to 1.10.0 per TSC decision
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
X-List-Received-Date: Wed, 22 Dec 2010 12:48:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/12/22 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-12-10 12:55, Frans Meulenbroeks wrote:
>> 2010/12/22 Koen Kooi <koen.kooi@gmail.com>:
>>> Signed-off-by: Koen Kooi <koen@openembedded.org>
>>> ---
>>> =A0conf/sanity.conf | =A0 =A02 +-
>>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/conf/sanity.conf b/conf/sanity.conf
>>> index 0f53cb2..1c83c14 100644
>>> --- a/conf/sanity.conf
>>> +++ b/conf/sanity.conf
>>> @@ -3,7 +3,7 @@
>>> =A0# See sanity.bbclass
>>> =A0#
>>> =A0# Expert users can confirm their sanity with "touch conf/sanity.conf=
"
>>> -BB_MIN_VERSION =3D "1.8.18"
>>> +BB_MIN_VERSION =3D "1.10.0"
>>>
>>> =A0SANITY_ABIFILE =3D "${TMPDIR}/abi_version"
>>> =A0SANITY_PRFILE =3D "${TMPDIR}/distro_pr"
>>> --
>>> 1.7.0
>>>
>>
>> As 1.10.1 is already out for quite a while and (if I recall correctly)
>> 1.10.0 had some issues that are resolved in 1.10.1 wouldn't it be
>> better to set 1.10.1 as minimal version?
>> Otherwise no objections.
>
> The head of the 1.10 branch says it's 1.10.0, not 1.10.1 :(

Indeed :-(
Guess this should be changed then

There is http://developer.berlios.de/projects/bitbake/ which lists 1.10.1
and the git also has a tag for 1.10.1 and a donwload for it.

Btw I assume we also need to update the wiki

Frans


