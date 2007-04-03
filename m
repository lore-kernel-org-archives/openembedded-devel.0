Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HYf8Q-0006Se-Og
	for openembedded-devel@openembedded.org; Tue, 03 Apr 2007 11:17:02 +0200
Received: (qmail 4550 invoked by uid 813007); 3 Apr 2007 09:17:01 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 3 Apr 2007 09:17:01 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 3 Apr 2007 11:17:06 +0200
User-Agent: KMail/1.9.6
References: <151901c775b6$2c86fc10$6e01a8c0@twilight>
In-Reply-To: <151901c775b6$2c86fc10$6e01a8c0@twilight>
MIME-Version: 1.0
Message-Id: <200704031117.07726.openembedded@hrw.one.pl>
Subject: Re: Busybox 1.5.0 available for testing
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
X-List-Received-Date: Tue, 03 Apr 2007 09:17:03 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 3 kwietnia 2007, Mike (mwester) napisa=B3:

> Busybox 1.5.0 is committed.  It is marked with preference =3D -1, so it
> should NOT be automatically included in anyone's builds.

thx

> It's considered less-than-stable upstream, so be prepared for anything
> to happen with it.  I re-did the patches that are applied, a couple of
> them no longer seem pertinent at all, but since they are referenced in
> the busybox.inc file, I don't know how to "un" specify them for 1.5.0
> and higher versions.

require busybox.inc

SRC_URI =3D "...."

this will overwrite SRC_URI in recipe

> I'm sure the .bb file could use a cleanup, but that will probably take
> a better bb person than I.

I am thinking that we should drop ALL our patches to busybox in more=20
recent versions and check each one does it is useful and if is then=20
submit it upstream. Some of our BB patches have 3-4 years...

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

       In theory there is no difference between practice and theory




