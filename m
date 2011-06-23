Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QZkuK-0004mL-Eo
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 16:29:24 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1QZkqt-00053P-2V
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 16:25:51 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4E032546.6000308@freyther.de>
References: <4E03211B.40205@freyther.de>
	<1308828119.21613.138.camel@phil-desktop>
	<4E032546.6000308@freyther.de>
Date: Thu, 23 Jun 2011 15:25:49 +0100
Message-ID: <1308839149.21613.165.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: RFC One recipe with two git repository as sources
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
X-List-Received-Date: Thu, 23 Jun 2011 14:29:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-06-23 at 13:36 +0200, Holger Freyther wrote:
> On 06/23/2011 01:21 PM, Phil Blundell wrote:
> > On Thu, 2011-06-23 at 13:18 +0200, Holger Freyther wrote:
> >> -        destdir =3D os.path.join(destdir, "git/")
> >> +        destsuffix =3D ud.parm.get("destsuffix", "git/")
> >> +        print destsuffix
> >> +        destdir =3D os.path.join(destdir, destsuffix)
> >=20
> > I think that "print" might be extraneous, but other than this your patc=
h
> > looks awesome.  I think this would resolve the problem that I was havin=
g
> > in.
>=20
> great, yeah the print is bogus and the question if and how this applies t=
o
> fetch/git.py is also unresolved (i had a quick look but have not found th=
e
> dirname it uses to create the tarball).

I'm not entirely clear on what's going on with fetch vs fetch2 at all,
in terms of whether fetch is going away at some point or the two of them
are meant to be existing in parallel.  Can one of the TSC =C3=BCberhackers
shed any light on what the intent is there?

p.



