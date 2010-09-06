Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Osi3a-0005vx-3l
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 22:12:47 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id EEAFE11000BD;
	Mon,  6 Sep 2010 22:12:04 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7DD9F110009A;
	Mon,  6 Sep 2010 22:11:51 +0200 (CEST)
Received: from rhein.familie-heinold.de (f052234098.adsl.alicedsl.de
	[78.52.234.98]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Mon,  6 Sep 2010 22:11:51 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id A4E643C0C3; Mon,  6 Sep 2010 22:11:45 +0200 (CEST)
Date: Mon, 6 Sep 2010 22:11:45 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Message-ID: <20100906201144.GA8176@rhein.zuhause.netz>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
	<AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
	<AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
	<20100906035002.GB5320@gmail.com>
	<AANLkTinvnAhcr63sm=O+s+iyZw8tKfspjzhR__XOb5mU@mail.gmail.com>
	<AANLkTi=zkn=Ns7MgcakxC8F61O9it3FTYb8XgtHRmcrD@mail.gmail.com>
	<AANLkTimNk1mKqHBsfW6S-KuQkbVyT8f4ajz1d8adDFcc@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimNk1mKqHBsfW6S-KuQkbVyT8f4ajz1d8adDFcc@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Mon, 06 Sep 2010 20:12:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> >> The code is:
> >> do_install_virtclass-native_prepend() {
> >> =A0 =A0 =A0 =A0 install -d ${D}${datadir}/dbus
> >> =A0 =A0 =A0 =A0install -m 0644 dbus-bus-introspect.xml ${D}${datadir=
}/dbus
> >> }
> >>
> >> Actually if the standard do_install needs to be changed, it generall=
y
> >> raises some alarms with me.
> >> Why would we need to install something that the package normally doe=
s
> >> not install?
> >> (of course this could be a bug in the package, but then I would pref=
er
> >> a patch that we also try to push upstream).
> >>
> >
> > Agreed, that is odd. =A0If it's something that dbus using things migh=
t need,
> > why is it only prepended for the native version, and as you say, why =
is it
> > not installed by the upstream install target. =A0I'd do a git blame a=
nd figure
> > out who added that and ask them :)
> > --
>=20
> Henning,
> Git blame gives your name as the person who created those lines.
> Care to comment?
>=20
> Frans

Hi,

if I remember correctly this file is generated in the build process. But =
somehow
in the later versions of dbus-glib there is somehow an error so this file=
 gets not installed
at all in the native variant. So I did it per hand.

Bye Henning


