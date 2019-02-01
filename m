Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id 09C4F7C400
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 20:56:56 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id d19so9180487qtq.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Feb 2019 12:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MJw0OEpJn1Se1uJH92+8otJ0c9Xz8kZ+JzzTDmf7D5o=;
	b=vYlHgLizKu0R1FT18unIvUh74e1/KfW0ISc7qYQz+E4Z0c7hvfiGIiQCWpz6LNXkHA
	LE+9ApTxOclOGhYXIipbVJ3vjQravQPoAZ+HDrfEqpoFTcpdQ/nuTQW7JTc/bke3PAbp
	qLCV5/giaSAeraehMjsGX5M3iCfBWtRubW86T5SQ+kOXjGrF8XTWYe7MvoW3z6dB6KC7
	SPYZWxDYdJ4E/bW8Oi1RwBcly2hg1kVs4IJrnXdrBWFynSqpllwqVfvZIYvzuZYdEtsr
	+0V6LAmefd087dVyBQ2HWcaObQoJNto6/Xf524rDswhxxjmqfhWgjYO+lNTQ2sevt1kE
	s2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MJw0OEpJn1Se1uJH92+8otJ0c9Xz8kZ+JzzTDmf7D5o=;
	b=r/XPM/mXfekwiNCXuqrb6Fob8hWMcVhajeYBO7yK6EWUfPV17vbldKJ352QkxRYM2O
	l0LpugW3Nd4T4JcNReW54cLnDQWz8WGFVgThXG11AkSkxODf4qLu3COxv9RiPmAVWtQS
	4DKutr7sCzfI3HtSEQXv1Kw2Ucxe8U8YXJbA6Hdl2RDWHN39FUYliJTp19QnEHRNOpBz
	v4VyGSauuuERW7CEVgSZNc5B+tM71ztAErpj/nimeFts/mWxZuYkN3278BM+JTeMUXnc
	CvDFuCGBiSODhqlwWbZddWsmVYiLFPChZ58zHNJFfZqAXwXBRmsJirYBM+X/ICj2MqQQ
	rsdA==
X-Gm-Message-State: AJcUukc+RivWYsnoJMnqnbXdWm3YyM94Vv1p+2b49yz9lhUeDcLAmuwO
	erIqyiHebHJ92jH3jhU92+FpJ7QRU4/Wck1jcuQ=
X-Google-Smtp-Source: ALg8bN51pQEV12oMu2agFJwlMS6M4khtmq4r6S1c6LSGaKOQL3ek7OUSyxkJWwtycprkojwTfUb7pt2yOujSfXG54N4=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr39645371qtc.236.1549054617809;
	Fri, 01 Feb 2019 12:56:57 -0800 (PST)
MIME-Version: 1.0
References: <f00069dd-43f6-4938-1e6c-7a2ff3dcb836@gmail.com>
In-Reply-To: <f00069dd-43f6-4938-1e6c-7a2ff3dcb836@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Feb 2019 12:56:31 -0800
Message-ID: <CAMKF1soyL8GPwKoDhHvmWsPnUE8aOAeWR6M8-gfzYb5hvYd8ZQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org >> OpenEmbedded Devel List"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: thud][Pull request]
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
X-List-Received-Date: Fri, 01 Feb 2019 20:56:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 31, 2019 at 11:00 PM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 6094ae18c8a35e5cc9998ac39869390d7f3bb1=
e2:
>
>   geoip: update SRC_URI (2018-12-22 08:14:11 -0800)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/meta-openembedded thud-next
>
> for you to fetch changes up to cca27b5ea7569d2730ee5da7ee7f47b39d775d89:
>
>   polkit: Fix CVE-2019-6133 (2019-01-23 08:17:23 -0800)
>
> ----------------------------------------------------------------
> Andreas M=C3=BCller (4):
>       libxklavier: Fix keyboard layout bug for xfce4-settings
>       libmtp: upgrade 1.1.5 -> 1.1.16 and rework
>       networkmanager: move udev-rules from /usr/lib -> /lib
>       openjpeg: fix build for multilib
>
> Ovidiu Panait (1):
>       polkit: Fix CVE-2019-6133
>

LGTM, merged thusly, thanks for doing this. I think
we have more pending thud requests on patchwork.

>  ...nfig_xkb.c-Fix-keyboard-layout-settings-f.patch |  39 +
>  .../fix-do_installe-failure.patch                  |   0
>  .../recipes-gnome/libxklavier/libxklavier_5.4.bb   |   1 +
>  .../networkmanager/networkmanager_1.14.4.bb        |   3 +-
>  .../libmtp/libmtp-1.1.5/69-libmtp.rules            | 999
> ---------------------
>  .../libmtp/libmtp-1.1.5/glibc-2.20.patch           |  36 -
>  .../libmtp/0001-Use-native-mtp-hotplug.patch       |  43 +
>  .../recipes-connectivity/libmtp/libmtp_1.1.16.bb   |  50 ++
>  .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |  58 --
>  .../polkit/polkit/CVE-2019-6133.patch              | 190 ++++
>  meta-oe/recipes-extended/polkit/polkit_0.115.bb    |   1 +
>  .../recipes-graphics/openjpeg/openjpeg_2.3.0.bb    |   3 +
>  12 files changed, 329 insertions(+), 1094 deletions(-)
>  create mode 100644
> meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-xklavier_config_xkb=
.c-Fix-keyboard-layout-settings-f.patch
>  rename meta-gnome/recipes-gnome/libxklavier/{files =3D>
> libxklavier}/fix-do_installe-failure.patch (100%)
>  delete mode 100644
> meta-oe/recipes-connectivity/libmtp/libmtp-1.1.5/69-libmtp.rules
>  delete mode 100644
> meta-oe/recipes-connectivity/libmtp/libmtp-1.1.5/glibc-2.20.patch
>  create mode 100644
> meta-oe/recipes-connectivity/libmtp/libmtp/0001-Use-native-mtp-hotplug.pa=
tch
>  create mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.16.bb
>  delete mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
>  create mode 100644
> meta-oe/recipes-extended/polkit/polkit/CVE-2019-6133.patch
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

