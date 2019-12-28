Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 584207DE3D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 18:17:47 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a203so24080380qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2019 10:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ub9k4puC44UO7L3RIhOB/F0vdvRLNOnvLC6MeJsLMz0=;
	b=uh2p+nWsv2VeY5tjqrt/L8PznoOrz1hYRQyUw5+uJINqtAMTDmHz2ZPxUzUUuKwkxk
	d+UamVyWefGSaKTMD7serErvMQhxzxCAhjne7ReJWtaKJI7upRjjP6HYBthgYjRfbfCZ
	5kgihsFKbIqmNbqvP0k6zsZoGqnHVLvaYrHK97pG3iYVlcBc5bjKI/DUBlJsw2W+x/23
	rvx6L7gHikqIjRGIUg1CZyTJUuPWCTvubULBUt3a31agobNAu9ir4DZyctcjTu2Nlmrl
	f3SJGZQe6HVtN4VlbDVA80Q8r0/vpyNIuh7i3OZg1NBqckUZpVJmD5qgsvA9sEKKwhPi
	caYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ub9k4puC44UO7L3RIhOB/F0vdvRLNOnvLC6MeJsLMz0=;
	b=CzwcASCbuXVe8WlCwHY7JCdJd6HcTD9vKKnSs83cYupU0NpjBBgB/FGoXwCSRpOc+P
	qEpAZP8rNFnyiMyzsSQttovPpVgiUhWrUqpKF1a2KVZkXW6//Ox/8oFHFcdx3jg3FSm4
	ZXIc4aFUgSZhdAzOsLutkqIzocNXYTbN0fZZdQsiaQDpoLep8lOpLjPkoEwMvpITJxKp
	ubs42esZdkpM9Rf9uiyycu7Zbi5ENfi+VPinN7I0Yup2WD4vQSd0An+/7zGsj7sFYXd/
	iKDwmZqLlljai/Vp94RBlI9TB2l3BOkfiSIWfO5q+gGSO2VBlnAOzr03Mc+Y5wp28peY
	qXrg==
X-Gm-Message-State: APjAAAXBDjpmRkhrI7nDvchP2cNzWTVHrPE9nci8/5PKWDZbDVjKUInX
	7eDpCXgP0mDiKBW6NgLzDoCoErqT1ydaqsKL5Tg=
X-Google-Smtp-Source: APXvYqxp9grEFobTSjGOKehfFEmhWKF7byrbPvKkIMel4q9xT8D6+1A86fXd90i9F7nPuYvSPwss2mBQ/swFg2Eauu4=
X-Received: by 2002:a37:a3c7:: with SMTP id
	m190mr48414002qke.212.1577557067960; 
	Sat, 28 Dec 2019 10:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20191227171120.10253-1-peter.kolbus@garmin.com>
	<20191227171120.10253-2-peter.kolbus@garmin.com>
In-Reply-To: <20191227171120.10253-2-peter.kolbus@garmin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Dec 2019 10:17:21 -0800
Message-ID: <CAMKF1sojj2e4Pvc9tGN_qvJZC-nBQQtamHyiRZr0UtspAFhLsg@mail.gmail.com>
To: Peter Kolbus <peter.kolbus@garmin.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] python3-license-expression: add recipe
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
X-List-Received-Date: Sat, 28 Dec 2019 18:17:47 -0000
Content-Type: text/plain; charset="UTF-8"

License checksum fails
http://errors.yoctoproject.org/Errors/Details/300493/

On Fri, Dec 27, 2019 at 9:12 AM Peter Kolbus <peter.kolbus@garmin.com> wrote:
>
> python3-license-expression is a utility library to parse and work with
> license expressions.
>
> Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
> ---
>  .../python/python-license-expression.inc         | 16 ++++++++++++++++
>  .../python/python3-license-expression_1.0.bb     |  2 ++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-license-expression.inc
>  create mode 100644 meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-license-expression.inc b/meta-python/recipes-devtools/python/python-license-expression.inc
> new file mode 100644
> index 000000000..5b18f2e96
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-license-expression.inc
> @@ -0,0 +1,16 @@
> +SUMMARY = "Utility library to parse, compare, simplify and normalize license expressions"
> +HOMEPAGE = "https://github.com/nexB/license-expression"
> +
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=7f538584cc3407bf76042def7168548a"
> +
> +SRC_URI[md5sum] = "81477f779099f55071c6a7b88a29bb01"
> +SRC_URI[sha256sum] = "8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-booleanpy \
> +    "
> +
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
> new file mode 100644
> index 000000000..10a702ca4
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-license-expression.inc
> --
> 2.24.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

