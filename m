Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3B66671A6B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:05:18 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id m5so12630904wrg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 02:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JdWnbT0E9CAgfF0tPhZjvK22pvYqffuqlpqsPW+sSEc=;
	b=eACQPwWaFoyfn2AHztWgBpai3GszrXC9G1m7cvNjmsBOBoTri0pXXn7R/g3beup5aT
	WuNO4H23e6cluEahphuAUmOaNyqqklCXreh1QJmbYE+eLkYCgND/RIC31AfjTVev1kF6
	aDP96fWHEGms5JHflvAoX+VhRDY+PkZSCLWVA4Da684pf1Dmfp3ptj4NXTtCkFDgAZ5V
	wM3ST4EEopdnPucG7KgVPDpIvI2OZFazKeJRxA3FK5cZu2DFv1tdavqhQeChMWxYft5f
	D82g/tKeIoJ8wUO6GZn3jvBKZ5p3j4gHZey3fXxR0Cix9lbTLGO3S41SpAG2TSUA9VjZ
	TqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JdWnbT0E9CAgfF0tPhZjvK22pvYqffuqlpqsPW+sSEc=;
	b=R+/6RgPF94VsXN4U7thLX8qNp6cKWSHNQjPSpCC/RgrCqz0vcdmnRvWfSLZy82xxb9
	DzGX8Ew/dmG0BKP5ctMdjJ9y83paHHTS/ek3HPiP2t19FfpUN1gp2cBzH1UhNyXOWqdT
	H7nHtbQKwUYKMCFNAH4+QWwpBmRuwuSKHLpizCpnRVHMj3c9TRoPUljQt8ymj8KPnCYs
	XV7J5i0MQZfJwlfwbP2XsqKrm0z5e6NavHPFB5Xvpaiy5WVthm+3ANkNE68aABzFPwOw
	4WeXCkR/f2pCLe/vRiSMYAO5AuwTwoVpplfVHSczPUARV3d/MM7c2/WSlI0DcR9XBGz2
	L2+g==
X-Gm-Message-State: APf1xPC0LqvDk1MqHtLM/RtFXpg+5Pf3QgJSCR7Pd2+5q2q0GRa6y+lG
	mszIq9Ujzk/mHOcW6xEzim3Huq43D7CRO+B5HmCw/A==
X-Google-Smtp-Source: AH8x225SjkvUHCd3eqU3Nr65+xFvcmfFjxW3xtxGMOwa4lFUuBlh7smuZausQCvxRPJBcetQp3YMFh6ix7UJ8IwfWnU=
X-Received: by 10.223.161.77 with SMTP id r13mr15466788wrr.230.1519121119781; 
	Tue, 20 Feb 2018 02:05:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 20 Feb 2018 02:05:18 -0800 (PST)
In-Reply-To: <B2794334-CD7F-4E09-9E3B-51AB564E3A04@qt.io>
References: <1519030401-9299-1-git-send-email-kwangsub.kim@qt.io>
	<CA+chaQfbgo2cG1zJ+UmBRWGaKu6vUy4Kod7SSOZk7=ZhjzF5SQ@mail.gmail.com>
	<B2794334-CD7F-4E09-9E3B-51AB564E3A04@qt.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Feb 2018 11:05:18 +0100
Message-ID: <CA+chaQffOATO2cZbZBR5u=YSO6T74icL7W2hA88bZ0SwX25rAA@mail.gmail.com>
To: Kwangsub Kim <kwangsub.kim@qt.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2] qtbase: add a config option to optimize for size
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
X-List-Received-Date: Tue, 20 Feb 2018 10:05:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

that's not what is wrong with this.

What you're doing is:
PACKAGECONFIG[optimize-size] =3D "-optimize-size,-optimize-size"
when -Os is enabled and
PACKAGECONFIG[optimize-size] =3D "-optimize-size"
when it isn't but, that's not how PACKAGECONFIG is used by any sane person.

What you should do is to keep:
PACKAGECONFIG[optimize-size] =3D "-optimize-size"

as it was and add:
${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Os', 'optimize-size', '',
d)}
in default PACKAGECONFIG variable (search "PACKAGECONFIG ?=3D " \", or you
can add it to PACKAGECONFIG_DEFAULT variable).

Regards,

On Tue, Feb 20, 2018 at 8:39 AM, Kwangsub Kim <kwangsub.kim@qt.io> wrote:

> Hi Martin,
>
>
>
> Thanks for your feedback.
>
> I failed to find a right way to add the inline function. That=E2=80=99s w=
hy I
> added new variable. I tried to update like below but it caused a syntax
> error. The function (bb.utils.contains) was not evaluated and just copied
> as a string. Could you kindly advise me to fix this?
>
>
>
> PACKAGECONFIG[optimize-size] =3D "-optimize-size,${@bb.utils.
> contains('SELECTED_OPTIMIZATION', '-Os', '-optimize-size', '', d)}"
>
>
>
> Best regards,
>
> Kwangsub
>
>
>
> *From: *Martin Jansa <martin.jansa@gmail.com>
> *Date: *Monday, 19 February 2018 at 9:07 PM
> *To: *Kwangsub Kim <kwangsub.kim@qt.io>
> *Cc: *openembedded-devel <openembedded-devel@lists.openembedded.org>
> *Subject: *Re: [oe] [meta-qt5][PATCH v2] qtbase: add a config option to
> optimize for size
>
>
>
> This doesn't make sense.
>
>
>
> Leave PACKAGECONFIG[optimize-size] as it was in v2 and add
> ${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Os', 'optimize-size', '',
> d)} to default PACKAGECONFIG value.
>
>
>
>
>
> On Mon, Feb 19, 2018 at 9:53 AM, Kwangsub Kim <kwangsub.kim@qt.io> wrote:
>
> The '-optimize-size' option would enable the compiler to optimize
> for size instead of speed. If the global compiler option already
> included '-Os', this option would be enabled by default.
>
> It would affect the whole Qt libraries and Qt applications as well.
> This feature is available in Qt 5.9+.
>
> Signed-off-by: Kwangsub Kim <kwangsub.kim@qt.io>
> ---
>  recipes-qt/qt5/qtbase_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> index 4f3ade2..208a755 100644
> --- a/recipes-qt/qt5/qtbase_git.bb
> +++ b/recipes-qt/qt5/qtbase_git.bb
> @@ -147,6 +147,9 @@ PACKAGECONFIG[widgets] =3D "-widgets,-no-widgets"
>  PACKAGECONFIG[libproxy] =3D "-libproxy,-no-libproxy,libproxy"
>  PACKAGECONFIG[libinput] =3D "-libinput,-no-libinput,libinput"
>  PACKAGECONFIG[journald] =3D "-journald,-no-journald,systemd"
> +PACKAGECONFIG[optimize-size] =3D "-optimize-size,${QT_DEFAULT_
> OPTIMIZATION_FOR_SIZE}"
> +
> +QT_DEFAULT_OPTIMIZATION_FOR_SIZE =3D "${@bb.utils.contains('SELECTED_OPT=
IMIZATION',
> '-Os', '-optimize-size', '', d)}"
>
>  QT_CONFIG_FLAGS_GOLD =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', '-use-gold-linker', '-no-use-gold-linker', d)}"
>  QT_CONFIG_FLAGS +=3D " \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

