Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1Qit76-00035m-W7
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 21:04:21 +0200
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 1DF521D36007; Mon, 18 Jul 2011 21:00:13 +0200 (CEST)
Date: Mon, 18 Jul 2011 21:00:13 +0200
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110718190013.GG15997@ibawizard.net>
References: <CA+Hv2hE6SgFS0uHFAp6Qz=BeTXDQZmbMiC3ZetscxrwRr_woDQ@mail.gmail.com>
	<4E1DC39A.5010309@mwester.net>
	<ED3E0BCACD909541BA94A34C4A164D4C06C48B@post.tritech.se>
MIME-Version: 1.0
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C06C48B@post.tritech.se>
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Unwanted dependency on X from ppp
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
X-List-Received-Date: Mon, 18 Jul 2011 19:04:21 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Mats K=E4rrman <Mats.Karrman@tritech.se> [2011-07-14 11:51:18]:

> Thanks again, Mike & Bob,
>=20
> I added something in the line of Mike's suggestion to my machine conf a=
nd
> got the number of tasks down to just over 2200 and the build runs reaso=
nably
> fast. There are still a bunch of X native related dependencies generate=
d from
> dbus but I found no easy way to get rid of them.

Another example, here's excerpt from my ts72xx/recipes/libpcap/libpcap_1.=
1.1.bbappend:

DEPENDS_ts72xx :=3D "${@oe_filter_out('bluez-libs', bb.data.getVar('DEPEN=
DS', d, 1), d)}"

It filters out bluez-libs dependency for ts72xx (headless) machine. I thi=
nk,
that it's courtesy of kergoth (or Tartarus?) from #oe.

-- ynezz


