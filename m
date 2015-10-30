Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 36E0275894
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 11:46:39 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so8961202wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 04:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=1mbdmQwFXXreiWnGEz2MHudItqiI8nUnaZZZfZMxHCA=;
	b=UsG1cApACYh5jW1WLP708uNyDI+O15IPS+KZOVoTTRZ6y3jY1ABlCseiKqSoOo2tJS
	AO9UWewCoSKR0qA2ftA25UuXyo9MFF9EkPjJ7T824tqqRLWBLDfztMAUfOH3+HQ0KyBg
	YMJHybgT/VIKw9CAlU3Je3T9x5eD8MFLHRGyFn/GPRoXqheFN0e1uHIuYJHP/257oeSo
	vY15G4Zn7dxAt8QIXbIk69o9QMapHYlJsqvXCWme/UhrjYZSLn1ppqblhemuhU12lls7
	JCtdl1pJtugF/47ud2uNu6tqslaV4jKzXmq7SsyK3gRlDnhN9XUJdotn2Jy4Ywgtx9R5
	bu3w==
X-Received: by 10.194.243.3 with SMTP id wu3mr9384197wjc.85.1446205599452;
	Fri, 30 Oct 2015 04:46:39 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12])
	by smtp.gmail.com with ESMTPSA id ql7sm817805wjc.37.2015.10.30.04.46.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Oct 2015 04:46:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <17C19527BD855F428F22685986FD58BEA16318@IRSMSX103.ger.corp.intel.com>
Date: Fri, 30 Oct 2015 12:46:37 +0100
Message-Id: <25A9A07D-261D-4E51-98CB-EB3307D7D9A2@gmail.com>
References: <4BA9AF94-31D9-4B1D-99DD-5D1DE20533EA@gmail.com>
	<17C19527BD855F428F22685986FD58BEA16318@IRSMSX103.ger.corp.intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Oct 2015 11:46:41 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


> Am 30.10.2015 um 10:09 schrieb Kaaria, Erkka <erkka.kaaria@intel.com>:
>=20
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
>> Behalf Of Jens Rehsack
>> Sent: Tuesday, October 27, 2015 10:32 PM
>> To: OE-devel <openembedded-devel@lists.openembedded.org>
>> Subject: [oe] [meta-java][PATCH 4/4] openjdk-8: add recipes for =
openjdk-8
>> and openjre-8
>>=20
>>=20
>> This adds openjdk-8 for native and target builds and allows a =
stripped
>> openjre-8 being built as well instead of trying to cherry-pick jre
>> components from jdk-image.
>>=20
>> The recipes allow building openjdk-8 with or without:
>> * x11
>> * cups
>> * alsa/pulseaudio
>> and let packager enable unlimited-crypto, if desired.
>>=20
>> Since there can be only one PROVIDES for virtual/java-native and
>> virtual/javac-native,
>> move the provides to openjdk-8-native (I think everyone agrees it's a =
better
>> choice than ecj-bootstrap-native).
>>=20
>> Plus: Applying a fix from openjdk-9 repository which fixes build =
issues using
>> gcc5
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> <snip>
>> Jens Rehsack - rehsack@gmail.com
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> Hi,
>=20
> I tried applying this patch, but openjdk-8 do_fetch task failed due to =
multiple incorrect checksums (corba, jaxp, jaxws, openjdk).

Weird. Can this happen when a tag is rewritten?
I have several company-intern customers who didn't report that - even =
the last of them build last Monday (2015-10-26) for the first time.

> After fixing the checksums manually, openjdk8-fix-shark-build.patch =
failed due to hotspot/make/Makefile portion not applying.

Maybe I should update to a recent tag and fix those issues...

> Also, the openjdk-8-cross.inc currently uses openjdk-8-native as the =
boostrap jdk for the openjkd/openjre-8. The build readme =
(http://hg.openjdk.java.net/jdk8/jdk8/raw-file/tip/README-builds.html) =
however suggests  that you should use the previous jdk version as the =
boostrap jdk and that using openjdk 8 to boostrap openjdk 8 may =
introduce unwanted dependencies. Perhaps using icedtea7-native would be =
better here?

openjdk-8-native uses icedtea7-native to bootstrap, openjdk-8 and =
openjre-8 use openjdk-8-native to bootstrap.
Can you explain which unwanted dependency openjdk-8-native might =
introduce you don't even have by using icedtea7-native?

Cheers
--=20
Jens Rehsack - rehsack@gmail.com


