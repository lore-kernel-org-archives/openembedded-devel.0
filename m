Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1D15D785AD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Dec 2017 16:22:49 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id f12so8529827pgo.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Dec 2017 08:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=puXDMMpUsBlDhJM2LatyTVdx7PXII6LVakwz2OHTVlk=;
	b=T4bLKNntJMt15FmzKd3YjL/rpQzoXfFK2jEpyEaxQ2AK31UWzVxGZ3X703ik86uxcR
	Uj4/5ZbbhaqnpR6hI7OlHJO7P0KN+6ZzjLpeg8xJqXMZfzqmB5uekqMhufm8a1/+G1VC
	hkV7b9FOQ4njw55nUXMn/nU8M3PUN9BKnJBLOekecNMVNrBB9og4li7B454wLYgR4S46
	f1r3GIT5o7areFTp/upUxUEhj4fg2vIIbFi4fim6cN56SrXDxJviDoyzkyYTNO9nULfd
	lm8vcoLSWKCeiDy5PEw7js+U6hjM7TLgCmqLlWaI0lbGhS1N7wZy9mo7ZZ/I+zQsTiv4
	uAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=puXDMMpUsBlDhJM2LatyTVdx7PXII6LVakwz2OHTVlk=;
	b=Ypk9/t5pbqySu1cvBodle4KJONKgIt/RvIPeCXDX4oaYbKB2asMq7Sf36FFLHU3zxZ
	rLnolgfWNXxqdLoMcGHled7ssp/hQhTqssVDvlWynrefUxGM+t3ZN4FhgyJFZdaf18fS
	Xd/qsxD8PvX69rjie1YekOi5OO8cT//sShMOJM/oOCYQRfHoBhK1FT6TBcWVz3V/XS1e
	B0Eh8ZbSq4Zqj5oroPw9UXIHhlCuTC365+hyEyjoE+MGwrQD6p+b8VJFzrLGmynD2wlm
	qRLUkDYFZWCUw5scyPEthWudV0JY4f+S3wFZzrdsjYFSZjYonTjDq44KuoMucqX2SuWB
	lthg==
X-Gm-Message-State: AKGB3mIrp8mz1RKEcibNM2a49baHGO6AQMeSRr4HuJpD/Tc6GIhQgXZ1
	mCnGSeNIBBGykrEyfk5rT69OCg==
X-Google-Smtp-Source: AGs4zMZQxh7Lb31oP+14QFtE/dy43HrUMTHvg7nBDIRKHjFI4USGQ6U1brx5sU2WFx9w+ZOY7Ts1UQ==
X-Received: by 10.84.252.134 with SMTP id y6mr2511901pll.204.1512404570881;
	Mon, 04 Dec 2017 08:22:50 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:488b:b9c3:5141:dcae?
	([2601:202:4001:9ea0:488b:b9c3:5141:dcae])
	by smtp.gmail.com with ESMTPSA id
	k23sm27520606pfj.22.2017.12.04.08.22.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Dec 2017 08:22:50 -0800 (PST)
To: Derek Straka <derek@asterius.io>, openembedded-devel@lists.openembedded.org
References: <1512331457-13213-1-git-send-email-derek@asterius.io>
From: akuster808 <akuster808@gmail.com>
Message-ID: <612c65f0-8dcf-5e6d-52ae-ad5520748166@gmail.com>
Date: Mon, 4 Dec 2017 08:22:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512331457-13213-1-git-send-email-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python-pywbem: update to version 0.11.0 and add a python3 recipe
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
X-List-Received-Date: Mon, 04 Dec 2017 16:22:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/03/2017 12:04 PM, Derek Straka wrote:
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../pywbem/{pywbem_0.8.0.bb => python-pywbem.inc}  | 37 +++++++++++++++-------
>  .../pywbem/python-pywbem_0.11.0.bb                 | 11 +++++++
>  .../pywbem/python3-pywbem_0.11.0.bb                |  8 +++++
>  3 files changed, 44 insertions(+), 12 deletions(-)
>  rename meta-python/recipes-extended/pywbem/{pywbem_0.8.0.bb => python-pywbem.inc} (58%)
>  create mode 100644 meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
>  create mode 100644 meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb
>
> diff --git a/meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb b/meta-python/recipes-extended/pywbem/python-pywbem.inc
> similarity index 58%
> rename from meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb
> rename to meta-python/recipes-extended/pywbem/python-pywbem.inc
> index 7f1986e..325131f 100644
> --- a/meta-python/recipes-extended/pywbem/pywbem_0.8.0.bb
> +++ b/meta-python/recipes-extended/pywbem/python-pywbem.inc
> @@ -12,25 +12,38 @@ at http://www.dmtf.org/standards/wbem. \
>  \
>  It also provides a Python provider interface, and is the fastest and easiest \
>  way to write providers on the planet."
> -HOMEPAGE = "http://pywbem.sf.net/"
> -LICENSE = "LGPLv2"
> +HOMEPAGE = "http://pywbem.github.io"
> +LICENSE = "LGPLv2.1"
No mention of why the license changed.

