Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ow7tG-000408-8w
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 08:24:24 +0200
Received: by iwn2 with SMTP id 2so791229iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Sep 2010 23:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RHONEh5i9wAJdQzygokaeFy74LAmpMZatgYRHrwUAjw=;
	b=ncEU5MLAmUkbxoFZjNlPrDGQiYROah6+peinz87mcLeF25vGuo7aC+1NyKWYNN+7yE
	6j8/gnb/W0I3OuNtaWgU6SkcfZKXXbHF9yCfos0f/3S7Kv+AbIgBeWGbq1uah4UcUC/Z
	qouczvlPd19CS8UYbPEFOzm1xdJ49XSzbCC4E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=EgS7olun3YMn9ff12mQAgBcjEe7MIzr1bOOmmer5wQPHvNUqp2w8SJH5VKXt/fqDTq
	+CwfZCpQCIf677CDu/h5OGfSsYjsJybRqMTLLAm6paujQ2Pu69xAPq3JKEjjOm9dWwmD
	lC6dQXOslxgMyyzU5RmK/6ar/H6smEV/FdEaE=
MIME-Version: 1.0
Received: by 10.231.184.156 with SMTP id ck28mr2549527ibb.168.1284618205848;
	Wed, 15 Sep 2010 23:23:25 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Wed, 15 Sep 2010 23:23:25 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1009160726030.29127@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinWDmigJDsU-vJqwujb9hXu7p7j4QpY=nYQq3rh@mail.gmail.com>
	<alpine.LNX.2.00.1009160658000.29127@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1009160726030.29127@asterix.crazy-teaparty.dyndns.org>
Date: Thu, 16 Sep 2010 08:23:25 +0200
Message-ID: <AANLkTimdGptzPQi9+84HcP6Gm3theF1HCy6nJ6vPWJAC@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Howto create a bitbake recipe
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
X-List-Received-Date: Thu, 16 Sep 2010 06:24:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/16 Vitus Jensen <vjensen@gmx.de>:
> On Thu, 16 Sep 2010, Vitus Jensen wrote:
>
>> On Wed, 15 Sep 2010, AJ ONeal wrote:
>>
>>> =A0I don't know very much about this - only what I've seen discussed on=
 the
>>> =A0mailing list.
>>
>> And you probably searched recipes/ before writing your own? =A0This is m=
y
>> main source of informationen.
>>
>>> =A0I've created a template and given my just-submitted recipe as an
>>> example.
>>>
>>> =A0If you know bitbake and OE policies, please share the wealth:
>>>
>>> =A0http://wiki.openembedded.net/index.php/How_to_create_a_bitbake_recip=
e_for_dummies
>>
>> I don't think you should not use method overrides in the example (the wi=
ki
>> list those overrides as things to avoid), just use the simpliest form of=
 a
>> recipe there and refer to the OE usermanual from that page for additiona=
l
>> features, that URL:
>> http://docs.openembedded.org/usermanual/usermanual.html#chapter_recipes
>>
>> =3D=3D=3D=3D=3D
>> DESCRIPTION =3D ""
>> HOMEPAGE =3D ""
>> LICENSE =3D ""
>> DEPENDS =3D ""
>> PR =3D "r0" =A0# Package Revision, update this whenever you change the r=
ecipe.
>>
>> SRC_URI =3D " http://server/${PN}-${PV}.tar.bz2 \
>> =A0 =A0 =A0 =A0 file://fix-crosscompile.patch \
>> =A0 =A0 =A0 =A0 "
>> SRC_URI[md5sum] =3D ""
>> SRC_URI[sha256sum] =3D ""
>> =3D=3D=3D=3D=3D
>>
>> More isn't needed (some may argue about PR) and writing more may actuall=
y
>> harm.
>
> Sorry, there was an important line missing:
>
> inherit cmake
> -or-
> inherit autotools
> -or-
> inherit your-build-system
>

or provide your own do_compile, do_install if it is not
cmake/autotools/qmake/whatever

FM


