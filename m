Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1IzBcm-0002MC-3H
	for openembedded-devel@openembedded.org; Mon, 03 Dec 2007 14:46:16 +0100
Received: (qmail 18961 invoked by uid 813007); 3 Dec 2007 13:42:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 3 Dec 2007 13:42:49 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 Dec 2007 14:42:31 +0100
User-Agent: KMail/1.9.7
References: <32693366.20071202213259@gmail.com>
In-Reply-To: <32693366.20071202213259@gmail.com>
MIME-Version: 1.0
Message-Id: <200712031442.34258.openembedded@haerwu.biz>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [ANN, RFC] dropbear-early
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2007 13:46:16 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia niedziela, 2 grudnia 2007, Paul Sokolovsky napisa=B3:

>   I've recently finally crafted something I wanted for long time - a
> package with script which allows to start dropbear ASAP after boot, if
> user chooses so.

Your recipe has one simple bug... It assume that dropbear is installed=20
which is not always true.

To fix it you need to make it RDEPEND on dropbear.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

               We're bad people and we do bad things [Pink]




