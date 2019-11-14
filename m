Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0FA7FA1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 21:39:27 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id q19so2999149qvs.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 13:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ETIU61HXS7TnxUfmwbqxhg1KO+r/Fbec91miDvq0lVw=;
	b=Ur4KYtFr8u3uR3tsIFbVPGCmKeECHe2oP2xw3lP5jmA+URMaoQpFmzfS+pka6i8p/g
	Bf7i/uNGQELvXDBYzQOSGF9SSri0WMDoIfKnn+e6HBWqqo8yDe6ApffghmPXbeDZEQ07
	RpCrGceJMIMaXU8XgR7WaNjxajlIENY8zqfAp4WlrOYNwv9CnxO/C8GBbN+J2wOCCJ35
	pY2QFzGmPv2vlsEEsRWBlndXP7cuUKc91d3cLIVifItE9D8MWYt9e1w1WNOg9lOleyLc
	BTR4Ts5pUIzJbVS3rCMPt163UjuXz4DjdZOHlhxCgNnWK6YoLk24Fy6dLp3MsPl7v+Xv
	9klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ETIU61HXS7TnxUfmwbqxhg1KO+r/Fbec91miDvq0lVw=;
	b=ULGYpEZTSU1wuDs5IX0/mmkNYPRYcLndAPucWzmKXNsX21skNAYnbLHh9LW45ADxzv
	Yo3QritvXf4mCINPupDodnD2mzQgKqzgfCBymtizcdbvVZixoxxQVKEwaP6BteASWAOB
	aGdanC0avRJjCWeoKwletfwZM9uJyJx0gYclw2NGmbFlHRBPqScjmnf6keXdPFKDDlzW
	nBDEFsDtRLRfp/qQBadXxndQxNk1kkVMNCF7Z6Qm0ni4Tj2PkJsD/nUxHm+VDsjUxcg3
	mb6gyaQWahrpGL5g0URivz2tDCrNdZPu+TG926L/olCAjtL0Ritwy07DfIDg/6J9xTWo
	VAdA==
X-Gm-Message-State: APjAAAWjQy+A0Usn+Ow3xBZHJKq9Efh364ciEmpQiHeJvlVwXz1Irvo0
	eQk6RjSq+9snbvt8/h2ITWNPT8LVH56AjBVAPmI=
X-Google-Smtp-Source: APXvYqyx00MX8+LL/qKtNpQD03dnVuqSH410x2zZYXtWa1r2+w+1zSrdQMbZM0Vg8dfD0VHLZx9HXkR+sxPZ/79qBXU=
X-Received: by 2002:ad4:4dce:: with SMTP id cw14mr8025748qvb.185.1573767567499;
	Thu, 14 Nov 2019 13:39:27 -0800 (PST)
MIME-Version: 1.0
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
	<20191114194930.2786-16-schnitzeltony@gmail.com>
In-Reply-To: <20191114194930.2786-16-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Nov 2019 13:39:01 -0800
Message-ID: <CAMKF1soTKvJ=uYgm-Q51yq8xGcissdwf4nKzR3qxXKwPTUXrgA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 15/16] libwacom: initial add 0.33
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
X-List-Received-Date: Thu, 14 Nov 2019 21:39:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 11:51 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> * it is a dependency for upcoming gnome-settings-daemon
> * there are later versions of libwacom availabvle but due to genaration o=
f
>   udev-rule at build time these versions open nasty native dependencies:
>   libgudev-native -> udev-native
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../recipes-support/libwacom/libwacom_0.33.bb      | 14 ++++++++++++++

the latest release is 1.1, any specific reasons to not use that ?

>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
>
> diff --git a/meta-gnome/recipes-support/libwacom/libwacom_0.33.bb b/meta-=
gnome/recipes-support/libwacom/libwacom_0.33.bb
> new file mode 100644
> index 000000000..6fb3b82ef
> --- /dev/null
> +++ b/meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "A tablet description library"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D40a21fffb367c82f39fd91a3b137c=
36e"
> +
> +DEPENDS =3D " \
> +    libxml2-native \
> +    libgudev \
> +"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI =3D "git://github.com/linuxwacom/libwacom.git"
> +SRCREV =3D "87cc710e21a6220e267dd08936bbec2932aa3658"
> +S =3D "${WORKDIR}/git"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

