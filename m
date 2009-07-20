Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MSmSE-00022V-KY
	for openembedded-devel@openembedded.org; Mon, 20 Jul 2009 08:34:30 +0200
Received: (qmail 3586 invoked by uid 813007); 20 Jul 2009 06:20:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Jul 2009 06:20:36 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jul 2009 08:20:40 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc3-00104-g3553fe1; KDE/4.2.96; x86_64; ;
	)
References: <4A6374DB.8020901@balister.org>
	<be7a9f3d0907191519w1d7c6179u178e27c10cc09697@mail.gmail.com>
	<4A63CEA0.3050000@balister.org>
In-Reply-To: <4A63CEA0.3050000@balister.org>
MIME-Version: 1.0
Message-Id: <200907200820.41353.marcin@juszkiewicz.com.pl>
Subject: Re: sqlite3 recipe
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
X-List-Received-Date: Mon, 20 Jul 2009 06:34:30 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 20 lipca 2009 o 03:55:44 Philip Balister napisa=C5=
=82(a):
> Otavio Salvador wrote:

> > It looks like you've forgotten the PR bump. In this case would be
> > nice to move it to INC_PR stuff.
>
> Well, for this case only staging changes, not the packaging. I needed
> to do this for a local recipe that used a different header file that
> the previous recipe did not install into staging. Certainly, if the
> packaging changes, it should move to INC_PR.

You change made all packages built after it have access to all SQLite=20
headers. You do not know how many of them use those.

Change to packages content require PR bump. Change to staging also=20
require PR bump - otherwise I am not able to build your local recipe=20
without rebuilding sqlite by hand.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




