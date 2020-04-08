Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.3001.1586307168086757920
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 17:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rNTdc4cW;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id 130so1526822qke.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Apr 2020 17:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zYTzkKRKu2Sh6tUe6gPWTUI8v5Fgpt2l0BtubCsOwVg=;
        b=rNTdc4cW461Q9r00VHZDc62lDIodhu//iieZFWKNQmfyCoVlKQBvHbQPKq41dfuJfw
         GQhQZbPW802opHofuYCVvYFcUGkKFToiTxwgm3DoIv3qKOR/yqUcgHmbCjOJpbZM2jLR
         8dwo9bGlZor61fQGSpiXSxhExL8BJY4MLa5AEuSlpbviReQnLe4UtdTKiZlaRyqeWZkY
         Ss25IR8nQWtLneyufKAWAqYAsJL9eAaRn+7qkHTV5YDAhAzSQHEf5viEjkTTLobRi2QN
         lZDwnhHEaFOpdf5nUFcQwnIS35RqqvfugX4G4vQEusNQahwYDWPq8vIaXOfOHfhVLeKc
         5LXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zYTzkKRKu2Sh6tUe6gPWTUI8v5Fgpt2l0BtubCsOwVg=;
        b=EIj6JM+y1iMlbMAtEwsDFMIDWQLmMotY0Di8RJUxcXcoollbXiJ01Jy4lYY6K39bfk
         Bv74DZJRPOz3kXiSEe/AG2IjWC5XooBjUkBIA1dvDpnONYOgee9V07Vp/J70u8M2Uell
         AKcE7/YTcb00N3dOO9nr/FeU2vSQZFxroMRrVvy+d5c1TW1eL4bynzodsWFCc43hiUnR
         qQB3HoBInWyLTQRh4crpHvNAeeMuWMqumG5KoT6QFC26zNzHEFFlXyPWNzjpVIc/BB3d
         iiZvH3lMIfj4V9V/KGd12B5Yp0ZOZGucXv3nimchUcnyHVrGEYwAMf+bh5ba2/LZDxrb
         hllw==
X-Gm-Message-State: AGi0PubuxOpiBUB6IF7eb/pMZWYiH2dYyfD48AXDuqnvagCOEwOilp9B
	j1GdY5kUWpMrNitdzDPY6hqDJoZoITW4bpQtOsg=
X-Google-Smtp-Source: APiQypKo3oHbBO05cjYxPcO9QzQoXdjsJH959QPjvtQhU3t7F6IE1JTqVuyEcT3UqsY1p3mu+2MwsofXGEmjzn+Njr4=
X-Received: by 2002:a37:bd81:: with SMTP id n123mr5090305qkf.431.1586307166849;
 Tue, 07 Apr 2020 17:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <87o8s3qedm.fsf@windriver.com>
In-Reply-To: <87o8s3qedm.fsf@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 7 Apr 2020 17:52:20 -0700
Message-ID: <CAMKF1sq3HPW2t=v3CTFHOC=acBUeOm2e+VjdGujdQ0Ojnfg_1Q@mail.gmail.com>
Subject: Re: [oe] [PATCH] wireshark: poppler: prevent PACKAGECONFIG change based on different layers
To: Matthew <matthew.zeng@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 7, 2020 at 12:34 PM Matthew <matthew.zeng@windriver.com> wrote:
>
>     As per discussed in a previous email under the subject "Regarding
>     poppler auto PACKAGECONFIG when qt5-layer exists", adding a layer
>     but not using it should not change PACKAGECONFIG automatically. It
>     may result unexpected error.
>

Please rebase it on latest master or master-next and resend it


> Signed-off-by: Matthew Zeng <matthew.zeng@windriver.com>
> ---
>  meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb | 2 +-
>  meta-oe/recipes-support/poppler/poppler_0.85.0.bb            | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
> index 91a7e1a36..db545028f 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
> @@ -19,7 +19,7 @@ PE = "1"
>
>  inherit cmake pkgconfig python3native perlnative upstream-version-is-even mime mime-xdg
>
> -PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5 plugins', '', d)}"
> +PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
>
>  PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
>
> diff --git a/meta-oe/recipes-support/poppler/poppler_0.85.0.bb b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> index 2f5d094fb..366f0c5cf 100644
> --- a/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> @@ -14,7 +14,7 @@ DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
>
>  inherit cmake pkgconfig gobject-introspection
>
> -PACKAGECONFIG ??= "jpeg openjpeg png tiff nss ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
> +PACKAGECONFIG ??= "jpeg openjpeg png tiff nss"
>  PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON -DENABLE_DCTDECODER=libjpeg,-DWITH_JPEG=OFF -DENABLE_DCTDECODER=none,jpeg"
>  PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng"
>  PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff"
> --
> 2.24.0
> 
