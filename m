Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NwE13-00023Q-6F
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 14:24:25 +0200
Received: (qmail 4231 invoked by uid 813007); 29 Mar 2010 12:21:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 29 Mar 2010 12:21:12 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Mar 2010 14:21:18 +0200
User-Agent: KMail/1.13.1 (Linux/2.6.34-rc2; KDE/4.4.1; x86_64; ; )
References: <1269864930-2633-1-git-send-email-mchazaux@adeneo-embedded.com>
In-Reply-To: <1269864930-2633-1-git-send-email-mchazaux@adeneo-embedded.com>
MIME-Version: 1.0
Message-Id: <201003291421.21206.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
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
X-List-Received-Date: Mon, 29 Mar 2010 12:24:26 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia poniedzia=C5=82ek, 29 marca 2010 o 14:15:30 Micka=C3=ABl CHAZAUX napis=
a=C5=82(a):
> 	This patch adds support for the i.MX25 3Stack platform.
> 	It is based on the patches released by Freescale as
> 	part of LTIB.

> +++ b/conf/checksums.ini

Move checksums into recipe which uses it please.

> +++ b/conf/machine/mx25-3stack.conf
> @@ -0,0 +1,25 @@
> +#@TYPE: Machine
> +#@Name: Freescale i.MX25_3stack
> +#@DESCRIPTION: Machine configuration for Freescale i.MX25_3stack

Can you add URL to website of board?

> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-mx25-3stack"

> +PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"

Do we have virtual/bootloader? First heard of it.


> +++ b/recipes/linux/linux-mx25-3stack_2.6.28.bb

Merge it into linux/linux_2.6.28.bb


Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




