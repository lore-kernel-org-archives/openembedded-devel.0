Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1IN68I-0000oS-6X
	for openembedded-devel@openembedded.org; Mon, 20 Aug 2007 14:13:22 +0200
Received: (qmail 26946 invoked by uid 813007); 20 Aug 2007 12:12:29 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 20 Aug 2007 12:12:29 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2007 14:12:17 +0200
User-Agent: KMail/1.9.7
References: <E1IIPXa-0005bT-C3@linuxtogo.org>
	<200708201332.29985.openembedded@hrw.one.pl>
	<46C97EFE.2080007@dominion.kabel.utwente.nl>
In-Reply-To: <46C97EFE.2080007@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200708201412.18032.openembedded@hrw.one.pl>
Subject: Re: [oe-commits] org.oe.dev linux 2.6.22: Alix boards use bzImage kernels
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
X-List-Received-Date: Mon, 20 Aug 2007 12:13:22 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=C5=82ek, 20 sierpnia 2007, Koen Kooi napisa=C5=82:
> Marcin Juszkiewicz schreef:
> > Dnia wtorek, 7 sierpnia 2007, Richard Purdie napisa=C5=82:
> >> On Tue, 2007-08-07 at 15:56 +0200, hrw commit wrote:

> > Right - I looked at it and prepared patch. It removes
> > KERNEL_IMAGETYPE =3D "zImage" entries from kernel recipes and also sets
> > this variable into bzImage for x86 machines which already use that
> > type of kernels. Rest of machines are untouched (yet) - I can convert
> > them if we reach consensus about it.

> What about poking machine maintainer to start using linux.inc direcly
> as well instead of duplicating it?

Some parts of linux.inc stuff should probably go into kernel.bbclass so we=
=20
will get it included in all kernel recipes. Things like EABI/OABI=20
automagic for ARM, creating of archive with kernel modules are nice=20
addons.

But linux.inc is another thing then KERNEL_IMAGETYPE cleanup. But I have=20
to admit that I missed it during first part of cleaning.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

  I don't know what your problem is, but I'll bet it's hard to pronounce.




