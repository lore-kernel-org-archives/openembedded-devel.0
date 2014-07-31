Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 466EF601A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 13:09:48 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id f8so9404283wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jul 2014 06:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UuJhcIb4Uig9euVrLNSNXriuFXoakJfasHHRmO/uRc4=;
	b=T9Np2N5NU3+F+3Nncg0XE5IfBUuWx0FaMZc55X3MPqvKegoj3vjlbXj837Yolu3AP2
	0NG8OQdm8rT5dumjHsghSu92hTVgVuxNWp1oNzuddpUpOLekqK9nzOIdnGfUlvEKXnDT
	bHhgPLm/3dxxBYyUkeF5I41nJRq0QlXVN6NwZWA0u1IBnBHZpncs/+HQQjUojwuWT46C
	BAMYm2aSOzKBzRQoTmEC+9SFleohPfjv5Sdou3u+JsP32eC4RNp/9EfFdzZDdsrhNZSq
	L5fpczE1wplyyfnAbwPOCOMQbvAn/S3ZmqIJzR7nIpe4izyrOoSEcbI+eEFJ8I5DtC0Q
	dCvQ==
X-Received: by 10.194.78.243 with SMTP id e19mr16285068wjx.119.1406812187707; 
	Thu, 31 Jul 2014 06:09:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gc8sm20492234wic.3.2014.07.31.06.09.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jul 2014 06:09:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 31 Jul 2014 15:10:10 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140731131010.GX16445@jama>
References: <1406803267-2669-1-git-send-email-b40869@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1406803267-2669-1-git-send-email-b40869@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: YangHaibo <b40869@freescale.com>
Subject: Re: [meta-webserver][PATCH v2] fcgi: integrate fcgi-2.4.0 and add OML license file
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
X-List-Received-Date: Thu, 31 Jul 2014 13:09:54 -0000
X-Groupsio-MsgNum: 51347
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yTwVabqJa5IUz21H"
Content-Disposition: inline

--yTwVabqJa5IUz21H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 06:41:07PM +0800, YangHaibo wrote:
> ---
>  meta-oe/licenses/OML                               | 28 ++++++++++++++++=
++++++
>  meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb     | 16 +++++++++++++
>  .../fcgi/files/Fix_EOF_not_declared_issue.patch    | 17 +++++++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 meta-oe/licenses/OML
>  create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb
>  create mode 100644 meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_de=
clared_issue.patch

In general I would prefer "fcgi" as BPN instead of "files" directory for
a bit faster lookup.

> diff --git a/meta-oe/licenses/OML b/meta-oe/licenses/OML
> new file mode 100644
> index 0000000..7e6bdfd
> --- /dev/null
> +++ b/meta-oe/licenses/OML
> @@ -0,0 +1,28 @@
> +This FastCGI application library source and object code (the
> +"Software") and its documentation (the "Documentation") are
> +copyrighted by Open Market, Inc ("Open Market").  The following terms
> +apply to all files associated with the Software and Documentation
> +unless explicitly disclaimed in individual files.
> +
> +Open Market permits you to use, copy, modify, distribute, and license
> +this Software and the Documentation for any purpose, provided that
> +existing copyright notices are retained in all copies and that this
> +notice is included verbatim in any distributions.  No written
> +agreement, license, or royalty fee is required for any of the
> +authorized uses.  Modifications to this Software and Documentation may
> +be copyrighted by their authors and need not follow the licensing
> +terms described here.  If modifications to this Software and
> +Documentation have new licensing terms, the new terms must be clearly
> +indicated on the first page of each file where they apply.
> +
> +OPEN MARKET MAKES NO EXPRESS OR IMPLIED WARRANTY WITH RESPECT TO THE
> +SOFTWARE OR THE DOCUMENTATION, INCLUDING WITHOUT LIMITATION ANY
> +WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  IN
> +NO EVENT SHALL OPEN MARKET BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY
> +DAMAGES ARISING FROM OR RELATING TO THIS SOFTWARE OR THE
> +DOCUMENTATION, INCLUDING, WITHOUT LIMITATION, ANY INDIRECT, SPECIAL OR
> +CONSEQUENTIAL DAMAGES OR SIMILAR DAMAGES, INCLUDING LOST PROFITS OR
> +LOST DATA, EVEN IF OPEN MARKET HAS BEEN ADVISED OF THE POSSIBILITY OF
> +SUCH DAMAGES.  THE SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS".
> +OPEN MARKET HAS NO LIABILITY IN CONTRACT, TORT, NEGLIGENCE OR
> +OTHERWISE ARISING OUT OF THIS SOFTWARE OR THE DOCUMENTATION.
> diff --git a/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb b/meta-webser=
ver/recipes-fcgi/fcgi/fcgi_2.4.0.bb
> new file mode 100644
> index 0000000..ceb5909
> --- /dev/null
> +++ b/meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "FastCGI is a protocol for interfacing interactive progr=
ams with a web server."
> +HOMEPAGE =3D "http://www.fastcgi.com"
> +LICENSE =3D "OML"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.TERMS;md5=3De3aacac3a647af6e7e31f18=
1cda0a06a"
> +
> +SRC_URI =3D "http://fossies.org/linux/www/fcgi-2.4.0.tar.gz \
> +           file://Fix_EOF_not_declared_issue.patch \
> +"
> +SRC_URI[md5sum] =3D "d15060a813b91383a9f3c66faf84867e"
> +SRC_URI[sha256sum] =3D "66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e=
76d2b4402d3f05b9"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}/"
> +
> +inherit autotools
> +
> +PARALLEL_MAKE =3D ""
> diff --git a/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_=
issue.patch b/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_i=
ssue.patch
> new file mode 100644
> index 0000000..b4cf080
> --- /dev/null
> +++ b/meta-webserver/recipes-fcgi/fcgi/files/Fix_EOF_not_declared_issue.p=
atch
> @@ -0,0 +1,17 @@
> +Upstream-Status: Pending
> +
> +Fix EOF not declared issue, following is the error log.
> +fcgio.cpp:70:72: error: 'EOF' was not declared in this scope
> +              if (FCGX_PutStr(pbase(), plen, this->fcgx) !=3D plen) retu=
rn EOF;
> +
> +Signed-off-by: Yang Haibo <b40869@freescale.com>
> +--- fcgi-ori/libfcgi/fcgio.cpp	2014-07-28 18:01:00.000000000 +0800
> ++++ fcgi-2.4.0/libfcgi/fcgio.cpp	2014-07-28 18:01:22.000000000 +0800
> +@@ -22,6 +22,7 @@
> + #define DLLAPI  __declspec(dllexport)
> + #endif
> +=20
> ++#include <stdio.h>
> + #include <limits.h>
> + #include "fcgio.h"
> +=20
> --=20
> 1.9.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yTwVabqJa5IUz21H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPaQDIACgkQN1Ujt2V2gBzGBACghy55bZrl2X+AL6Y/SiA8OfOC
jCIAn1wPSvzK3ftcg3h5vPi1E7bz8vUT
=dP39
-----END PGP SIGNATURE-----

--yTwVabqJa5IUz21H--
