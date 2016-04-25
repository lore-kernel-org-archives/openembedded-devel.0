Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 349A36018C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 15:44:16 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id e201so90565003wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 08:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=afTC/SLL9fCUUq4kYcNZFwCT6aaB67l6SF1VEt66vko=;
	b=kXsJL4pUSlMf1WEGa7vQgW1j46NbEUcQmjVuN47I/OcFADW177yPFUWqJWIS/4Tpt7
	EbHo+foH0rmqHsV37XHX3Wwa0EkUEx2uVCmpCun2YNNvngpKwbBJuGFAMtNG96zTitxz
	J3wZe1OYTo5ePMXKUCN/wbU3/Eq6bIg3G/LOsvvmQwgVuUmeX//+H4gQlAyJNGGHEzYV
	0E8wJqdzpPwfgSJfj9Q+2YvcUjlWEhZHuG00gvw53VEublUpMt+XN81iGqer0Ru2ckBH
	BP84A8Nq7PlLhiCYEXP4yL1tsc//vPzna448W2Uq+IsFWIx1HwY0Gs4kGpYnL99Yqy/W
	kCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=afTC/SLL9fCUUq4kYcNZFwCT6aaB67l6SF1VEt66vko=;
	b=A3/LFYxNywfdfSnhJcCTYj4tT+RAnv3RoKfUjzdlkZf3kr/OPjvXzvCCrRefChuQrc
	oK++InzniDxsjH4kgaXAqHmp0mdyazDVTh3A4Q8aUpxml4URxSw3eOWWV8Q05xyn3ECV
	kMx6bretrf/60sCJaM18ehoEi7awpKlCofsgKPwtTCZYxDKoe7CA3Ei5s57NKiwhkvHp
	wOGUPqYhBMhFAqmIeBRfKK2kkWIC5phcf1AJX20cW9Arigho3582ClTzsgsVBenHXMez
	LXfRoVFH7xOHl1Qv63HMh7NHTeaTOAIV5tN4j5ypST2bVliQvcYGD3AGXbkXVxx1G3NW
	sqRQ==
X-Gm-Message-State: AOPr4FU2nP3CTx3PGqUpPI/olGvC04rHOCrY86uBJNw+4L1jPIPIG66mMt2AUY1PiCUtFg==
X-Received: by 10.28.135.200 with SMTP id j191mr13537207wmd.54.1461599056514; 
	Mon, 25 Apr 2016 08:44:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	y91sm19400612wmh.10.2016.04.25.08.44.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Apr 2016 08:44:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 25 Apr 2016 17:44:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160425154425.GA2558@jama>
References: <1461543138-25293-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1461543138-25293-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Subject: Re: [meta-oe][PATCH] ltrace: Remove deprecated readdir_r()
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
X-List-Received-Date: Mon, 25 Apr 2016 15:44:17 -0000
X-Groupsio-MsgNum: 61152
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 24, 2016 at 05:12:18PM -0700, Khem Raj wrote:
> New glibc >=3D 2.24 will remove it

Is this still needed with:
http://patchwork.openembedded.org/patch/120317/
?

If so please rebase on top of master-next and resend.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-replace-readdir_r-with-readdir.patch      | 33 ++++++++++++++++=
++++++
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-r=
eaddir_r-with-readdir.patch
>=20
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_=
r-with-readdir.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-=
readdir_r-with-readdir.patch
> new file mode 100644
> index 0000000..8d2c264
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-replace-readdir_r-with-=
readdir.patch
> @@ -0,0 +1,33 @@
> +From 64f98f84fd88797e219f9dde1ca387fee4b509f0 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 24 Apr 2016 16:58:17 -0700
> +Subject: [PATCH] replace readdir_r with readdir
> +
> +glibc 2.24 has deprecated readdir_r
> +
> +https://sourceware.org/ml/libc-alpha/2016-02/msg00093.html
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Submitted
> +
> + sysdeps/linux-gnu/proc.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +Index: git/sysdeps/linux-gnu/proc.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/sysdeps/linux-gnu/proc.c
> ++++ git/sysdeps/linux-gnu/proc.c
> +@@ -240,9 +240,10 @@ process_tasks(pid_t pid, pid_t **ret_tas
> + 	size_t alloc =3D 0;
> +=20
> + 	while (1) {
> +-		struct dirent entry;
> + 		struct dirent *result;
> +-		if (readdir_r(d, &entry, &result) !=3D 0) {
> ++		errno =3D 0;
> ++		result =3D readdir(d);
> ++		if (errno !=3D 0) {
> + 			free(tasks);
> + 			return -1;
> + 		}
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/reci=
pes-devtools/ltrace/ltrace_git.bb
> index d8d037e..7a7174c 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -19,6 +19,7 @@ SRC_URI =3D "git://anonscm.debian.org/collab-maint/ltra=
ce.git;branch=3Dltrace-0.7 \
>             file://ltrace-0.7.2-unused-typedef.patch \
>             file://configure-allow-to-disable-selinux-support.patch \
>             file://0001-ltrace-fix-gcc-5-logical-not-parentheses.patch \
> +           file://0001-replace-readdir_r-with-readdir.patch \
>            "
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.8.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlceOWAACgkQN1Ujt2V2gBxSOACeKhj1s0CBQQK+tX7ckc3ScfnL
GS4AoJC4nwPQ567fge73A1uURYQIjotM
=s/5V
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
