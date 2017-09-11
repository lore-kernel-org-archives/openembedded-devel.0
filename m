Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 37C1071A35
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 13:17:30 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j189so2073859vka.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=stQ7LE/At+h9JCRnXCi2ITZc63xiuIqcMSfLBtTuUZA=;
	b=csQZNyp0IftAhpFxbeV/xh7hYrjC90Mb8SPMqtnpT7oo5kH8k5s3pHeD4XdS0pUahP
	ycXrcuckrVmiBn3bfv06Ev3cuULeDofQt09cUZPcazB5lg0FL6zktSeEarxMbzmAbo80
	9R2FPUZNRRaG92mSmoXlPA0qC97E09uc5LM8KLbiCv5ROKG+6cKr3Pzm14pO3XpohoOD
	3NFgPZPlhJvQpUXU7OM2r/c0C4wvtK2ztqQSucIkbnZZ95xxTrOck17xJui8z8b+HjiV
	DEa8RG047ILM6D3d99T3w6zsPegoGaYoshk7t/D9ugjh/iqMCMTrS+coVRo17yvPagp2
	6f0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=stQ7LE/At+h9JCRnXCi2ITZc63xiuIqcMSfLBtTuUZA=;
	b=UXLxtjRQFQQtQgWuU7T6doHu0buAFh+zb1g7pvIhOrolp1vTpRSfJnLqf/M/YUdsST
	WbW8JKlb7x4Hh0IqJCmZB0v10hfpmTBc8FIR8wUXc5YJs6Cxg57ifmv0ahDQ9OK3Xuit
	RoGxY7pXSdLcw+QH25XmOb7QOBEvF0S566zzXlFhoYXNifeB/xc5cHiFIRw2fL0Tva5S
	TcHnRPOJl+o9EKPi88xXg+Y1GTWeA9L6ha2cY43o2kLlITgQKCnpoHx2qmGraUlZaSJJ
	pvnv2gmKooeZNWtbSFCA7s7SZ6ZayTLjaIMSWul/H8O1oeMerXKBCmNZuwf7I1PrvUJt
	gS9Q==
X-Gm-Message-State: AHPjjUg2bRRopKnOEWUJ7cHqqE0CCKZFkKZr6AMutwtd8OT/E8FMk81l
	a7BCTtxIFrzOmRSDYiCcrX/lgz9GnA==
X-Google-Smtp-Source: AOwi7QDVwwHZc6fjsmGySsZMuGxdrQ1RuCuOvxbOB/gxaiReX29LUPw4ZfS+ImszfrNnvX/aK6gQuURgIMIpHk2folg=
X-Received: by 10.31.224.134 with SMTP id x128mr7308015vkg.1.1505135852281;
	Mon, 11 Sep 2017 06:17:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Mon, 11 Sep 2017 06:17:31 -0700 (PDT)
In-Reply-To: <1504993112-9111-1-git-send-email-athoik@gmail.com>
References: <1504993112-9111-1-git-send-email-athoik@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 Sep 2017 15:17:31 +0200
Message-ID: <CA+chaQebLEPnMQk+P2XdVGH-FPB0FA41N8Cic5ovJifUvbdkgA@mail.gmail.com>
To: Athanasios Oikonomou <athoik@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] v4l-utils: added missing dependency on udev
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
X-List-Received-Date: Mon, 11 Sep 2017 13:17:31 -0000
Content-Type: text/plain; charset="UTF-8"

This causes build failure (at least with gold enabled):

../../lib/libdvbv5/.libs/libdvbv5.so: error: undefined reference to
'pthread_cancel'
../../lib/libdvbv5/.libs/libdvbv5.so: error: undefined reference to
'pthread_create'



On Sat, Sep 9, 2017 at 11:38 PM, Athanasios Oikonomou <athoik@gmail.com>
wrote:

> Upgrading to newer v4l-utils 1.12.3 on commit
> f84a551f2d419df88b85987855fec866d9e84b4a
> Is causing issues because libdvbv5 now require libudev in order to work
> (commit db42484881bf5e6a902de51fe42444ddf286d52a on v4l-utils).
>
> First issue is missing dvb utils dvb-fe-tool, dvb-format-convert,
> dvbv5-daemon, dvbv5-scan, dvbv5-zap
> because libdvbv5 requires now libudev.
>
> Another issue was the failure of building dvb-apps (currently removed from
> master)
> because the v4l-utils-native is missing dvb-format-convert.
>
> This commit adds the missing udev dependency only on target and brings
> back the missing dvb utils.
>
> Adding udev on native build is not possible because nothing provides
> udev-native.
>
> Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
> ---
>  meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
> index 42da5cc..dacc406 100644
> --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
> +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.12.3.bb
> @@ -7,6 +7,7 @@ PROVIDES = "libv4l media-ctl"
>  DEPENDS = "jpeg \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'virtual/libx11', '', d)}"
>  DEPENDS_append_libc-musl = " argp-standalone"
> +DEPENDS_append_class-target = " udev"
>
>  inherit autotools gettext pkgconfig
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

