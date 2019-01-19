Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9966B899
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 22:34:54 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id i7so19167003qtj.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 14:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3lOdAw5a/SJnpshs7fMTzzyNlRrjs2jjEQFODtOAdsM=;
	b=fq76KF6yQW+MLSU02Tt+YbJouZaqGNVFMwQ2JpyFT6Oj+JLgMNAKpFRk0rb0+OkkRK
	HKsO8gHQ5QLo99Cw5HgLo2IOQKaAXOpBO9e/kCCyqrVYg+WMQKU6ZGD4wLySmt+SyusE
	syzrQ5mottKH+l1LGhh37RdqhOMz7FGHh9z0+w+Pb+xUPYwdG1cBQmrGv+SRDSNOwtZ2
	m+29hOMUeAoGgE+8cieOisx7hFOldNifH8wmJb+Vw4P1h2g4rbNyR3UimOCMhffQhSea
	y+EnHLuu8RcEbVtbqttmWMipJoDyJvYg9fJBh/o4FgJOXNCE5YrTVz20s5guQu2TA/Cz
	dl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3lOdAw5a/SJnpshs7fMTzzyNlRrjs2jjEQFODtOAdsM=;
	b=ZdsQ0qHCV4Ct2iIcXEkL/qmi8K2DC58c7HEnHSWlYW2nz4HNq/BbXLpEYGmTpPiRXs
	+1B4n6rz18BiyrrJjD4Tz4GtpOx3n4NNpYvEJBTDcFSimqsNj7QxNA5zWaI5cu0cqfVF
	VfGLQ82qWcUMMvCEnVamTTzMty875532+QdIpgZqoOwAHQdOvK0MD3bEogInpOE7/+l5
	SBOs921P2IE3crruLGVkhPk6W6ICG9GkAHmN3qxaDMMgKvOtNgXK5rdUpvwzx5TBBe8v
	jDAxjhjSJNC/hGgVnHeFuq8UcoRMBiD31JDZIuknzN1MfSJYc8mPDsFW4wJ3r+huKF02
	TV8w==
X-Gm-Message-State: AJcUukcn1kqCX0r7OGmRcmHkXbRUTYXTufEAZLQC/lmMH/FcwX9/JbY+
	ZTnCXW6caMZxj/XEhG0ZyLeEQYL0xP4kIdCoapv4KYo2y1o=
X-Google-Smtp-Source: ALg8bN4jRKIXnMCvtxWXuViy04v0V3Yq2BW428ddRIChj4T8JHG2WHn8Dpu8v/y6zO2mfNkjNjcrQ5wnrs0PFAI9shM=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr20870303qtn.254.1547937294888;
	Sat, 19 Jan 2019 14:34:54 -0800 (PST)
MIME-Version: 1.0
References: <20190119174544.19389-1-shantanu@senic.com>
In-Reply-To: <20190119174544.19389-1-shantanu@senic.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Jan 2019 14:34:28 -0800
Message-ID: <CAMKF1sokeASo4H1JC6oFmZwvM2F_-PHZH0T-nYz04kaEaGd8xw@mail.gmail.com>
To: Shantanu <shantanu@senic.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Sat, 19 Jan 2019 22:34:54 -0000
Content-Type: text/plain; charset="UTF-8"

This does not address the build problem that I mentioned, please send
a fix the dep should be converted into rdep

RDEPENDS_${PN} = "python3-core"

On Sat, Jan 19, 2019 at 9:46 AM Shantanu <shantanu@senic.com> wrote:
>
> Included correction suggested from Khem of using STAGING_EXECPREFIXDIR
>
> Signed-off-by: Shantanu <shantanu@senic.com>
> ---
>  .../python/python3-bsddb3_6.2.6.bb            | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> new file mode 100644
> index 000000000..81baf98fd
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "pybsddb is the Python binding for the Oracle Berkeley DB"
> +HOMEPAGE = "https://www.jcea.es/programacion/pybsddb.htm"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c8796b7e1f8eda0aef7e242e18ed43"
> +SRC_URI[sha256sum] = "42d621f4037425afcb16b67d5600c4556271a071a9a7f7f2c2b1ba65bc582d05"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "bsddb3"
> +
> +DEPENDS = "db \
> +  python3-core \
> +"
> +
> +DISTUTILS_BUILD_ARGS = "--berkeley-db=${STAGING_EXECPREFIXDIR}"
> +DISTUTILS_INSTALL_ARGS = "--berkeley-db=${STAGING_EXECPREFIXDIR}"
> +
> +RDEPENDS_${PN} = "db"
> \ No newline at end of file
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

