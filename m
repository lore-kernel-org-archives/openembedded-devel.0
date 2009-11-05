Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1N63qX-0002j5-E4
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 16:02:00 +0100
Received: (qmail 28365 invoked by uid 813007); 5 Nov 2009 14:34:04 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Nov 2009 14:34:04 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 5 Nov 2009 15:34:06 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc5-00402-gb6727b1; KDE/4.3.2; x86_64; ;
	)
References: <1254776922-10892-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1254818412.9214.107.camel@lenovo.internal.reciva.com>
In-Reply-To: <1254818412.9214.107.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <200911051534.07348.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] java.bbclass: Use force (-f) for ln (suggested by Marcin).
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
X-List-Received-Date: Thu, 05 Nov 2009 15:02:00 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia wtorek, 6 pa=C5=BAdziernika 2009 o 10:40:12 Phil Blundell napisa=C5=82=
(a):
> On Mon, 2009-10-05 at 23:08 +0200, Marcin Juszkiewicz wrote:
> > @@ -72,7 +72,7 @@ oe_jarinstall() {
> >        oewarn "file was in the way. removing:" $dir/$1
> >        rm $dir/$1
> >      fi
> > -    ln -s $destname $dir/$1
> > +    ln -sf $destname $dir/$1
> >      shift
> >    done
> >  }
>=20
> What's the reason for the -f argument?  If the target file already
> exists then it seems like that "rm" should already take care of it.

=46inally debugged it. "ln -sf" was needed if $dir/$1 was broken symlink. I=
 have=20
better fix for that thanks to Thomas Horsten and will push it to .dev and t=
hen=20
request for stable.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




