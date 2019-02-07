Return-Path: <krussell7711@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1B16BD1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 03:01:30 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id u11so5800029vsp.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Feb 2019 19:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wo3F1r20NzIDIm2K92AEmgBrfPDLYEj4po/MxI8InY4=;
	b=uDVC/u7l9tb05bpFo0ZI3RdyIby9ntIwMoMfBDc4Uv5sHC8TS+zvX9Gu9K3O7jew0f
	4TgPgsbIk9wN0d7SjnQuk6XhDXIv0GKD5is231nJG8S+7hNr3NQyYtR7mBcHTpW8+Zsh
	2m+7OMPno+i/3TraaoRb2QcuEW/wItceOExEi9ZZ6b+5YS8VNlDn33cqlrugbzpqoE09
	KMNFR1I8yliyUE1CHuPHZTcShRCCGErmhCOvS6mdwiDv8Lykmz5S+0PJ5UV9DVPh3HaR
	epupXLVwQ90r+1HCe7h+XHGUC/UUvxJyy4JNpwfgXvC/OiPNwcVhv99ohH/kzVCQjpf+
	JSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wo3F1r20NzIDIm2K92AEmgBrfPDLYEj4po/MxI8InY4=;
	b=TtMAn552wDJV+33ziZH9Wze5LgIrLT4Ug5E5NLn4DG+1W9nXLnD2PmellXzBanSos7
	K84yaCkICYQTttFiO6WK1EZ+xrTPCDLc79GLhISTESh/k/LPHY6Z/xIg3MtKDiffAtVN
	i+6Kk90SftTpQ7vrI76fCLqYg7rsHzRPCDq/iIzqHJAAyqbkoCFEU15EbXJD8ORwR1pq
	crPgfHiX67T3Rw0i3448EnghdHWdSFLKY6wXIcCxfLEl7sUz9HrZfdXwwv0Zwk9nWgfV
	luJfTW9RhZdiEhwVGxjSoQo92TC1zIglxnn+JT2BsTt9qVY4gjJW/O3hbgVtzXBFjwmI
	zxXg==
X-Gm-Message-State: AHQUAuYYtrURPTZKk2iVEj7zgXtLIrRAnwgvJPPkYradozXTCKdHDxrL
	kz927hIpLvCSdVDtZ/Xybp0zPt/wLfeMrTRZs6k=
X-Google-Smtp-Source: AHgI3Ia6lvH4axNyFCZG/+Tph0L0f6GsS3qEaMAhmlexs8rYdDx7wEfYmhcYVyui6rKMB30IsZKFZCv7TPC/xf8R0S4=
X-Received: by 2002:a67:808a:: with SMTP id b132mr5971753vsd.224.1549508490891;
	Wed, 06 Feb 2019 19:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20180727132923.15149-1-git@andred.net>
	<20180727132923.15149-7-git@andred.net>
In-Reply-To: <20180727132923.15149-7-git@andred.net>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Wed, 6 Feb 2019 22:01:18 -0500
Message-ID: <CAFrQVPOv8j1yOZs6DfLsK6QD69F4uVj0=wFJX5bQ_44Oj9S5-g@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][RFC][PATCH 7/7] ca-certificates-java: switch to more generic / more correct JAVA (R)DEPENDS
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
X-List-Received-Date: Thu, 07 Feb 2019 03:01:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2018 at 9:29 AM Andr=C3=A9 Draszik <git@andred.net> wrote:

> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> This recipe here actually depends on Java7 upwards, not Java2 upwards,
> so state that dependency correctly using the newly introduced (virtual)
> RPROVIDES of the OpenJDK8/OpenJRE8 recipes.
>
> At the same time, we can remove hard-coded references to openjdk-8 and
> openjre-8, and thusly make the build more flexible.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> ---
>  .../ca-certificates-java_20180516.bb                   | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/recipes-core/ca-certificates-java/
> ca-certificates-java_20180516.bb b/recipes-core/ca-certificates-java/
> ca-certificates-java_20180516.bb
> index a2d7abd..2ae7352 100644
> --- a/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
> +++ b/recipes-core/ca-certificates-java/ca-certificates-java_20180516.bb
> @@ -14,7 +14,7 @@ DEPENDS =3D "virtual/javac-native fastjar-native"
>

Should this DEPEND on virtual/java7-sdk-native instead?

 # We can't use virtual/javac-native, because that would create a
>  # keystore that can't be read on the target (as virtual/javac-native
>  # usually is either too old, or plain incompatible with this)
> -PACKAGE_WRITE_DEPS +=3D "openjdk-8-native"
> +PACKAGE_WRITE_DEPS +=3D "virtual/java7-runtime-native"
>

Would you still need the PACKAGE_WRITE_DEPS if the DEPENDS above was
changed?  I thought virtual/javac-native was "too old" because it was
reserved for the bootstrap process, so I've been considering it as a
special case.

