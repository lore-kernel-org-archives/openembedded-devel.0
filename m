Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.20939.1592234908095116252
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2020 08:28:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cu1OL1D0;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id g11so7932034qvs.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2020 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JxKCEvhv/GL9PKnftANBKCHIL9UCDEuqI+st0V2P878=;
        b=cu1OL1D07vy3IYRV8rg8zm4veFBbO+lMaE3XjpGB9bU2Zcd4ZnNU2BYMDert9V+pLe
         GPefuLOB5cVb/CwJFUK1kf3AzMhm/cWBB0gC/WpQ6WkwIXsbdd4E3eNzHIu8c6OdQvm9
         qcCeUfqK5iq6s3Tt++WaFp+dsPz+ab8nCg2BLwBDpkl3EY/Mvf3fLb8yCBOCZyJiYh4n
         gF05GPT/PnlP9TZu3uWTHXTagCLLC8DWpwdK1kinao5LHmAK/QZ9PonRe/qOmdMrys5r
         VOimfmTqbXLwxcxzOMOEGBg9V5+jh/DGNDoPPmt6TcpMp7GvW4qADYCMUSRr6Q1z/JvJ
         c+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JxKCEvhv/GL9PKnftANBKCHIL9UCDEuqI+st0V2P878=;
        b=EJanE6lsWhuNkjL7VEGS/Tpl6HQOZP86YphKT45P3ioeiP6pFLJ4Wfv52V/Rcv5a7/
         BKSJoNaSOXo/LQ2BM/ghVhW9RyvN0Lx3KhIqz6mdBi7x8yefvahp+rSB5P4m+gkjgb8W
         trbl5J3ofSeYjMAQM53zOyzl5GKH1pjZSTTrZ9XnwxeVXXpODQRaTQLAh3U2Gp6KciFI
         9jaf+yFvC2cR8bNcJISfabkHnjy0owocYx+PD0EmNxb1yqDWfpA3bGY4yZvdViSCttDJ
         op1G+P1CulXaMSepTeclh4W9cobn1MgUaVaztqmv1zcc6h6SGPelTO1dySEU7J9OEbre
         Bi2Q==
X-Gm-Message-State: AOAM532vB2Zy6rjk3VOiQSEbg4wjT2ZSXe2OcIWDPvoD5maH6ajIAz0I
	n19cBvP/EUUPdDq3asJ02f9Xq+SkQPP7jMGuIho=
X-Google-Smtp-Source: ABdhPJy3dH2c+QrNSLxk1+TlJJZ7GZYriJwrHMAiL5RbxFxc743AcxabDoDtHHEFGAjXTaHtFYlc9sp8LP3E+8iA4jY=
X-Received: by 2002:a0c:f888:: with SMTP id u8mr25030488qvn.130.1592234907009;
 Mon, 15 Jun 2020 08:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200615124132.5262-1-leon.anavi@konsulko.com>
In-Reply-To: <20200615124132.5262-1-leon.anavi@konsulko.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 15 Jun 2020 08:28:01 -0700
Message-ID: <CAMKF1squBAiaaJuCVsxg4pXiZOvNYf8nbZ7DHVGSXTGs-cVb1w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] protobuf: Upgrade 3.11.4 -> 3.12.3
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 15, 2020 at 5:41 AM Leon Anavi <leon.anavi@konsulko.com> wrote:
>
> Upgrade to release 3.12.3. Update the path to the git repository
> in GitHub. Update the patch for examples/Makefile.
>
> The new release brings:
>
> - [experimental] Singular, non-message typed fields in proto3 now
>   support presence tracking. This is enabled by adding the
>   "optional" field label and passing the
>   --experimental_allow_proto3_optional flag to protoc.
> - Allow duplicate symbol names when multiple descriptor sets are
>   passed on the command-line, to match the behavior when multiple
>   .proto files are passed.
> - Deterministic protoc --descriptor_set_out
> - Bug fixes for the supported programming languages
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...Makefile-respect-CXX-LDFLAGS-variables-fix-.patch | 12 ++++++++----
>  .../{protobuf_3.11.4.bb => protobuf_3.12.3.bb}       |  4 ++--
>  2 files changed, 10 insertions(+), 6 deletions(-)
>  rename meta-oe/recipes-devtools/protobuf/{protobuf_3.11.4.bb => protobuf_3.12.3.bb} (96%)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> index 0a2e5e2df..934c98193 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> @@ -1,4 +1,4 @@
> -From a28e15092a298e0c73c6fc1ded0913275cf27cb0 Mon Sep 17 00:00:00 2001
> +From e5340f816aa273cfda36998466739ca0748caafb Mon Sep 17 00:00:00 2001
>  From: Martin Jansa <Martin.Jansa@gmail.com>
>  Date: Fri, 28 Jun 2019 13:50:52 +0000
>  Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
> @@ -23,12 +23,13 @@ Subject: [PATCH] examples/Makefile: respect CXX,LDFLAGS variables, fix build
>
>  Upstream-Status: Pending
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>  ---
>   examples/Makefile | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
>  diff --git a/examples/Makefile b/examples/Makefile
> -index 4ad605641..31d887639 100644
> +index e9f9635ae..b2fbe2de1 100644
>  --- a/examples/Makefile
>  +++ b/examples/Makefile
>  @@ -2,6 +2,8 @@
> @@ -44,13 +45,16 @@ index 4ad605641..31d887639 100644
>
>   add_person_cpp: add_person.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installed
> --      c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
> +-      c++ -std=c++11 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
>  +      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
>
>   list_people_cpp: list_people.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installed
> --      c++ list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
> +-      c++ -std=c++11 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
>  +      $(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
>
>   add_person_dart: add_person.dart protoc_middleman_dart
>
> +--
> +2.17.1
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
> similarity index 96%
> rename from meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
> index 4d6c5b255..21ad7a460 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.12.3.bb
> @@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
>  DEPENDS = "zlib"
>  DEPENDS_append_class-target = " protobuf-native"
>
> -SRCREV = "d0bfd5221182da1a7cc280f3337b5e41a89539cf"
> +SRCREV = "31ebe2ac71400344a5db91ffc13c4ddfb7589f92"
>
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.11.x \
> +SRC_URI = "git://github.com/protocolbuffers/protobuf.git \

shouldn't this be pointing to 3.12.x branch ?

>             file://run-ptest \
>             file://0001-protobuf-fix-configure-error.patch \
>             file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
> --
> 2.17.1
>
> 
