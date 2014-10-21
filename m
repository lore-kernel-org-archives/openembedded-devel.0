Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id EB4F665CAF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Oct 2014 18:57:12 +0000 (UTC)
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XgecL-0005sq-Np from Joe_MacDonald@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Oct 2014 11:57:13 -0700
Received: from burninator (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.3.181.6;
	Tue, 21 Oct 2014 11:57:13 -0700
Received: by burninator (Postfix, from userid 1000)	id C640658103D; Tue, 21
	Oct 2014 14:57:12 -0400 (EDT)
Date: Tue, 21 Oct 2014 14:57:12 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141021185712.GE18243@mentor.com>
References: <1413523465-30242-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1413523465-30242-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2][meta-networking] Revert "tftp-hpa: bug fix on empty file put error"
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
X-List-Received-Date: Tue, 21 Oct 2014 18:57:13 -0000
X-Groupsio-MsgNum: 52584
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IU5/I01NYhRvwH70"
Content-Disposition: inline

--IU5/I01NYhRvwH70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH 1/2][meta-networking] Revert "tftp-hpa: bug fix on empty file =
put error"] On 14.10.17 (Fri 13:24) rongqing.li@windriver.com wrote:

> From: "Roy.Li" <rongqing.li@windriver.com>
>=20
> This reverts commit b2eb21a5fbcb065e84ed582e87de21bdc3082f00.
>=20
> It make 3d8520a0b411[tftp-hpa: add error check for disk filled up]
> unable to work
> ---
>  .../tftp-hpa-bug-fix-on-empty-file-put-error.patch |   33 --------------=
------
>  .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |    1 -
>  2 files changed, 34 deletions(-)
>  delete mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-h=
pa-bug-fix-on-empty-file-put-error.patch
>=20
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-=
fix-on-empty-file-put-error.patch b/meta-networking/recipes-daemons/tftp-hp=
a/files/tftp-hpa-bug-fix-on-empty-file-put-error.patch
> deleted file mode 100644
> index aa29d9c..0000000
> --- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-=
empty-file-put-error.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -tftp-hpa: bug fix on empty file put error
> -
> -With the feature that checking the disk filled up, the return value of
> -function write_behind was checked and used to detect the disk status.
> -While for empty file, without data being written, this function will
> -return -1 thus the disk filled up error was miss-raised. Fix it.
> -
> -Upstream-Status: pending
> -
> -Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ----
> - tftpd/tftpd.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> ---- a/tftpd/tftpd.c
> -+++ b/tftpd/tftpd.c
> -@@ -1692,7 +1692,7 @@ static void tftp_recvfile(const struct f
> -             syslog(LOG_WARNING, "tftpd: write(ack): %m");
> -             goto abort;
> -         }
> --        if(write_behind(file, pf->f_convert) < 0) {
> -+        if(write_behind(file, pf->f_convert) < -1) {
> -             nak(ENOSPACE, NULL);
> -             (void)fclose(file);
> -             goto abort;
> -@@ -1727,7 +1727,7 @@ static void tftp_recvfile(const struct f
> -             goto abort;
> -         }
> -     } while (size =3D=3D segsize);
> --    if(write_behind(file, pf->f_convert) < 0) {
> -+    if(write_behind(file, pf->f_convert) < -1) {
> -         nak(ENOSPACE, NULL);
> -         (void)fclose(file);
> -         goto abort;
> diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/m=
eta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> index e58a4b1..1951747 100644
> --- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> +++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
> @@ -25,7 +25,6 @@ SRC_URI =3D "http://kernel.org/pub/software/network/tft=
p/tftp-hpa/tftp-hpa-${PV}.t
>             file://init \
>             file://add-error-check-for-disk-filled-up.patch \
>             file://tftp-hpa-bug-fix-on-separated-CR-and-LF.patch \
> -           file://tftp-hpa-bug-fix-on-empty-file-put-error.patch \
>  "
> =20
>  SRC_URI[md5sum] =3D "46c9bd20bbffa62f79c958c7b99aac21"
> --=20
> 1.7.10.4
>=20
--=20
-Joe MacDonald.
:wq

--IU5/I01NYhRvwH70
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQEcBAEBAgAGBQJURqyIAAoJEEn8ffcsOfaWtd8H/2pMgwVCnNj1N0QOHjyyFSXM
ezgRe4QgJ2yY4P+LcE5QJonbO5p4aBzifL7ovPFT7O/WOmgMDDGFU5AapgXpaInV
EYgdddBZNiQ/snFOdgqcvxyJv/N3TniqTZLmhjFbM3DIlmlv9VvvpVtbdE/DMBqv
+dkwQoOIKUfYyaS/ShTsm3lwbUV2OZDD9hGFiIhnggLLe9oOlM1h83dGAxdzA02E
cpImAa1F8CJmuqDdwOW09uclYjEXzHgZn3jk65Cs+uORVOrPDRwx7GCCHh/xaLsm
6yPAMULwbjGxVFJSecBaH77lNwxZkDmT+fM8EQ7JxjrTPCLw2Y0xvbUZk8PbJeU=
=aGbR
-----END PGP SIGNATURE-----

--IU5/I01NYhRvwH70--
