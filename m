Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1OP9P3-0001hN-6e
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 09:20:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id C26E740008230
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 09:16:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id B9FF3400057E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 09:16:11 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FqdZT0gpxfm
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 09:16:11 +0200 (CEST)
Received: from [192.168.4.51] (entw2.tarent.buero [192.168.4.51])
	by ugs.tarent.de (Postfix) with ESMTPSA id 7F97040008230
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 09:16:11 +0200 (CEST)
Message-ID: <4C19CC08.9040606@gmx.net>
Date: Thu, 17 Jun 2010 09:17:28 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C187CF6.5010401@gmx.net>	<20100616090200.5c23b895@xora-desktop.xora.org.uk>	<AANLkTilul0-HFnIkW2eJ7lTzZ7EMzq6qBzLYZhUVxyhZ@mail.gmail.com>	<20100616175640.4d7795ff@xora-desktop.xora.org.uk>	<AANLkTimFM0nCDuT-eMOJRvolhw06Q6uoHwmbnebIIFjL@mail.gmail.com>
	<4C19CA2D.4@gmx.net>
In-Reply-To: <4C19CA2D.4@gmx.net>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: thebohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_FAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] add ubuntu patch which adds atomic builtin support to gcc 4.3.[3 but also other microversions]
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
X-List-Received-Date: Thu, 17 Jun 2010 07:20:51 -0000
X-Groupsio-MsgNum: 20225
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigB878D3A69B1434F10F412BBB"

--------------enigB878D3A69B1434F10F412BBB
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
just a few more words about the patches:

- Ubuntu ARM used it for a long time, so its tested for a while
- for x86/amd64 atomic operations intrinsics are available for a looong
time, so all packages built for these arches where already under the
effect of 'GCC atomic builtins are available'.

Regards,
Robert

Am 17.06.2010 09:09, schrieb Robert Schuster:
> Hi,
> first of all. As Stefan pointed out the change was needed while working=

> for Buglabs on OpenJDK support. So it was decided that the introduction=

> of the mentioned GCC change is handled by Stefan Schmidt now.
>
> But I would like to elaborate on the side-effects of the patch.
>
> Am 16.06.2010 19:12, schrieb Khem Raj:
>  =20
>> Those applications are working fine and they will keep working fine as=

>> long as you dont recompile them
>> and you make sure that libgcc is updated then whenever you rebuild an
>> application that uses the atomic
>> builtins will start using them until then it should work without using=
 them.
>>  =20
>>    =20
> Yes, already built and shipped applications are not affected at all.
> It is only that when certain packages are built again with the new GCC,=

> the package's binary
> will be different although PR (and PV) did not change. The reason is
> that most configure scripts check
> for the availability of the GCC intrinsics. If they are found they make=

> use of it, if not they either use a different implementation
> (libatomic-ops for example)
> or bring their own (software running on ARM Linux 2.6 can assume that
> the neccessary kernel helpers exist and make use of them[0]) or silentl=
y
> disable
> multithread support (that is the case for llvm 2.7).
>
> And already compiled software will also not magically pick up the
> implementation found in libgcc because:
> 1) it was not there before
> 2) I am under the impression that at least some of the builtins are
> actually macros and thus bits of machinecode are copied into each binar=
y
> using them.
>
> However as said. Stefan is now dealing with the issue. He has gotten tw=
o
> patches (one from Ubuntu, another one from the GCC 4.4 stable branch)
> that we needed to get things going and is most likely checking the
> effects they have.
>
> Regards,
> Robert
>
> [0] - code like this can be found in many projects; search for
> __kernel_dmb and __kernel_cmpxchg:
> http://code.google.com/p/nativeclient/source/browse/trunk/src/native_cl=
ient/src/include/linux/arm/atomic_ops.h?r=3D857
>  =20
>> Maybe I am missing something it would be helpful if Robert could
>> explain potential scenarios
>> where it would break precompiled binaries. I don't see it.
>>
>>  =20
>>    =20
>>> Graeme
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>>
>>>    =20
>>>      =20
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=

>>  =20
>>    =20
>
>  =20
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  =20


--------------enigB878D3A69B1434F10F412BBB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAkwZzAgACgkQG9cfwmwwEto7GQCgg8mbqAPVdM1OFBZJhtss5tzl
whgAmwVjo4cQ2rdJlKWj6vwHAAuwjETl
=ZXa5
-----END PGP SIGNATURE-----

--------------enigB878D3A69B1434F10F412BBB--
