Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1K8zYg-0004Mg-BG
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jun 2008 17:26:50 +0200
Received: from andromeda.vanille.de (e180141217.adsl.alicedsl.de
	[85.180.141.217])
	by drlauer-research.com (Postfix) with ESMTP id 90FE2584BF6;
	Wed, 18 Jun 2008 17:28:42 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Jun 2008 17:25:49 +0200
User-Agent: KMail/1.9.9
References: <ae36f8040806180812j37bca53lf1e06722a8246a55@mail.gmail.com>
In-Reply-To: <ae36f8040806180812j37bca53lf1e06722a8246a55@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200806181725.49146.mickey@vanille-media.de>
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: problems with bitbake
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 18 Jun 2008 15:26:50 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Mittwoch 18 Juni 2008 17:12:53 schrieb Lu=EDs Vit=F3rio Cargnini:
> Dear fellows:
>
> I'm restarting the development process based on openembedded with
> angstrom distro, after reconfiguring a new machine (ubuntu 8.04) to
> work properly I did the following:
> bitbake base-image ; bitbake console-image ; bitbake x11-image
>
> and get the following errors:
>
> ERROR: no files to build.

This almost always is a problem of BBFILES or BBPATH settings. Since your=20
BBFILES seems to be set (double check whether the regex is valid), double=20
check whether BBPATH points to the proper directories, so that Bitbake=20
actually has a chance to find your local.conf and its bitbake.conf.

=2D-=20
:M:


