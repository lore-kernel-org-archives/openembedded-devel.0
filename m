Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OvQNt-0005N3-BI for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 09:56:59 +0200
Received: from f053036152.adsl.alicedsl.de ([78.53.36.152]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OvQN9-0007a1-J9 for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 07:56:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=KwCAU5f6WWAqx+hQ+-XD8W_7tbFauK5O9Kv8d@mail.gmail.com>
References: <AANLkTi=KwCAU5f6WWAqx+hQ+-XD8W_7tbFauK5O9Kv8d@mail.gmail.com>
Date: Tue, 14 Sep 2010 09:56:09 +0200
Message-ID: <1284450969.7160.8.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: beagleboard-demo-image fails on gnome-games
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
X-List-Received-Date: Tue, 14 Sep 2010 07:56:59 -0000
X-Groupsio-MsgNum: 23555
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-jRuoMMrw5JQsECJzfSky"

--=-jRuoMMrw5JQsECJzfSky
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Frans,


Am Dienstag, den 14.09.2010, 09:09 +0200 schrieb Frans Meulenbroeks:

[=E2=80=A6]

> | xsltproc -o aisleriot-en_GB.omf --stringparam db2omf.basename
> aisleriot --stringparam db2omf.format 'docbook' --stringparam
> db2omf.dtd "-//OASIS//DTD DocBook XML V4.1.2//EN" --stringparam
> db2omf.lang en_GB --stringparam db2omf.omf_dir "/usr/share/omf"
> --stringparam db2omf.help_dir "/usr/share/gnome/help" --stringparam
> db2omf.omf_in "/home/hudson/jobs/FM_test/workspace/tmp/work/armv7a-angstr=
om-linux-gnueabi/gnome-games-2.30.0-r1/gnome-games-2.30.0/aisleriot/help/ai=
sleriot.omf.in"
>  `/home/hudson/jobs/FM_test/workspace/tmp/sysroots/i686-linux/usr/bin/pkg=
-config
> --variable db2omf gnome-doc-utils` en_GB/aisleriot.xml || { rm -f
> "aisleriot-en_GB.omf"; exit 1; }
> | warning: failed to load external entity
> "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
> | cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
> | warning: failed to load external entity
> "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
> | cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
> | warning: failed to load external entity
> "/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl"
> | cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl

[=E2=80=A6]

(I would prefer it if line wrapping was turned off for pasted log or
code sections.)

I think I had the same problem with Evince [1] and Khem fixed it for me
in b2c2771ddc0e5ddc307999a9a63c5bade88d5956 [2]. Did it ever build for
you? I think most people do not notice since they have this installed on
the build system and so the file is found.

I did not sent this fixe upstream yet, since I am still unable to build
Evince [3].


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/022=
957.html
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db2c2771=
ddc0e5ddc307999a9a63c5bade88d5956
[3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/023=
029.html

--=-jRuoMMrw5JQsECJzfSky
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyPKpMACgkQPX1aK2wOHVgUhgCcCj3xDKh4Juw6FSIEJl2zYQS7
gSYAn2/OFIf3dEaRoBwxljg+0/BzmgOt
=MXid
-----END PGP SIGNATURE-----

--=-jRuoMMrw5JQsECJzfSky--
