Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1NuQCo-0005d4-OM
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 14:01:09 +0100
Received: from keemun.localnet (unknown [192.168.1.125])
	by mail.altell.local (Postfix) with ESMTPS id 9C66967CC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 15:57:51 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Mar 2010 15:57:44 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003211505.39554.roman@khimov.ru>
	<1269381068-5518-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1269381068-5518-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <201003241557.44087.khimov@altell.ru>
X-Altell-MailScanner-ID: 9C66967CC2.E0301
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
Subject: Re: [PATCH 01/44] cpan-base: add perl version to PR
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
X-List-Received-Date: Wed, 24 Mar 2010 13:01:09 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A1=D1=80=D0=B5=D0=B4=D0=B0 24 =D0=BC=D0=B0=D1=80=D1=82=D0=B0 2010 00:51=
:08 =D0=B2=D1=8B =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB=D0=B8:
> Makes perl modules rebuild on perl version change, since binary
>  compatibility could be broken with that (although perl itself tries to
>  maintain it  within patchlevel range, like 5.8.7 -> 5.8.8).
>=20
> This is conditional on PACKAGE_ARCH, since there is nothing to rebuild for
> pure perl modules (and those should use 'PACKAGE_ARCH =3D "all"') even if
>  they break with perl version change.
>=20
> This also should ease transition to perl 5.10.1.

OK to push? I've realized yesterday that without it or similar thing many=20
binary modules would be broken when someone would try to use 5.10.1 and man=
ual=20
cleaning and rebuilding a ton of perl modules is no fun.


