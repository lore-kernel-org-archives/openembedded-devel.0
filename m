Received: from mail-qw0-f45.google.com ([209.85.216.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1R3UrU-00007c-Ki
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Sep 2011 17:25:24 +0200
Received: by qwj8 with SMTP id 8so792641qwj.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2011 08:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=Q6dsr2Ph7IpZHYWwgtowNyaB8tSOcyThKYGj1n/4gtI=;
	b=rwetfsxS5sWqcAngB6rqSpf5wjfFDCZxqFgCzuW0314lLVa9/DhovNgCJrx230nZaJ
	an52BD+2MypX4tB1JBTyMEANuDbc7M/6Oq44Mezg5Le5+Y5lXoJPku73io9EAJk3vM5a
	05R83vEUQO0wi9+wQ1iv5LNNPVSBORO9EfJjY=
Received: by 10.68.33.194 with SMTP id t2mr3579877pbi.302.1315927214200; Tue,
	13 Sep 2011 08:20:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.98 with HTTP; Tue, 13 Sep 2011 08:19:44 -0700 (PDT)
In-Reply-To: <1315920550-3977-1-git-send-email-sledz@dresearch-fe.de>
References: <1315920550-3977-1-git-send-email-sledz@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Sep 2011 08:19:44 -0700
Message-ID: <CAMKF1srA9RXsXh+AcQWqK+Z0v=UFrH=qkpyVBuXAeMru3YARbw@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eglibc-2.9: allow building with newer GNU make
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
X-List-Received-Date: Tue, 13 Sep 2011 15:25:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 13, 2011 at 6:29 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> GNU make >=3D 3.82 does not allow mixed implicit and normal rules
>
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
> =C2=A0recipes/eglibc/eglibc-2.9/make-3.82.patch | =C2=A0 16 +++++++++++++=
+++
> =C2=A0recipes/eglibc/eglibc_2.9.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A03 ++-
> =C2=A02 files changed, 18 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 recipes/eglibc/eglibc-2.9/make-3.82.patch
>
> diff --git a/recipes/eglibc/eglibc-2.9/make-3.82.patch b/recipes/eglibc/e=
glibc-2.9/make-3.82.patch
> new file mode 100644
> index 0000000..b0a45d9
> --- /dev/null
> +++ b/recipes/eglibc/eglibc-2.9/make-3.82.patch
> @@ -0,0 +1,16 @@
> +diff -Nurd libc.orig//manual/Makefile libc/manual/Makefile
> +--- libc.orig//manual/Makefile 2011-09-13 14:49:57.428424088 +0200
> ++++ libc/manual/Makefile =C2=A0 =C2=A0 =C2=A0 2011-09-13 14:50:47.009620=
484 +0200
> +@@ -242,7 +242,11 @@
> + .PHONY: stubs
> + stubs: $(objpfx)stubs
> + endif
> +-$(objpfx)stubs ../po/manual.pot $(objpfx)stamp%:
> ++$(objpfx)stubs ../po/manual.pot:
> ++ =C2=A0 =C2=A0 =C2=A0$(make-target-directory)
> ++ =C2=A0 =C2=A0 =C2=A0touch $@
> ++
> ++$(objpfx)stamp%:
> + =C2=A0 =C2=A0 =C2=A0 $(make-target-directory)
> + =C2=A0 =C2=A0 =C2=A0 touch $@
> +
> diff --git a/recipes/eglibc/eglibc_2.9.bb b/recipes/eglibc/eglibc_2.9.bb
> index be60ba7..7e0fa55 100644
> --- a/recipes/eglibc/eglibc_2.9.bb
> +++ b/recipes/eglibc/eglibc_2.9.bb
> @@ -3,7 +3,7 @@ require eglibc.inc
> =C2=A0DEPENDS +=3D "gperf-native"
> =C2=A0FILESPATHPKG =3D. "eglibc-svn:"
> =C2=A0PV =3D "2.9"
> -PR =3D "${INC_PR}.10"
> +PR =3D "${INC_PR}.11"
> =C2=A0PR_append =3D "+svnr${SRCPV}"
> =C2=A0SRCREV=3D"10153"
> =C2=A0EGLIBC_BRANCH=3D"eglibc-2_9"
> @@ -14,6 +14,7 @@ SRC_URI =3D "svn://svn.eglibc.org/branches;module=3D${E=
GLIBC_BRANCH};proto=3Dsvn \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://shorten-build-commands.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sh4_set_fpscr.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://sh4_local-fpscr_values.pa=
tch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make-3.82.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://etc/ld.so.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://generate-supported.mk"
> =C2=A0S =3D "${WORKDIR}/${EGLIBC_BRANCH}/libc"
> --
> 1.7.3.4
>
>

patch in essence is fine. Address Paul's concern about patch header

Acked-by: Khem Raj <raj.khem@gmail.com>


