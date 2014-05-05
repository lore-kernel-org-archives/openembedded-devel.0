Return-Path: <smennetrier@connected-labs.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id BA25165DDE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 09:30:51 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id o6so1158470oag.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 02:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=i3SiXum7omATbsnAyJnBff8QNxElxDGSNRHgb3nuI0c=;
	b=K086VG6xDH4j5UDiJwhGBQsNFMe9Jq9YTJ+hA/o+2WwhKGAAmpfUjLStU7A2A+MgXx
	RwwSFW4DJqh06v5/4suILm7QNw9KUQfQDeh3woZMtauEXjumjqsMblhYO2J1JUm5mg1g
	gLXmoJ9bj1EqQkHVPlm8TQ343OJOmjoGbBrdonR8sVtEwgDndEuLy9ubnVfAGSpf7tu5
	a+LuC0z+YuEMS8R+PAKHMavxUD6Y3vqc155S2iy6vg9cGr17rKoHFKt4rcIlAsjjEyWP
	AI27ayRZFmxOw/OZwHqyrFnYOzLBB30N0RXjs3DjFt6/enHVMM4j2jgPPZijHFKoss6a
	rnJQ==
X-Gm-Message-State: ALoCoQmqhCVO5Ua9T32O+1KGE/KwwQJ7p/EFOuT6b8xo2feU1/UuOUmixFuEe+eZ50ImuQaGxkTd
MIME-Version: 1.0
X-Received: by 10.182.120.5 with SMTP id ky5mr30068601obb.11.1399282252240;
	Mon, 05 May 2014 02:30:52 -0700 (PDT)
Received: by 10.182.4.166 with HTTP; Mon, 5 May 2014 02:30:52 -0700 (PDT)
X-Originating-IP: [94.103.137.126]
In-Reply-To: <1398765982-22532-1-git-send-email-mburtin@connected-labs.com>
References: <1398765982-22532-1-git-send-email-mburtin@connected-labs.com>
Date: Mon, 5 May 2014 11:30:52 +0200
Message-ID: <CAKCtLPyY4Mm9pORtYTJ6Exrt956W9O13r0SserUbvkHeG98MWA@mail.gmail.com>
From: =?UTF-8?Q?S=C3=A9bastien_Mennetrier?= <smennetrier@connected-labs.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-ruby][PATCH] ruby: remove obsolete extmk_run.patch
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
X-List-Received-Date: Mon, 05 May 2014 09:30:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

There are the same failure on dora branch. Is it possible to apply this
patch on dora branch ?

Thanks

Regards,
S=C3=A9bastien


2014-04-29 12:06 GMT+02:00 Micha=C3=ABl Burtin <mburtin@connected-labs.com>=
:

> This patch does nothing except causing failures from the second build in
> the same working directory.
>
> Signed-off-by: Micha=C3=ABl Burtin <mburtin@connected-labs.com>
> ---
>  meta-ruby/recipes-devtools/ruby/ruby.inc             |  1 -
>  meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch | 15 --------------=
-
>  2 files changed, 16 deletions(-)
>  delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
>
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc
> b/meta-ruby/recipes-devtools/ruby/ruby.inc
> index 837e52b..e679f27 100644
> --- a/meta-ruby/recipes-devtools/ruby/ruby.inc
> +++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
> @@ -21,7 +21,6 @@ INC_PR =3D "r1"
>
>  SHRT_VER =3D
> "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).s=
plit('.')[1]}"
>  SRC_URI =3D "
> http://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
> -           file://extmk_run.patch \
>             file://extmk.patch \
>  "
>
> diff --git a/meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
> b/meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
> deleted file mode 100644
> index 57926f5..0000000
> --- a/meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- packages/ruby/ruby-1.8.5/extmk_run.patch
> d9738b5a71e2f9a98d009af9fd0ef1ceaff9ef48
> -+++ packages/ruby/ruby-1.8.5/extmk_run.patch
> d9738b5a71e2f9a98d009af9fd0ef1ceaff9ef48
> -@@ -0,0 +1,11 @@
> -+--- ruby-1.8.5/common.mk.orig 2006-12-30 13:07:32.000000000 +1100
> -++++ ruby-1.8.5/common.mk      2006-12-30 13:08:32.000000000 +1100
> -+@@ -56,7 +56,7 @@
> -+              --make=3D"$(MAKE)" \
> -+              --mflags=3D"$(MFLAGS)" \
> -+              --make-flags=3D"$(MAKEFLAGS)"
> -+-EXTMK_ARGS    =3D      $(SCRIPT_ARGS) --extout=3D"$(EXTOUT)" --extensi=
on
> $(EXTS) --extstatic $(EXTSTATIC) --
> -++EXTMK_ARGS    =3D      $(SCRIPT_ARGS) --with-ldflags=3D"%%TARGET_LDFLA=
GS%%"
> --with-cflags=3D"%%TARGET_CFLAGS%%" --extout=3D"$(EXTOUT)" --extension $(=
EXTS)
> --extstatic $(EXTSTATIC) --
> -+
> -+ all: $(MKFILES) $(PREP) $(RBCONFIG) $(LIBRUBY)
> -+      @$(MINIRUBY) $(srcdir)/ext/extmk.rb $(EXTMK_ARGS)
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

