Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IJZYu-00046s-NJ
	for openembedded-devel@openembedded.org; Fri, 10 Aug 2007 20:50:18 +0200
Received: (qmail 3347 invoked by uid 813007); 10 Aug 2007 18:47:26 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 10 Aug 2007 18:47:26 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2007 20:41:35 +0200
User-Agent: KMail/1.9.7
References: <74d0deb30708100731y124e3931g2e5dde6749d0cce3@mail.gmail.com>
In-Reply-To: <74d0deb30708100731y124e3931g2e5dde6749d0cce3@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200708102041.43625.openembedded@hrw.one.pl>
Subject: Re: -dbg packages in image confusion
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
X-List-Received-Date: Fri, 10 Aug 2007 18:50:20 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia pi=B1tek, 10 sierpnia 2007, pHilipp Zabel napisa=B3:

> Ah, why would gpe-session-scripts depends on gpe-login-dbg?
> Let's see ...
>
> 	$ ipkg-cl info gpe-session-scripts
> 	Package: gpe-session-scripts
> 	Version: 0.67-r10
> 	Depends: matchbox-panel, matchbox-desktop, matchbox-common,
> gpe-session-starter

gpe-login_0.90.bb:

RPROVIDES =3D "gpe-session-starter"

which is WRONG - change to RPROVIDES_${PN} and it will works

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

                   Smile a lot; it makes others nervous.




