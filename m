Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0CAD66BF37
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 08:01:17 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id x1so5731429qkl.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 00:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=164Yd16Uufkr8htIP4uajc4Et1EGwPwSKeG758koKKg=;
	b=J9cxJ8F00izis3Bt8ZS2/zq2QwVSb4wXR/EVKNvG5iTQdtfrWTEl69bUMO9P/E3qA6
	dk35iUdDKZmDgmOwNkkqU9KnHWIg1zCBE9zXQVNn6EskoFNx9Pf3e/sSveGGMhXKq9zZ
	ZkqUWFSJ4NEnzkRNdbsT8SdXKGhZE3QPxpgjjdGcmxBVfjOFuG8ZLM/cjacKDUuJmE9a
	ih7kL7FIlkvvehjRtMEkpYvkJaF9qOptM316seZ1nJljmP/4DKGPsymshC6tNY/1duGv
	hYTxX5E+WZddpSbq2X0Wj70dlRvVLWBaS831GuCPdG5kZxq9lW1Oi9oam+ryO9+YNvpB
	9TDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=164Yd16Uufkr8htIP4uajc4Et1EGwPwSKeG758koKKg=;
	b=PaFfe5z8vKMODqbiH1ManBKBwIfHmtzqDwFZpys0C/aGqnr/nTBXj4fV8IsfmgPLas
	ZPrw2xj4/W48w7IpzRV6azGdly5T1um129ewPht//YwlIEYTvF1vw51BBojCrsgwp5ea
	kHf9O9XcoqgzBkpp/OB/CF4iQkLdZULe0YN7f+nKDtpIM1UqEwCgaM9WILmbspxRjSbs
	SHdQIapY3PccXDpMxumLkfPiFcDp4loDwn95P1GsI1C9RvC7JiuJd57hIQFUiBehj+1T
	DlMb8L31d6+1B4HakWivO0DMOEdweZlfmSRsvd1JYl37hnrBDW6urrN5sHW4RdUVFTXj
	O/+Q==
X-Gm-Message-State: APjAAAUINzXgNu8638Cz0vqzbQfaJmDyHgoQJbhvyZ02IggI1r9KS0ME
	RlmfbDaxibU3+wBATQIpmeoA3JlfooTmDzpRP50=
X-Google-Smtp-Source: APXvYqyTa6fBtqiI/i21mRm20M0dQhR8zbgsOtCwvCoalgTOB9ny3MMGS+ejR0ijq+4mnd/7IG3quEu8uENmodps1IA=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr12969083qke.9.1575619278362; 
	Fri, 06 Dec 2019 00:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20191206000912.19841-1-schnitzeltony@gmail.com>
	<20191206000912.19841-22-schnitzeltony@gmail.com>
In-Reply-To: <20191206000912.19841-22-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Dec 2019 00:00:52 -0800
Message-ID: <CAMKF1sroq9=eexVrX0QHH2-287rXQkg48pAVqCNjiyL5MA3GWw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 21/21] Add: packagegroup-gnome-apps / packagegroup-gnome-desktop
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
X-List-Received-Date: Fri, 06 Dec 2019 08:01:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2019 at 4:12 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../packagegroups/packagegroup-gnome-apps.bb  | 20 ++++++++++++++
>  .../packagegroup-gnome-desktop.bb             | 26 +++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup=
-gnome-apps.bb
>  create mode 100644 meta-gnome/recipes-support/packagegroups/packagegroup=
-gnome-desktop.bb
>
> diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-=
apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.=
bb
> new file mode 100644
> index 000000000..d7f1df8f2
> --- /dev/null
> +++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "GNOME applications"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> +
> +inherit packagegroup features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +RDEPENDS_${PN} =3D " \
> +    evolution-data-server \
> +    evince \
> +    file-roller \
> +    gedit \
> +    gnome-font-viewer \
> +    gnome-system-monitor \
> +    gnome-terminal \
> +    libwnck3 \
> +    nautilus \
> +    wv \

wv provider recipe is missing,

> +"
> diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-=
desktop.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-de=
sktop.bb
> new file mode 100644
> index 000000000..b9e1f8764
> --- /dev/null
> +++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-desktop=
.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "Basic GNOME desktop"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> +
> +inherit packagegroup features_check
> +
> +REQUIRED_DISTRO_FEATURES =3D "x11"
> +
> +RDEPENDS_${PN} =3D " \
> +    adwaita-icon-theme \
> +    adwaita-icon-theme-cursors \
> +    evolution-data-server \
> +    gnome-backgrounds \
> +    gnome-bluetooth \
> +    gnome-control-center \
> +    gnome-desktop3 \
> +    gnome-flashback \
> +    gnome-keyring \
> +    gnome-menus3 \
> +    gnome-session \
> +    gnome-settings-daemon \
> +    gnome-shell \
> +    gnome-shell-extensions \
> +    gmime \
> +    gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash \
> +"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

