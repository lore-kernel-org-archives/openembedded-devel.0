Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 06FBC79B30
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:21:50 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id f16-v6so5681658ita.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZXLQEmu73jfPb/oquHY8GN6Qkv37CurRyD5lgz+vLu0=;
	b=ve/66AU0PltHuE6TXMx4bKfU+4fWDYzclBtM3YLwO2GjRb9aSbBmg62Su32SkM9i8+
	rG8oWMFBGFfkMC2tHRKn3+jn8cv2oI+89rIKSwTOnt1y6WYdEXzM8me53zZU956YIPdn
	u7fmR4zTUF10TLDWhKkjrIy7kP76YWjN2fSfZAmQwJxnisuNeiO4hHLWIipE7jb/ys0U
	lxlXwnu2TYNtvRkHqlKErdSMc2nytQbAsWFfO/QgR5E5wvFnQXaUPY2am6XJHT5szV/K
	z3Z8WiqRVP9ml5KPA3YItZPoeK8k9cXB7+iQB+lxRsrhrcsCAOubYm+mTdmfPTFORic8
	3yqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZXLQEmu73jfPb/oquHY8GN6Qkv37CurRyD5lgz+vLu0=;
	b=XGbxC1diSvONwqyVHxBmln2iDB4cl45Tek1SrxsuTbpO4T3Wh7JI/EJ775yvtOT4dZ
	LAiF7LocWpKNuGYIJdV2y1/RN8QOPBS76kETRVaA7RgPabjapHkitz5GnRzCpUKw+5Rh
	bPimgQCOtUNgbjYqOx65gmmBaZWiNjAguMLZV6w9dyGJhu1sDnPZeT7vQeofNIRWPz0o
	8N9W7Cr8vFqurelzR2dXxjfa7AFGRmwxDach0X8gJWLssIP2u8zWthM1rGeKS7H57+R0
	thHiw4uOQP4xXJCvt901azup6x2JrYaaS7D+HGKDhNf8T+WER+5+y1bN9KYmLWZ49i+E
	a6CA==
X-Gm-Message-State: AGRZ1gITfo0IwITlszl1coU2+6UYNe6uPrBoAwXm1HZFJCI8KdhFFB6z
	7htiS00jtJeqmlJAZZX3IyAb8j2/xICam3Ef9hGbaQ==
X-Google-Smtp-Source: AJdET5fK0hl5T4Lf6vgZf4LAY2zt7xbpUh3NQDZib5c57Oo/+qCMpIl3HoNB+tBsyZgxrfKUBDoA02vXFhL0ymUwSfE=
X-Received: by 2002:a05:660c:a06:: with SMTP id e6mr922919itk.62.1540898511144;
	Tue, 30 Oct 2018 04:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<96e86320d4d21de21552cf98eb6145a114fcd69f.1540830650.git.brendank310@gmail.com>
In-Reply-To: <96e86320d4d21de21552cf98eb6145a114fcd69f.1540830650.git.brendank310@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 11:21:40 +0000
Message-ID: <CAJTo0LaxyAWT+idVwFyKUimNeANxiEfB-k7G0CMXsM=ZNuxVhg@mail.gmail.com>
To: brendank310@gmail.com
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 12/16] mutter: add recipe for mutter window manager
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
X-List-Received-Date: Tue, 30 Oct 2018 11:21:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Oct 2018 at 16:43, brendank310 <brendank310@gmail.com> wrote:

> +do_install_append() {
> +       install -d ${D}/${datadir}/gir-1.0
> +       install ${B}/src/Meta-3.gir ${D}/${datadir}/gir-1.0
> +       install ${B}/cogl/cogl/Cogl-3.gir ${D}/${datadir}/gir-1.0
> +       install ${B}/cogl/cogl-pango/CoglPango-3.gir ${D}/${datadir}/gir-1.0
> +       install ${B}/clutter/clutter/Cally-3.gir ${D}/${datadir}/gir-1.0
> +       install ${B}/clutter/clutter/ClutterX11-3.gir ${D}/${datadir}/gir-1.0
> +       install ${B}/clutter/clutter/Clutter-3.gir ${D}/${datadir}/gir-1.0
> +}

Why is this needed?

Ross

