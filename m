Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1HwHL3-0008Io-Jz
	for openembedded-devel@openembedded.org; Thu, 07 Jun 2007 14:43:41 +0200
Received: (qmail 30163 invoked by uid 813007); 7 Jun 2007 12:41:13 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 7 Jun 2007 12:41:13 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 Jun 2007 14:41:04 +0200
User-Agent: KMail/1.9.7
References: <03ec01c7a8bc$95a2f030$6e01a8c0@twilight>
	<200706070839.52842.openembedded@hrw.one.pl>
	<045401c7a8fa$ea96f300$6e01a8c0@twilight>
In-Reply-To: <045401c7a8fa$ea96f300$6e01a8c0@twilight>
MIME-Version: 1.0
Message-Id: <200706071441.05394.openembedded@hrw.one.pl>
Subject: Re: Need advice on changing kernel.bbclass
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
X-List-Received-Date: Thu, 07 Jun 2007 12:43:42 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 7 czerwca 2007, Mike (mwester) napisa=B3:

> > RPROVIDES_kernel-2.4.22-xfs =3D "kernel-image-2.4.22-xfs" should solve
> > your problem.

> Build completed, with this suggestion. =A0:( =A0No joy:

> Package: kernel-module-binfmt-misc
> Version: 2.4.22.l2.3r63-r18.5
> Depends: update-modules, kernel-2.4.22-xfs
> Section: kernel

> The kernel modules built remain firm in their conviction that they
> depend upon the kernel, not kernel-image.

OK, they depend on kernel-2.4.22-xfs but it provide=20
kernel-image-2.4.22-xfs so your users should be able to upgrade rather.

Or I have bug in thinking (which is possible).

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

     Linux in the cellular phone is not a question of 'if', but 'when'




