Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id D35357ED73
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:15:27 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id x19so3094284eda.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Jul 2019 05:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kmvH9lp7MuXcFLjm2CCCytOFF72oqHAUL0pCDUBDdKs=;
	b=SSZBe3y0eZmS0eAZp3ZFaKXpv/YSWtMQdSNG9mVsEQZI7f6b++NVHWvLozjx3hOz6L
	MOcR1LQf0HYnQFZdH3X8aRM8ihaOImLdhcEbtzq/J9dGAimmdsrh15k8qQclKZBk/uI+
	VdjKPrhljBy7vmwo4W1iRw6LsT6HDnXhz8G/6wVnVVHYZwYZAXtyetyK9Q6m9F0rXylp
	kawdOCbvb2twqbvZu9Tz2NFOcZlQVaxY2GGKQUHhiR0vET+FO8yJhoVwAcz2hStKS2Ny
	8GWCQouGoBqHwp0d7l9xucFvT85v2cem+vUoM7NfRVA1UI9t6ESEw4rF/DdaTSco26O9
	k+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kmvH9lp7MuXcFLjm2CCCytOFF72oqHAUL0pCDUBDdKs=;
	b=kwaqFJj1hYAYwZk1kY4okJGl7mUQ6J5doXUKvFw84m46fMYo6gzV0O1HEvEOMxdZ/h
	Jba1xQ5+cPhWhwQLCFEO2mn2HaKYtNnfChMqoWBbNNE8zPbusqMa8wkKvvL/mq5tb1ps
	e8Rv/Oz1jlyYwOXBcBB4hhe2B6K7i59cnOFg82YsNfnhhKLD4IDOUcFoxx8nHcrR093B
	TO1SU43GIjcKMFePb89UopQQEreKeIdoLJkzqHqCMirX6f0NSsaBNam5GwJ0NX2g6WxS
	jC3jPjD7WswnhugtsHk3PbtHvUhLwwLTrUlCABE5PFaHfvmQM47VAG7ZalG32ejTb9Vb
	C2IA==
X-Gm-Message-State: APjAAAUKqPzs86w8cAothRlxoEZgS5DK+rH6NHHc1xls5fGAIoGx4sFd
	8Wbk7kHZoN6khTFu0unjqybIs5ck/VIb7iVikdM=
X-Google-Smtp-Source: APXvYqx/yLiduzL9U88ypWRs9RINOSAbofp8/I3lGRRSoreM2FivIVScJj6Y11Es909GB2kkZTyTy919vlFuIJqfYEk=
X-Received: by 2002:a05:6402:6d0:: with SMTP id
	n16mr8822572edy.168.1562933728488; 
	Fri, 12 Jul 2019 05:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <1562930807-28919-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1562930807-28919-1-git-send-email-mikko.rapeli@bmw.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 12 Jul 2019 14:15:17 +0200
Message-ID: <CA+chaQe9QVLqAos53+svN0-V-9+hF=xgWEvyhR8bLGP-gL-Dow@mail.gmail.com>
To: Mikko Rapeli <mikko.rapeli@bmw.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] protobuf: fix ptest compilation with hardening flags
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
X-List-Received-Date: Fri, 12 Jul 2019 12:15:28 -0000
Content-Type: text/plain; charset="UTF-8"

Doesn't
http://git.openembedded.org/meta-openembedded/commit/?id=a2fac5a0a4848c2486cb3982f930f45f04469860
resolve
the same?

Your change might be better (then we should partially revert mine), because
I'm still seeing some recipes which depend on protobuf failing with similar
errors like protobuf itself did.

On Fri, Jul 12, 2019 at 1:58 PM Mikko Rapeli <mikko.rapeli@bmw.de> wrote:

> Build fails when conf/local.conf has both hardening and ptests enabled:
>
> require conf/distro/include/security_flags.inc
>
> DISTRO_FEATURES_append = " ptest"
>
> Use CXXFLAGS for examples too to avoid hardening warnings
> about using O0 optimization.
>
> Then change linking order to avoid linker failures:
>
> aarch64-poky-linux-g++  -fstack-protector-strong  -D_FORTIFY_SOURCE=2
> -Wformat -Wformat-security -Werror=form
> at-security -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat
> -Wformat-security -Werror=format-security
>
> --sysroot=/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot
>  -O2 -pipe -g -feliminate-unused-debug-types
> -fmacro-prefix-map=/home/builder/src/base/build/tmp/work/aar
> ch64-poky-linux/protobuf/3.8.0-r0=/usr/src/debug/protobuf/3.8.0-r0
>               -fdebug-pre
>
> fix-map=/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0=/usr/src/debug/pr
> otobuf/3.8.0-r0
> -fdebug-prefix-map=/home/builder/src/base/build/tmp/work/aarch6
> 4-poky-linux/protobuf/3.8.0-r0/recipe-sysroot=
> -fdebug-prefix-map=/home/builder/src
> /base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot-native=
> -fvisibility-inlin
> es-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -fstack-protector-strong -Wl,-z,relro,-z,now -fstack-p
> rotector-strong -Wl,-z,relro,-z,now -pthread
> -I/home/builder/src/base/build/tmp/work/aarch64-poky-linux/p
> rotobuf/3.8.0-r0/git/src
> -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r
> 0/git/src/.libs
> -L/home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/re
> cipe-sysroot/usr/lib -lprotobuf
> ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc
> addressbook.pb.cc -
> o add_person_cpp
>
> /home/builder/src/base/build/tmp/work/aarch64-poky-linux/protobuf/3.8.0-r0/recipe-sysroot-native/usr
> /bin/aarch64-poky-linux/../../libexec/aarch64-poky-linux/gcc/aarch64-poky-linux/9.1.0/ld:
> ../src/google/protobuf/.libs/timestamp.pb.o: in function
> `google::protobuf::Timestamp::SerializeWithCachedSizes(google::protobuf::io::CodedOutputStream*)
> const':
> /usr/src/debug/protobuf/3.8.0-r0/git/src/google/protobuf/
> timestamp.pb.cc:279: undefined reference to
> `google::protobuf::internal::WireFormat::SerializeUnknownFields(google::protobuf::UnknownFieldSet
> const&, google::protobuf::io::CodedOutputStream*)'
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> ---
>  .../0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch   | 4
> ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> index 029abfd..0a2e5e2 100644
> ---
> a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> +++
> b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
> @@ -45,12 +45,12 @@ index 4ad605641..31d887639 100644
>   add_person_cpp: add_person.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installed
>  -      c++ add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config
> --cflags --libs protobuf`
> -+      $(CXX) $(LDFLAGS) $(PROTOBUF)
> ../src/google/protobuf/.libs/timestamp.pb.o add_person.cc
> addressbook.pb.cc -o add_person_cpp
> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc
> addressbook.pb.cc -o add_person_cpp
>
>   list_people_cpp: list_people.cc protoc_middleman
>         pkg-config --cflags protobuf  # fails if protobuf is not installed
>  -      c++ list_people.cc addressbook.pb.cc -o list_people_cpp
> `pkg-config --cflags --libs protobuf`
> -+      $(CXX) $(LDFLAGS) $(PROTOBUF)
> ../src/google/protobuf/.libs/timestamp.pb.o list_people.cc
> addressbook.pb.cc -o list_people_cpp
> ++      $(CXX) $(CXXFLAGS) $(LDFLAGS)
> ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc
> addressbook.pb.cc -o list_people_cpp
>
>   add_person_dart: add_person.dart protoc_middleman_dart
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

