Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8FED2605B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 10:25:58 +0000 (UTC)
Received: by wmec201 with SMTP id c201so131380813wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2015 02:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=d9+O9kxYsAQQ1jwJzxtm9BOa3MnIqjK41ElaO31gjww=;
	b=y+t9Guw8M5Dn569q1t+RgUTtL65KB4dAED9heVeS6OvCFCbbysloCX2ufmwSQt+lIR
	XQkrezHMVBAGd1Ufe30aOJ8J6HB9xePQs4VuCiB8FYArFCwXmGaw4kMx2IbgpFWD/vBQ
	FjxQErw+26FAixLaJ2W0s+Mqx8ek/suJ5gYjwUeDmWVXv0piJ50sFVeTfUhowWfJ4ie2
	LN6kWy/QVZCArRjB0YkR5xeYlCE6Mqge4YSGW7dISGWb0WlqHKfADgA6EnOAUwGYzTDx
	rSf4Q3F2BS/Qwltwkzi1dCUIC8A4yQXuxPDZOM763/6gZWqgUUKLRdtYGNvgX4AeFY5F
	Hgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=d9+O9kxYsAQQ1jwJzxtm9BOa3MnIqjK41ElaO31gjww=;
	b=KSEnU4/ECr/8kucPvYV4h4CxLOS6BXW0aUZdKz2gUJA2JaP6Qd8jJDTsWOAZcRL2Rz
	Wg2K5wLpb4Urt/4L9WEYCcgAqtp8Eeo4J96W0xpMXnN4qgPVWt90nCFwA4puN/PKN1/k
	cKFhicv5wT1ylOFB1v8LAuuEsMzzN/NDmZAZMZkIR2DGzqZ7YuLvTLCtMRmyHil79LUI
	yDwdWi1DC0ESsWecBeP08UCunAvSSaoYXrxgdkCc6/qNm8dpe+xuprcBuPZTXXjLslYp
	lfVBbn7GdQsbwawovkb1eRSrfzD7YmkQsqnO3rSAku0/9r3f78t4ukkM9aLSPsElQc4T
	Eowg==
X-Gm-Message-State: ALoCoQmNaeSABPvgRbUa6UAVgEmHK0Df4BpuzrBlNJfP3M6kEQ7K6k/PWjIFXkGENebD/EIAMHI5
X-Received: by 10.194.134.3 with SMTP id pg3mr69741854wjb.63.1448879158780;
	Mon, 30 Nov 2015 02:25:58 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by smtp.gmail.com with ESMTPSA id
	v4sm46041999wjx.18.2015.11.30.02.25.57
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Nov 2015 02:25:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1448215516-13579-1-git-send-email-fathi.boudra@linaro.org>
Date: Mon, 30 Nov 2015 11:25:56 +0100
Message-Id: <48368BFC-9404-4374-B4E1-B9FD3C17B0BD@dominion.thruhere.net>
References: <1448215516-13579-1-git-send-email-fathi.boudra@linaro.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] libsoc: upgrade from version 0.6 to 0.7
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
X-List-Received-Date: Mon, 30 Nov 2015 10:26:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Op 22 nov. 2015, om 19:05 heeft Fathi Boudra <fathi.boudra@linaro.org> =
het volgende geschreven:
>=20
> update SRCREV
>=20
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
> changes from v1:
>  * don't ship board configs
>  * don't oe-stylize
>=20
> meta-oe/recipes-support/libsoc/{libsoc_0.6.bb =3D> libsoc_0.7.bb} | 2 =
+-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> rename meta-oe/recipes-support/libsoc/{libsoc_0.6.bb =3D> =
libsoc_0.7.bb} (90%)
>=20
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb =
b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> similarity index 90%
> rename from meta-oe/recipes-support/libsoc/libsoc_0.6.bb
> rename to meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> index 79c171a..3b7436f 100644
> --- a/meta-oe/recipes-support/libsoc/libsoc_0.6.bb
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.7.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3De0bfebea12a718922225ba987b2126a5"
>=20
> inherit autotools
>=20
> -SRCREV =3D "3643cf161a4b37bfbdfd05437166c4a29ac3ed8d"
> +SRCREV =3D "4d5c5af71e225cc4e792d2166da3f3e432b08735"
> SRC_URI =3D "git://github.com/jackmitch/libsoc.git"
>=20
> S =3D "${WORKDIR}/git"
> =E2=80=94=20

Looks good to me:

Reviewed-by: Koen Kooi <koen@dominion.thruhere.net>=

