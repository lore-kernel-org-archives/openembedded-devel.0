Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id BAC8E71B46
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 13:51:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1478267498; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=aoX4sAfyz3r2erfYDccz0CXex9Q3S3Rf9iahYmsdfnU=;
	b=kO/PsBJ96O2Y4/Ii885Ak0eJFQ1CgFAWagClw/9DXL44F0xqLLq1z1wuAggtqNDfZnmw+LA4
	yy0WBDIBU7ZEVBwkA72Ya+foh+fJu8Q7Ren0kJT8VUmweoSl8jfTJfvBCYZsqT/rTxQX7NjU
	+8Ow02XEB9wHpAYWtLUva7nOyns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=BlxbQSEagx2Ragk68C0NkHJgWdTFSpkJrwME2UOKq2mVuXwEKP02VNjdL4AswyLZ+V6KjX
	rV8zNBZiDfQ98ZT8qgQs2zaBobGiIHdimkTh1j66FvppBvn2Xiqj66Pzr2fAH1Umn8RflfT1
	OLnjj5tMQ4o9SzXE+lt5KONmoI5HU=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-yw0-f174.google.com (mail-yw0-f174.google.com
	[209.85.161.174])
	by mxa.mailgun.org with ESMTP id 581c912d.7f54282773f0-in3;
	Fri, 04 Nov 2016 13:46:21 -0000 (UTC)
Received: by mail-yw0-f174.google.com with SMTP id h14so86011994ywa.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2016 06:46:21 -0700 (PDT)
X-Gm-Message-State: ABUngveConhJN9Q7u+zG16ukBRf8DvBJyiayYlF5ifdsycuv3a5UlQDAp31CVdWuik3eD6cigHuy+1xzSmM2bw==
X-Received: by 10.36.98.8 with SMTP id d8mr1862519itc.73.1478267180856; Fri,
	04 Nov 2016 06:46:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.133.152 with HTTP; Fri, 4 Nov 2016 06:46:20 -0700 (PDT)
In-Reply-To: <20161104101649.20749-1-ruben.de.smet@rubdos.be>
References: <20161104101649.20749-1-ruben.de.smet@rubdos.be>
From: Derek Straka <derek@asterius.io>
Date: Fri, 4 Nov 2016 09:46:20 -0400
X-Gmail-Original-Message-ID: <CADNbA1pCKyPNgFx+0JCNPTjkGZr85W9kzDfQJF=XZzyqyOQ2+g@mail.gmail.com>
Message-ID: <CADNbA1pCKyPNgFx+0JCNPTjkGZr85W9kzDfQJF=XZzyqyOQ2+g@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH v2] python-spidev: add recipe for version 3.2
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
X-List-Received-Date: Fri, 04 Nov 2016 13:51:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 4, 2016 at 6:16 AM, Ruben De Smet <ruben.de.smet@rubdos.be>
wrote:

> A python module for interfacing with SPI
>
> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
> ---
>  meta-python/recipes-devtools/python/python-spidev.inc   | 17
> +++++++++++++++++
>  .../recipes-devtools/python/python3-spidev_3.2.bb       |  6 ++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-spidev.inc
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-spidev_3.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-spidev.inc
> b/meta-python/recipes-devtools/python/python-spidev.inc
> new file mode 100644
> index 0000000..1b93763
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-spidev.inc
> @@ -0,0 +1,17 @@
> +SUMMARY = "Python bindings for Linux SPI access through spidev"
> +DESCRIPTION = "This project contains a python module for interfacing with
> SPI\
> +devices from user space via the spidev linux kernel driver.\
> +This is a modified version of the code originally found\
> +[here](http://elk.informatik.fh-augsburg.de/da/da-49/trees/
> pyap7k/lang/py-spi)\
> +All code is GPLv2 licensed unless explicitly stated otherwise."
> +HOMEPAGE = "http://github.com/doceme/py-spidev"
> +SECTION = "devel/python"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=54bdb9022ebb75ab68399cdaab97da
> 60"
> +SRCNAME = "spidev"
> +
> +SRC_URI[md5sum] = "f601676f1bb48b9aa3b3897f95216365"
> +SRC_URI[sha256sum] = "09d2b5122f0dd79910713a11f9a002
> 0f71537224bf829916def4fffc0ea59456"
> +
> +
> +inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
> b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
> new file mode 100644
> index 0000000..59f1c4f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-spidev_3.2.bb
> @@ -0,0 +1,6 @@
> +inherit setuptools3
> +require python-spidev.inc
> +
> +RDEPENDS_${PN} += "\
> +"
>
Any need to keep the empty '+='?

> +RDEPENDS_${PN}_class-native = ""
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

