Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1INqo2-0003Ff-Br
	for openembedded-devel@openembedded.org; Wed, 22 Aug 2007 16:03:34 +0200
Received: (qmail 9349 invoked by uid 813007); 22 Aug 2007 14:02:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 22 Aug 2007 14:02:28 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2007 16:02:25 +0200
User-Agent: KMail/1.9.7
References: <200703231200.31520.openembedded@hrw.one.pl>
	<9010469286.20070822152313@vanille-media.de>
In-Reply-To: <9010469286.20070822152313@vanille-media.de>
MIME-Version: 1.0
Message-Id: <200708221602.26912.openembedded@hrw.one.pl>
Subject: Re: Building Python extensions
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
X-List-Received-Date: Wed, 22 Aug 2007 14:03:34 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 22 sierpnia 2007, Dr. Michael Lauer napisa=B3:
> Marcin Juszkiewicz wrote on 23th of March:
> > When we build Python extension (for example python-pygtk2) configure
> > script builds one test program to check does it has Python headers.

> So this is a problem with python packages using autotools only, right?
> (I remember I patched distutils to take care about that).

looks like it

> > I got fix for it of course. M4 scripts of each used Python extensions
> > use macro AM_CHECK_PYTHON_HEADERS which I edited to add one option to
> > configure: --with-python-includes which should be pointed to
> > ${STAGING_INCDIR}/../ to get it working.
>
> So just adding to EXTRA_OECONF will do?

Need to patch acinclude.m4 too.

> > I will sync some of Python extensions with this fix from Poky into
> > OpenEmbedded in next days (python-pygtk2 already pushed).
>
> Since we don't have that many extensions using autotools, we can fix
> this easily.

you or me?

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

        Linux! -- Because a big world can not fit in small windows.




