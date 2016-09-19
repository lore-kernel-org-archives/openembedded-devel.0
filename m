Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 58E3077040
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 14:35:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so15364260wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=N6T5Amd5XzBJbKAPh7lmU2TPo+7NhIdIlGslSbaJ7cY=;
	b=wW3DmSVQfPBHBEL7tl9bkP+lNwjncE/GZdZ6WoqgO1kQPLhaJPeqiAsSdGfo7EZiO9
	SfwfnQxEIvb9l6ZPGbEdqDMNNBNtRY5j/XiOqQxiBHGKKmC9yjj/UhLoUxD3sWFztBbZ
	TchOWFX7suRKEXmp7b7tHlKpBRNXQabUApXN2T/keRRVuZKySFxJV8WQA/G2uXA1a7/C
	sX8bIUvwN4Wi9uifx0M5MOk6k8HKyWlTjg3I2RZZXJIIQVj+xlocG/y7rLJsJmhWSpyM
	3Prcn3S2AXH3HS0+wMKEeSp/0Bwgzn7UcKzMFjfCjfNm3pVwCP200LrFGjzWn38lPgU+
	J0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=N6T5Amd5XzBJbKAPh7lmU2TPo+7NhIdIlGslSbaJ7cY=;
	b=HGNTOyfKL8Uulm/Pc+WwDfp2aJYr6G1LzxKMFlIB40BU74+Xy9JfHeDE/54e1F1fsb
	U3kMFg0x0il7XlNdFkgK8+DxsBBON/J0Vrt+4SXBncytM0sRTufjmtVzMmutuJQSzf0F
	XcT/3V1KeO0db3yMpzO83ON4/UyrGzcqcAhIyBn8aPY+aP4e+EW3m50hiom3Z7PP4yBx
	lzSb5xI4sMymyAmcdByLSv68XkFUfvbERE8+IQ3c40/PXh/TuMtzTAlM0Vu7UfuOJ0Dr
	UmG0G5JOfYMGXTmWF+H8dzrrKotXUKZUYzp28aiRvRPx8V+w5knJQHHCDKHv8wI5CrGF
	6jcg==
X-Gm-Message-State: AE9vXwMtsd/MmDlsoeWQ+o+7wTYsYY99fN5T6pkbqUGqUCCDBitq7V/g8WXXwrpdoZtBFQ==
X-Received: by 10.28.56.196 with SMTP id f187mr9173722wma.120.1474295752355;
	Mon, 19 Sep 2016 07:35:52 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	g17sm22420901wme.3.2016.09.19.07.35.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Sep 2016 07:35:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 19 Sep 2016 16:35:51 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160919143551.GA2630@jama>
References: <1474167179-6717-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1474167179-6717-1-git-send-email-zhe.he@windriver.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Subject: Re: [meta-oe] [PATCH] bash2dash conversion
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
X-List-Received-Date: Mon, 19 Sep 2016 14:35:53 -0000
X-Groupsio-MsgNum: 63188
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 10:52:59AM +0800, zhe.he@windriver.com wrote:
> From: "Tim K. Chan" <nirvanatk@gmail.com>
>=20
> Change bash style to dash style
>=20
> Signed-off-by: Tim K. Chan <nirvanatk@gmail.com>
> [Adjust context]
> Signed-off-by: He Zhe <zhe.he@windriver.com>

2016-09-19 16:30:09 URL:https://patchwork.openembedded.org/patch/131797/mbo=
x/ [4648] -> "pw-am-131797.patch" [1]
Applying: bash2dash conversion
=2Egit/rebase-apply/patch:32: space before tab in indent.
        . $CONFIG_SITE_ITEM
error: meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb: does not exist in =
index
Patch failed at 0001 bash2dash conversion
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

2016-09-19 16:30:09 URL:https://patchwork.openembedded.org/patch/131797/mbo=
x/ [4648] -> "pw-am-131797.patch" [1]
Applying: bash2dash conversion
=2Egit/rebase-apply/patch:32: space before tab in indent.
        . $CONFIG_SITE_ITEM
