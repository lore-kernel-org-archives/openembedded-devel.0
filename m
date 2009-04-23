Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LwyDk-0004rh-IG
	for openembedded-devel@openembedded.org; Thu, 23 Apr 2009 14:40:04 +0200
Received: (qmail 22137 invoked by uid 813007); 23 Apr 2009 12:35:25 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Apr 2009 12:35:25 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Apr 2009 14:35:06 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.30-rc2-00199-g51f1622-dirty; KDE/4.2.2;
	x86_64; ; )
References: <1240488138-32232-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1240488138-32232-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <200904231435.15840.marcin@juszkiewicz.com.pl>
Subject: Re: [PATCH] bitbake.conf: use rootfs.${PN} for IMAGE_ROOTFS
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
X-List-Received-Date: Thu, 23 Apr 2009 12:40:05 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia czwartek, 23 kwietnia 2009 o 14:02:18 Roman I Khimov napisa=C5=82(a):
> Allows parallel build for different images.
> ---
>  conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

> -IMAGE_ROOTFS =3D "${TMPDIR}/rootfs"
> +IMAGE_ROOTFS =3D "${TMPDIR}/rootfs.${PN}"

I would suggest ${TMPDIR}/rootfs/${PN}/ to not pollute TMPDIR with lot=20
of directories.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




