Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id A313B6FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2016 03:37:13 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id v62so6072211oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Sep 2016 20:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to; bh=w/jhj4Bo+JuvKZEfzw9gyLVoJNfLhrgHjaN1ptPVjQo=;
	b=zgBEYFdMU+Oh05tHkyUVCduv1INYs3kOkHyM2xltghgHwa48KW01yEXAbloMBOQJo9
	9wn5RGaUGyU0qHD2jryU/Xcpn2bC8oulduc3CgKWDbnC5FI8vnix/L2BpY26QC95Iwg9
	8tQDpVqMrmZoyanF74+Kk+prlt7YH3CC1RoPfXEVvs3rtD/Zxw+sGQZoM1dWGvFSCw6K
	KO08H0lH8shKK8sNREHL2XubXUkmqKRz4fa3evYiH9rt29v0ILzLQZbnfUUXKgU4WpxD
	n8qWwQIlqBtMhPQDlmAo/E8AS6McsycgKKSghC7Mvo7Hm5RGFN8x5cRse2HiYmZu5bNF
	ST1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to;
	bh=w/jhj4Bo+JuvKZEfzw9gyLVoJNfLhrgHjaN1ptPVjQo=;
	b=AD/WMuoJYPNx5xtU2yPP62VKlRWFrNNksXbqWbq6TsMrG8r7RLVs9UgUcVIn4XRC+I
	5a9OlqIlhGoEHoczTwnyzLi9nxWlPw90LnA2m5PLc6R1kyTvPzn/lB4Sjl6Prx1HlSzI
	a9cBOh4BJ6LZsN81zPQ8RVh2oo899EewMTG5faAyX0DudSM8p8sXyufgxvTO/amCBzdi
	vZ2DYQc5DxyyragbQw1wybYk+q/zvthgsrKlY7Sw83+W3YsNEfIdlAKaOQPLi1X/uXmJ
	D9lueqNWIt/eW80alufZDxYQ9RdmffhIVcuyLZVYifCzr1aUxrITc0v0c2r+X94ost1M
	65Aw==
X-Gm-Message-State: AE9vXwPUwcwesqkeaoZY9J5ENRbZzTNOyeCSp0vKBidCvApZSkZRR0l/SXDBdCeTjPIsW3A9gQ7h+5fKLU1m9A==
X-Received: by 10.202.244.16 with SMTP id s16mr22870716oih.189.1474169833748; 
	Sat, 17 Sep 2016 20:37:13 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Sat, 17 Sep 2016 20:36:53 -0700 (PDT)
In-Reply-To: <1474167179-6717-1-git-send-email-zhe.he@windriver.com>
References: <1474167179-6717-1-git-send-email-zhe.he@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 17 Sep 2016 20:36:53 -0700
X-Google-Sender-Auth: nQuWb56wxXYIuqQ4O8Rs9aOIRxI
Message-ID: <CABcZANn79dEop66L+-zU7EOyv++T-AcH4Qsg=Z_vkQzShbo4LQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Sun, 18 Sep 2016 03:37:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The purpose of =E2=80=98command=E2=80=99 is to *run* a command, not check i=
f it=E2=80=99s
available, and =E2=80=98type=E2=80=99 is mandated in SuSv3/SuSv4/POSIX. If =
dash doesn=E2=80=99t
provide it, it=E2=80=99s broken.

On Sat, Sep 17, 2016 at 7:52 PM, <zhe.he@windriver.com> wrote:

> From: "Tim K. Chan" <nirvanatk@gmail.com>
>
> Change bash style to dash style
>
> Signed-off-by: Tim K. Chan <nirvanatk@gmail.com>
> [Adjust context]
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb          | 2
> +-
>  meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb                 | 6
> ++++--
>  meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb                    | 2
> +-
>  meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb             | 2
> +-
>  meta-oe/recipes-support/postgresql/postgresql.inc                   | 2
> +-
>  5 files changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/
> iscsi-initiator-utils_2.0-873.bb b/meta-networking/recipes-
> daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> index 03f6459..17a5c1e 100644
> --- a/meta-networking/recipes-daemons/iscsi-initiator-utils/
> iscsi-initiator-utils_2.0-873.bb
> +++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/
> iscsi-initiator-utils_2.0-873.bb
> @@ -103,7 +103,7 @@ pkg_postinst_${PN}() {
>
>      if [ -e /etc/init.d/populate-volatile.sh ]; then
>          /etc/init.d/populate-volatile.sh update
> -    elif command -v systemd-tmpfiles >/dev/null; then
> +    elif command -p systemd-tmpfiles >/dev/null; then
>          systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/iscsi.conf
>      fi
>  }
> diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> index 3c3b4b5..2961b6b 100644
> --- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> +++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
> @@ -33,7 +33,9 @@ do_configure() {
>  }
>
>  do_compile () {
> -    . ${CONFIG_SITE}
> +    for CONFIG_SITE_ITEM in $CONFIG_SITE; do
> +       . $CONFIG_SITE_ITEM
> +    done
>      if [ X"$ac_cv_uint" =3D X"yes" ]; then
>          CFLAGS=3D"${CFLAGS} -DHAVE_uint"
>      fi
> @@ -68,7 +70,7 @@ do_install () {
>
>  pkg_postinst_${PN} () {
>      if [ -z "$D" ]; then
> -        if command -v systemd-tmpfiles >/dev/null; then
> +        if command -p systemd-tmpfiles >/dev/null; then
>              systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/
> lmbench.conf
>          elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
>              ${sysconfdir}/init.d/populate-volatile.sh update
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> index 3a3886b..ba0e2ac 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
> @@ -108,7 +108,7 @@ do_install_append() {
>
>  pkg_postinst_${PN} () {
>      if [ -z "$D" ]; then
> -        if command -v systemd-tmpfiles >/dev/null; then
> +        if command -p systemd-tmpfiles >/dev/null; then
>              systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/krb5.conf
>          elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
>              ${sysconfdir}/init.d/populate-volatile.sh update
> diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> index 84e465d..b1346b3 100644
> --- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> +++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> @@ -67,7 +67,7 @@ pkg_postinst_${PN} () {
>
>      if [ x"$D" !=3D "x" ]; then
>          OPTS=3D"--root=3D$D"
> -        if type systemctl >/dev/null 2>/dev/null; then
> +        if command -p systemctl >/dev/null 2>/dev/null; then
>                  systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE=
}
>          fi
>          exit 1
> diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc
> b/meta-oe/recipes-support/postgresql/postgresql.inc
> index e473f58..9592c79 100644
> --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> @@ -179,7 +179,7 @@ do_install_append() {
>
>      # install COPYRIGHT README HISTORY
>      install -d -m 0755 ${D}${docdir}/${BPN}
> -    for i in ${B}/{COPYRIGHT,README,HISTORY}
> ${B}/doc/{KNOWN_BUGS,MISSING_FEATURES,README*,bug.template}; do
> +    for i in ${B}/COPYRIGHT ${B}/README ${B}/HISTORY ${B}/doc/KNOWN_BUGS
> ${B}/doc/MISSING_FEATURES ${B}/doc/README* ${B}/doc/bug.template; do
>          [ -f $i ] && install $i ${D}${docdir}/${BPN}
>      done
>
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

