Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Op0zv-0006h3-LN
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 17:37:44 +0200
Received: by iwn2 with SMTP id 2so2620284iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 08:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=EjnrjtPYDcHKW3f6OV1lIhlE0fGf8sIJo/RCN5qglH0=;
	b=CLzFpyAoQfmEIoB1i084SIL2Uao4qrYL9SomMPkqptapiL6/ESKiwHMrLuCSUyFis5
	wazYOYz8/rHM+WwMi58Q4yPNQi3USljUro6/NnRVGVzXJ0leLYuBCK0nvD2iOQrx1915
	UVKaD2pUWAip2d9j6GFla/BjrduxpDvbn4bvo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=NI3iMlUsd5IPxhQKvu6Hb3jkS67OgQvf3Z75ZmlNjwcauC9KxYoIFG3sYeskCxr1sp
	YIc2YOW9hFVBod2Ht0FAmMjglWdNvdy1UPXYHpttuTEoy4FrVjylgvVzB9JKuYPvk29f
	6GY5hTftA97fo0sSyy/E77ZDU/qgEuLExPI1w=
Received: by 10.231.184.71 with SMTP id cj7mr1249444ibb.159.1282923436149;
	Fri, 27 Aug 2010 08:37:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Fri, 27 Aug 2010 08:36:56 -0700 (PDT)
In-Reply-To: <AANLkTinOBdbZGQLChSYb1JtN5xU5QD5+dt0b=7KYTZZ1@mail.gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<AANLkTinOBdbZGQLChSYb1JtN5xU5QD5+dt0b=7KYTZZ1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Aug 2010 08:36:56 -0700
Message-ID: <AANLkTikUB6xwPoWwtofLcSRd5WWeoyW6gpCgF6X_MCGp@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Fri, 27 Aug 2010 15:37:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2010 at 2:40 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> Khem,
>
> Thanks for the good work.
> I've gone through the file and saw no problems.
> The move of the nonbuilding recipes due to missing dependencies (like
> with hildon) has been discussed on irc too).
> I have a few small remarks (see below), but nothing blocking an ack so,
> Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>
> Btw: next time please split things like this in two:

yes would have been better.

> one patch with the files that are moved and one patch with the files
> that are modified.
> That makes it easier to review the modified recipes.
>
>> diff --git a/recipes/angstrom/angstrom-bootmanager.bb b/recipes/angstrom=
/angstrom-bootmanager.bb
>> index 6cae115..e5f3478 100644
>> --- a/recipes/angstrom/angstrom-bootmanager.bb
>> +++ b/recipes/angstrom/angstrom-bootmanager.bb
>> @@ -1,7 +1,7 @@
>> =A0DESCRIPTION =3D "A graphical Boot Manager for the =C5ngstr=F6m Linux =
Distribution"
>> =A0AUTHOR =3D "Michael 'Mickey' Lauer <mickey@Vanille.de>"
>> =A0SECTION =3D "base"
>> -DEPENDS =3D "evas-fb ecore-fb esmart-fb imlib2-fb edje efl++-fb"
>> +#DEPENDS =3D "ecore esmart-fb imlib2-fb edje efl++-fb"
>> =A0#RDEPENDS_${PN} =3D "libefl++0"
>>
>> =A0ALLOW_EMPTY =3D "1"
>
> I'm not too keen on commenting out things. If it is not needed any
> more it should just go.

It could but I do not claim to know it well.
so I will leave that to someone else.

> Something like the lines above only cause confusion.
> suggest to remove the # lines or to add a short comment explaining why
> they are commented out but not removed.

I can add comments yes will do.

>
>
>> diff --git a/recipes/xqt2/xqt2_20060509.bb b/recipes/xqt2/xqt2_20060509.=
bb
>> index 7634d27..4492bc7 100644
>> --- a/recipes/xqt2/xqt2_20060509.bb
>> +++ b/recipes/xqt2/xqt2_20060509.bb
>> @@ -1,6 +1,6 @@
>> =A0DESCRIPTION =3D "Xqt2 is an X-Server than runs within the Opie enviro=
nment"
>> =A0HOMEPAGE =3D "http://xqt.sourceforge.jp"
>> -DEPENDS =3D "freetype libxi xmu flex-native virtual/libqte2 libqpe-opie=
"
>> +DEPENDS =3D "freetype libxi libxmu flex-native virtual/libqte2 libqpe-o=
pie"
>> =A0LICENSE =3D "GPL"
>> =A0SECTION =3D "opie/applications"
>> =A0APPTYPE =3D "binary"
>> --
>> 1.7.1
>
> With recipes like this I always wonder if we should keep them.
> Apparently they are not build, otherwise the faulty DEPENDS would have
> been detected earlier.

very true. But that is another step.

> And the fact that it is a recipe from 2006 also indicates it is
> probably not important.
> Can an opie maintainer say whether it is useful to keep this?
>
> Thanks for the good work!

thx for looking into it.
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


