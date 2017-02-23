Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7538A72FDC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:41:28 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id 62so10430848oih.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KTcTbm2GnZAfaS1JYFtSQ6toT5JCN+bIdN1k1wfI3s0=;
	b=AVEDZzk4ALkS6LTc5QQyRzaV1XpTilhgqht6CwQGs7CHMA/0ncqYQ0s8QnSq26OJt5
	3VB0RFeg+ecak+HWygVu15QoNC89XdfkeHX4F8PSaiDKmG8tz3MDJtdppHhucpW4mlI7
	WHgxEm/mx2c9+w91baMPw3qEY3dtQUzpGRP28FbMUL9JQgwFza1RpB+owJky/muIbEnl
	78gtg02Se9dtCslm1I+sBKRxNrCcVQ1msMmB7Br0mKjoacxCM/01HKzapfNqrSE93Nes
	keN8xTWc7SyfY8D6EI1NwaoreuSo87ZqfH6JpOjeUCGTit40T/o9f9LHIpx4Ldn4W3k3
	vNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KTcTbm2GnZAfaS1JYFtSQ6toT5JCN+bIdN1k1wfI3s0=;
	b=e0XK5AnjeqOd9TjMk8Ent/Vm5s/KFXWKEIW7rZaCUKpJMtbpVHgd/J0joWCtjqAPXp
	nO7r8L2F6DI2GUDY1FP7zN4BtboARQ9oPj3j2aBNpZWZbuIvwQtOLDW/GU6d90bO+Kyo
	I6RWGMijBtw65JuJdeP6Y2jpOUVNxEALF+C3a2hovANchP1AIoE+AfEPXdEPaYRJKwUb
	NjH2mhY6XWhgP20ilq39qC5PilgEAELBkhH+hkr9El31sgWVCeVfEyJqhemkZgHH3JPV
	8cCFnmojzqKkrQVAaCDByaTGKE3asp6H0YmOHZC9/QvLEXVEjNt5mxc6bgKl3fSq6PeR
	rLYw==
X-Gm-Message-State: AMke39nRzrSN4rSBLMYLj42MS4We01sOKmZWopon6rPI0vTg4bqxTz90x2A6djabpXEUTw==
X-Received: by 10.202.232.210 with SMTP id f201mr2359583oih.60.1487810489750; 
	Wed, 22 Feb 2017 16:41:29 -0800 (PST)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	o14sm1019102oto.18.2017.02.22.16.41.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Feb 2017 16:41:28 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id 65so10434639oig.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:41:28 -0800 (PST)
X-Received: by 10.202.180.85 with SMTP id d82mr19119982oif.210.1487810487756; 
	Wed, 22 Feb 2017 16:41:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.74.26.5 with HTTP; Wed, 22 Feb 2017 16:41:27 -0800 (PST)
In-Reply-To: <1487768029-5984-1-git-send-email-jaragunde@igalia.com>
References: <1487768029-5984-1-git-send-email-jaragunde@igalia.com>
Date: Wed, 22 Feb 2017 21:41:27 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpFmTT5ied29nSXQLYB7x5D+4W2y3wG3E8ac+qQACrcpw@mail.gmail.com>
Message-ID: <CAP9ODKpFmTT5ied29nSXQLYB7x5D+4W2y3wG3E8ac+qQACrcpw@mail.gmail.com>
To: =?UTF-8?Q?Jacobo_Aragunde_P=C3=A9rez?= <jaragunde@igalia.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] chromium: disable generate_character_data for qemux86
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
X-List-Received-Date: Thu, 23 Feb 2017 00:41:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2017 at 9:53 AM, Jacobo Aragunde P=C3=A9rez
<jaragunde@igalia.com> wrote:
> Chromium-wayland fails with:
>   http://errors.yoctoproject.org/Errors/Build/32356/
>
> Root cause seems to be ICU mixing host and target architectures,
> same as in: https://bugreports.qt.io/browse/QTBUG-57705
>
> Signed-off-by: Jacobo Aragunde P=C3=A9rez <jaragunde@igalia.com>
> ---
>  recipes-browser/chromium/chromium.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chro=
mium/chromium.inc
> index 0e7250e..0076f3a 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -15,6 +15,7 @@ inherit gettext pythonnative
>
>  ARMFPABI_armv7a =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconventi=
on-hard', 'arm_float_abi=3Dhard', 'arm_float_abi=3Dsoftfp', d)}"
>  GYP_DEFINES +=3D "${ARMFPABI} release_extra_cflags=3D'-Wno-error=3Dunuse=
d-local-typedefs' sysroot=3D''"
> +GYP_DEFINES_append_qemux86 =3D " generate_character_data=3D0"

Any x86 will need this.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

