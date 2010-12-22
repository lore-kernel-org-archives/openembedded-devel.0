Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVXOe-00017M-Ea
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 23:43:00 +0100
Received: by ywi6 with SMTP id 6so2530556ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 14:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=tJ7wHlRttN5JEPr+DBgR0Ap1dn3BNmJ2ZURv4B6iXT4=;
	b=HUks80zxGLGUSVaWJhWLAAd11J6HiADbc8Cx4P85giKZqOdOmkKGYmTD+afpe7ZsK8
	ohQzXFbcbXJutq4zDNQFsg2BJhOq0rKH1GDvdM6auGCjzHlfQUkbJ64cERNf8w/VR4hk
	CU0m57DS92QgNO6ZMgVDf5S/A/fT8gzpIJSNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=O9Sk/dWutkXAVbXcsHuXX0X+4FGcPgYALBuvuuak2ZGdnp2f2IfUmhGqoV00J5n2KY
	2R2ACkW0uMjL5AS/HWb7TTfluuAFJm7UM3Mns9S7P9UDhhK2PlqWg8wvlsN5LOQQzUMJ
	UAe/NHTxn1ZkzqClHdwaGu54Ry8dMLtwAZoOM=
Received: by 10.90.80.18 with SMTP id d18mr9296222agb.31.1293057771555; Wed,
	22 Dec 2010 14:42:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 22 Dec 2010 14:42:31 -0800 (PST)
In-Reply-To: <4D126BCC.1020508@mentor.com>
References: <1293016481-703-1-git-send-email-koen@openembedded.org>
	<ietk2q$jdr$1@dough.gmane.org> <4D1259F7.9030905@mentor.com>
	<4D126BCC.1020508@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Dec 2010 14:42:31 -0800
Message-ID: <AANLkTik_GNNX5vMMsjZO7PTdf6od8ah-uHBfbe31sKnA@mail.gmail.com>
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
X-List-Received-Date: Wed, 22 Dec 2010 22:43:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2010 at 1:21 PM, Tom Rini <tom_rini@mentor.com> wrote:
> On 12/22/2010 01:05 PM, Tom Rini wrote:
>>
>> On 12/22/2010 12:38 PM, Koen Kooi wrote:
>>>
>>> -----BEGIN PGP SIGNED MESSAGE-----
>>> Hash: SHA1
>>>
>>> On 22-12-10 12:14, Koen Kooi wrote:
>>>>
>>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>>> ---
>>>> conf/sanity.conf | 2 +-
>>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> diff --git a/conf/sanity.conf b/conf/sanity.conf
>>>> index 0f53cb2..1c83c14 100644
>>>> --- a/conf/sanity.conf
>>>> +++ b/conf/sanity.conf
>>>> @@ -3,7 +3,7 @@
>>>> # See sanity.bbclass
>>>> #
>>>> # Expert users can confirm their sanity with "touch conf/sanity.conf"
>>>> -BB_MIN_VERSION =3D "1.8.18"
>>>> +BB_MIN_VERSION =3D "1.10.0"
>>>>
>>>> SANITY_ABIFILE =3D "${TMPDIR}/abi_version"
>>>> SANITY_PRFILE =3D "${TMPDIR}/distro_pr"
>>>
>>> If people are agreeing, can I get some Acked-by lines please?
>>
>> I agree with the concept but I want a patch that says 1.10.2 once Chris
>> releases that hopefully later today.
>
> To be clear, this is because 1.10.0 has some bugs that aren't all that ha=
rd
> to hit and 1.10.1 reports itself as 1.10.0. =C2=A0I strongly suspect we h=
ave
> users that stay on the trailing edge, would get 1.10.0 release and hit
> issues.

For 1.10.2

Acked-by: Khem Raj <raj.khem@gmail.com>


