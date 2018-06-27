Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id DF245748D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jun 2018 04:47:45 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id q135-v6so408163vkh.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 21:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bJJRtE5NqnUtdvD+58h/R0kFbgfsuQkqveHna7ASM0k=;
	b=VFyTXO9lRTzSpptFyTgQ+jujv112rdjkqrQLwGeLY6mp1k/uPQ+2FxLTeQLHRpTIid
	fZj21KyXW+amAphq97o16Gs9+pD1Kb8ExOvVfOhFj7oM+jPralNhAZf5znhEAeGIHtKo
	i5Y0A6G04V/hW0RThokST4Eevg/KEBOT7Gy1ELHqrSgT/UA7g0xoBsaMN3tLlKPndvmS
	2Hso1ANMRzCfAF0n0T4JwzH+uLBbI+dbzBTTywAoYkqXUDe3pFJdpMzCcmMqq7ZQP8a5
	hTZ2NqSJ1KAoOdqpMJPk2rPXPGUc/ciQveo5D4GxrQFUvpBwcnQII/s1KDiZwQREcAR+
	iaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bJJRtE5NqnUtdvD+58h/R0kFbgfsuQkqveHna7ASM0k=;
	b=B2lWExrVPJiCcuoj9uh37XS1u/hiQlk284mq4HNLOtPL/Z9wfvTd0KTYTN8kqkAOpJ
	q6C1ZfnNGhNOtFov11dMgbZGepvVe2yjWs43qTNqfiA17YvHcLQbMuvu0jYrDQBqdR39
	7T2YeFGYoFv0ZOQWLXqSVsYiT3oPeGxqWkfSDCnUtJ2E6c0WuNl1oHLpn0HLLldAD8E8
	0FiG2466oVjpkmdZ2maIGDi1gzs1hEGN4A2jDPflDSKxP4DOKR6SHKS6d/nxlZfq92qp
	2qhNOcXxp9TnKm4fJFWpwu/AaLlq4i17wFLlldRJqdadYM7VHUfZZsC0th3Rmev/Ht1x
	6rLw==
X-Gm-Message-State: APt69E2RNvtxfnJGRfQhXAFPxscAcm34beMmS879b49y4saqZAnpZKOQ
	fvtL701dtr9MWHMkHRhWCU14iJlDR33C8rPPl6M=
X-Google-Smtp-Source: AAOMgpcgbf4SiXyupAc3/0YGQU4Wg6m4oIpjmUMt286Bs5OThpMbEFUrgwB7m/TL2zDskWuxLtXsl1AVsDHZWS14Bvo=
X-Received: by 2002:a1f:2c0d:: with SMTP id
	s13-v6mr2627772vks.106.1530074866484; 
	Tue, 26 Jun 2018 21:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <1530068931-25298-1-git-send-email-daniel.diaz@linaro.org>
In-Reply-To: <1530068931-25298-1-git-send-email-daniel.diaz@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jun 2018 21:47:20 -0700
Message-ID: <CAMKF1srzsUXgdPVCuOc4NCw8qX3vipX5eGg_h7AH+73ZQCyoNQ@mail.gmail.com>
To: =?UTF-8?Q?Daniel_D=C3=ADaz_Rodr=C3=ADguez?= <daniel.diaz@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] bpftool: add new recipe
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
X-List-Received-Date: Wed, 27 Jun 2018 04:47:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 26, 2018 at 8:09 PM Daniel D=C3=ADaz <daniel.diaz@linaro.org> w=
rote:
>
> The bpftool allows for inspection and simple manipulation of
> eBPF programs and maps, so common in the kernel selftests.
>
> Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> ---
>  meta-oe/recipes-kernel/bpftool/bpftool.bb | 32 +++++++++++++++++++++++++=
++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool.bb
>
> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-=
kernel/bpftool/bpftool.bb
> new file mode 100644
> index 0000000..887f079
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "Inspect and manipulate eBPF programs and maps"
> +DESCRIPTION =3D "bpftool is a kernel tool for inspection and simple mani=
pulation \
> +of eBPF programs and maps."
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=3D801f809=
80d171dd6425610833a22dbe6"
> +DEPENDS =3D "binutils elfutils"
> +PROVIDES =3D "virtual/bpftool"
> +
> +inherit bash-completion kernelsrc kernel-arch
> +
> +do_populate_lic[depends] +=3D "virtual/kernel:do_patch"
> +
> +EXTRA_OEMAKE =3D "-C ${S}/tools/bpf/bpftool O=3D${B} CROSS=3D${TARGET_PR=
EFIX} CC=3D"${CC}" LD=3D"${LD}" AR=3D${AR} ARCH=3D${ARCH}"
> +
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"
> +
> +do_compile() {
> +    oe_runmake
> +}
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} install
> +    chown -R root:root ${D}

this chown does not seem right

> +}
> +
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +
> +python do_package_prepend() {
> +    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
> +}
> +
> +B =3D "${WORKDIR}/${BPN}-${PV}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

