Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id EECD8602D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 13:55:01 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id g62so80392186lfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 06:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mNoC9piyFQwKvn1AgvK8yuK64Fc4n7XqoPdUzMe8sSA=;
	b=cQBqcu5wPjieTTWeN4OHNlUj3a4EqI0M2kJlhM3BadvFlckJomDMVOXQYw76cEObfa
	8J9oKwIz6SRvLvX+cdztBxq40CHLnFWuxLyWne3utZSC6ATQqGXZgrWfPXh/PXdra6On
	2Uaj8I0UppZnN6vXT02CzTu0d0VlwWJjGb/Qb5TpwwExO3SmewA7JXufnWJZmev1s5mD
	v9/LlIh5JehHV0Z0IEdmMEhx7g8W0oybIUCKeWzX3p229+7rhyMMiKMyV6zsg+boSIkV
	gJa5VcUCU7rnzRQfMef+gEmD4HqPZBP/qYvjAq70Yp7hP+DjnfQ0JjS3uF2x+h+oZAW0
	hQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mNoC9piyFQwKvn1AgvK8yuK64Fc4n7XqoPdUzMe8sSA=;
	b=I8z2FNrzBaAvIGNQJVeXR0z3JwLnpsMwsapdrdpTVeQ3HGHh1oi7Jt6NlxGcOk+QVK
	3LQNgfSP3TYqiwhdZwfSlOYqHodYcN156sHzYPf5cebpG9VXSjAGzx5s52vFdZbflKz6
	dqIHKujL8QptoBma+hKS4cruxMYHwUJM/PO25mJbAMms32rV7WXdv3iDtp0AVP5F/mtz
	96XwbaDd/VWfmk6iXIsfXcq/h+edFgWLr+1ffQgws93u8hPgJ5qU2cSlBpU89D6/Sh+x
	cOAFXHbog64Ggk9KHfklbupg+XrRt7Ab3fKpoa+In8rbJ/EQDQGGsesS5a1PD+7tAkUu
	CPYg==
X-Gm-Message-State: AA6/9RnmTtGUW2wSFHKlXhjMQcMkTkiee9uEfNI5OKwEgUBnle0pqH7nnWWyMpGOamATosOd594wq4B9OK26Xg==
X-Received: by 10.46.71.85 with SMTP id u82mr701416lja.19.1475157301515; Thu,
	29 Sep 2016 06:55:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.24.195 with HTTP; Thu, 29 Sep 2016 06:54:31 -0700 (PDT)
X-Originating-IP: [177.100.224.38]
In-Reply-To: <20160929133054.20096-1-ruben.de.smet@rubdos.be>
References: <20160929133054.20096-1-ruben.de.smet@rubdos.be>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 29 Sep 2016 10:54:31 -0300
Message-ID: <CAAPZna1EHTEKernEX88FO5gv=1m5VrEhf-S3LB6EDF91j8vd2w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-scales: add recipe for version 1.0.9
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
X-List-Received-Date: Thu, 29 Sep 2016 13:55:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2016 at 10:30 AM, Ruben De Smet <ruben.de.smet@rubdos.be>
wrote:

> A python module for tracking server state and statisticst
>
> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
> ---
>  meta-python/recipes-devtools/python/python-scales.inc       | 13
> +++++++++++++
>  meta-python/recipes-devtools/python/python3-scales_1.0.9.bb | 11
> +++++++++++
>  2 files changed, 24 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-scales.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-scales_1.0.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-scales.inc
> b/meta-python/recipes-devtools/python/python-scales.inc
> new file mode 100644
> index 0000000..5a46e2b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-scales.inc
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Metrics for Python"
> +DESCRIPTION =3D "Tracks server state and statistics, allowing you to see
> what \
> +your server is doing. It can also send metrics to Graphite for graphing
> or to \
> +a file for crash forensics."
> +SECTION =3D "devel/python"
> +LICENSE =3D "Apache-2.0"
> +# LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c=
6bd
> 57"
> +SRCNAME =3D "scales"
> +
> +SRC_URI[md5sum] =3D "c61167f2b5f506f0a34a7b8a295a9567"
> +SRC_URI[sha256sum] =3D "8b6930f7d4bf115192290b44c757af
> 5e254e3fcfcb75ff9a51f5c96a404e2753"
> +
> +inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
> b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
> new file mode 100644
> index 0000000..ecf6c67
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
> @@ -0,0 +1,11 @@
> +inherit setuptools3
> +require python-scales.inc
> +
> +RDEPENDS_${PN} +=3D "\
> +    python3-six \
>

=E2=80=8BYou can move this to inc file and use

RDEPENDS_${PN} +=3D " \
    ${PYTHON_PN}-six \

so, will work with both python 2 and 3.

+"
> +
> +DEPENDS_${PN} +=3D "\
> +    python3-setuptools \
> +"
>


=E2=80=8BIs this not provided by setuptools3
=E2=80=8B class?=E2=80=8B

+
> --
> 2.10.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