error: meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb: does not exist in =
index
Patch failed at 0001 bash2dash conversion
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".


> ---
>  .../iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb          | 2 =
+-
>  meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb                 | 6 =
++++--
>  meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb                    | 2 =
+-
>  meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb             | 2 =
+-
>  meta-oe/recipes-support/postgresql/postgresql.inc                   | 2 =
+-
>  5 files changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-=
initiator-utils_2.0-873.bb b/meta-networking/recipes-daemons/iscsi-initiato=
r-utils/iscsi-initiator-utils_2.0-873.bb
> index 03f6459..17a5c1e 100644
> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiat=
or-utils_2.0-873.bb
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiat=
or-utils_2.0-873.bb
> @@ -103,7 +103,7 @@ pkg_postinst_${PN}() {
> =20
>      if [ -e /etc/init.d/populate-volatile.sh ]; then
>          /etc/init.d/populate-volatile.sh update
> -    elif command -v systemd-tmpfiles >/dev/null; then
> +    elif command -p systemd-tmpfiles >/dev/null; then
>          systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/iscsi.conf
>      fi
>  }
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-o=
e/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 3c3b4b5..2961b6b 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -33,7 +33,9 @@ do_configure() {
>  }
> =20
>  do_compile () {
> -    . ${CONFIG_SITE}
> +    for CONFIG_SITE_ITEM in $CONFIG_SITE; do
> +    	. $CONFIG_SITE_ITEM
> +    done
>      if [ X"$ac_cv_uint" =3D X"yes" ]; then
>          CFLAGS=3D"${CFLAGS} -DHAVE_uint"
>      fi
> @@ -68,7 +70,7 @@ do_install () {
> =20
>  pkg_postinst_${PN} () {
>      if [ -z "$D" ]; then
> -        if command -v systemd-tmpfiles >/dev/null; then
> +        if command -p systemd-tmpfiles >/dev/null; then
>              systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/lmbench.c=
onf
>          elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
>              ${sysconfdir}/init.d/populate-volatile.sh update
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/r=
ecipes-connectivity/krb5/krb5_1.13.2.bb
> index 3a3886b..ba0e2ac 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> @@ -108,7 +108,7 @@ do_install_append() {
> =20
>  pkg_postinst_${PN} () {
>      if [ -z "$D" ]; then
> -        if command -v systemd-tmpfiles >/dev/null; then
> +        if command -p systemd-tmpfiles >/dev/null; then
>              systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/krb5.conf
>          elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
>              ${sysconfdir}/init.d/populate-volatile.sh update
> diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/me=
ta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> index 84e465d..b1346b3 100644
> --- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> +++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> @@ -67,7 +67,7 @@ pkg_postinst_${PN} () {
> =20
>      if [ x"$D" !=3D "x" ]; then
>          OPTS=3D"--root=3D$D"
> -        if type systemctl >/dev/null 2>/dev/null; then
> +        if command -p systemctl >/dev/null 2>/dev/null; then
>                  systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>          fi
>          exit 1
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/=
recipes-support/postgresql/postgresql.inc
> index e473f58..9592c79 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -179,7 +179,7 @@ do_install_append() {
> =20
>      # install COPYRIGHT README HISTORY
>      install -d -m 0755 ${D}${docdir}/${BPN}
> -    for i in ${B}/{COPYRIGHT,README,HISTORY} ${B}/doc/{KNOWN_BUGS,MISSIN=
G_FEATURES,README*,bug.template}; do
> +    for i in ${B}/COPYRIGHT ${B}/README ${B}/HISTORY ${B}/doc/KNOWN_BUGS=
 ${B}/doc/MISSING_FEATURES ${B}/doc/README* ${B}/doc/bug.template; do
>          [ -f $i ] && install $i ${D}${docdir}/${BPN}
>      done
> =20
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlff9usACgkQN1Ujt2V2gBxIzACgha7fOetaujrJ0TODek3GIoX0
5xcAmQEV6PxdBKXTl0obsiba++na8Jnj
=BeSf
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
