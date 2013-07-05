Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id E53126AFF5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 10:02:16 +0000 (UTC)
Received: from e6520eb (pac33-3-88-170-243-169.fbx.proxad.net [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 93BFCA611A;
	Fri,  5 Jul 2013 12:02:10 +0200 (CEST)
Date: Fri, 5 Jul 2013 12:02:09 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130705120209.1f2e518a@e6520eb>
In-Reply-To: <1373018084-5555-1-git-send-email-B40290@freescale.com>
References: <1373018084-5555-1-git-send-email-B40290@freescale.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: b40527@freescale.com
Subject: Re: [meta-oe][PATCH] samba:Add /run into package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jul 2013 10:02:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Chunrong,

Le Fri, 5 Jul 2013 17:54:44 +0800,
Chunrong Guo <B40290@freescale.com> a =C3=A9crit :

> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
>  meta-oe/recipes-connectivity/samba/samba-basic.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/samba-basic.inc b/meta-oe=
/recipes-connectivity/samba/samba-basic.inc
> index d0fa8e6..6cead01 100644
> --- a/meta-oe/recipes-connectivity/samba/samba-basic.inc
> +++ b/meta-oe/recipes-connectivity/samba/samba-basic.inc
> @@ -20,6 +20,7 @@ FILES_${PN} +=3D "${libdir}/vfs/*.so \
>                  ${libdir}/*.dat \
>                  ${libdir}/auth/*.so \
>                  ${libdir}/security/pam_smbpass.so \
> +                /run \
>  "
> =20
>  FILES_${PN}-dbg +=3D "${libdir}/vfs/.debug/*.so \

please read this thread :
http://lists.openembedded.org/pipermail/openembedded-devel/2013-July/091257=
.html

Best regards,
Eric

