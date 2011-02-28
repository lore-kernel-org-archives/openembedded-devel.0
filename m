Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Pu7gz-0001Y2-5y
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 19:19:33 +0100
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Pu7fe-0006TH-9P
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 19:18:10 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D697E1C.3060708@mentor.com>
References: <1298742255-23389-1-git-send-email-ynezz@true.cz>
	<1298745578.3818.7.camel@lenovo.internal.reciva.com>
	<20110226185959.GC10042@ibawizard.net>
	<1298748041.3818.10.camel@lenovo.internal.reciva.com>
	<4D697E1C.3060708@mentor.com>
Date: Mon, 28 Feb 2011 18:23:24 +0000
Message-ID: <1298917404.23547.37.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/2] micro-uclibc: add xattr to distro features to fix build failure of libcap2
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
X-List-Received-Date: Mon, 28 Feb 2011 18:19:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2011-02-26 at 15:26 -0700, Tom Rini wrote:
> On 02/26/2011 12:20 PM, Phil Blundell wrote:
> > Which package in console-image depends on libcap2?  It might be worth
> > exploring whether there is a way to avoid that dependency.
>=20
> avahi brings in libcap2 now.  I suppose it's possible to make that xattr=
=20
> DISTRO_FEATURE spell that part out and update all of the distros.  But=
=20
> maybe that can wait until post release?

Sure, waiting until post release for that sounds fine to me.  Though
judging from the recent checkins it seems as though most of the DISTROs
are declaring xattr now in any case.

Unless you have a particular objection, I'm going to revert Petr
=C5=A0tetiar's original micro-uclibc.conf patch and just take the view of
"don't do that, then" for the resulting console-image failure.  If it
turns out that someone actually wants console-image on micro then I
guess we can apply some distro-specific hack to suppress the avahi
behaviour.

p.




