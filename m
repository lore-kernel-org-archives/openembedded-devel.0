Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id F3CE360621
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jan 2017 08:50:45 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so9878763wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jan 2017 00:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=05fZCbkuc5WY2vSa2inITMJWAsnrdwEin2GGCylQsvk=;
	b=UeW9UqS09CqHV+nBZravGkrB51nQXBxfACeR8uhbkWi5KYGLxTq6n0ig9wMyjd4Qa3
	P948HRuvmFqfLfUt6IaFbOKgqdBTGLMdhRorj18F9GP7JR9+Keu7Kmk4zQupFAa9TfKo
	9mcP7sobF4XT1d95wYN3H3hqlaC5/n9xjidCqilsgrcUEIvjBmoeFUIijssfaPneiuuZ
	ZspVxahN3SrdujhnogYsO6kQvXvlE9wwT5WUNnvqwzPd5CCM0h2qLDAIvgXcQIWF1bAJ
	zOxZLUsmA6ELQwiL1O1wLotU87AG39EQSpHAGZPYa6FH265oRAKKiNQrgsYVJ5l5zEFC
	skLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=05fZCbkuc5WY2vSa2inITMJWAsnrdwEin2GGCylQsvk=;
	b=s2GZHEkOiadvAxnXc6vjGTwi7QPeaeEb09AlMlFXdgX9HpXmg73rHIj+YCq+BUJ9ZT
	yrT92lizwGActwASJq5b+VWdnf/loX3OMi2/T/yhVWWP2cAULUxqCTj2S7EAbR8GYQog
	X7bQqTLnbI+w750uxq8NQTHT5nu3yLg4d4RR/wMuf89EMvksM/7x/QMiP3UjzS2a4WiB
	6OGy0ILKEd/TxGzGHQlrEYhBm0JBFttK7UMDsFAbMww/vePYHvd7lnny6H4HcuoXBQyw
	CJe/qD2TGx7xH6cgsPLL1Arxrj6jwftoreoojQ92El2ycBmmjk2jaSku1bh67uzeczm2
	yMFQ==
X-Gm-Message-State: AIkVDXJbJd5JLqt4dL+zUyEPmb3WfjCTWCfssVGClrm+IapypExNn09onEDBa+VuMvkCfg==
X-Received: by 10.223.174.1 with SMTP id x1mr4370312wrc.113.1483779045474;
	Sat, 07 Jan 2017 00:50:45 -0800 (PST)
Received: from [172.20.0.85] (ip4da29576.direct-adsl.nl. [77.162.149.118])
	by smtp.gmail.com with ESMTPSA id
	i15sm112344994wjs.16.2017.01.07.00.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Jan 2017 00:50:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1483732020-31128-1-git-send-email-moritz.fischer@ettus.com>
Date: Sat, 7 Jan 2017 09:50:43 +0100
Message-Id: <7F119B05-00F0-4502-84FE-161CB0F15CAE@dominion.thruhere.net>
References: <1483732020-31128-1-git-send-email-moritz.fischer@ettus.com>
To: Moritz Fischer <moritz.fischer@ettus.com>
X-Mailer: Apple Mail (2.3259)
Cc: mdf@kernel.org, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v4] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Sat, 07 Jan 2017 08:50:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 6 jan. 2017, om 20:47 heeft Moritz Fischer =
<moritz.fischer@ettus.com> het volgende geschreven:
>=20
> Add a recipe to build 'ectool' a utility to interact with the embedded
> controller on Google's chromebooks (and other platforms using it).
>=20
> Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
> Changes from v1:
>=20
> - Replaced DESCRIPTION with SUMMARY (Martin)
> - Use EXTRA_OEMAKE (Martin)
> - Removed FILESEXTRAPATHS (Martin)
> - Changed PV (Martin / Khem)
> - Removed FILES_PN (Khem)
>=20
> Changes from v2:
>=20
> - Changed PV (Martin)
>=20
> Changes from v3:
>=20
> - Patch now against meta-oe (Khem, Ross)
> - No longer need patch for HOST_LDFLAGS since merged upstream

For v4: Adapt commit message to patch guidelines, e.g.

Chromium-utils: add recipe for Chromium Embedded Controller utilities


>=20
> ---
> .../chromium-utils/chromium-utils.bb               | 23 =
++++++++++++++++++++++
> 1 file changed, 23 insertions(+)
> create mode 100644 =
meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb
>=20
> diff --git a/meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb =
b/meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb
> new file mode 100644
> index 0000000..49d2647
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/chromium-utils/chromium-utils.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "Chromium EC utilities"
> +DEPENDS =3D "libftdi"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D562c740877935f40b262db8af30bca36"
> +
> +SRCREV =3D "a7bf207add71cfb20308ed6858b1b028c866304a"
> +SRC_URI =3D =
"git://chromium.googlesource.com/chromiumos/platform/ec;protocol=3Dhttps =
\
> +          "
> +
> +PV =3D "1.1.9999+gitr${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE =3D "'HOSTCC=3D${CC}' 'HOSTCFLAGS=3D${CFLAGS}' =
'HOST_LDFLAGS=3D${LDFLAGS}'"
> +
> +do_compile() {
> +    oe_runmake utils
> +}
> +
> +do_install() {
> +    install -m 0755 -d ${D}${bindir}
> +    install -m 0755 ${S}/build/bds/util/ectool ${D}${bindir}/ectool
> +}

nitpick: sbindir instead since it it (hopefully) requires root to talk =
to hardware.=

