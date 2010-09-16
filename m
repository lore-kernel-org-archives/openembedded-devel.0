Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OwCWg-0002nF-LI
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Sep 2010 13:21:16 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 19C4661C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 07:20:21 -0400 (EDT)
Received: from frontend1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 16 Sep 2010 07:20:21 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type:content-transfer-encoding;
	s=smtpout; bh=xB9QU7+906XNoiF6EYGzHybbS+0=;
	b=oniJs96cHYAPJTM48Qy6mbdsXfe1HkojyVtKnlwC9i0nSoJ+3ffQaATiUeJpXIBi47FRMXoQhst7bUkq5xvTlC9DSfbdA+1lD26XbvBaIooPZ/u+KjjDIc4bOJz2H7JZGvCbv/X64aiV7gRniZ3CJTPOnmhqw6cZj0WYO5yTsSI=
X-Sasl-enc: JGtmtxSABnlbQjQA6OSVHxO2VUBsgO7o6pizOGXM+Uq5 1284636020
Received: from [192.168.1.34] (hnvr-4d07871e.pool.mediaWays.net [77.7.135.30])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 6B86A404E8D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 07:20:20 -0400 (EDT)
Date: Thu, 16 Sep 2010 13:22:01 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimdGptzPQi9+84HcP6Gm3theF1HCy6nJ6vPWJAC@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1009161312350.29127@asterix.crazy-teaparty.dyndns.org>
References: <AANLkTinWDmigJDsU-vJqwujb9hXu7p7j4QpY=nYQq3rh@mail.gmail.com>
	<alpine.LNX.2.00.1009160658000.29127@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1009160726030.29127@asterix.crazy-teaparty.dyndns.org>
	<AANLkTimdGptzPQi9+84HcP6Gm3theF1HCy6nJ6vPWJAC@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.26
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
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
X-List-Received-Date: Thu, 16 Sep 2010 11:21:17 -0000
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Sep 2010, Frans Meulenbroeks wrote:

> 2010/9/16 Vitus Jensen <vjensen@gmx.de>:
>> On Thu, 16 Sep 2010, Vitus Jensen wrote:
>>> On Wed, 15 Sep 2010, AJ ONeal wrote:
>>>
>>>> =C2=A0I don't know very much about this - only what I've seen discus=
sed on the
>>>> =C2=A0mailing list.
>>>
>>> And you probably searched recipes/ before writing your own? =C2=A0Thi=
s is my
>>> main source of informationen.
>>>
>>>> =C2=A0I've created a template and given my just-submitted recipe as =
an
>>>> example.
>>>>
>>>> =C2=A0If you know bitbake and OE policies, please share the wealth:
>>>>
>>>> =C2=A0http://wiki.openembedded.net/index.php/How_to_create_a_bitbake=
_recipe_for_dummies
>>>
>>> I don't think you should not use method overrides in the example (the=
 wiki
>>> list those overrides as things to avoid), just use the simpliest form=
 of a
>>> recipe there and refer to the OE usermanual from that page for additi=
onal
>>> features, that URL:
>>> http://docs.openembedded.org/usermanual/usermanual.html#chapter_recip=
es
>>>
>>> =3D=3D=3D=3D=3D
>>> DESCRIPTION =3D ""
>>> HOMEPAGE =3D ""
>>> LICENSE =3D ""
>>> DEPENDS =3D ""
>>> PR =3D "r0" =C2=A0# Package Revision, update this whenever you change=
 the recipe.
>>>
>>> SRC_URI =3D " http://server/${PN}-${PV}.tar.bz2 \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-crosscompile.patch \
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>> SRC_URI[md5sum] =3D ""
>>> SRC_URI[sha256sum] =3D ""
>>> =3D=3D=3D=3D=3D
>>>
>>> More isn't needed (some may argue about PR) and writing more may actu=
ally
>>> harm.
>>
>> Sorry, there was an important line missing:
>>
>> inherit cmake
>> -or-
>> inherit autotools
>> -or-
>> inherit your-build-system
>>
>
> or provide your own do_compile, do_install if it is not
> cmake/autotools/qmake/whatever

OK, you are right.  I missed the fact that this was an example for totall=
y=20
self-contained recipe (it's like the gumstix example).  However this isn'=
t=20
the usual case and 'for dummies' should IMHO document the most common cas=
e=20
in a way it would be acceptable to this list.

Given the amount of variations found in the repository I would refer=20
interested persons to read the source and provide a link to the user=20
manual.  The manual is actually quite good :-)

Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


