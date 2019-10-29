Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD4060125
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:27:43 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l3so281490qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 14:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RFsAZkuDcQjYS/jq27S8Mk5WVjG3GjWZLS29KxtWyWc=;
	b=nArlrjmuN06GakCjEgRDIT/J7o+IPVOapq2UXP6jTBMPmJxYlhZjC7lb7dCl5kfwYI
	AtSfRbj6FhBSsJUj2fZ74ZdvWLDTv1VGXsBZloxyl0Q+GsWOaPWnip4Qps7sH0kBpZOl
	DeZ8gewyIWuuiWbkeuyPWBnZbrZPgNx/JcDzxVnUEsOGdg0KkusRUgBVdZsCD7FNiPjl
	UnBb8A1s5cJS3Yp5Ef36A4rndKizajBKkLj6xO1RcrPhorGdRqMcf+Tlzg2mOMYKhkMK
	fax69+kXJwdhRSVe1VAel639KnX/r9+PbqNhYX+XihCZDjVUYfGfR0zz7nTmwlWotevi
	b/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RFsAZkuDcQjYS/jq27S8Mk5WVjG3GjWZLS29KxtWyWc=;
	b=AmyKKCLvymQiRndzUBKcI6c4uecDBJDeIW4vqqhBQk/w9kpMuFtKbEdAxsMN0kp7Xb
	Z0MotIRPv1LyGYI+xi37YHXS6zrunPm0mu/sL4o3o1y9ZEoEJ3tQQ+EKNbkKOKmZEUf6
	tUJqHKEbXoBKvT22YAFed4rRM3aI97iBh8I8b+UtJvj434tTHyqBZyd634RVruvXkSl8
	eGkehOfhpxKILZgDdINTnVncs6UYM+6DDkmkF1gRqJ0JpV74HcSPIqueQOq5L29WZCVd
	trtf1DTOmIWyfIbxvQ6oi0+9V4nGoUhKo3t9TlzE+je1itCm0TDMRAVccC/B8/KlBq2j
	E3Jw==
X-Gm-Message-State: APjAAAUZ05ruo4JhDyaiMfxVRCq6mTNb7C9qzqfN0kUNGo6CwD7j+fnB
	8lguY1Cse7sm6q5CDc6g8LLuQ5AIC7/tjkxYytzmIeGyARwHSA==
X-Google-Smtp-Source: APXvYqy6/W5fpjS3Nmx3g5+i1SaylDvGmxZ2U9lzf7V/aG9lsRuyYdhFzldVSGA8kw6VoJxTqQ4vqDM6Te7iCi4EuUc=
X-Received: by 2002:ac8:411b:: with SMTP id q27mr1476292qtl.53.1572384463763; 
	Tue, 29 Oct 2019 14:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191029102000.11329-1-mns@gomspace.com>
In-Reply-To: <20191029102000.11329-1-mns@gomspace.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Oct 2019 22:27:17 +0100
Message-ID: <CAMKF1spaJvH1AS15KK1MUwD7HM-UKiGtb1oB9eRRBe-t9kxHyg@mail.gmail.com>
To: Martin Siegumfeldt <mns@gomspace.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] libiio: Conditionally inherit distutils3-base
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
X-List-Received-Date: Tue, 29 Oct 2019 21:27:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 29, 2019 at 11:21 AM Martin Siegumfeldt <mns@gomspace.com> wrote:
>
>  * inherit only when libiio-python3 is build.
>
>  * also add PACKAGECONFIG variant that allows python bindings to be
>    enabled and disabled. It adheres to the current CMake logic and
>    defaults to an 'out-out' approach.
>
> Signed-off-by: Martin Siegumfeldt <mns@gomspace.com>
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> index e6e0eaef8..ec3a39de1 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
>
>  S = "${WORKDIR}/git"
>
> -inherit cmake python3native systemd distutils3-base
> +inherit cmake python3native systemd
>
>  DEPENDS = " \
>      flex-native bison-native libaio \
> @@ -25,10 +25,13 @@ EXTRA_OECMAKE = " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
>  "
>
> -PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
> +PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND PYTHON_BINDINGS"

this change is not needed.

>
>  PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
>  PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
> +PACKAGECONFIG[PYTHON_BINDINGS] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"

this should be
PACKAGECONFIG[libiio-python3] = "-DPYTHON_BINDINGS=ON,-DPYTHON_BINDINGS=OFF"

> +
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'distutils3-base', '', d)}
>
>  PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-${PYTHON_PN}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

