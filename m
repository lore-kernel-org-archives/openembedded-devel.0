Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P43cR-0000b1-Dq
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 05:27:42 +0200
Received: by iwn5 with SMTP id 5so174175iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 20:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=YfqbmmEf9dKOX1WrkRCFIB3uxybN0C0UW5C0j+QbfnU=;
	b=U04+QHKvnNFBTtnPFh1J/K+sSeQtRE+oaX/mL5rrmJqEeNIktiyHOPfriFI9at2ktP
	TIxkQdHDxQi9nvolmhHFtt5UNNWI87j4+w261NrhaFWwluhOVKvxCBoQIKIZuuJbMrzf
	Faq79XrNSyhMW5L940EU0ltWYUE0QDQwTSmCI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Il8WpeoGDZGvoFQ/54VPEPu1TkLHr88DEATGXJYbN4qPGC3r3wwt9Xp5/27pt73AtQ
	KzWZF66ByzLIR1sYqJGPxLYyynRJySxZbRTJbjAkrz/Mgsyv9lo1iZAwyTM1zw2rU9Xx
	CeKSiizrrrN2LjYvKaS1OQOiyoDcraCvJj0YM=
Received: by 10.42.148.3 with SMTP id p3mr92467icv.357.1286508438321; Thu, 07
	Oct 2010 20:27:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Thu, 7 Oct 2010 20:26:58 -0700 (PDT)
In-Reply-To: <4CAE4F92.5080107@mlbassoc.com>
References: <3ADCCD33-6EA5-43FA-84EE-31D6B7C5A005@mac.com>
	<4CAE4F92.5080107@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Oct 2010 20:26:58 -0700
Message-ID: <AANLkTinDviTOfaSFktW0iKJPrjsT3QSHWiYLaw4WrX5K@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: How to modify /etc/network/interfaces file in a OE recipe
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
X-List-Received-Date: Fri, 08 Oct 2010 03:27:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2010 at 3:54 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 10/07/2010 03:11 PM, Elvis Dowson wrote:
>>
>> Hi,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Would someone be able to help me with modifyi=
ng an
>> omap3-console-image recipe, such that in the final image, the
>> /etc/network/interfaces file gets edited as follows
>>
>> #auto eth0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<- remove # sign ( auto eth0 )
>> #iface eth0 inet dhcp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <- remove # sig=
n ( iface eth0 inet dhcp )
>> #iface eth1 inet dhcp
>>
>> I am using a Gumstix Overo + Chestnut43 expansion board, which has an
>> inbuilt wired ethernet interface. I have to make this modification manua=
lly,
>> to enable this interface each time. However, if I can modify the OE reci=
pe
>> somehow to do this it would be great. I know it can be done, but I don't
>> know where to start and which file to modify.
>
> Add the file the way you like it to
> .../openembedded/recipes/netbase/netbase/overo
> and rebuild netbase. =C2=A0Use the beagleboard as an example.

or use bblayers and bbappend.

>
> --
> ------------------------------------------------------------
> Gary Thomas =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0Consulting for the
> MLB Associates =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


