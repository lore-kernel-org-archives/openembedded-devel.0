Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1PTEnS-0002OT-OX
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 15:27:07 +0100
Received: from keemun.altell.local (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 212C753EF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 17:25:18 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Dec 2010 17:32:17 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.34.7-0.5-desktop; KDE/4.4.4; x86_64; ; )
References: <131E5DFBE7373E4C8D813795A6AA7F080329DB6BBC@dlee06.ent.ti.com>
	<131E5DFBE7373E4C8D813795A6AA7F080329E92ADA@dlee06.ent.ti.com>
	<ied6kt$dqa$1@dough.gmane.org>
In-Reply-To: <ied6kt$dqa$1@dough.gmane.org>
MIME-Version: 1.0
Message-Id: <201012161732.17976.khimov@altell.ru>
X-Altell-MailScanner-ID: 212C753EF.93680
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move openssl.cnf file into base openssl package
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
X-List-Received-Date: Thu, 16 Dec 2010 14:27:07 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 16 =D0=B4=D0=B5=D0=BA=D0=B0=D0=
=B1=D1=80=D1=8F 2010 17:10:37 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Koen Kooi =D0=
=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> >>> So it seems like there are two packages that need this default
> >> openssl.cnf
> >>=20
> >>>  file, the libcrypto and openssl packages.  Would it perhaps be a
> >>>  better idea to pull the configuration file into its own package and
> >>>  then set
> >> the
> >>>  RDEPENDS for the libcrypto and openssl packages to use the openssl
> >>>  configuration package? That way you can still have multiple versions
> >>>  of libcrypto (like Koen was trying to do) and have the default file
> >>>  shared between both packages that need it.
> >>=20
> >> openssl is rdepending on libcrypto anyway (it's linked with it and I
> >> don't think it'll change any time soon). But configs for different
> >> versions can be
> >> conflicting, so I'm not sure this kind of approach solves anything.
> >=20
> > I noticed that.  I think the only thing that putting this into its own
> > package would solve is addressing Koen's comment about having multiple
> > versions of libcrypto installed.
> >=20
> > Koen, can you comment on your change that moved the openssl.cnf file to
> > the misc package?  Do you still need to be able to install multiple
> > versions of libcrypto?
>=20
> Yes, I still need to be able to do that, couldn't you just add an
> rrecommend for -misc?

To get all -misc stuff? I'd opt for putting openssl.cnf in its own package =
and=20
setting it as RRECOMMENDS for libcrypto in that case.


