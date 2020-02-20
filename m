Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id ABD0C61612
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 15:17:43 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gv17so1021436pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2020 07:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=ni8YT1222U5Kqo+zI3oxKdBtrV0So2f7a3hrv2S6T0Q=;
	b=uIagXjtdGycb3NTegAFQLZifaMNZXJL17uWwaJaEWMyw3cyAIAzzkUhq6+vrLFDXfk
	6nFCtHTLQhu0oVIR7tDsiCjAbqRBRjO5DIRaZXYC9p7TFjg3SJrGHJNq2C0l7vlPXQkh
	tRHnXcPSPtX82lxfb3k8GgZ0YC/EsXFHxrB4gBCzEJ9GD928iL8/mPLXwp+c2qFa6VS/
	XQmzI+2tuKijNxrU6goA4Gc5c7fv2K3qmIm7Dk7jPS2wKtgjJnYD4hbWXf2XzfV41w3H
	KqkVj5AShqMes+fJSeQavXmkW7MVQCLXoLwzSyVRIbWX87f7Y9F5VRQgGDFsz73YcWsH
	mw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ni8YT1222U5Kqo+zI3oxKdBtrV0So2f7a3hrv2S6T0Q=;
	b=GIaNZ52kEF1vIU+/OKgWgk53gsf5/7etfebMhgKVA8AT/kQJt/5UrMRxruTOargFE9
	5KmSLvvHVZDBfOy5S0D+pVLEWF++UbweodUKacZGT4cyXOuCYEeJH8JIu2RDzIlWiBs/
	X2lPVvbikQnP8k0wMwHJ/hszJr4ZS/1o8ITF+jIXCNERxhYvDwuWyaxhGRGP5itZ3r+j
	nzAJmeD4IotAVkCRIekb+kkBNmrFWwQz3rdKS0+Ay9rPcrhrS6dPVQySa8jUCH4mNJY6
	Pa+iQuNDXNQHzHlWHQAa789LyDyn5Fg4vOkVNWI4LRJGr5w8YyoO1mNI+mYh9aEyYrzn
	aYJw==
X-Gm-Message-State: APjAAAVESQQIF5N+QIqn/SSwyYoEE2wrV303ccIvdw8iPRGS6z8O/6tK
	M0SIdq1xWPeaORo2Y4+DAAYmUQSX
X-Google-Smtp-Source: APXvYqx8ECS/PekFz4v2DkWsf3+hLqQXekXcdONlgqBIvgACe6kAncSZCsbLiTLqipDLm/VSwH7Eag==
X-Received: by 2002:a17:90a:7345:: with SMTP id
	j5mr3985840pjs.69.1582211864476; 
	Thu, 20 Feb 2020 07:17:44 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:88be:17f0:935c:9e35?
	([2601:202:4180:a5c0:88be:17f0:935c:9e35])
	by smtp.gmail.com with ESMTPSA id
	t189sm3878837pfd.168.2020.02.20.07.17.31
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 20 Feb 2020 07:17:35 -0800 (PST)
To: Jan-Simon Moeller <dl9pf@gmx.de>, openembedded-devel@lists.openembedded.org
References: <20200219115740.25272-1-dl9pf@gmx.de>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c3dab90a-bfdd-815a-c9ae-a04ad46d7ebe@gmail.com>
Date: Thu, 20 Feb 2020 07:17:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200219115740.25272-1-dl9pf@gmx.de>
Subject: Re: [meta-oe][zeus][PATCH] meta-oe: zeus: remmina - use PACKAGECONFIG for spice
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
X-List-Received-Date: Thu, 20 Feb 2020 15:17:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Jan,

On 2/19/20 3:57 AM, Jan-Simon Moeller wrote:
> remmina depends on spice and spice-protocol but they are in meta-networking.
> Use the PACKAGECONFIG flag to avoid hardcoding the dependency.
>
> Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
> ---
>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> index 82b803a4d..5f25231c2 100644
> --- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> @@ -5,8 +5,6 @@ LICENSE = "GPLv2 & openssl"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=dab7215512044d49037272ce1ac4ea8f file://LICENSE.OpenSSL;md5=c1eb3cee0a4dea27503c531267a69769"
>  DEPENDS += "openssl freerdp gtk+3 gdk-pixbuf atk libgcrypt avahi-ui libsodium libssh vte json-glib libsoup-2.4 libvncserver libsecret"
>
> -DEPENDS_append_x86 = " spice spice-protocol"
> -DEPENDS_append_x86-64 = " spice spice-protocol"
>
>  DEPENDS_append_libc-musl = " libexecinfo"
>  LDFLAGS_append_libc-musl = " -lexecinfo"
> @@ -23,11 +21,7 @@ inherit cmake distro_features_check
>  # depends on avahi-ui with this restriction
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
> -EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF -DWITH_SPICE=OFF"
> -
> -EXTRA_OECMAKE_append_x86 = " -DWITH_SPICE=ON"
> -EXTRA_OECMAKE_append_x86-64 = " -DWITH_SPICE=ON"
> -
> +EXTRA_OECMAKE += "-DWITH_APPINDICATOR=OFF -DWITH_GETTEXT=OFF -DWITH_TRANSLATIONS=OFF"
>
>  do_install_append(){
>      # We dont need the extra stuff form other desktop environments
> @@ -36,6 +30,8 @@ do_install_append(){
>      rm -rf ${D}/${datadir}/gnome-session
>  }
>
> +PACKAGECONFIG[spice] = "-DWITH_SPICE=ON, -DWITH_SPICE=OFF, spice spice-protocol"
The above needs to be set for x86 and x86-64 systems to make this change
behave as it did before and I don't see that so its not a viable zeus
candidate.

- armin
> +
>  RDEPENDS_${PN} = "bash"
>
>  FILES_${PN}_append = " ${datadir}/icons/hicolor/*"
> --
> 2.11.0
>


