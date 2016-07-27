Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 15D2A6FF9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:00:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1469599210; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=CqWvF0hurGIkpUmrlgoO/K0cEjsZ6nsRe+DtpTcTtpM=;
	b=d6Z6ku7jZMFhCd15YKLNfrb5yByUvWEcABnp79rr78JdFPfw47RHukz5F8h8LdEHpIooZn1Y
	vUpTuQ0x006Kc8tBaXDEaXFbZN+GiHEHEw2eMiR3RO8DkQ/vHLf/1TRjDEZ3LkOyg9oH4afP
	vmtOVphcRp6Khd0EZQOKdZodx1s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=LQMBuuwEuTlNFy+eLScMnnbD0PG028qHijG1sE6gW1BkcJEF1XMSwpn9elI0LA5oAeUdL5
	mLPj7i1NatbnHXl/7wrILvoR4Ou6M+uwBN0HQoENTGm1e+J3Xzvf4ELN0dfksPv6lrie904L
	LLlegOzVzP4hXQM9tJ66GSv8yfa94=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mxa.mailgun.org with ESMTP id 57984dea.7f0bac2812b0-in3;
	Wed, 27 Jul 2016 06:00:10 -0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id f6so135013851ith.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 23:00:10 -0700 (PDT)
X-Gm-Message-State: AEkoout2vJsLG3IEtFRVsBvvM+XI/Oz0yJDu5F+4oIhmETrOuGSF75TDjBndpaQ1gNe8cMb9pTorm1tE5MMG2A==
X-Received: by 10.36.87.140 with SMTP id u134mr32391255ita.38.1469599209935;
	Tue, 26 Jul 2016 23:00:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Tue, 26 Jul 2016 23:00:09 -0700 (PDT)
In-Reply-To: <20160727030338.15620-3-Qi.Chen@windriver.com>
References: <20160727030338.15620-1-Qi.Chen@windriver.com>
	<20160727030338.15620-3-Qi.Chen@windriver.com>
From: Derek Straka <derek@asterius.io>
Date: Wed, 27 Jul 2016 02:00:09 -0400
X-Gmail-Original-Message-ID: <CADNbA1pm9XGsLVTBKNrzoS05PRat-OQnbA6E_v72k2OHEVG7aA@mail.gmail.com>
Message-ID: <CADNbA1pm9XGsLVTBKNrzoS05PRat-OQnbA6E_v72k2OHEVG7aA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH 3/3] python3-django: add recipe
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
X-List-Received-Date: Wed, 27 Jul 2016 06:00:12 -0000
Content-Type: text/plain; charset=UTF-8

Can the common portions be pulled out into a .inc file that can be included
in the python and python3 recipes or was there a specific reason not to do
that?

-Derek

On Tue, Jul 26, 2016 at 11:03 PM, Chen Qi <Qi.Chen@windriver.com> wrote:

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  .../python/python3-django_1.9.7.bb                 | 24
> ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-django_1.9.7.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_1.9.7.bb
> b/meta-python/recipes-devtools/python/python3-django_1.9.7.bb
> new file mode 100644
> index 0000000..7c0db64
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-django_1.9.7.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "A high-level Python Web framework"
> +HOMEPAGE = "http://www.djangoproject.com/"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
> +
> +SRC_URI[md5sum] = "7de9ba83bfe01f4b7d45645c1b259c83"
> +SRC_URI[sha256sum] =
> "2b29e81c8c32b3c0d9a0119217416887c480d927ae2630bada2da83078c93bf6"
> +
> +PYPI_PACKAGE = "Django"
> +inherit pypi setuptools3
> +
> +FILES_${PN} += "${datadir}/django"
> +
> +BBCLASSEXTEND = "nativesdk"
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-importlib \
> +    ${PYTHON_PN}-numbers \
> +    ${PYTHON_PN}-pip \
> +    ${PYTHON_PN}-pkgutil \
> +    ${PYTHON_PN}-subprocess \
> +    ${PYTHON_PN}-threading \
> +    "
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

