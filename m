Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N6PSU-00047W-CO
	for openembedded-devel@openembedded.org; Fri, 06 Nov 2009 15:06:37 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 759B11D36078; Fri,  6 Nov 2009 15:05:19 +0100 (CET)
Date: Fri, 6 Nov 2009 15:05:19 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Message-ID: <20091106140519.GA25214@ibawizard.net>
References: <1257504486-7975-1-git-send-email-ynezz@true.cz>
	<1257504486-7975-2-git-send-email-ynezz@true.cz>
	<be7a9f3d0911060413i778aec0cpf2c618832437665a@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0911060413i778aec0cpf2c618832437665a@mail.gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH][geodegx] geodegx: Fix glibc configure error
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
X-List-Received-Date: Fri, 06 Nov 2009 14:06:37 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Otavio Salvador <otavio@ossystems.com.br> [2009-11-06 10:13:16]:

> Hello,

Hi,

> On Fri, Nov 6, 2009 at 8:48 AM, Petr =A9tetiar <ynezz@true.cz> wrote:
> > Fix glibc configure error:
> >
> > | configure: running configure fragment for add-on nptl
> > | checking sysdep dirs... configure: error: The geode subspecies of i=
486 is not supported.
> > | FATAL: oe_runconf failed
> >
> > Signed-off-by: Petr =A9tetiar <ynezz@true.cz>
>=20
> I use it this way here and it works. Which glibc version are you
> using? In my case I'm using:

I don't use custom glibc version, it's same as in OE, log says it's
glibc-2.9-r35.2 and from GCC is ANGSTROM_GCC_VERSION ?=3D "4.3.3".

> angstrom 2008 versions, plus:
>=20
> PREFERRED_VERSION_gcc                    =3D "4.3.2"
> PREFERRED_VERSION_gcc-cross              =3D "4.3.2"
> PREFERRED_VERSION_gcc-cross-sdk          =3D "4.3.2"
> PREFERRED_VERSION_gcc-cross-initial      =3D "4.3.2"
> PREFERRED_VERSION_gcc-cross-intermediate =3D "4.3.2"

> And I build in stable; but this is not supposed to affect it.

I build dev and I found this fix on the web using Google, now looking it =
up
again I found yours and Hrw's conversation on #oe http://pastebin.com/f66=
40d6f7
It seems, that it's 4.3.3 issue?

-- ynezz


