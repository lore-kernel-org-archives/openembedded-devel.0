Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PbKba-0008Hy-Rc
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 23:16:19 +0100
Received: by yxd5 with SMTP id 5so7280261yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 14:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=4BFcxxvKDX4lWB+nwCMpp6EaAWF7KVcY8wcm9ph+b28=;
	b=jAHg3ruWNS3MPAlQp0PlRAjXPTp4UNGTr/Kq0uz8ldRrXoIi+F7fl4WTtLPxNHnSoa
	ZJ10axxEipsZ/ivd8S/f8zySm52smBHlTDUHXVGq9yehQOHJPWWVlLjuIjuX0bScE+XL
	Dp1ROtp9REjHjYsoOq9Wx1lOpDLm8lPByehBI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=VYedNBm+wN4pPK/nL3wkvN5zkCgBsKMMPZutvh2damK0T+AriZs1lPDCa2/w/NHbba
	9u+ItDqO9Uj1/+QOa2pya+cfbKZJVozpZ+sDZNcmiGRmMk/hriIUA6Z1R535AaLZwzAo
	dvw3Gj5EaIYkmOczQyje3KbD0ELAAwErZvBQE=
Received: by 10.90.80.18 with SMTP id d18mr3889332agb.31.1294438547500; Fri,
	07 Jan 2011 14:15:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 7 Jan 2011 14:15:25 -0800 (PST)
In-Reply-To: <1294435710-2622-1-git-send-email-eric@eukrea.com>
References: <1294435710-2622-1-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jan 2011 14:15:25 -0800
Message-ID: <AANLkTi=4WsYzkEMbY+861QseH9XQGsr=3nN4p36ynko6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] busybox-1.8.1 : add latest fixes
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
X-List-Received-Date: Fri, 07 Jan 2011 22:16:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 1:28 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> patches from : http://busybox.net/downloads/fixes-1.18.1/
> * hush : fix wrong prompt problem on empty interactive commants
> http://git.busybox.net/busybox/commit/?id=3D642e71a789156a96bcb18e6c5a0f5=
2416c49d3b5
> * mkswap : selinux build fix
> http://git.busybox.net/busybox/commit/?id=3De66a212081bcca521760ccff3a2da=
0deccd99340
> * suppress "'fast_strtol_10' defined but not used" warning
> http://git.busybox.net/busybox/commit/?id=3Df42c7b8fc161f5b3eb4e9c13f392d=
af7a11760c8
>

> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>


looks ok you have a typo in the commit message though

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../busybox-1.18.1/busybox-1.18.1-hush.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 28 ++++++++++++++++---
> =C2=A0.../busybox-1.18.1/busybox-1.18.1-mkswap.patch =C2=A0 =C2=A0 | =C2=
=A0 12 ++++++++
> =C2=A0.../busybox-1.18.1/busybox-1.18.1-warning.patch =C2=A0 =C2=A0| =C2=
=A0 28 ++++++++++++++++++++
> =C2=A0recipes/busybox/busybox_1.18.1.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 ++-
> =C2=A04 files changed, 66 insertions(+), 6 deletions(-)
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-mk=
swap.patch
> =C2=A0create mode 100644 recipes/busybox/busybox-1.18.1/busybox-1.18.1-wa=
rning.patch
>
> diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch b/r=
ecipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
> index 3e189a9..5281a52 100644
> --- a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
> +++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-hush.patch
> @@ -1,6 +1,6 @@
> =C2=A0diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1-hush/shell/hu=
sh.c
> =C2=A0--- busybox-1.18.1/shell/hush.c =C2=A0 =C2=A0 =C2=A0 =C2=A02010-12-=
21 05:31:04.000000000 +0100
> -+++ busybox-1.18.1-hush/shell/hush.c =C2=A0 2010-12-21 21:20:02.49365181=
3 +0100
> ++++ busybox-1.18.1-hush/shell/hush.c =C2=A0 2011-01-07 14:59:19.64995615=
6 +0100
> =C2=A0@@ -913,7 +913,7 @@ static const struct built_in_command blt
> =C2=A0 */
> =C2=A0#if HUSH_DEBUG
> @@ -177,7 +177,25 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.=
1-hush/shell/hush.c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0prn++;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pi =3D pi->next;
> -@@ -7445,7 +7461,7 @@ int hush_main(int argc, char **argv)
> +@@ -4106,7 +4122,16 @@ static struct pipe *parse_stream(char **
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_NULL_CMD(ctx.command)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& dest.length =3D=3D 0 && !dest.h=
as_quoted_part
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ) {
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* This newli=
ne can be ignored. But...
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * without th=
e below check, interactive shell
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * will ignor=
e even lines with bare <newline>,
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * and show t=
he continuation prompt:
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ps1_prompt=
$ <enter>
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ps2> _ =C2=
=A0 <=3D=3D=3D wrong prompt, should be ps1
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pipe *=
pi =3D ctx.list_head;
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pi->num_c=
mds !=3D 0)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0continue;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Treat newline as a command separator.=
 */
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done_pipe(&ctx, PIPE_SEQ);
> +@@ -7445,7 +7470,7 @@ int hush_main(int argc, char **argv)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned builtin_argc;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0char **e;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct variable *cur_var;
> @@ -186,7 +204,7 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1=
-hush/shell/hush.c
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT_G();
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (EXIT_SUCCESS) /* if EXIT_SUCCESS =3D=3D 0,=
 it is already done */
