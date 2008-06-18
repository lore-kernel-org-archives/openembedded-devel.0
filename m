Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1K91W9-00061G-7n
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jun 2008 19:32:21 +0200
Received: from andromeda.vanille.de (e180141217.adsl.alicedsl.de
	[85.180.141.217])
	by drlauer-research.com (Postfix) with ESMTP id 006A0584C35;
	Wed, 18 Jun 2008 19:34:13 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: angstrom-distro-devel@linuxtogo.org,
 lvcargnini@gmail.com
Date: Wed, 18 Jun 2008 19:31:16 +0200
User-Agent: KMail/1.9.9
References: <ae36f8040806180812j37bca53lf1e06722a8246a55@mail.gmail.com>
	<200806181725.49146.mickey@vanille-media.de>
	<ae36f8040806180956r7143e0eelc1adbf65112d9a3c@mail.gmail.com>
In-Reply-To: <ae36f8040806180956r7143e0eelc1adbf65112d9a3c@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200806181931.16473.mickey@vanille-media.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] problems with bitbake
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
X-List-Received-Date: Wed, 18 Jun 2008 17:32:21 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Mittwoch 18 Juni 2008 18:56:45 schrieb Lu=C3=ADs Vit=C3=B3rio Cargnini:
> I did as you said, I finded the error in expression regular, the error
> was in BBFILES I fixed it
> but the error now is:
>
>
> lvcargnini@protheus:~/instramed/openembedded$ bitbake nano
> ERROR:  Openembedded's config sanity checker detected a potential
> misconfiguration.
> 	Either fix the cause of this error or at your own risk disable the
> checker (see sanity.conf).
> 	Following is the list of potential problems / advisories:
>
> 	Please set TARGET_ARCH directly, or choose a MACHINE or DISTRO that does
> so. Please set TARGET_OS directly, or choose a MACHINE or DISTRO that does
> so. DISTRO 'None' not found. Please set a valid DISTRO in your local.conf

This indicates that it does not find all configuration files. Doublecheck y=
our=20
value of BBPATH and run bitbake -v -v -v to give us more debug output.

:M:


