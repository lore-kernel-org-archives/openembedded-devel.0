Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3vGO-0007Dc-1G
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 20:32:21 +0200
Received: by ywl5 with SMTP id 5so65657ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bYoR73flFHrJrA1Xyc4MmJVL6yv97AaXL9fxJ0jHfpU=;
	b=LConMnmcVWwm1Hx3Bdzz657zhx2hAKj2eKnh9J2QkKqWJ159jaKfaxVKgf81R6nC7+
	CywbMTtplkcH/8Pj9An2ojA11JlmjD5waziTugzMpK6NfupQjLYGMPIP21MONfy9q1Bx
	gkFkNo3OOK2PgpVS9Zi/3lcZzLdS1LI6Y7yow=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=w4K0fQ/1z9bkbS3ogaR7w4R+9bcMJ5l/iqYklv/wdOR7z8dXSsfWnJnoFG7jHjRGhT
	h256bJKypWvxyG59b1xtQuQxSgJm1mmX4DnlxVrLmaZDxWRyPW0L62df12KNuedIrYyY
	uNshidh/4LEMAM6aam7ZcvkFsMWu0AOkg9/GA=
Received: by 10.231.170.21 with SMTP id b21mr1257519ibz.122.1286476317206;
	Thu, 07 Oct 2010 11:31:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Thu, 7 Oct 2010 11:31:34 -0700 (PDT)
In-Reply-To: <i8jufe$299$1@dough.gmane.org>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
	<i8jufe$299$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Oct 2010 11:31:34 -0700
Message-ID: <AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Thu, 07 Oct 2010 18:32:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2010 at 12:56 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 07-10-10 03:46, Khem Raj wrote:
>> Hi
>>
>> Following set of patches is v2 of the patches adding support for getting=
 libtool 2.4 into
>> openemebedded. I have so far built minimal-image for two machines succes=
sfully using old
>> and new libtool.
>>
>> The libtool sysroot feature knob is added through LIBTOOL_HAS_SYSROOT va=
riable. If this is
>> set to "yes" then you ought to use libtool > 2.4 by default its set to "=
no" which means
>> the current behavior remains.
>>
>> The big change that libtool 2.4 brings is sysroot support and I have add=
ed
>> support to use this feature. It should make our life easier.
>>
>> This needs a lot of testing.
>>
>> Please cherry pick the patch bundle and give it a try in yout environmen=
t
>
> Can you apply these to a branch so we can add fixes there if needed?

I can do that. However now that backward compatibility is left intact I thi=
nk
it would not be that bad to merge it into master and fix things on
master. the libtool
2.4 would have DEFAULT_PREFERENCE =3D "-1" by default it wont be picked by =
anyone.
with the number of developers we have it will get better testing before we
accumulate too many changes on a branch. Secondly there might be changes li=
ke
gnutls one where the patch is only valid for new libtool and should be test=
ed
in old and new way. If there is any breakage introduced in existing build w=
ill
be caught quickly. Where as on branch resources might be divided and it may
not progress so well. I am just weighing efforts Vs. risk here and
risk seems low

Thanks
-Khem

>
>>
>> Some distros pin libtool version to 2.2.6b
>>
>> include/preferred-slugos-versions.inc
>> include/angstrom-2008-preferred-versions.inc
>> include/kaeilos-2009-preferred-versions.inc
>> include/angstrom-2010-preferred-versions.inc
>> include/preferred-shr-versions.inc
>>
>> So if you are using one of these distro's then you might have
>> to override the version in your local.conf
>>
>> LIBTOOL_HAS_SYSROOT =3D "yes"
>> LIBTOOL_VER =3D "2.4"
>> PREFERRED_VERSION_libtool =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "${LIBT=
OOL_VER}"
>> PREFERRED_VERSION_libtool-native =C2=A0 =C2=A0=3D "${LIBTOOL_VER}"
>> PREFERRED_VERSION_libtool-cross =C2=A0 =C2=A0 =3D "${LIBTOOL_VER}"
>> PREFERRED_VERSION_libtool-nativesdk =3D "${LIBTOOL_VER}"
>> PREFERRED_VERSION_libtool-sdk =C2=A0 =C2=A0 =C2=A0 =3D "${LIBTOOL_VER}"
>>
>> Please review, test, and provide feedback
>>
>> Thanks
>>
>> -Khem
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMrX0uMkyGM64RGpERAjNfAJ0eRV99dBkIAeDKsE/4GA9DTZcvXwCfZitH
> pXRfV3B7U2f48NSxGcDq/wE=3D
> =3DlbRD
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


