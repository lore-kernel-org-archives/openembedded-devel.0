Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SG3Ue-0006MM-MD
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Apr 2012 09:22:01 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 45E8E4B0192
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2012 09:12:44 +0200 (CEST)
Date: Fri, 6 Apr 2012 09:12:43 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120406091243.1f1969d2@eb-e6520>
In-Reply-To: <jllb47$64q$1@dough.gmane.org>
References: <20120404091720.4b743c5b@eb-e6520> <jli1uf$7nt$1@dough.gmane.org>
	<CABcZANngH2BSmSdBPkaPyJcG1RFuKLxc9DnJWhe7_b9xcSGjxA@mail.gmail.com>
	<jllb47$64q$1@dough.gmane.org>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Fri, 06 Apr 2012 07:22:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Le Thu, 05 Apr 2012 16:50:32 -0700,
Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
> I would appreciate people sending decent bugreports to the list, because =
it
> is *NOT* supposed to break this way. The breakage needs to get fixed befo=
re
> we merge it into oe-core.
>=20
to reproduce the problem I met, simply add to a conf file :
PREFERRED_VERSION_udev =3D "164"

and using oe-core + meta-oe try to build anything which has "inherit
systemd" (even if in the end you don't install the corresponding
${PN}-systemd in the target's rootfs) : systemd's configure will fail
because it requires a more recent udev.

Eric


