Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1L5GT6-0005BU-Tq
	for openembedded-devel@openembedded.org; Wed, 26 Nov 2008 10:13:57 +0100
Received: (qmail 23391 invoked by uid 813007); 26 Nov 2008 09:10:57 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 26 Nov 2008 09:10:56 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2008 10:11:09 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.28-rc4; KDE/4.1.3; x86_64; ; )
References: <gghjh1$dg1$1@ger.gmane.org>
	<200811252242.05674.openembedded@haerwu.biz>
	<gghsc8$jot$1@ger.gmane.org>
In-Reply-To: <gghsc8$jot$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200811261011.09918.openembedded@haerwu.biz>
Subject: Re: [RFC] LICENSE fields and packages
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
X-List-Received-Date: Wed, 26 Nov 2008 09:13:57 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Tuesday 25 of November 2008 22:57:27 Koen Kooi napisa=C5=82(a):
> On 25-11-08 22:42, Marcin Juszkiewicz wrote:
> > Tuesday 25 of November 2008 22:02:00 Koen Kooi napisa=C5=82(a):

> >> The concrete problem I have is that I have a bunch of licenses
> >> that don't have a name (not even inside the company that wrote
> >> them), so my recipes have things like
> >>
> >> LICENSE =3D "proprietary binary"
> >> LICENSE =3D "evil binary"
> >
> > So add license.txt into /usr/share/doc/${PN}/ with content of that
> > package license. I have done few such packages during last year as
> > some copyright holders gave permissions to distribute their stuff
> > *ONLY* with attached license. This kind of stuff does not even need
> > nothing new - it is just another file in SRC_URI.

> I like that idea very much, but the license file will have to be in
> every entry in PACKAGES, so ${PN} won't work. Do you have a
> suggestion on how to handle that?

${PN}-license package on which all entries from PACKAGES will RDEPEND?

> >> So as short term solution I'd like to be able to point to a url
> >> for the 'licenses without a proper name'
> >
> > Yeah.. especially when license contents is available only in
> > restricted area for which simple person can not get access (for
> > example Marvell extranet). If there are packages which have own
> > license then such license should be inside of package.
>
> So you agree that in those situations we can point to an URL, but in
> other cases either use the name or include it in the package?

No, I mean that if license is not one of popular ones covered by=20
base-files-doc or common-licenses package it should be added into OE=20
metadata. Ok, it can be a bit of overkill adding all those 'povray',=20
'openssl' etc licenses but when we will end then it will be clear how=20
each recipe is licensed.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




