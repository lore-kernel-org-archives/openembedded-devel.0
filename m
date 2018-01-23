Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id B8B9C60767
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:02:18 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id e76so657658pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IpURHvoZeNT7veAcCH+JipNafwlM4Xyieut9cxmcEP0=;
	b=YWi/OyJ9QFVMYq4LkXHRYbHlEN9i5lxON/2d0Uf8JnZGLfWWDANKJHyFQcK5DxMPVP
	VTIRDCFQmDW7+5K4TFRDSVDq7PMqK0VzY/ySOHH/TlMNIaaKWXJ1akQLRMG/SyVXGUDI
	XZmGVzm+1Yf5PA4oD6CG3On8VyD51QcOw1vrHo7eG+lhSpk/oR/FGv3k+W82Swi4MXi3
	DazWlHL+Nb+sfe707z6Hg3fxralmb1RaNOPuqQxbP/HGD4slEegXgitW/w8nD+b09jGm
	wuEI0P7YcH0AdmhH5EksLEvnqPA3kWcrr7OMFFV60vkM6mNo3elNSfiDA5ti+JcOHbXV
	xDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IpURHvoZeNT7veAcCH+JipNafwlM4Xyieut9cxmcEP0=;
	b=dBoJ0rHlOJ/no6JTIPPl5Ta/Ba8b0NFDYZ/i4SZY+kVb1450zf55OHYsHN3d0B0amI
	gUvTJHLC2skaNijc3UiWf3dxUgwTBRbuMzY5zslld8SSugcVD3HB5om1K9TdsVOa+gZT
	swb/MZxGKhxNn/oflkM+k/xDc6CHVRXNP/IWcRENrERItmh/gppO1TVinCOPJqAR4fPG
	uPR3zfuUiLwbPYooYfGLfoD0AI0oldGetiI/R7yWY1qCMAPx27VDp7bhLQ1Hzillf6wc
	9HqbTA3lhcpH0NqL1hjbI102vNtLoqY7TwQW6DFNTROcmcFA1dJrQ1/OK5qUjE+Ix7Dz
	+9mw==
X-Gm-Message-State: AKwxytemRhz/BB7o+1p9L2W0tFyEEpX1y55Yet1xel4Bn74qLadl2zT1
	lMpQNYrn/5K3kpzIvW0NzvswCgfqwCsjsDIzExc=
X-Google-Smtp-Source: AH8x224QeWLdo6V5eOQxyyUhZqdqwIYVO9hpaKJlQzjwLi+OTtyCA52XqwxFrjmBGTbblKaqlNNCwLABcD5PwRTHniM=
X-Received: by 10.98.13.196 with SMTP id 65mr10789410pfn.155.1516723339540;
	Tue, 23 Jan 2018 08:02:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Tue, 23 Jan 2018 08:01:49 -0800 (PST)
In-Reply-To: <1516206797987.39279@cisco.com>
References: <1516206797987.39279@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jan 2018 10:01:49 -0600
Message-ID: <CAMKF1sp91GwUs4tv_00uTufKcnYdg6ti+UHQ_V0x4N0VLC9xxQ@mail.gmail.com>
To: "Mariia Movchan -X (mmovchan - GLOBALLOGIC INC@Cisco)" <mmovchan@cisco.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] ipcalc: add initial recipe for version 0.2.0
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
X-List-Received-Date: Tue, 23 Jan 2018 16:02:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 10:30 AM, Mariia Movchan -X (mmovchan -
GLOBALLOGIC INC at Cisco) <mmovchan@cisco.com> wrote:
> Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
> ---
>  .../recipes-support/ipcalc/ipcalc_0.2.0.bb            | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb
>
> diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb
> new file mode 100644
> index 0000000..bb283c8
> --- /dev/null
> +++ b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.0.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Tool to assist in network address calculations for IPv4 and IPv6."
> +HOMEPAGE = "https://github.com/nmav/ipcalc"
> +
> +SECTION = "net"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> +
> +SRC_URI = "https://github.com/nmav/ipcalc/archive/${PV}.tar.gz;downloadfilename=ipcalc-${PV}.tar.gz"
> +

archives get rebuilt sometimes on github, perhaps we should be using a
git fetcher with locked down
SRCREV


> +SRC_URI[md5sum] = "edbfc4cb64632e0c4f87cf81c7d8302d"
> +SRC_URI[sha256sum] = "c965c1296172a6acc50d54dfe81f7e5d589f9762b5d9ae459eee00349675336b"
> +
> +export USE_GEOIP = "no"
> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${S}/ipcalc ${D}/${bindir}
> +}
> --
> 2.10.3.dirty
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

