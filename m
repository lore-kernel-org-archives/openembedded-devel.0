Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ore5s-0002kz-DA
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 23:46:46 +0200
Received: by iwn2 with SMTP id 2so1852149iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Sep 2010 14:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=JTVVGVox2LruCQ0XQ93B4ccznksrcgxtIjRd4NdA9X4=;
	b=MXGIfqlcL3KfKEaT16ZEYx7D6dNQ0CiiaVkfrlPum7CTnUPWJ/5vnmRovBGv9/tW2a
	br/zXLGIYD9Y9yVdhWW/FvrZc6s1StH5UAxKsJL4oZ3WJMESohhr5yPiRPzvlVNOhJ29
	OmlCrANNhRP/XKz/Ze0EMSnampFOJoLTT9qAw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=oeHGlmgHzSnEOSMXNzlbeISgw6RBn5ZJVX6kqkSwkF2IkEtOlQD1/Aw3SK3wnjq0Sf
	xC0ZWOuFkKkH2tiQ77szXciluNmCaVuSJhm/arXIKkTLDdc6Bfj8oBeMrPD5/+wORMtE
	9LTIb4KkPA4gH4ehXAfZtw8ocfszON8jEmN3Y=
Received: by 10.231.14.5 with SMTP id e5mr1483813iba.175.1283550369118; Fri,
	03 Sep 2010 14:46:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 3 Sep 2010 14:45:49 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310BFA35B@dlee06.ent.ti.com>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<AANLkTin7HBBUQk0STC=zAPgbceC+dfLFB=3eaYORr7Ws@mail.gmail.com>
	<20100903164708.GI17702@game.jcrosoft.org>
	<20100903165917.GJ17702@game.jcrosoft.org>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFA35B@dlee06.ent.ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Sep 2010 14:45:49 -0700
Message-ID: <AANLkTinuGYwMaa_3Ue0ytjrqs3zaeWckc1q1D_Lm=KkZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to extend SRC_URI_append?
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
X-List-Received-Date: Fri, 03 Sep 2010 21:46:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 3, 2010 at 1:34 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Jean-Christophe PLAGNIOL-VILLARD
>> Sent: Friday, September 03, 2010 11:59 AM
>> To: openembedded-devel@lists.openembedded.org
>> Subject: Re: [oe] How to extend SRC_URI_append?
>>
>> On 18:47 Fri 03 Sep =A0 =A0 , Jean-Christophe PLAGNIOL-VILLARD wrote:
>> > On 07:44 Fri 03 Sep =A0 =A0 , Chris Larson wrote:
>> > > The append syntax you're referring to uses OVERRIDES. =A0FOO_someval=
ue
>> > > replaces FOO if somevalue is in OVERRIDES. =A0FOO_append_somevalue i=
s
>> added to
>> > > FOO if somevalue is in OVERRIDES. =A0I don't think SOC_FAMILY is in
>> overrides
>> > > at this time.
>> > how can I extend it?
>> is this ok?
>>
>> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
>> index 677c76a..ecdf245 100644
>> --- a/conf/bitbake.conf
>> +++ b/conf/bitbake.conf
>> @@ -677,9 +677,9 @@ BUILDCFG_NEEDEDVARS ?=3D "TARGET_ARCH TARGET_OS"
>> =A0#
>> =A0# This works for =A0functions as well, they are really just environme=
nt
>> variables.
>> =A0# Default OVERRIDES to make compilation fail fast in case of build sy=
stem
>> misconfiguration.
>> -OVERRIDES =3D
>> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-
>> ${BUILD_OS}:fail-fast:pn-${PN}"
>> +OVERRIDES =3D
>> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:${SOC_FAMILY}:${=
TA
>> RGET_ARCH}_${SOC_FAMILY}:build-${BUILD_OS}:fail-fast:pn-${PN}"
>> =A0# Alternative OVERRIDES definition without "fail fast", usually only =
for
>> native building and Scratchbox toolchains.
>> -#OVERRIDES =3D
>> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:build-
>> ${BUILD_OS}:pn-${PN}"
>> +#OVERRIDES =3D
>> "local:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:${SOC_FAMILY}:${=
TA
>> RGET_ARCH}_${SOC_FAMILY}:build-${BUILD_OS}:pn-${PN}"
>>
>> =A0##################################################################
>> =A0# Include the rest of the config files.
>>
>> Best Regards,
>> J.
>
> Is there really a case for a ${TARGET_ARCH}_${SOC_FAMILY} override. =A0If=
 these devices have different architectures are they really part of the sam=
e family?
>
> As for adding this to bitbake.conf I guess I wouldn't object, but I don't=
 know that this is something everyone would want. =A0Instead you could put =
this in your distro's conf file (like angstrom does) or in your local.conf =
file.
>
> The distro/include/angstrom.inc file sets:
>
> OVERRIDES .=3D ":${FEED_ARCH}:${SOC_FAMILY}"

second option is better.

>
> I use SOC_FAMILY overrides in my work.
>
> Just my two cents
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


