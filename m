Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M3psA-0002o8-RC
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 13:10:11 +0200
Received: (qmail 7393 invoked by uid 813007); 12 May 2009 11:03:33 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 May 2009 11:03:33 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 May 2009 13:03:01 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <1242089668-11610-1-git-send-email-denis@denix.org>
	<1242089668-11610-8-git-send-email-denis@denix.org>
In-Reply-To: <1242089668-11610-8-git-send-email-denis@denix.org>
MIME-Version: 1.0
Message-Id: <200905121303.01792.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 7/8] linux-davinci: build linux-davinci kernels for dm6446, dm6467 and dm355 EVMs
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
X-List-Received-Date: Tue, 12 May 2009 11:10:13 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 12 maja 2009 o 02:54:27 Denys Dmytriyenko napisa=C5=82(a):
> +++ b/recipes/linux/linux-davinci_2.6.28.bb
> @@ -3,10 +3,12 @@ require linux.inc
>  DESCRIPTION =3D "Linux kernel for Davinci processors"
>  KERNEL_IMAGETYPE =3D "uImage"
> =20
> -COMPATIBLE_MACHINE =3D "davinci-sffsdr"
> +COMPATIBLE_MACHINE =3D "(dm6446-evm|dm6467-evm|davinci-sffsdr)"
 =20
> +++ b/recipes/linux/linux-davinci_git.bb

> -COMPATIBLE_MACHINE =3D "(davinci-dvevm|davinci-sffsdr|dm355-leopard)"
> +COMPATIBLE_MACHINE =3D "(dm6446-evm|dm6467-evm|dm355-evm|davinci-sffsdr|=
dm355-leopard)"

> -DEFAULT_PREFERENCE =3D "-1"
> +DEFAULT_PREFERENCE =3D "1"

So all Davinci devices starts to use GIT kernel instead of 2.6.28?

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




