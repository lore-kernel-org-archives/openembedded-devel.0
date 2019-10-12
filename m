Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id D80026D74B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 15:37:06 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f14so2405400pgi.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2019 08:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=2ajJ7O/Zu3t1FZaKNzMf2u64T9oDkQwGtgi8XNTmzcc=;
	b=NTj45+steIZkfiQTIYTfW/ngX68JoDBU8WTAI56WhM04gKy1lGEJEyLMt4Lr6nVWAO
	rCv39RD23YkMrFhuVLakI2/bhhmo1sqCtA+xgOkCwDJmUbyrEpTfAKspm5IfjBbGmb9Z
	vbx6IwkI8Ci68t/yG190NP/Sgxm0adyHr6WwwHyPxT+80Vs2/BXGlZ/w2lFYG7Tw8Biy
	M4lRU+oRpVd6S6dQ+8cmet7f47Rop8TKkEZKo5u3jrfDhTJPiLJ6PlIh73tIECjWM78m
	dM98404BxCC8re4aW6ih+N0Z1Bg2ccYGy+2kdyuFQ5K3AKaoJg0VoYanOpU95jGkBRbo
	NqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=2ajJ7O/Zu3t1FZaKNzMf2u64T9oDkQwGtgi8XNTmzcc=;
	b=JmVcWCxLYnGKlCZ4GP7QCkXzC32V7+IIcE+AJ0doDElueFAnTcbz9Vcc4MXOdxQodJ
	zTGsC/eci0CEycXgEH8h/x7Lzjxo6rwiiyElv3cAJRcMEqisFq5WyQb2lPpYmxBoJ80O
	QEeBfLW75JqH6ywZ4WnCiwwkXKsMFw365ZAU4mvPul/kLHOp47vxtq1Si0QbvAHmxjnr
	tQJbolQutG2DXTJBzgU0h3RoivK9LfxsH7ykKJyNM50g3VEZzOeoTI/I5akmmpjFsV2X
	woju9JiSg99mUX6jcff9ZY+sBzD68DLgggZbwULRzAvjXkcCqwpainWEHHSRxoJgI70+
	tyzQ==
X-Gm-Message-State: APjAAAVn3U/h6hI1sGQUwqq33X4SdJWuSRmgSSxasda+xIqWi6JUOdEh
	MCT/A4T239Bqev/xqEB64Os=
X-Google-Smtp-Source: APXvYqyGS96Fxo0jBikJ++hkDw36Z1xdByEVBwiuNvdoS0Qe26aKIK2zRGDHfObz1Itkp2DvBgB4Lg==
X-Received: by 2002:a17:90a:1b45:: with SMTP id
	q63mr24329275pjq.106.1570894627629; 
	Sat, 12 Oct 2019 08:37:07 -0700 (PDT)
Received: from tyche ([2601:646:8500:1c20::3d0e])
	by smtp.gmail.com with ESMTPSA id
	g35sm10732148pgl.27.2019.10.12.08.37.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 08:37:06 -0700 (PDT)
Message-ID: <1ff659c05553cc4516ff8a446525d46199c1946a.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>, 
	openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2019 08:37:05 -0700
In-Reply-To: <20191012124434.129278-2-stefan.wiehler@missinglinkelectronics.com>
References: <20191009151926.1733788-1-raj.khem@gmail.com>
	<20191012124434.129278-1-stefan.wiehler@missinglinkelectronics.com>
	<20191012124434.129278-2-stefan.wiehler@missinglinkelectronics.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] nvme-cli: defer host ID generation to post installation
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
X-List-Received-Date: Sat, 12 Oct 2019 15:37:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Stefan

Please rebase it on top of latest master and resend please. Since half
of this patch is already merged.

On Sat, 2019-10-12 at 14:44 +0200, Stefan Wiehler wrote:
> Signed-off-by: Stefan Wiehler <
> stefan.wiehler@missinglinkelectronics.com>
> ---
>  meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb b/meta-
> oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
> index 256d83f03..061c7a0fe 100644
> --- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
> +++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_1.9.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/linux-nvme/nvme-cli"
>  SECTION = "console/utils"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM =
> "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022"
> -DEPENDS = "util-linux util-linux-native"
> +DEPENDS = "util-linux"
>  PV .= "+git${SRCPV}"
>  
>  SRC_URI = "git://github.com/linux-nvme/nvme-cli.git"
> @@ -15,15 +15,18 @@ S = "${WORKDIR}/git"
>  inherit bash-completion systemd
>  
>  do_install() {
> -    oe_runmake install DESTDIR=${D} PREFIX=${prefix} \
> +    oe_runmake install-spec DESTDIR=${D} PREFIX=${prefix} \
>          UDEVDIR=${nonarch_base_libdir}/udev
> SYSTEMDDIR=${systemd_unitdir}
>  }
>  
>  pkg_postinst_ontarget_${PN}() {
>      ${sbindir}/nvme gen-hostnqn > ${sysconfdir}/nvme/hostnqn
> +    ${bindir}/uuidgen > ${sysconfdir}/nvme/hostid
>  }
>  
>  PACKAGES =+ "${PN}-dracut ${PN}-zsh-completion"
>  
>  FILES_${PN}-dracut = "${libdir}/dracut/dracut.conf.d"
>  FILES_${PN}-zsh-completion = "${datadir}/zsh/site-functions"
> +
> +RDEPENDS_${PN} = "util-linux-uuidgen"
> -- 
> 2.19.2
> 


