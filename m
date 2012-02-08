Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rux1R-0002p9-2t
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 03:12:37 +0100
Received: by lahc1 with SMTP id c1so69919lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 18:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=YsuqTWWpZmk4kueH1wuzAgiw7ltHuU1ULcwzXKpQMR8=;
	b=DEuLjNvPXFlxaOkwp3vRX4Spd/w/rL2NIAnC4U+uKpd05YTsUXV54Se3JKuDPSAAom
	YLcmAvkILXbetUqSn+nLWCtdg5PnIU9WptqaMeehi9P4H5EIwsR/OHYmYEwAqy956+uO
	KThiApdVlrWT1nXO0jBU6j04ypUyH56HjNq00=
Received: by 10.112.86.67 with SMTP id n3mr7115030lbz.29.1328666674256; Tue,
	07 Feb 2012 18:04:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 18:04:04 -0800 (PST)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C01336BE7@ORSMSX106.amr.corp.intel.com>
References: <4F2C6842.1040907@promwad.com>
	<20120204022129.GC26306@sakrah.homelinux.org>
	<4F2D77AE.7060505@promwad.com>
	<CAMKF1sqC2h+akQ63gXZLj6gv1pFot258iy-iW_Au2U6UdqevGw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0133412E@ORSMSX106.amr.corp.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C01336BE7@ORSMSX106.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 18:04:04 -0800
Message-ID: <CAMKF1spHuj98D3nAUy1wWjanrs_swFaTjhFMh7FqRsUdFDNvhA@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Java: meta-java, meta-oracle-java
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
X-List-Received-Date: Wed, 08 Feb 2012 02:12:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 7, 2012 at 3:51 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
> Ivan,
> =C2=A0So is adding "virtual/java" in provider is enough to get the two ve=
rsions of java recipes to work interchangeably ?

look at meta-java

virtual/java-native
virtual/javac-native
virtual/javac

and work with Henning (woglinge) to sort out any other layer APIs you need =
these
layers to live amicably

>
> Nitin
>
>
>> -----Original Message-----
>> From: Kamble, Nitin A
>> Sent: Monday, February 06, 2012 10:00 AM
>> To: Khem Raj; openembedded-devel@lists.openembedded.org
>> Subject: RE: [oe] Java: meta-java, meta-oracle-java
>>
>> > On Sat, Feb 4, 2012 at 10:23 AM, Ivan Kuten <ivan.kuten@promwad.com>
>> > wrote:
>> > > I meant isn't it going to be something like that in local.conf :
>> > > PREFERRED_PROVIDER_virtual/java =3D "oracle-jre"
>> > > PREFERRED_PROVIDER_virtual/java =3D "openjdk"
>> > > in a single meta-java layer...
>> >
>> > I think that would be sensible meta-java e.g. do provide
>> > virtuals I hope oracle java layer does something same.
>> > >
>> > > Regards,
>> > > Ivan
>> > >
>> > > On 02/04/2012 05:21 AM, Khem Raj wrote:
>> > >> On (04/02/12 02:05), Ivan Kuten wrote:
>> > >>> Hello,
>> > >>>
>> > >>> I noticed an activity around meta-java layer (OpenJDK based)
>> > >>> https://github.com/woglinde/meta-java
>> > >>> and recently around Oracle JRE:
>> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-oracle-java/
>> > >>>
>> > >>> Any plans to combine or coordinate these efforts?
>> > >> these are two different layers so they will exist. What
>> coordination
>> > >> would you like to see that will help you
>>
>> I agree, adding virtual/java in provides is a good thing for end user,
>> and I will do it in the oracle-java recipes.
>> And because of license differences it is better to keep these 2
>> variations of java recipes in different layers.
>>
>> Nitin


