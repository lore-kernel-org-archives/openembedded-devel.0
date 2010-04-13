Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1O1fHt-0003xG-EP
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Apr 2010 14:32:18 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 50B61682F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Apr 2010 16:28:39 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Apr 2010 16:12:45 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <s2ud2a86f8e1004122027pf357420tc3cc7d0aea062740@mail.gmail.com>
	<201004130929.43327.roman@khimov.ru>
	<g2hd2a86f8e1004130509sf3133ec2hb730e20abf586cf@mail.gmail.com>
In-Reply-To: <g2hd2a86f8e1004130509sf3133ec2hb730e20abf586cf@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201004131612.45565.khimov@altell.ru>
X-Altell-MailScanner-ID: 50B61682F7.8EB2D
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE failed at task 8045 of 8046
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
X-List-Received-Date: Tue, 13 Apr 2010 12:32:18 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 13 =D0=B0=D0=BF=D1=80=D0=B5=D0=
=BB=D1=8F 2010 16:09:13 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 ttk rpink =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> There is another error shows up now. Opkg-cl needs another argument after
> "install". Error message listed below. Please let me know if not related
>  and I need open another post.
>=20
> | + xargs opkg-cl -f /home/setup/stuff/tmp/staging/i686-linux/etc/opkg.co=
nf
>=20
> -o /home/setup/stuff/tmp/rootfs/beagleboard-demo-image -t
> /home/setup/stuff/tmp/rootfs/beagleboard-demo-image-tmp -nodeps install
>=20
> | opkg-cl: the ``install'' command requires at least one argument

It's not related and at quick glance it comes from ROOTFS_POSTPROCESS_COMMA=
ND=20
in beagleboard-demo-image.bb that calls install_linguas from=20
classes/image.bbclass. Probably something's wrong with locales in your buil=
d.


