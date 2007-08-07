Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IIIUc-0007DB-L6
	for openembedded-devel@openembedded.org; Tue, 07 Aug 2007 08:24:34 +0200
Received: (qmail 30061 invoked by uid 813007); 7 Aug 2007 06:22:05 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 7 Aug 2007 06:22:05 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Aug 2007 08:22:01 +0200
User-Agent: KMail/1.9.7
References: <03d301c7d853$58ec39f0$6e01a8c0@twilight>
In-Reply-To: <03d301c7d853$58ec39f0$6e01a8c0@twilight>
MIME-Version: 1.0
Message-Id: <200708070822.03530.openembedded@hrw.one.pl>
Subject: Re: STAGING_LIBDIR_NATIVE needed in bitbake.conf
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
X-List-Received-Date: Tue, 07 Aug 2007 06:24:34 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 6 sierpnia 2007, Mike (mwester) napisa=B3:
> In order to fix an ncurses build bug
> (http://bugs.openembedded.org/show_bug.cgi?id=3D2554), we need to set
> LD_LIBRARY_PATH in the ncurses bb file.
>
> I've tested, and the following resolves the problem with ncurses not
> installing:
>
>     export LD_LIBRARY_PATH =3D "${STAGING_BINDIR_NATIVE}/../lib"
>
> That's not too elegant, so I'd like to create "STAGING_LIBDIR_NATIVE"
> in the bitbake.conf file instead, which will clean up the recipe and
> make more obvious what it is that we're doing.

STAGING_LIBDIR_NATIVE sounds ok for me

> Anyone have any heartburn with this approach to resolving this problem?

It should be done in classes/native.bbclass not in ncurses-native. The=20
problem is wider as there are few distributions which have host versions=20
of stuff other then OE use as native. As a result building of native=20
stuff which depend on native libraries can fail - when you will set=20
LD_LIBRARY_PATH in native.bbclass then it should work.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

              whats mean ubuntu?
              it's african word for "can't configure debian"




