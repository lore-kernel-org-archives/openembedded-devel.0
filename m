Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC5F7867C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 11:15:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520594106; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=EagjAB0fz71PvkScrkvkALnXfcJkNB3BjOYXg4LJLFQ=;
	b=qg5o7pqEnJyuU1iJZeOwwoEtmoGL0+dXjS98AthE0AULzdE2hhC6VGpJa2lku8AkWdtGs65E
	W2nUK2MCh5qYBWBbSky0PI2Rwse9Mp5K4nrWSTBQAPZHb2V0pipkOHKNhz45XsUvDY9FDvxt
	9AluqsD41cTVafySPNLx6oYdNmc=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mxa.mailgun.org with ESMTP id 5aa26cba.7f9b5c1f69f0-smtp-out-n01;
	Fri, 09 Mar 2018 11:15:06 -0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id a23so10278069qtn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Mar 2018 03:15:06 -0800 (PST)
X-Gm-Message-State: AElRT7Ehe94lPo0bYOkaQ4D5LJt53jsNug52hEA58pgmibVArcAmt41s
	w//EriF9rRdqgCURYGOtAHZFbQVxs14joavY508=
X-Google-Smtp-Source: AG47ELucBH3mytFdwBA489G/6NGnqunj5t6NN3Il95FuYgI5yrSy4ARCeB1xbsEhZxHOAfr4Pv9S8NKyx6d+9sW/WWs=
X-Received: by 10.237.34.172 with SMTP id p41mr45800405qtc.316.1520594106005; 
	Fri, 09 Mar 2018 03:15:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Fri, 9 Mar 2018 03:15:05 -0800 (PST)
Received: by 10.140.108.35 with HTTP; Fri, 9 Mar 2018 03:15:05 -0800 (PST)
In-Reply-To: <20180309081718.14146-1-alexandru.vasiu@ni.com>
References: <20180309081718.14146-1-alexandru.vasiu@ni.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 9 Mar 2018 06:15:05 -0500
X-Gmail-Original-Message-ID: <CADNbA1q85=4dqQJ_XzcsHf2ki+=QAkr_dR8_TTzaqCXoCn17wQ@mail.gmail.com>
Message-ID: <CADNbA1q85=4dqQJ_XzcsHf2ki+=QAkr_dR8_TTzaqCXoCn17wQ@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH v2] Add support for pyiface
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
X-List-Received-Date: Fri, 09 Mar 2018 11:15:05 -0000
Content-Type: text/plain; charset="UTF-8"

I apologize for not being clear.  Please provide a python3 version of the
recipe using the .inc file paradigm.  It makes it easier for the
maintainers to keep both up to date.  Let me know if you have questions.
Thanks

-Derek

On Mar 9, 2018 3:17 AM, "Alexandru Vasiu" <alexandru.vasiu@ni.com> wrote:

> Pyiface is a package that exposes the network interfaces of the
> operating system in a easy to use and transparent way.
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb | 10
> ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pyiface_0.0.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb
> b/meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb
> new file mode 100644
> index 000000000..5449e21c9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyiface_0.0.4.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Pyiface Recipe - Adds Pyiface library for Python 2 & 3"
> +HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
> +LICENSE = "GPLv3+"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fe06497acaf4f45999925d348c2605
> f9"
> +
> +SRC_URI[md5sum] = "edcdd71109c4259af8348006a8049c9c"
> +SRC_URI[sha256sum] = "dc984de0e1bcf6871ef88b1a92d1fb
> 75717d4f602a60caeb66136093d4a8f62e"
> +
> +inherit pypi setuptools
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

