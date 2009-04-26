Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1LxtvT-0003kY-Hf
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Apr 2009 04:17:03 +0200
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 94C2424067; Sun, 26 Apr 2009 12:12:08 +1000 (EST)
Date: Sun, 26 Apr 2009 11:59:41 +1000
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20090426115941.364c5618.raster@rasterman.com>
In-Reply-To: <200904252356.18619.marcin@juszkiewicz.com.pl>
References: <gsst4a$cvj$1@ger.gmane.org>
	<200904252318.18413.marcin@juszkiewicz.com.pl>
	<gsvvqb$mc4$1@ger.gmane.org>
	<200904252356.18619.marcin@juszkiewicz.com.pl>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.5.0 (GTK+ 2.14.4; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Subject: Re: reverting some csets that kill package upgrade paths
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
X-List-Received-Date: Sun, 26 Apr 2009 02:17:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 25 Apr 2009 23:56:17 +0200 Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> said:

> Dnia sobota, 25 kwietnia 2009 o 23:37:14 Koen Kooi napisa=C5=82(a):
> > On 25-04-09 23:18, Marcin Juszkiewicz wrote:
>=20
> > >> So suddenly the library packages (or plugin packages, but no
> > >> difference in this case) have a new name, but don't set RPROVIDES
> > >> or RREPLACES to the old packages containing *the same files*.
>=20
> > > Provide a patch which will add such ones?
>=20
> > Well, I verified that e-wm started in beagleboard-demo-image in a
> > build from scratch and in an upgraded images 2 days ago, so any
> > problems those 3 patches were supposed to fix weren't that critical.
> > *After* those 3 patches I have a broken build and broken upgrade
> > paths, while *before* things were working for me.
>=20
> > I actually tested the changes I made for build from scratch as well
> > as upgrading an image. While upgrading I actually noticed the ecore
> > bug which was present. I could have revert the SRCREV bump, but I
> > went ahead and fixed it.=20
>=20
> But origin/org.openembedded.dev is not koen/org.openembedded.dev - you=20
> are *not the only user* of that branch (asterisks added because it look=
s=20
> like you like them). And we have a weekend now - you should wait and=20
> check what would other say about those 3 changsets. As I said:=20
> origin/org.openembedded.dev is not your sandbox - we also like to play=20
> there.

true - not the onyl user.. but if it breaks for him.. that is a break - a=
nd
something to fix. if changes broke something - fix the changes or revert.=
 i
guess this thread is about screaming "revert!" in  hopes that the changes=
 will
get fixed asap before a revert actually happens (and you start some
commit/revert war) :)

--=20
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



