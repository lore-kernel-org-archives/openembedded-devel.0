Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1M3pqh-0002co-49
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 13:08:40 +0200
Received: (qmail 4110 invoked by uid 813007); 12 May 2009 11:02:01 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 12 May 2009 11:02:01 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 May 2009 13:01:28 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc3-00005-g51bc6b7-dirty; KDE/4.2.2;
	x86_64; ; )
References: <1242089668-11610-1-git-send-email-denis@denix.org>
	<1242089668-11610-6-git-send-email-denis@denix.org>
In-Reply-To: <1242089668-11610-6-git-send-email-denis@denix.org>
MIME-Version: 1.0
Message-Id: <200905121301.29194.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH 5/8] dm365-evm: add new machine definition
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
X-List-Received-Date: Tue, 12 May 2009 11:08:40 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia wtorek, 12 maja 2009 o 02:54:25 Denys Dmytriyenko napisa=C5=82(a):
> +++ b/conf/machine/dm365-evm.conf

> +require conf/machine/include/davinci.inc

> +PREFERRED_PROVIDER_xserver =3D "xserver-kdrive"
> +PREFERRED_PROVIDERS +=3D "virtual/${TARGET_PREFIX}depmod:module-init-too=
ls-cross"=20
> +
> +PREFERRED_VERSION_u-boot =3D "git"
> +UBOOT_MACHINE =3D "davinci_dvevm_config"

Move those lines to include/davinci.inc? All dm*-evm configs set them.=20
And I am not sure about module-init-tools-cross - if it is really required
then submit patch against classes/kernel.bbclass as it should take care of
it.

> +#MACHINE_EXTRA_RRECOMMENDS =3D ""

drop that

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




