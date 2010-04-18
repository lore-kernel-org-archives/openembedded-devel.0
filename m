Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1O3QYm-0003vA-FK
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Apr 2010 11:13:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id AD14A2C7F5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 09:08:18 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wC+okF1DBqs6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 09:08:14 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id 03F1B2C7DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Apr 2010 09:08:13 +0000 (UTC)
Message-ID: <4BCACC5B.1000601@gmail.com>
Date: Sun, 18 Apr 2010 11:09:47 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LNX.2.00.1004161842100.28729@asterix.crazy-teaparty.dyndns.org>
	<alpine.DEB.1.10.1004161853380.13187@vitus.devnet.local>
In-Reply-To: <alpine.DEB.1.10.1004161853380.13187@vitus.devnet.local>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/5] linux_2.6.32: add tb5200l support
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
X-List-Received-Date: Sun, 18 Apr 2010 09:13:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Vitus Jensen ha scritto, Il 16/04/2010 18:54:
> [PATCH 4/5] linux_2.6.32: add tb5200l support
>=20
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
>  recipes/linux/linux_2.6.32.bb   |    1 +
>  recipes/linux/tb5200l/defconfig | 1436 +++++++++++++++++++++++++++++++=
++++++++
>  2 files changed, 1437 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/linux/tb5200l/defconfig
>=20
> diff --git a/recipes/linux/linux_2.6.32.bb b/recipes/linux/linux_2.6.32=
.bb
> index 7f2ef0a..85710ac 100644
> --- a/recipes/linux/linux_2.6.32.bb
> +++ b/recipes/linux/linux_2.6.32.bb
> @@ -7,6 +7,7 @@ S =3D "${WORKDIR}/linux-${PV}"
>  # Mark archs/machines that this kernel supports
>  DEFAULT_PREFERENCE =3D "-1"
>  DEFAULT_PREFERENCE_simone =3D "1"
> +DEFAULT_PREFERENCE_tb5200l =3D "1"
>=20
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2;name=3Dkernel \
>             file://defconfig"


The /linux/linux_2.6.32.bb part of this patch doesn't apply and it is
composed by two files, next time submit each file in a single patch,
moreover you forgot to bump PR.

Please correct and resubmit.


Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


