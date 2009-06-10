Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MEMdN-0000tN-2r
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 14:10:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 5B7951416BAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 14:01:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TqqV5C8qFrk
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 14:01:30 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 21D131416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 14:01:30 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
	<BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
Date: Wed, 10 Jun 2009 14:00:40 +0200
Message-Id: <1244635240.28486.7.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.2 
Subject: Re: OE Build :error configure failed to discover size of unix socket path
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
X-List-Received-Date: Wed, 10 Jun 2009 12:10:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=E5=88=98=E8=8A=B3=E5=8D=8E wrote:
>=20
> Hi!
>=20
>    I met a error while I build:
>=20
> /mono/io-layer/wapi-private.h:22:2: error: #error configure failed to d=
iscover size of unix socket path

MONO_SIZEOF_SUNPATH was not detected.

While cross-compiling you have to provide this value manually - for
example run configure once on the target platform and then read the
value in config.h.

Then you need to set mono_cv_sizeof_sunpath in
conf/{your_platform_file}. See site/arm-linux for example. If it works,
you can submit a patch.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



