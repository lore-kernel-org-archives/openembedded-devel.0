Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1O6Ln4-0004Ar-MJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 12:44:03 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id C0C0068413
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 14:39:55 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Apr 2010 14:40:07 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1272114888-16964-4-git-send-email-eric@eukrea.com>
	<1272223214-23542-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1272223214-23542-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Message-Id: <201004261440.07280.khimov@altell.ru>
X-Altell-MailScanner-ID: C0C0068413.80D0D
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] kernel.class : fix for recent kernel on x86
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
X-List-Received-Date: Mon, 26 Apr 2010 10:44:03 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 25 =D0=
=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 2010 23:20:14 =D0=B0=D0=B2=D1=82=D0=BE=D1=
=80 Eric Benard =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> - bitbake linux for a x86 machine fails with the following message :
> cp: target `.../image/kernel//include/asm-x86/' is not a directory
>=20
> so create $kerneldir/include/asm-x86 before trying to copy something in
> this directory.
>=20
> - make headers_install fails because of missing directories in include
> (tested with linux 2.6.32 and 2.6.33 on x86) and missing Kbuild
>=20
> Signed-off-by: Eric Benard <eric@eukrea.com>

Acked-by: Roman I Khimov <khimov@altell.ru>


