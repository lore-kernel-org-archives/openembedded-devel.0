Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 896716D196
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 02:30:21 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id u7so16914594qtg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 18:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sPAtdHhJ0tz3NepqIw4VzN8Gycj95L0i1ubO4GCA0KQ=;
	b=ZZx96Rvx+VO66ZNMwGMcyKtPAoPMtxkjdAYluRN2YdB8w6M0vgAe7cTzwOQDwPAXOS
	PQ3JoOY9jqgCf9e6Da4R+AM3bTWGYDSwB/LLwNhXGW0wCkBF8vCJ4uIx9Sn30Aizx4/T
	CsRjF/WGPua+9JKXpiZC4h18nimKTWuLdV3zdA9dxy8ITwp3XnAYU9ceXc73Hca8bdFN
	sAu4S9PH+D/oKmWYWXDG4sFoP2+M9NkldJaVzdoc/Jy7/cUypQCKsy2ENR5+ypqGZmpF
	iJjYb3/JXSnY042hnj7uh1pW6cVJeo+oglVgASg1PTdhW3pK+RprKiPRfwYx5BnsQceC
	P0iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sPAtdHhJ0tz3NepqIw4VzN8Gycj95L0i1ubO4GCA0KQ=;
	b=NcDJGw3jvlVl5Wvs1+VzPiLX4xuhEneMaOxBVD4SrS0ezDXchtxamY0nToJQDWFZtf
	+rl76Urg2f07QWBbFGMmWidTd9omGuPVQc7udjIRty7IgYhnQ+g2w7mqBhxpSHEzfo4x
	Hf0EPe/UcbVLOwWGwvhkh1Gzn422+guC7lE82EeuaNFwfVsHxWCnRWmK06LWKeVXm2fh
	/Xl/dODzyIgwsAGYFHgEnWhy7CDsfo3TjTDk9rV0P38vTezYCP6KBf8gYij6snllHoes
	bcIiDccROaAoTbOiuzOwypf2r2HiyBQgfqlHjIwxR44/wl1sU8ZnhkYAKpxMEMT4za/5
	bxfA==
X-Gm-Message-State: APjAAAXzmlO0t2oScjoy05Lf8Ku4cGWVQI+5pYQCYxi1Mu3a4mI+/klB
	M5WP+yUHAb72h2PV7Vu8RAoAr3ZCMcA+9Un7GeY=
X-Google-Smtp-Source: APXvYqyWZOMLeE3Z1ON/hgJw7rEwpW+uTVF8dpe25kb+KKR7peORUIVOwfvNwxwJBOREsJnoqNzuj2Z6UixULGqCzu4=
X-Received: by 2002:aed:2268:: with SMTP id o37mr2123958qtc.29.1551407422111; 
	Thu, 28 Feb 2019 18:30:22 -0800 (PST)
MIME-Version: 1.0
References: <20190301001504.4459-1-alistair.francis@wdc.com>
In-Reply-To: <20190301001504.4459-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 18:29:56 -0800
Message-ID: <CAMKF1sqGWbQVoU+YTrgW3yWYwJ=sS1ujxv_YM-k9Fv_nEgPJLA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] mimic: Initial commit of version 1.2.0.2
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
X-List-Received-Date: Fri, 01 Mar 2019 02:30:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 28, 2019 at 4:26 PM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> I was not sure what the license should be, it's a little confusing:
> https://github.com/MycroftAI/mimic/blob/development/COPYING
>

ideally list them all with &

>  .../recipes-multimedia/mimic/mimic_1.2.0.2.bb    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.=
2.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb b/=
meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
> new file mode 100644
> index 000000000..bd43fe389
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.2.0.2.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "A fast lightweight Text-to-speech engine"
> +DESCRIPTION =3D "Mimic is a fast, lightweight Text-to-speech engine deve=
loped by Mycroft A.I. and VocaliD, based on Carnegie Mellon University=E2=
=80=99s Flite (Festival-Lite) software. Mimic takes in text and reads it ou=
t loud to create a high quality voice."
> +HOMEPAGE =3D "https://mimic.mycroft.ai/"
> +SECTION =3D "multimedia"
> +
> +LICENSE =3D "BSD-like"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D416ef1ca5167707fe381d7be33664=
a33"
> +
> +DEPENDS =3D "curl-native icu"
> +
> +SRCREV =3D "67e43bf0fa56008276b878ec3790aa5f32eb2a16"
> +SRC_URI =3D "git://github.com/MycroftAI/mimic.git"
> +
> +inherit autotools
> +
> +S =3D "${WORKDIR}/git"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

