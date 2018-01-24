Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 Jan 2018 00:05:58 UTC
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2FBC178682
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 00:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 285A831C50AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 01:06:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id UPlAnKQGvIbs
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 01:05:58 +0100 (CET)
Received: from t460p (p4FE9ACAE.dip0.t-ipconnect.de [79.233.172.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id D588331C50AB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jan 2018 01:05:57 +0100 (CET)
Date: Wed, 24 Jan 2018 01:05:56 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20180124010556.367817ec@t460p>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF7363A9A988@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1513002095-5152-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363A9A988@G08CNEXMBPEKD01.g08.fujitsu.local>
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCHv2] samba: Add packagegroup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jan 2018 00:05:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 23 Jan 2018 07:38:33 +0000
"Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com> wrote:

> ping

You didn't answer my question about the dependency on perl:

http://lists.openembedded.org/pipermail/openembedded-devel/2017-December/11=
5938.html

Instead you removed the server meta package without explanation. It's hard =
to
follow the reasoning behind your patch iterations this way.

Btw, you kept one of the SUMMARY lines, which doesn't contain anything but =
the
package name.

Regards,
Andreas



>=20
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>=20
>=20
> -----Original Message-----
> From: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6=20
> Sent: Monday, December 11, 2017 10:22 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu.c=
om>
> Subject: [oe][meta-networking][PATCHv2] samba: Add packagegroup
>=20
> Add packagegroup for samba, for there are too many rpms in samba and it's=
 hard to manage.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../recipes-connectivity/samba/samba_4.6.7.bb         | 19 +++++++++++++=
+++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> index 2b227c9..0bacb02 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.6.7.bb
> @@ -162,7 +162,7 @@ PACKAGES =3D+ "${PN}-python ${PN}-pidl \
>               ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
>               winbind \
>               ${PN}-common ${PN}-base ${PN}-ctdb-tests \
> -             smbclient"
> +             smbclient ${PN}-client ${PN}-test"
> =20
>  python samba_populate_packages() {
>      def module_hook(file, pkg, pattern, format, basename):
> @@ -254,3 +254,20 @@ FILES_smbclient =3D "${bindir}/cifsdd \
> =20
>  RDEPENDS_${PN}-pidl_append =3D " perl"
>  FILES_${PN}-pidl =3D "${bindir}/pidl ${datadir}/perl5/Parse"
> +
> +SUMMARY_${PN}-client =3D "samba client"
> +RDEPENDS_${PN}-client =3D "\
> +    smbclient \
> +    winbind \
> +    registry-tools \
> +    ${PN}-pidl \
> +    "=20
> +
> +ALLOW_EMPTY_${PN}-client =3D "1"
> +
> +RDEPENDS_${PN}-test =3D "\
> +    ${PN}-ctdb-tests \
> +    ${PN}-testsuite \
> +    "
> +
> +ALLOW_EMPTY_${PN}-test =3D "1"


