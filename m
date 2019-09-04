Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 56B437E7BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2019 22:21:15 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id o11so204782qkg.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2019 15:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ag0UT2u66QQgpbRPzX6pEzfmXOjdV3xUzT5dqCxAcNs=;
	b=LjlGfpeDjWyJ+4uKzBYdQATRBzaZ2AIzVKBPv7UribK5ZJGU5D3nCdm2eb6zWs/Wzx
	qlKOs0Mdm3xn6LsE3fUHeGWC64wuIY1UYUihjGVcIBEGteEuEJAZCc9pqsvmCgYCTkFW
	Nayv5lDGIWPAOcKK104E7B2o0kwWmmMMIZMeSix7dDtLL/bhCV6XC7yZOVR+zlrL4fcc
	8Y28HXzbFYs/5EtnBgEeHsUbP/p7hcaNbUMLnTqiNSrnDjod3MlhkKR/OTuKofD/AMs8
	xM0Bujiq8ZlGJAPPI7WNEIQMgSv8f6aYiWzezqCdWcEvefTX/iFRh32nDpKxAOhcsNGp
	9KCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ag0UT2u66QQgpbRPzX6pEzfmXOjdV3xUzT5dqCxAcNs=;
	b=V8k02YvTioRfsGAfR3ceE/wHHcwx+VEZzEFPl5Survnc8xGLo7SqFxmA2w5WWRg9ho
	wbHuMOQQFZYNP+77HpkqBjh9stS5jhwS+pRV18oMDTjAI4QvpuGnc6HpD0CT+7yYRH9d
	R7V/o4Wa62cXtAMOvTRVA7+shlhx/Bw2xgTqbYL1t/g/5dFoO6u+1OW76CESQOmuJVNP
	0R/kgmXsYvfI3bYDGKaT8cGaVt+3+R3Jcpng+cXrhHwnxTATHHrGihJCivMjEIZTs3+d
	KqRx/pTbMpeOmqBl+9Ylub7RzxVDDdwL4oFf9fUQuQuhD8bYYOUBjBXHROo+LZmkKnth
	4vBQ==
X-Gm-Message-State: APjAAAXWXapmTsHCwE3xiMhasqU+Ob0OVA03sDCRZj0H1ztWr8liAhR+
	E7vyxEXkm3R+Ui0cQyRBgR4EvMezfLI/8HfIKGs=
X-Google-Smtp-Source: APXvYqyhl+j8xNavNTVyCuoQbBUVobMlzzjtmnA1F/4WXm34k4GFHf26qXGV2XmrnlQ0ZcNYIhTAbj8hVZwcdb7adS4=
X-Received: by 2002:a37:4f97:: with SMTP id
	d145mr16773268qkb.474.1567635675873; 
	Wed, 04 Sep 2019 15:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <1567633251-7502-1-git-send-email-aehs29@gmail.com>
In-Reply-To: <1567633251-7502-1-git-send-email-aehs29@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Sep 2019 15:21:05 -0700
Message-ID: <CAMKF1sp4rXMECorH3XR-Pg3KVxZhOwSqPP7fof5LcQowCR0nqQ@mail.gmail.com>
To: Alejandro Hernandez <aehs29@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] remmina: Add recipe for the remmina remote desktop client
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
X-List-Received-Date: Wed, 04 Sep 2019 22:21:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 4, 2019 at 2:41 PM Alejandro Hernandez <aehs29@gmail.com> wrote:

> Remmina has become one of the most widely used RDP clients,
> it uses freeRDP 2.0 as a backend and also supports multiple
> network protocols like RSP, VNC, SPICE, NX, and SSH.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <aehs29@gmail.com>
> ---
>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 32
> ++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-support/remmina/remmina_1.3.6.bb
>
> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> new file mode 100644
> index 0000000..81514fa
> --- /dev/null
> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION = "A feature rich Remote Desktop Application written in GTK+"
> +HOMEPAGE = "https://remmina.org"
> +LICENSE = "GPLv2 & openssl"
> +SECTION = "Support"
> +
> +SRC_URI = "
> https://gitlab.com/Remmina/Remmina/-/archive/v${PV}/Remmina-v${PV}.tar.bz2
> \
> +"
> +
> +S = "${WORKDIR}/Remmina-v${PV}"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f
> file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
> +
> +
> +SRC_URI[md5sum] = "6da599c3a5cab2df37a70f8fba2f5438"
> +SRC_URI[sha256sum] =
> "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea556af1a"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF
> -DWITH_TRANSLATIONS=OFF"
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
> +
> +DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui
> libsodium libssh vte json-glib libsoup-2.4 libvncserver spice
> spice-protocol libsecret"
>

I think the depends section should be above at least rdep section maybe
better run the Oe-stylize script on it and adjust for format while you are
here

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

