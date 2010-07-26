Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OdJRy-00066D-Rg
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 10:54:21 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id 6AC6B53FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 12:58:37 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 12:53:53 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1280075525-31322-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1280075525-31322-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
Message-Id: <201007261253.53814.khimov@altell.ru>
X-Altell-MailScanner-ID: 6AC6B53FD.736D8
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
Subject: Re: [PATCH] cpan.bbclass: removed legacy staging
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
X-List-Received-Date: Mon, 26 Jul 2010 08:54:21 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 25 =D0=
=B8=D1=8E=D0=BB=D1=8F 2010 20:32:05 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Frans Me=
ulenbroeks=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> bumped PR for the main perl recipes so this change takes effect
>=20
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>=20
> removed legacy staging
>=20
> as QA compared with the poky version.
> Also build all perl/lib* recipes with it (using perl 5.8.8).
> 5 of these fail:
> ERROR:
>  'virtual:native:/home/frans/oe/openembedded/recipes/perl/libcurses-perl_=
1.
> 28.bb' failed ERROR:
>  '/home/frans/oe/openembedded/recipes/perl/libcurses-perl_1.28.bb' failed
>  ERROR: '/home/frans/oe/openembedded/recipes/perl/libsocket6-perl_0.23.bb'
>  failed ERROR:
>  '/home/frans/oe/openembedded/recipes/perl/libdbd-mysql-perl-native_4.010=
=2Eb
> b' failed ERROR:
>  '/home/frans/oe/openembedded/recipes/perl/libencode-detect-perl_1.01.bb'
>  failed However these 5 also failed before making the change.
> These recipes are broken and I did not see an apparent fix

Acked-by: Roman I Khimov <khimov@altell.ru>

As for the broken recipes, changes are high for at least mine part of them=
=20
that they actually require Perl 5.10 (I'm not using 5.8.8 for almost a year=
=20
now).


