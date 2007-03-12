Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1HQfaM-0006FD-Az
	for openembedded-devel@openembedded.org; Mon, 12 Mar 2007 09:08:50 +0100
Received: (qmail 20032 invoked by uid 813007); 12 Mar 2007 08:08:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 12 Mar 2007 08:08:49 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Mar 2007 09:08:43 +0100
User-Agent: KMail/1.9.6
References: <45F4C45B.8020601@whitby.id.au>
In-Reply-To: <45F4C45B.8020601@whitby.id.au>
MIME-Version: 1.0
Message-Id: <200703120908.45917.openembedded@hrw.one.pl>
Subject: Re: [RFC] madwifi staging and hostap-deamon support for madwifi
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
X-List-Received-Date: Mon, 12 Mar 2007 08:08:50 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 12 marca 2007, Rod Whitby napisa=B3:
> I want to get hostap-deamon working for madwifi (on the IOMega NAS100d,
> and D-Link DSMG-600 RevA).

And also on any other PCI equipped machines (madwifi req pci iirc).

> Currently, it does not support madwifi, and the current madwifi-ng
> recipe is putting the include files in a place other than the place
> that hostapd looks for them during the compile. =20

> Also, hostapd has an RDEPENDS on hostapd-modules, which does not make
> sense for madwifi.=20

Hostap-modules dependency should be dropped - we use hostap from kernel.=20

I would like to get latest stable hostapd in OE.

> I'd like to change madwifi-ng to put the files in the right place, and
> then change hostap-daemon to enable madwifi support and use those
> include files.  Are there any other known packages that use madwifi
> include files that may be affected?

wpa-supplicant use madwifi and also has all needed code for madwifi=20
support on PCI equipped machines.

> I can either enable this globally, or enable it for the slugos distro
> only, or enable it for ixp4xx machines only.  Which should I do?

Enable it for PCI equipped machines like it is in wpa-supplicant 0.5.x

> Here is the hostap-daemon.inc patch (example using a _ixp4xx override):
> > -RDEPENDS =3D "hostap-modules hostap-utils (${PV})"
> > +RDEPENDS =3D "hostap-utils (${PV})"
> > +DEPENDS_append_ixp4xx =3D " madwifi-ng"
> >
> > +do_configure_ixp4xx() {
> > +        sed -e
> > 's/\#CONFIG_DRIVER_MADWIFI=3Dy/CONFIG_DRIVER_MADWIFI=3Dy/' \ +         =
 =20
> >    '${WORKDIR}/defconfig' >>'${S}/.config'
> > +}

Do this like it is done in wpa-supplicant 0.5.x

Thx

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

 Truly a man of few words. I'll bet you don't know what either one of them
 means.




