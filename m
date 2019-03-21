Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6B88F7CF62
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 13:53:43 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id m18so4163475ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bnCjehZyrU22znbfOK9FFYZINTc6nhuaeOxknhQ9tsk=;
	b=qfmlLXE/DPKZrCbG+dp+RoxtrkAYngw8og+ozp32QwZ390NTSaa/oQyrfY76/r1VI7
	4dPYOv+CLIRzpbUjlZ9fv+PBIfb1pYr/Pp3JidCDWyZcYZEe0tUwSNySi/gvM1v2G9uE
	IU6Z/rJVn3Uxju/JVRixJGqnyKdWEMLrQyVeMmpiTC1XMyIqlI+VWU8cP5FLd2ax+naM
	So6e7tRdYKh7gxJt8OxI8Qx5fTbtUe2TZW9ngY3qfpqJ7bh96sVIM7yWyaJLXQJAw15O
	QZvlohNkcBiuQWAaxaYVYbQl06HhkLZeSspUB0sYDmTzxYlSum+qG8I9uqalfoDlWayC
	58IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bnCjehZyrU22znbfOK9FFYZINTc6nhuaeOxknhQ9tsk=;
	b=PYbWKRyb0Fues59pbL7+2QO6ORrLReRRty70crX1Q6LfmT61JzOoVXBilyW01U6kJG
	aTxAgdGFQ2r7xFXo9X8zO6u9OmUH/ZefQ2EkGfBRAlpQ4AFxl7gaZ0LTSF3Mr49lMN+v
	5b3/+nKxag6xteKMiZp7E+mM3covFqVzClptVBe+UWrMwzL9XeXrJZRR9RUR4DBz7Xpf
	zPMQe6fCnxCyyGP2SlcwY3mRM03iLKUUyJXqErRd0753Nygvt4/9HNQrI71+HFyfiy0B
	BmpLQk47oOfLhIn8vJQunDQupg52MJQF058/dhSxfuYpN9t0d5ClqWraMoOEWWvA4lT2
	C7hQ==
X-Gm-Message-State: APjAAAWWuKjDoVDBByEHnX9vxwaUdhy9ubUADtka66YyX3z2Tf1ZmDYf
	b6ZJfFpr9CmDbfERWpG5/jND1fv6091YOgrVvKg=
X-Google-Smtp-Source: APXvYqzSK5Pmvb/Xg8cwYI04aFWzuymZR11rigu6DsA78x6GFE+dzW8sW63bnfVrg0cjqJvAgGEeWxfPlr0XSBrIbOU=
X-Received: by 2002:a24:5c47:: with SMTP id q68mr2778911itb.81.1553176424409; 
	Thu, 21 Mar 2019 06:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190318144440.11580-1-andrej.valek@siemens.com>
	<20190319070547.21396-1-andrej.valek@siemens.com>
In-Reply-To: <20190319070547.21396-1-andrej.valek@siemens.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 21 Mar 2019 14:53:32 +0100
Message-ID: <CALbNGRRHFuHRVmDLGWNjJAFXk3StTVxvWJEzXBbkHGOAKHZ47Q@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: vkc@connectedcars.dk,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v3] nodejs: fix target ldflags using
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
X-List-Received-Date: Thu, 21 Mar 2019 13:53:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 8:06 AM Andrej Valek <andrej.valek@siemens.com> wro=
te:
>
>  - do not drop target LDFLAGS
>   - even if the target LDFLAGS have been specified, tools like torque was
>     linked with system libraries
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../nodejs/nodejs/0006-Use-target-ldflags.patch    | 24 ++++++++++++++++=
++++++
>  meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb  |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-targe=
t-ldflags.patch
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldfla=
gs.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.p=
atch
> new file mode 100644
> index 000000000..f6569cd57
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs/0006-Use-target-ldflags.patc=
h
> @@ -0,0 +1,24 @@
> +The target LDFLAGS have been ignored. Tools like torque
> +have been loaded from system libraries, even if a native
> +one was the target.
> +|$ ldd torque
> +|    libz.so.1 =3D> /lib/x86_64-linux-gnu/libz.so.1
> +|    libcrypto.so.1.1 =3D> /usr/lib/x86_64-linux-gnu/libcrypto.so.1.1
> +|    libssl.so.1.1 =3D> /usr/lib/x86_64-linux-gnu/libssl.so.1.1
> +|    libicui18n.so.63 =3D> not found
> +|    libicuuc.so.63 =3D> not found
> +...
> +
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +
> +diff -Naur node-v10.15.1/deps/v8/gypfiles/toolchain.gypi node-v10.15.1/d=
eps/v8/gypfiles/toolchain.gypi
> +--- node-v10.15.1/deps/v8/gypfiles/toolchain.gypi      2019-03-18 15:01:=
39.000000000 +0100
> ++++ node-v10.15.1/deps/v8/gypfiles/toolchain.gypi      2019-03-18 15:04:=
08.628361308 +0100
> +@@ -1106,6 +1106,7 @@
> +             'cflags': [ '-fno-strict-aliasing' ],
> +           }],
> +         ],  # conditions
> ++        'ldflags+': [ '$(LDFLAGS)' ],
> +       }],
> +       ['OS=3D=3D"solaris"', {
> +         'defines': [ '__C99FEATURES__=3D1' ],  # isinf() etc.
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_10.15.1.bb
> index 17c9bb0c4..672cd8440 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_10.15.1.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.=
tar.xz \
>             file://0003-Crypto-reduce-memory-usage-of-SignFinal.patch \
>             file://0004-Make-compatibility-with-gcc-4.8.patch \
>             file://0005-Link-atomic-library.patch \
> +           file://0006-Use-target-ldflags.patch \
>             "
>  SRC_URI_append_class-target =3D " \
>             file://0002-Using-native-torque.patch \
> --
> 2.11.0
>
Fixes native build for me so

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