> -@@ -7454,17 +7470,17 @@ int hush_main(int argc, char **argv)
> +@@ -7454,17 +7479,17 @@ int hush_main(int argc, char **argv)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0G.argv0_for_re_execing =3D argv[0];
> =C2=A0#endif
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Deal with HUSH_VERSION */
> @@ -209,7 +227,7 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1=
-hush/shell/hush.c
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cur_var =3D G.top_var;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0e =3D environ;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (e) while (*e) {
> -@@ -7479,8 +7495,8 @@ int hush_main(int argc, char **argv)
> +@@ -7479,8 +7504,8 @@ int hush_main(int argc, char **argv)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e++;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* (Re)insert HUSH_VERSION into env (AFTER we =
scanned the env!) */
> @@ -220,7 +238,7 @@ diff -urpN busybox-1.18.1/shell/hush.c busybox-1.18.1=
-hush/shell/hush.c
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Export PWD */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0set_pwd_var(/*exp:*/ 1);
> -@@ -7840,18 +7856,6 @@ int hush_main(int argc, char **argv)
> +@@ -7840,18 +7865,6 @@ int hush_main(int argc, char **argv)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0parse_and_run_file(stdin);
>
> =C2=A0 final_return:
> diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch b=
/recipes/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
> new file mode 100644
> index 0000000..41dff57
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-mkswap.patch
> @@ -0,0 +1,12 @@
> +diff -urpN busybox-1.18.1/util-linux/mkswap.c busybox-1.18.1-mkswap/util=
-linux/mkswap.c
> +--- busybox-1.18.1/util-linux/mkswap.c 2010-12-20 01:41:27.000000000 +01=
00
> ++++ busybox-1.18.1-mkswap/util-linux/mkswap.c =C2=A02011-01-05 11:41:24.=
455856773 +0100
> +@@ -15,7 +15,7 @@ static void mkswap_selinux_setcontext(in
> + =C2=A0 =C2=A0 =C2=A0 if (!is_selinux_enabled())
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> +
> +- =C2=A0 =C2=A0 =C2=A0xfstat(fd, &stbuf, argv[0]);
> ++ =C2=A0 =C2=A0 =C2=A0xfstat(fd, &stbuf, path);
> + =C2=A0 =C2=A0 =C2=A0 if (S_ISREG(stbuf.st_mode)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 security_context_t new=
con;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 security_context_t old=
con =3D NULL;
> diff --git a/recipes/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch =
b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch
> new file mode 100644
> index 0000000..cda94bd
> --- /dev/null
> +++ b/recipes/busybox/busybox-1.18.1/busybox-1.18.1-warning.patch
> @@ -0,0 +1,28 @@
> +diff -urpN busybox-1.18.1/libbb/procps.c busybox-1.18.1-warning/libbb/pr=
ocps.c
> +--- busybox-1.18.1/libbb/procps.c =C2=A0 =C2=A0 =C2=A02010-12-21 05:29:4=
5.000000000 +0100
> ++++ busybox-1.18.1-warning/libbb/procps.c =C2=A0 =C2=A0 =C2=A02011-01-07=
 13:41:22.000000000 +0100
> +@@ -154,6 +154,7 @@ static unsigned long fast_strtoul_10(cha
> + =C2=A0 =C2=A0 =C2=A0 return n;
> + }
> +
> ++# if ENABLE_FEATURE_FAST_TOP
> + static long fast_strtol_10(char **endptr)
> + {
> + =C2=A0 =C2=A0 =C2=A0 if (**endptr !=3D '-')
> +@@ -162,6 +163,7 @@ static long fast_strtol_10(char **endptr
> + =C2=A0 =C2=A0 =C2=A0 (*endptr)++;
> + =C2=A0 =C2=A0 =C2=A0 return - (long)fast_strtoul_10(endptr);
> + }
> ++# endif
> +
> + static char *skip_fields(char *str, int count)
> + {
> +@@ -448,7 +450,7 @@ procps_status_t* FAST_FUNC procps_scan(p
> + //FIXME: is it safe to assume this field exists?
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sp->last_seen_on_cpu =3D fast_strtoul_10(&cp);
> + # endif
> +-#endif /* end of !ENABLE_FEATURE_TOP_SMP_PROCESS */
> ++#endif /* FEATURE_FAST_TOP */
> +
> + #if ENABLE_FEATURE_PS_ADDITIONAL_COLUMNS
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 sp->niceness =3D tasknice;
> diff --git a/recipes/busybox/busybox_1.18.1.bb b/recipes/busybox/busybox_=
1.18.1.bb
> index 2f78be9..69daef5 100644
> --- a/recipes/busybox/busybox_1.18.1.bb
> +++ b/recipes/busybox/busybox_1.18.1.bb
> @@ -1,10 +1,12 @@
> =C2=A0require busybox_1.1x.inc
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>
> =C2=A0SRC_URI +=3D " \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.18.1-hush.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.18.1-cpio.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://busybox-1.18.1-bzip2.patch \
> + =C2=A0 =C2=A0 =C2=A0 file://busybox-1.18.1-mkswap.patch \
> + =C2=A0 =C2=A0 =C2=A0 file://busybox-1.18.1-warning.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0SRC_URI[md5sum] =3D "f15fe752d8b7012aa5e59f83b88ccb1c"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


