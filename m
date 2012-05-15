Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SUIHM-0008MR-95
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 15:59:08 +0200
Received: from localhost (unknown [91.224.149.44])
	by ms.seketeli.net (Postfix) with ESMTP id 4FAE7EA040;
	Tue, 15 May 2012 16:01:22 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 035D6202FB; Tue, 15 May 2012 15:49:08 +0200 (CEST)
Date: Tue, 15 May 2012 15:49:08 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120515134908.GB4846@kilowog>
References: <CAOHjBZto_R5S777po-K8mXG-Z9XLYNVzE05-kq_TOCeo4YgyoQ@mail.gmail.com>
	<20120515130625.GD3166@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120515130625.GD3166@jama.jama.net>
X-Operating-System: Debian GNU/Linux 6.0
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-core] Packages broken URL
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
X-List-Received-Date: Tue, 15 May 2012 13:59:08 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 15-May-12, Martin Jansa a =E9crit:
> On Tue, May 15, 2012 at 03:02:37PM +0200, Giuseppe Condorelli wrote:
> > Hi All,
> >=20
> > there are a number of packages having a broken SRC_URI, for example g=
it.
> > Has someone met this issue?
> > For sure we can correct those links adding a dedicated .bbappend file=
 for
> > each failing package but
> > I think we could also update the main package fixing the errors.
>=20
> This should go to oe-core ML:
> openembedded-core@lists.openembedded.org
>=20
> And yes it should be fixed in original recipe.

I have also experienced fetch issues while trying to build some
packages lately, and I am using oe-classic (because the distribution I
am working with is not available in oe-core yet).

For instance, yesterday I submitted a patch to fix a fetch error on
util-linux-ng in oe-classic:

http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-May/039576.h=
tml

Like you said, Martin, I am trying to fix these kind of issues
directly in the recipe (if it hasn't been fixed in oe-core or yocto
already, in which case I just bring the fix over to oe-classic).

Martin, Kristoffer, can one of you review that patch by the way ?

Cheers.
--=20
        Apelete


