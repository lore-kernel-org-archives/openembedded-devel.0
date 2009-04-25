Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1Lxpw6-0001Pv-8t
	for openembedded-devel@openembedded.org; Sun, 26 Apr 2009 00:01:26 +0200
Received: (qmail 29112 invoked by uid 813007); 25 Apr 2009 21:56:32 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 25 Apr 2009 21:56:32 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Apr 2009 23:56:17 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc2-00199-g51f1622-dirty; KDE/4.2.2;
	x86_64; ; )
References: <gsst4a$cvj$1@ger.gmane.org>
	<200904252318.18413.marcin@juszkiewicz.com.pl>
	<gsvvqb$mc4$1@ger.gmane.org>
In-Reply-To: <gsvvqb$mc4$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200904252356.18619.marcin@juszkiewicz.com.pl>
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
X-List-Received-Date: Sat, 25 Apr 2009 22:01:26 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia sobota, 25 kwietnia 2009 o 23:37:14 Koen Kooi napisa=C5=82(a):
> On 25-04-09 23:18, Marcin Juszkiewicz wrote:

> >> So suddenly the library packages (or plugin packages, but no
> >> difference in this case) have a new name, but don't set RPROVIDES
> >> or RREPLACES to the old packages containing *the same files*.

> > Provide a patch which will add such ones?

> Well, I verified that e-wm started in beagleboard-demo-image in a
> build from scratch and in an upgraded images 2 days ago, so any
> problems those 3 patches were supposed to fix weren't that critical.
> *After* those 3 patches I have a broken build and broken upgrade
> paths, while *before* things were working for me.

> I actually tested the changes I made for build from scratch as well
> as upgrading an image. While upgrading I actually noticed the ecore
> bug which was present. I could have revert the SRCREV bump, but I
> went ahead and fixed it.=20

But origin/org.openembedded.dev is not koen/org.openembedded.dev - you=20
are *not the only user* of that branch (asterisks added because it looks=20
like you like them). And we have a weekend now - you should wait and=20
check what would other say about those 3 changsets. As I said:=20
origin/org.openembedded.dev is not your sandbox - we also like to play=20
there.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




