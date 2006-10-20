Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GaoWs-0007J8-5T
	for openembedded-devel@openembedded.org; Fri, 20 Oct 2006 09:10:54 +0200
Received: (qmail 1906 invoked by uid 813007); 20 Oct 2006 07:03:46 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 20 Oct 2006 07:03:45 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Oct 2006 09:04:08 +0200
User-Agent: KMail/1.9.5
References: <E1GadpR-0005SF-6I@linuxtogo.org>
	<20061019213932.GA30714@twibble.org>
In-Reply-To: <20061019213932.GA30714@twibble.org>
MIME-Version: 1.0
Message-Id: <200610200904.08999.openembedded@hrw.one.pl>
Subject: Re: [oe-commits] org.oe.dev glibc: drop 2.4, since it is confirmed to be nonworking on arm
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 07:10:54 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 19 pa=BCdziernika 2006 23:39, Jamie Lenehan napisa=B3:
> On Thu, Oct 19, 2006 at 09:45:21PM +0200, "koen commit" wrote:
> > glibc: drop 2.4, since it is confirmed to be nonworking on arm

Koen: next time *check* does something use what you plan to remove.=20
Especially with such *important* packages like toolchain/libc ones.

> Hmm, was this really necessary? Surely marking it broken for arm
> would have been enough for now?

Should be enough.

> I'm sure I'm not the only one running glibc 2.4 on lots of non-arm
> devices and now have to either add glibc 2.4 back in to OE locally
> and/or get all my devices upgraded (which will happen, once I've
> finished testing with glibc 2.5, no other glibc's build here except
> 2.4 and 2.5.)

> And I'm sure there'll be a lot of people wondering why OE is suddenly
> building an older version of glibc.

I reverted koen's changeset and added DEFAULT_PREFERENCE_arm =3D "-1" so AR=
M=20
builds will skip it.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant




