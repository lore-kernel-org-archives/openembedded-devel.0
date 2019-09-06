Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id C75977EF4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2019 01:11:47 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s12so3138387pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2019 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=wwfppFPGcgv3GvOmpkLRlEsASSZpfG5aoNOoBEqz7CI=;
	b=A95DfoJVuEgwQla26J7QyDX9MmFc77sg2w6hLtRZvIqKwyjjGSaUFeCukgPr5GDIS4
	lpTertxvTrqTEAl4xjqPNUqQPZzfLmBibLR4o57O/GM4zYBSMLrGPvvgOinSCAJUZWMz
	Q5Q7Ypi/Wc7Urk+sexnmHPTpuFvg8onorw2SBj/boj+viSf3kSCXi2JTeJNvOtRFOQv9
	0lViQDxRLyTu8g98CNLavxdJfArBkEsk8J0r8vVpCRBekqqB3FffhALJoK13DpIcHNsq
	bvwbrCD45ld7Cud2VQ5nXXqK2OvOiiOG+ShUT0B7srbw6sAbv/mr0Sp96AWYCmogR1EW
	7Cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=wwfppFPGcgv3GvOmpkLRlEsASSZpfG5aoNOoBEqz7CI=;
	b=eQLY5sKSMiCJ/71zGCJbNbOtlfrn5VY392g3QWH2YZMEHrvLBt4t6m2JyJiMOfh5D7
	b9WPh/oDVuePrnd64ttMxtCzqsr1XVnEiYiF6PmSoIx1giM8qHPQZDxubmduZo4sDsh9
	ut6s/AMqoQT/tU2h9DvtA4/Qz75zh0DU3uS5LRC5lxkr91+sXxcZDc3WO2Bm9XlWnXTg
	PUBk9sjc1kRKpJuHAHjZy/1oN2DyPXOjxwfUpZZcBR9i0zi1S9b/Hj4hv9Uih5sBP+xh
	az712hI9fkIFNit6y8uNyk/+t3JiMO10oA6lXtQU9jINFTHGGqbkPSQRSb+ScUiowSGM
	xCbg==
X-Gm-Message-State: APjAAAWxkFArGqJQsfYIEuKbrheGPFnGxb2Ks9GcS7ZcR3yfsZtT63+/
	zhpqA7kEdhqsw70GDjAwr2HwMdP5pds=
X-Google-Smtp-Source: APXvYqx/Udmt8DUnPq8Quv412R3JTCHB1mILreoOgEBQVpraPs3OXNWDJCS6o+5PLrKmtzdMz+6+FA==
X-Received: by 2002:aa7:9794:: with SMTP id o20mr7665919pfp.8.1567732308205;
	Thu, 05 Sep 2019 18:11:48 -0700 (PDT)
Received: from [10.0.0.10] (c-73-71-176-3.hsd1.ca.comcast.net. [73.71.176.3])
	by smtp.gmail.com with ESMTPSA id
	i10sm4055733pfo.102.2019.09.05.18.11.47
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Sep 2019 18:11:47 -0700 (PDT)
To: Alejandro Hernandez <aehs29@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1567637877-16295-1-git-send-email-aehs29@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <242a65b6-dd3e-66a3-e412-351eed4da7b6@gmail.com>
Date: Thu, 5 Sep 2019 18:11:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1567637877-16295-1-git-send-email-aehs29@gmail.com>
Subject: Re: [meta-oe][PATCH v2] remmina: Add recipe for the remmina remote desktop client
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
X-List-Received-Date: Fri, 06 Sep 2019 01:11:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

we might need to add libexecinfo to DEPENDS on musl see

https://errors.yoctoproject.org/Errors/Details/268552/

can you take a look ?

On 9/4/19 3:57 PM, Alejandro Hernandez wrote:
> Remmina has become one of the most widely used RDP clients,
> it uses freeRDP 2.0 as a backend and also supports multiple
> network protocols like RSP, VNC, SPICE, NX, and SSH.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
> ---
>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-support/remmina/remmina_1.3.6.bb
>
> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> new file mode 100644
> index 0000000..a14a259
> --- /dev/null
> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "A feature rich Remote Desktop Application written in GTK+"
> +HOMEPAGE = "https://remmina.org"
> +SECTION = "Support"
> +LICENSE = "GPLv2 & openssl"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
> +DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver spice spice-protocol libsecret"
> +
> +SRC_URI = "https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2 \
> +"
> +SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
> +SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea556af1a"
> +
> +S = "${WORKDIR}/Remmina-v${PV}"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
> +
> +do_install_append(){
> +    # We dont need the extra stuff form other desktop environments
> +    rm -rf ${D}/${datadir}/xsessions
> +    rm -rf ${D}/${datadir}/metainfo
> +    rm -rf ${D}/${datadir}/gnome-session
> +}
> +
> +RDEPENDS_${PN} = "bash"
> +
> +FILES_${PN}_append = " ${datadir}/icons/hicolor/*"

