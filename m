Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1NuQDc-0006DK-Ji
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 14:01:58 +0100
Received: from keemun.localnet (unknown [192.168.1.125])
	by mail.altell.local (Postfix) with ESMTPS id 8A71E67CC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 15:58:39 +0300 (MSK)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Mar 2010 15:58:31 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1269346975-842-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1269346975-842-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <201003241558.31342.khimov@altell.ru>
X-Altell-MailScanner-ID: 8A71E67CC2.6DA23
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
Subject: Re: [PATCH] distutils-common-base: move Python dir detection to separate class
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
X-List-Received-Date: Wed, 24 Mar 2010 13:01:58 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 23 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 15:22:54 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Roman I Khimov =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Allows to inherit that in packages containing Python extensions but still
>  tightly control packaging of those extensions. Mainly for the cases where
>  you want those python modules/extensions/parts to be packaged separately
>  from the main package in order not to introduce python dependency where
>  you don't need it. Technically, you can do it with distutils-common-base,
>  but it might require more FILES_* work than with python-dir.
>=20
> Introduce PYTHON_SITEPACKAGES_DIR along the way, site-packages directory =
is

OK to push series?