- armin
>  LIC_FILES_CHKSUM = "file://pywbem/LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
> -SECTION = "Development/Libraries"
> -DEPENDS = "python-m2crypto-native python-typing-native"
> -SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BPN}/${BP}/${BP}-dev.r704.zip"
> -SRC_URI[md5sum] = "84072451dcdd1aa9ee82363848faf7ad"
> -SRC_URI[sha256sum] = "898035866d3cc741bbcd62c4ac26e633ad07b7c11d89db2472b9f923f3fd3ed8"
> +SRC_URI[md5sum] = "1465dfa92e4cbe558c773838b9b00711"
> +SRC_URI[sha256sum] = "2a05f2c1a6ab4b08560a6da55fdaabd0f52f4d1e6df6e288b9ed927bf5c289ed"
>  
> -S = "${WORKDIR}/${BP}-dev"
> +inherit pypi 
>  
> -inherit setuptools python-dir
> +DEPENDS += " \
> +    ${PYTHON_PN}-ply-native \
> +    ${PYTHON_PN}-pyyaml-native \
> +    ${PYTHON_PN}-six-native \
> +"
>  
>  do_install_append() {
>      mv ${D}${bindir}/wbemcli.py ${D}${bindir}/pywbemcli
> -    mv ${D}${bindir}/mof_compiler.py ${D}${bindir}/mofcomp
>  
> -    rm ${D}${libdir}/python2.7/site-packages/${BPN}/wbemcli.py*
> -    rm ${D}${libdir}/python2.7/site-packages/${BPN}/mof_compiler.py*
> +    rm -f ${D}${bindir}/*.bat
>  }
>  
> +RDEPENDS_${PN}_class-target += "\
> +    ${PYTHON_PN}-argparse \
> +    ${PYTHON_PN}-datetime \
> +    ${PYTHON_PN}-io \
> +    ${PYTHON_PN}-netclient \
> +    ${PYTHON_PN}-ply \
> +    ${PYTHON_PN}-pyyaml \
> +    ${PYTHON_PN}-six \
> +    ${PYTHON_PN}-stringold \
> +    ${PYTHON_PN}-threading \
> +    ${PYTHON_PN}-unixadmin \
> +    ${PYTHON_PN}-xml \
> +"
> +
>  BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb b/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
> new file mode 100644
> index 0000000..963a137
> --- /dev/null
> +++ b/meta-python/recipes-extended/pywbem/python-pywbem_0.11.0.bb
> @@ -0,0 +1,11 @@
> +require python-pywbem.inc
> +inherit setuptools
> +
> +DEPENDS += " \
> +    ${PYTHON_PN}-m2crypto-native \
> +    ${PYTHON_PN}-typing-native \
> +"
> +
> +RDEPENDS_${PN}_class-target += "\
> +    ${PYTHON_PN}-m2crypto \
> +"
> diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb
> new file mode 100644
> index 0000000..de2a6f5
> --- /dev/null
> +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_0.11.0.bb
> @@ -0,0 +1,8 @@
> +require python-pywbem.inc
> +inherit setuptools3
> +
> +RDEPENDS_${PN}_class-target += "\
> +    ${PYTHON_PN}-enum \
> +    ${PYTHON_PN}-selectors \
> +    ${PYTHON_PN}-subprocess \
> +"


