Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id 57BF4746FA
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Apr 2018 11:56:20 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id r29so4883744ywa.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Apr 2018 04:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0aG/caeV2Nd3+WmKLnQNEfXc8VwXcxAQkIHb0pVPo7A=;
	b=omNtuM4C5EJwqkoUpBuaaWyW7zKNg/sw1Rbp392+iS/WxEPOKTXzjKJ7QJ7evbUhYq
	XIafxGu7nQijbi80IwTIqOYeZK+gKhgb0MDKFQLROP7b2dUuofMHbH/kX0Wgx5RciVuM
	RqOHlQDgZ3vyEHX3K0OSvikcE9e4UuLCyG8tWf4BKixQb43fqPAJnc9VOWJTMK66meDO
	+KaY94L5gUHvJrXeujEABhZ3jiJqRPDOPUugFt8knNKTUQS1gZaGcbvIsayFx7skpa95
	flh8BOeAQDXjLGF0tbVSm2EFykm32nGbUlRMD6WWOYRRpxqH9iW2ydpb57gTq4E+vUGM
	ERKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0aG/caeV2Nd3+WmKLnQNEfXc8VwXcxAQkIHb0pVPo7A=;
	b=oEFZ5U7VWx3XIUMqfYN4fBFHW0cCwVWfMQbO50dxu3tCrQpLWzk1IvpJB8W2thhO/V
	eTyxzqLFxuiZOr0kFDw7na7AVy9eurVqdvdIrjkbwtPG4Zhl+Z2ns8w0v04HBrAl1qxB
	U1lvQifiKL3RB548YYictSsT6n1Bm2msmwgr0PMkGGzmlHnvFks07q8Apms2AG9zXxYe
	e2BHLt7yCPXjZATyLqK3ecSJrc3bHLoTCjVEz0Vfc0r3gENViwKHVTBzS8dkJ0n2sc9z
	tqKpGtmh4DA/M5MpESocXOHDX38zeaheh7z7JvfK/W3hj/qpcW2C/ex6s/HBzmLOmEzN
	AgEQ==
X-Gm-Message-State: AElRT7Fxbp7CF0nCepNGBOAriVt5aliSuSSSWmvt7+7AoP323z78Ts+Y
	VDa/NHe7Y9nsjyhoJVLARqaWyNn4peHNgLlUp6s=
X-Google-Smtp-Source: AIpwx4/u+Q6fHpPPsp6GEnO8LvejwUO84lEGKOzJ6U59xK7G6WEEz3iqccbW/+BgTk0HBpCQyuEKxjc/ewAq/ycQxuM=
X-Received: by 10.129.152.17 with SMTP id p17mr3346062ywg.163.1522670181923;
	Mon, 02 Apr 2018 04:56:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP;
	Mon, 2 Apr 2018 04:56:21 -0700 (PDT)
In-Reply-To: <1522636575-23776-1-git-send-email-akuster808@gmail.com>
References: <1522636575-23776-1-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 2 Apr 2018 13:56:21 +0200
Message-ID: <CALbNGRSO8ZNb5gad6ZPGOzMmhXcm6XQ7Uv3BjGOoDcp=kZb=Jg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poppler: fix compile errors
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
X-List-Received-Date: Mon, 02 Apr 2018 11:56:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 2, 2018 at 4:36 AM, Armin Kuster <akuster808@gmail.com> wrote:
> disable glib  via new PACKGAGECONFIG option
>
> glib.so, not found (try using -rpath or -rpath-link)
> | ./libpoppler-glib.so: undefined reference to `FormWidgetText::noSpellCheck() const'
> | ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::deselectAll()'
> | ./libpoppler-glib.so: undefined reference to `StructElement::getTextSpansInternal(MarkedContentOutputDev&) const'
> | ./libpoppler-glib.so: undefined reference to `PopplerCache::PopplerCache(int)'
> | ./libpoppler-glib.so: undefined reference to `MemStream::MemStream(char*, long long, long long, Object&&)'
> | ./libpoppler-glib.so: undefined reference to `StructElement::appendSubTreeText(GooString*, bool) const'
> | ./libpoppler-glib.so: undefined reference to `typeinfo for LinkOCGState'
> | ./libpoppler-glib.so: undefined reference to `FormWidgetChoice::noSpellCheck() const'
> | ./libpoppler-glib.so: undefined reference to `XRef::okToChange(bool)'
> | ./libpoppler-glib.so: undefined reference to `globalParams'
> | ./libpoppler-glib.so: undefined reference to `MarkedContentOutputDev::MarkedContentOutputDev(int)'
> | ./libpoppler-glib.so: undefined reference to `GfxPath::lineTo(double, double)'
> | ./libpoppler-glib.so: undefined reference to `FormWidgetButton::getButtonType() const'
> | ./libpoppler-glib.so: undefined reference to `GfxPath::close()'
> | ./libpoppler-glib.so: undefined reference to `PDFDoc::getID(GooString*, GooString*)'
> | ./libpoppler-glib.so: undefined reference to `pdfDocEncoding'
> | ./libpoppler-glib.so: undefined reference to `BaseStream::BaseStream(Object&&, long long)'
> | ./libpoppler-glib.so: undefined reference to `GfxGouraudTriangleShading::getTriangle(int, double*, double*, double*, double*, double*, double*, double*, double*, double*)'
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-support/poppler/poppler_0.62.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
> index 6966219..d20751f 100644
> --- a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
> @@ -21,6 +21,7 @@ PACKAGECONFIG[curl] = "-DENABLE_LIBCURL=ON,-DENABLE_LIBCURL=OFF,curl"
>  PACKAGECONFIG[openjpeg] = "-DENABLE_LIBOPENJPEG=openjpeg2,-DENABLE_LIBOPENJPEG=none,openjpeg"
>  PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF,qtbase qttools-native"
>  PACKAGECONFIG[nss] = "-DWITH_NSS3=ON,-DWITH_NSS3=OFF,nss"
> +PACKAGECONFIG[glib] = "-DENABLE_GLIB=ON,-DENABLE_GLIB=OFF, glib-2.0"
>
>  # surprise - did not expect this to work :)
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
> --
> 2.7.4
>
This looks odd to me: poppler depends on cairo and cairo depends on
glib-2.0 - both dependencies are unconditional. So glib-2.0 should be
in poppler's recipe specific sysroot. Seems there is something else
wrong here.

I am a bit afraid that this will break evince which is THE pdf-viewer
we have in our common layers. Are there some public log I can look
into?

Andreas

