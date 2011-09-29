Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R9HX5-0002SE-W2
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Sep 2011 16:24:16 +0200
Received: by pzd13 with SMTP id 13so1729384pzd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2011 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=wTEadVobk3y+YqRWqgD/CCMBio8/w/a5rxotjWJ/nXA=;
	b=KGeIi+9ejqhaljEMj1PJhe3rz/MjmJq1YElS5mdwS6PYSPDU/Pu6YNORznE3ktK9Wy
	GJl3qVgjSH/2m8zTxg17oYnY8u32EsuCFUxdOVQNH6RAa7lQ+cScyUQJLB4Ar0yCiwu9
	hOfmXNEDir2rXDKnpBERjAu5TP4IhWJHAC67s=
Received: by 10.68.31.199 with SMTP id c7mr13413693pbi.73.1317305926523; Thu,
	29 Sep 2011 07:18:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Thu, 29 Sep 2011 07:18:15 -0700 (PDT)
In-Reply-To: <1317304678-27094-1-git-send-email-Martin.Jansa@gmail.com>
References: <20110929092859.GB5030@jama.jama.net>
	<1317304678-27094-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Sep 2011 07:18:15 -0700
Message-ID: <CAMKF1spa2wDNGzmOxPPhxEKKyHGo1RxjLEkNasfk8vP+65PFFg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gcc-4.6: drop/update few patches from gcc-4_6-branch-linaro-backports.inc
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
X-List-Received-Date: Thu, 29 Sep 2011 14:24:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2011 at 6:57 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * they need to be rebased after
> =C2=A0http://git.openembedded.org/cgit.cgi/openembedded-core/commit/?id=
=3Ded7deecb9503420fbf8071445e077c32beda8dc4
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I had a patch which should have addressed it. I was waiting for update in c=
ore
can you try this one out ? this should address this issue as well.

http://patches.openembedded.org/patch/12407/

> ---
> =C2=A0.../gcc-4.6/linaro/gcc-4.6-linaro-r106741.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A04 ++--
> =C2=A0.../gcc-4.6/linaro/gcc-4.6-linaro-r106742.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A09 ++++-----
> =C2=A0.../gcc/gcc-4_6-branch-linaro-backports.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 --
> =C2=A03 files changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106741.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106741.patch
> index 84f6f64..f76914f 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.=
patch
> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106741.=
patch
> @@ -188,8 +188,8 @@
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Try to simplify the expression furth=
er. =C2=A0*/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx tor =3D simplify_gen_binary (IOR, m=
ode, XEXP (x, 0), XEXP (x, 1));
> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D combine_simplify_rtx (tor, mode, i=
n_dest);
> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D combine_simplify_rtx (tor, mode, i=
n_dest, 0);
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D combine_simplify_rtx (tor, VOIDmod=
e, in_dest);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0temp =3D combine_simplify_rtx (tor, VOIDmod=
e, in_dest, 0);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we could, great. =C2=A0If not, do=
 not go ahead with the IOR
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 replacement, since PLUS appears=
 in many special purpose
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106742.patch b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r=
106742.patch
> index d14f06c..836b76f 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.=
patch
> +++ b/meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106742.=
patch
> @@ -1582,15 +1582,14 @@
> =C2=A0=3D=3D=3D modified file 'gcc/config/arm/predicates.md'
> =C2=A0--- old/gcc/config/arm/predicates.md =C2=A0 2011-04-07 10:52:12 +00=
00
> =C2=A0+++ new/gcc/config/arm/predicates.md =C2=A0 2011-05-03 15:14:56 +00=
00
> -@@ -683,3 +683,7 @@
> - =C2=A0 =C2=A0}
> - =C2=A0 return true;
> - })
> +@@ -686,3 +686,7 @@
> +
> + (define_special_predicate "add_operator"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(match_code "plus"))
> =C2=A0+
> =C2=A0+(define_special_predicate "neon_struct_operand"
> =C2=A0+ =C2=A0(and (match_code "mem")
> =C2=A0+ =C2=A0 =C2=A0 =C2=A0 (match_test "TARGET_32BIT && neon_vector_mem=
_operand (op, 2)")))
> -
> =C2=A0=3D=3D=3D modified file 'gcc/doc/tm.texi'
> =C2=A0--- old/gcc/doc/tm.texi =C2=A0 =C2=A0 =C2=A0 =C2=A02011-01-22 19:35=
:10 +0000
> =C2=A0+++ new/gcc/doc/tm.texi =C2=A0 =C2=A0 =C2=A0 =C2=A02011-05-03 15:17=
:25 +0000
> diff --git a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports=
.inc b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> index 86dceab..e256e15 100644
> --- a/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> +++ b/meta-oe/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
> @@ -21,11 +21,9 @@ file://linaro/gcc-4.6-linaro-r106755.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106759.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106761.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106762.patch \
> -file://linaro/gcc-4.6-linaro-r106763.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106764.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106766.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106768.patch \
> -file://linaro/gcc-4.6-linaro-r106769.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106770.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106771.patch \
> =C2=A0file://linaro/gcc-4.6-linaro-r106772.patch \
> --
> 1.7.6.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


