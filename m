Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U2iF8-00053D-Ag
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Feb 2013 14:07:23 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 9E6142D2FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2013 13:51:33 +0100 (CET)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id B18434B0083
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Feb 2013 13:51:28 +0100 (CET)
Date: Tue, 5 Feb 2013 13:51:26 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130205135126.048dc6ed@e6520eb>
In-Reply-To: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
References: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-browser][PATCH 1/2] chromium: fix webkit build with newer bison
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
X-List-Received-Date: Tue, 05 Feb 2013 13:07:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Thu, 10 Jan 2013 21:22:38 +0500,
Fahad Usman <fahad_usman@mentor.com> a =C3=A9crit :

> the chromium tarball contains its own copy of webkit sources and it fails=
 to
> build with bison-2.6 or later. Martin Jansa submitted a fix for this
> problem in webkit-gtk recipei in poky,
> commit id=3D4b5705c426743e812d6da25ff37c335e073bfb12
>=20
> We need to apply the same fix here as well
>=20
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  recipes-browser/chromium/chromium/bison-2.6.patch |  558 +++++++++++++++=
++++++
>  recipes-browser/chromium/chromium_19.0.1049.3.bb  |    3 +-
>  2 files changed, 560 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-browser/chromium/chromium/bison-2.6.patch
>=20
applied to master

thanks
Eric


