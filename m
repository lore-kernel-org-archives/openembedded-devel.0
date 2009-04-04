Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Lq0qx-0005bP-JC
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 10:04:19 +0200
Received: by bwz19 with SMTP id 19so1222529bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2009 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Z7UlieG8dWYTcgxacJhGRmUiarNLmswE2zevdJG80DQ=;
	b=p3cflsx0bRlmS2M/MlhZlxohmqy4nk3CtmKJpJGiU1nFeWp4x7Gupu957sA4pE5UVr
	Xhq9iZtJ6p5kb0Ylg2XfMNp2TRmdufPgNkYC3hPSfDJDy11A1TOoBF0z4XaER+KMPhnZ
	Ib0b6CFKZfN+97O9Mb7HWRN4gCAhcE/baNK30=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=U80vFetiYAyZ6SXBrGP6q2AT3VoRoBOwX+uK9Do2CgzRGa1tCm571H4aEk3fYJTxR8
	8y00rDFEEOTHj8W3WEUaZabjEdqMczQi6PsQ/lzG+o4iGPrAJTZbsqm/ErorVnvo48s8
	c0PHQPF/KF0asd0ou2OHBzz8qLBoBre0U/TMw=
MIME-Version: 1.0
Received: by 10.223.122.15 with SMTP id j15mr1767934far.74.1238832069240; Sat, 
	04 Apr 2009 01:01:09 -0700 (PDT)
In-Reply-To: <069B6B31F6201B4389D7EEB9AD827BCA0500604A@otis.burlington.evertz.tv>
References: <ac9c93b10904030956g2e8a1663g7877947b1a17775c@mail.gmail.com>
	<069B6B31F6201B4389D7EEB9AD827BCA0500604A@otis.burlington.evertz.tv>
Date: Sat, 4 Apr 2009 10:01:09 +0200
Message-ID: <ac9c93b10904040101p434f67acrd9cc05602b57ec91@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, mickey@vanille-media.de
X-SA-Exim-Connect-IP: 209.85.218.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] Where is the python-zopeinterface recipe?
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
X-List-Received-Date: Sat, 04 Apr 2009 08:04:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I think what happened is that when zopeinterface was split off the
zope recipe, the name got changed. Not sure if that was intentional.

Mickey, as I am not a python wiz: should baking zopeinterface result
in a python-zopeinterface package or should we change the name in the
packages that require zopeinterface (like twisted) ?

FM

2009/4/3 Rodney Lott <rlott@evertz.com>:
> Yeah, that's where the zope-interfaces recipe is. =A0I am looking for the=
 python-zopeinterface.
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org]On Behalf Of
> Frans Meulenbroeks
> Sent: Friday, April 03, 2009 12:56 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [STABLE] Where is the python-zopeinterface recipe?
>
>
> $ cd recipes; find | grep zope
> /zope/zope-interfaces_3.3.0.bb
> ...
>
> It used to be part of the zope recipe.
>
> 2009/4/3 Rodney Lott <rlott@evertz.com>:
>> Hello.
>>
>> I am currently using the origins/stable/2009 branch and was trying to ad=
d the python-twisted recipe to my image and I got the following dependency =
issues:
>>
>> OE Build Configuration:
>> BB_VERSION =A0 =A0 =A0 =A0=3D "1.8.13"
>> METADATA_BRANCH =A0 =3D "stable/2009"
>> METADATA_REVISION =3D "e93bd21c7a03b0e78a3097a8f924308841970429"
>> TARGET_ARCH =A0 =A0 =A0 =3D "i486"
>> TARGET_OS =A0 =A0 =A0 =A0 =3D "linux"
>> MACHINE =A0 =A0 =A0 =A0 =A0 =3D "x86"
>> DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D "minimal"
>> DISTRO_VERSION =A0 =A0=3D ".dev-snapshot-20090403"
>>
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: '['/home/rlott/openembedded.git/recipes/python/python-twisted_8.2=
.0.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'pyt=
hon-zopeinterface' but it wasn't found in any PACKAGE or RPROVIDES variable=
s
>> NOTE: Runtime target 'python-zopeinterface' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['python-zopeinterface']
>> NOTE: Runtime target 'python-twisted' is unbuildable, removing...
>> Missing or unbuildable dependency chain was: ['python-twisted', 'python-=
zopeinterface']
>> ERROR: Required build target 'cp2210e-image' has no buildable providers.
>> Missing or unbuildable dependency chain was: ['cp2210e-image', 'python-t=
wisted', 'python-zopeinterface']
>>
>> In the python-twisted_8.2.0.bb recipe, it references the python-zopeinte=
rface recipe as a dependency. =A0I couldn't find such a recipe in the recip=
es/python subdirectory of the git branch. =A0So, is this recipe merely a bo=
okmark or is it going to be available, pending approval?
>>
>> Regards.
>>
>> Rodney
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
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


