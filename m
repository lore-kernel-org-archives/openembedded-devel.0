Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QioLw-00029b-Fl
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jul 2011 15:59:20 +0200
Received: by eye4 with SMTP id 4so1527154eye.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jul 2011 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PdszUHbCVapx87IQuMUjcWeWBDk+0zNXLvgiNpYaWMU=;
	b=vfAezQBu6XsjhGgpO9amrR8Por9rMFVIADir/VaW7ocrXKayAjxo1jrdNxpXqS2nu3
	0pREQrbC4L9AaZ5UghGtSVa+SKZ9pPJP/eNne7W4KXiQfjjmoIp2LpSNtkNoUeCT1zSl
	p4ceqf1P5syp35wRmPbIRpcDeQyaVrtGeZ02s=
Received: by 10.14.127.3 with SMTP id c3mr2288549eei.21.1310997316052;
	Mon, 18 Jul 2011 06:55:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p49sm447962eef.24.2011.07.18.06.55.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 06:55:14 -0700 (PDT)
Date: Mon, 18 Jul 2011 15:55:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110718135506.GB3412@jama.jama.net>
References: <1309990447-4283-1-git-send-email-agnel.joel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1309990447-4283-1-git-send-email-agnel.joel@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: joelagnel@ti.com, jdk@ti.com, k-kooi@ti.com
Subject: Re: [PATCH v2] libxml: Deleted patch that is already applied in source tarball
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
X-List-Received-Date: Mon, 18 Jul 2011 13:59:20 -0000
X-Groupsio-MsgNum: 33201
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline

--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2011 at 05:14:07PM -0500, Joel A Fernandes wrote:
> * Deleted a patch that appears to be already applied to the checked out s=
ource and is causing do_patch in libxml2 to fail
>=20
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> ---
> Changes since previous patch:
>  Update commit summary to be more relevant.

This patch was applied after tagging 2.7.8 as you can see here:
http://git.gnome.org/browse/libxml2/log/

I've redownloaded 2.7.8 tarball just in case someone did change it
upstream and it's still the same. So OE is right and you probably didn't
clean your libxml build directory so you have that patch applied from
previous run (maybe killed by Ctrl+C in do_patch phase).

Please do bitbake -c clean libxml2 first and check again.

Regards,

> Not sure if should bump the PR in this case? If not, please ignore this n=
ote
>=20
>  .../0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch |   29 --------------=
------
>  recipes/libxml/libxml2_2.7.8.bb                    |    1 -
>  2 files changed, 0 insertions(+), 30 deletions(-)
>  delete mode 100644 recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c7=
0d8fbf030e270c37.patch
>=20
> diff --git a/recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf0=
30e270c37.patch b/recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8f=
bf030e270c37.patch
> deleted file mode 100644
> index f94350d..0000000
> --- a/recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf030e270c=
37.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 0cbeb50ee03ce582a0c979c70d8fbf030e270c37 Mon Sep 17 00:00:00 2001
> -From: Daniel Veillard <veillard@redhat.com>
> -Date: Mon, 15 Nov 2010 11:06:29 +0000
> -Subject: Fix a potential memory access error
> -
> -in case of a previus allocation error
> ----
> -diff --git a/xpath.c b/xpath.c
> -index 4d6826d..81e33f6 100644
> ---- a/xpath.c
> -+++ b/xpath.c
> -@@ -3575,13 +3575,13 @@ xmlXPathNodeSetAdd(xmlNodeSetPtr cur, xmlNodePtr=
 val) {
> -     } else if (cur->nodeNr =3D=3D cur->nodeMax) {
> -         xmlNodePtr *temp;
> -=20
> --        cur->nodeMax *=3D 2;
> --	temp =3D (xmlNodePtr *) xmlRealloc(cur->nodeTab, cur->nodeMax *
> -+	temp =3D (xmlNodePtr *) xmlRealloc(cur->nodeTab, cur->nodeMax * 2 *
> - 				      sizeof(xmlNodePtr));
> - 	if (temp =3D=3D NULL) {
> - 	    xmlXPathErrMemory(NULL, "growing nodeset\n");
> - 	    return;
> - 	}
> -+        cur->nodeMax *=3D 2;
> - 	cur->nodeTab =3D temp;
> -     }
> -     if (val->type =3D=3D XML_NAMESPACE_DECL) {
> ---
> -cgit v0.8.3.1
> diff --git a/recipes/libxml/libxml2_2.7.8.bb b/recipes/libxml/libxml2_2.7=
=2E8.bb
> index 1a71c2b..7d0c451 100644
> --- a/recipes/libxml/libxml2_2.7.8.bb
> +++ b/recipes/libxml/libxml2_2.7.8.bb
> @@ -1,7 +1,6 @@
>  require libxml2.inc
> =20
>  SRC_URI +=3D "\
> -  file://0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch \
>    file://df83c17e5a2646bd923f75e5e507bc80d73c9722.patch \
>    file://fec31bcd452e77c10579467ca87a785b41115de6.patch \
>    file://00819877651b87842ed878898ba17dba489820f0.patch \
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk4kOzoACgkQN1Ujt2V2gBwS3gCfdoTDeVJ548OCKRqIDqnJYqXV
cBMAoKByEzPHsGqILfFGqrgYJ8TsmXsl
=mOWI
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
