Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B940460703
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Aug 2014 16:10:42 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id m15so7773792wgh.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Aug 2014 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DBEcI/WR+K1yMDVqVBu3T/zDBQ69LF3EQ0iBpZEzJMU=;
	b=PeZ7jSeepGzOJ/pbi7tmcvJvUYgvwyzD6tdnTY7J40IO18Y0eZUWzs1U/7GdhuB14i
	D4kIxVZygA183TX1svMdcxhLic4Nk4WNSoDZToAsfxNcCSTHC+IkIKUm4x3ggjUADHJd
	95O9LbTyCiGX1E+5LZozA9Th+U2VDU5nR5H06CizWKuF1kpdTTy1PKZKgUrtSIJWyKtB
	DnVsfSSPdMQ79SywSh3Van64AOcpyyE4LXdGFYvKxmZtAVvHOCTL7syXbGxkojZvS0yE
	bhdXE/QA3kPpEct2uSpr5Bawwx3OasHBmNmSt+/7tLz48ZDXA5k5+//u27BTiyg44Fig
	V6gQ==
X-Received: by 10.194.100.34 with SMTP id ev2mr32510953wjb.76.1407168637304;
	Mon, 04 Aug 2014 09:10:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f6sm44505761wja.25.2014.08.04.09.10.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Aug 2014 09:10:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Aug 2014 18:11:03 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140804161103.GB2465@jama>
References: <1406861456-16786-1-git-send-email-b40869@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1406861456-16786-1-git-send-email-b40869@freescale.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: YangHaibo <b40869@freescale.com>
Subject: Re: [meta-webserver][PATCH v3] integrate fcgi-2.4.0 and add OML license file
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
X-List-Received-Date: Mon, 04 Aug 2014 16:10:47 -0000
X-Groupsio-MsgNum: 51407
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline

--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2014 at 10:50:56AM +0800, YangHaibo wrote:
> ---
>  meta-oe/licenses/OML                               | 28 ++++++++++++++++=
++++++
>  .../fcgi/fcgi/Fix_EOF_not_declared_issue.patch     | 17 +++++++++++++
>  meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb     | 16 +++++++++++++
>  3 files changed, 61 insertions(+)
>  create mode 100644 meta-oe/licenses/OML
>  create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_dec=
lared_issue.patch
>  create mode 100644 meta-webserver/recipes-fcgi/fcgi/fcgi_2.4.0.bb
>=20
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
> diff --git a/meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_i=
ssue.patch b/meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_iss=
ue.patch
> new file mode 100644
> index 0000000..b4cf080
> --- /dev/null
> +++ b/meta-webserver/recipes-fcgi/fcgi/fcgi/Fix_EOF_not_declared_issue.pa=
tch
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

fcgi-2.4.0 -> ${BP}

> +           file://Fix_EOF_not_declared_issue.patch \
> +"
> +SRC_URI[md5sum] =3D "d15060a813b91383a9f3c66faf84867e"
> +SRC_URI[sha256sum] =3D "66fc45c6b36a21bf2fbbb68e90f780cc21a9da1fffbae75e=
76d2b4402d3f05b9"
> +
> +S =3D "${WORKDIR}/${BPN}-${PV}/"

This is default, you can drop it.

> +
> +inherit autotools
> +
> +PARALLEL_MAKE =3D ""

Fails in current master, you need to add foreign to AC_INIT_AUTOMAKE

| Makefile.am: installing './INSTALL'
| Makefile.am: error: required file './NEWS' not found
| Makefile.am: error: required file './AUTHORS' not found
| Makefile.am: error: required file './ChangeLog' not found
| Makefile.am: installing './COPYING' using GNU General Public License v3 f=
ile
| Makefile.am:     Consider adding the COPYING file to the version control =
system
| Makefile.am:     for your code, to avoid questions about which license yo=
ur project uses
| automake: warning: autoconf input should be named 'configure.ac', not 'co=
nfigure.in'
| cgi-fcgi/Makefile.am:5: warning: 'CPPFLAGS' is a user variable, you shoul=
d not override it;
| cgi-fcgi/Makefile.am:5: use 'AM_CPPFLAGS' instead
| examples/Makefile.am:14: warning: 'CPPFLAGS' is a user variable, you shou=
ld not override it;
| examples/Makefile.am:14: use 'AM_CPPFLAGS' instead
| libfcgi/Makefile.am:4: warning: 'CPPFLAGS' is a user variable, you should=
 not override it;
| libfcgi/Makefile.am:4: use 'AM_CPPFLAGS' instead
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-eglibc/work/i586-oe-linux/fcgi/2.4.0-r0/temp/log.do=
_configure.23481)
NOTE: recipe fcgi-2.4.0-r0: task do_configure: Failed
ERROR: Task 35 (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-webs=
erver/recipes-fcgi/fcgi/fcgi_2.4.0.bb, do_configure) failed with exit code =
'1'


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

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPfsJcACgkQN1Ujt2V2gBxU9wCeMAM/sjhxLMq4tmAVZ0cvpDcK
fSAAnApd0ZzbdP1D2MoJwMuzVfl3gBlx
=cbm7
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
