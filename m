Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PLKLF-0004HN-I1
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 19:45:20 +0100
Received: by gyd12 with SMTP id 12so31981gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 10:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=MKe0xDgeFyobn/cQW9b4WnzBLZeb4ASGhhla/X99EdE=;
	b=o8KUbgRCsq/C2iAlZZnzg7jb/XFTsgUuSHlRkDjEj0fO1EKuOn1bnB9FTz2yIYuh5e
	AT/D2AcXM4pVL5c71VhuElNReFBM3zR07o9jtzaE9zfM08Ze85QvFLJpqYgNY1MhMgtp
	3neqbzm2wQF0GTLqhL1jsSw03aL40JiJ4j8vo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=LhPF4tpUZuYyQrwNJJR7g5O7LS1r9KFu9GhJJwYhv7McdCfqFOIXSr5ORpcHNwhZmi
	6J4sTei42oTu2jItHlMCM8pq/X4YvblykMLfcRgGM0p0/g+/LNF5y7qM2bM+vEOzbjsa
	Yo4ODE3iQycFFLuLFeRAB9wvWtWKdzhwQLObs=
Received: by 10.91.51.19 with SMTP id d19mr1240665agk.183.1290624241002; Wed,
	24 Nov 2010 10:44:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 24 Nov 2010 10:43:40 -0800 (PST)
In-Reply-To: <1290620636-21238-1-git-send-email-eric@eukrea.com>
References: <1290620636-21238-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Nov 2010 10:43:40 -0800
Message-ID: <AANLkTinJP7g6qG5Ai-Gf+wApL=xOjH2VXOEsyvthCSH4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] busybox 1.17.3: add latest fixes
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
X-List-Received-Date: Wed, 24 Nov 2010 18:45:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2010 at 9:43 AM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> from http://busybox.net/downloads/fixes-1.17.3/
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Looks ok. You could make the commit message a bit more elaborative
Please install it on release branch as well

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../busybox-1.17.3/busybox-1.17.3-iproute.patch =C2=A0 =C2=A0| =C2=
=A0 13 ++++++++
> =C2=A0.../busybox/busybox-1.17.3/busybox-1.17.3-ls.patch | =C2=A0 30 ++++=
++++++++++++++++
> =C2=A0recipes/busybox/busybox_1.17.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 ++-
> =C2=A03 files changed, 46 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/busybox/busybox-1.17.3/busybox-1.17.3-ip=
route.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.17.3/busybox-1.17.3-ls=
.patch
>
> diff --git a/recipes/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch =
b/recipes/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
> new file mode 100644
> index 0000000..03c749f
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.17.3/busybox-1.17.3-iproute.patch
> @@ -0,0 +1,13 @@
> +diff -urpN busybox-1.17.3/networking/libiproute/iproute.c busybox-1.17.3=
-iproute/networking/libiproute/iproute.c
> +--- busybox-1.17.3/networking/libiproute/iproute.c =C2=A0 =C2=A0 2010-10=
-09 21:57:14.000000000 +0200
> ++++ busybox-1.17.3-iproute/networking/libiproute/iproute.c =C2=A0 =C2=A0=
 2010-11-04 09:13:06.307919550 +0100
> +@@ -791,8 +791,8 @@ static int iproute_get(char **argv)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 req.r.rtm_dst_len =3D addr.bitlen;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0argv++;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv++;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 if (req.r.rtm_dst_len =3D=3D 0) {
> diff --git a/recipes/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch b/rec=
ipes/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch
> new file mode 100644
> index 0000000..1c4f895
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.17.3/busybox-1.17.3-ls.patch
> @@ -0,0 +1,30 @@
> +diff -urpN busybox-1.17.3/coreutils/ls.c busybox-1.17.3-ls/coreutils/ls.=
c
> +--- busybox-1.17.3/coreutils/ls.c =C2=A0 =C2=A0 =C2=A02010-10-09 21:57:1=
3.000000000 +0200
> ++++ busybox-1.17.3-ls/coreutils/ls.c =C2=A0 2010-11-06 00:26:48.46704957=
5 +0100
> +@@ -184,7 +184,7 @@ static const unsigned opt_flags[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 LIST_INO, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* i */
> + =C2=A0 =C2=A0 =C2=A0 LIST_LONG | STYLE_LONG, =C2=A0 =C2=A0 /* l - remem=
ber LS_DISP_HR in mask! */
> + =C2=A0 =C2=A0 =C2=A0 LIST_SHORT | STYLE_SINGLE, =C2=A0/* 1 */
> +- =C2=A0 =C2=A0 =C2=A00, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* g (don't show group) - hand=
led via OPT_g */
> ++ =C2=A0 =C2=A0 =C2=A00, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* g (don't show owner) - hand=
led via OPT_g */
> + =C2=A0 =C2=A0 =C2=A0 LIST_ID_NUMERIC, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* n */
> + =C2=A0 =C2=A0 =C2=A0 LIST_BLOCKS, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* s */
> + =C2=A0 =C2=A0 =C2=A0 DISP_ROWS, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0/* x */
> +@@ -621,7 +621,7 @@ static NOINLINE unsigned list_single(con
> + =C2=A0 =C2=A0 =C2=A0 if (all_fmt & LIST_ID_NAME) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (option_mask32 & OP=
T_g) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 column +=3D printf("%-8.8s ",
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_cached_username(dn->dstat.st_uid));
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_cached_groupname(dn->dstat.st_gid));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 column +=3D printf("%-8.8s %-8.8s ",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_cached_username(dn->dstat.st_uid),
> +@@ -631,7 +631,7 @@ static NOINLINE unsigned list_single(con
> + #endif
> + =C2=A0 =C2=A0 =C2=A0 if (all_fmt & LIST_ID_NUMERIC) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (option_mask32 & OP=
T_g)
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0column +=3D printf("%-8u ", (int) dn->dstat.st_uid);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0column +=3D printf("%-8u ", (int) dn->dstat.st_gid);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 column +=3D printf("%-8u %-8u ",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (int) dn->ds=
tat.st_uid,
> diff --git a/recipes/busybox/busybox_1.17.3.bb b/recipes/busybox/busybox_=
1.17.3.bb
> index 6956bde..f1a0b74 100644
> --- a/recipes/busybox/busybox_1.17.3.bb
> +++ b/recipes/busybox/busybox_1.17.3.bb
> @@ -1,10 +1,12 @@
> =C2=A0require busybox_1.1x.inc
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>
> =C2=A0SRC_URI +=3D "\
> =C2=A0 file://busybox-1.17.3-sort.patch =C2=A0\
> =C2=A0 file://busybox-1.17.3-dnsd.patch \
> =C2=A0 file://busybox-1.17.3-unicode.patch \
> + =C2=A0file://busybox-1.17.3-iproute.patch \
> + =C2=A0file://busybox-1.17.3-ls.patch \
> =C2=A0"
>
> =C2=A0SRC_URI[md5sum] =3D "a2ce1a951571da8c6e0eaf75b1acef60"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


