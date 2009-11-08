Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N7DtZ-0004Os-Ls
	for openembedded-devel@openembedded.org; Sun, 08 Nov 2009 20:57:56 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 710011D36078; Sun,  8 Nov 2009 20:56:35 +0100 (CET)
Date: Sun, 8 Nov 2009 20:56:35 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091108195635.GB16449@ibawizard.net>
References: <1257689597-31831-1-git-send-email-ynezz@true.cz>
	<1257691795.25369.229.camel@lenovo.internal.reciva.com>
	<20091108161751.GA16449@ibawizard.net>
MIME-Version: 1.0
In-Reply-To: <20091108161751.GA16449@ibawizard.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libgsf: fix compile error, add missing dependency	on gtk+
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
X-List-Received-Date: Sun, 08 Nov 2009 19:57:56 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Petr =A9tetiar <ynezz@true.cz> [2009-11-08 17:17:51]:

> Phil Blundell <pb@reciva.com> [2009-11-08 14:49:54]:
>=20
> > On Sun, 2009-11-08 at 15:13 +0100, Petr =A9tetiar wrote:
> > > This patch fixes this compile error:
> > > main.c:38:35: error: gdk-pixbuf/gdk-pixbuf.h: No such file or direc=
tory
> >=20
> > I wonder if you might be better off depending on gdk-pixbuf rather th=
an
> > the full gtk+.  Does that work for you?
>=20
> Yes, it works for me. What should I do now, since the patch has been co=
mmited
> already? :-)

I've encoutered few problems when using gdk-pixbuf as dependency, for exa=
mple
when building Abiword which than needs gdk-linux-fb package as dependency=
, which
is pulled in by EXTRA_OECONF =3D "--with-gdktarget=3Dlinux-fb" in gdk-pix=
buf package.
So I think, that gtk+ in this patch is correct.

-- ynezz


