Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1L55iM-00087B-Kz
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 22:44:58 +0100
Received: (qmail 23500 invoked by uid 813007); 25 Nov 2008 21:42:01 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 25 Nov 2008 21:42:01 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Nov 2008 22:42:05 +0100
User-Agent: KMail/1.10.3 (Linux/2.6.28-rc4; KDE/4.1.3; x86_64; ; )
References: <gghjh1$dg1$1@ger.gmane.org>
	<200811252113.50363.openembedded@haerwu.biz>
	<gghp49$76g$1@ger.gmane.org>
In-Reply-To: <gghp49$76g$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200811252242.05674.openembedded@haerwu.biz>
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
X-List-Received-Date: Tue, 25 Nov 2008 21:44:58 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Tuesday 25 of November 2008 22:02:00 Koen Kooi napisa=C5=82(a):

> How would a non-OE user know that http://openembedded.org/dl/ICA2.txt
> is the license? Shipping the license itself in the packages would be
> better, but that will need a lot of thought,=20

> since we can't have a 1000 packages shipping=20
> /usr/share/licenses/GPLv2, and *all* packages from a recipe need a
> license, even -doc, -dev -and -dbg.

/usr/share/common-licenses/ is part of base-files-doc now and consists=20
GPL, LGPL, BSD, Artistic and few other licenses. We can extend this list=20
and create 'common-licenses' package which would be installed in each=20
image.

> The concrete problem I have is that I have a bunch of licenses that
> don't have a name (not even inside the company that wrote them), so
> my recipes have things like
>
> LICENSE =3D "proprietary binary"
> LICENSE =3D "evil binary"

So add license.txt into /usr/share/doc/${PN}/ with content of that=20
package license. I have done few such packages during last year as some=20
copyright holders gave permissions to distribute their stuff *ONLY* with=20
attached license. This kind of stuff does not even need nothing new - it=20
is just another file in SRC_URI.

> So as short term solution I'd like to be able to point to a url for
> the 'licenses without a proper name'=20

Yeah.. especially when license contents is available only in restricted=20
area for which simple person can not get access (for example Marvell=20
extranet). If there are packages which have own license then such=20
license should be inside of package.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




