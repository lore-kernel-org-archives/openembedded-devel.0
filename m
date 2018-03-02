Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6F6789AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Mar 2018 18:10:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1520014255; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=AwKRo8STRasKQwXi5z6qF450OgEaxv2v1ahwfIjIFJ4=;
	b=Y45Z2WZu4jqbJ8ckqHdmhJoZVUaJ3nyQLTYQ/Et8qHLDn+YcrUdDT6g/TeRXcIhomgQJjiF1
	qGbpfhyPyl6hWcvtVoa+5FxiPpxADCTJYV+hw2PrOPEf/V21IAWh0enqDR4S9h+RUFAaGosQ
	sjZJMDfDE7569dxCA3AIPjvmq9E=
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
X-Mailgun-Sending-Ip: 104.130.122.4
Sender: derek@asterius.io
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mxa.mailgun.org with ESMTP id 5a9993af.7fd19848e0b0-smtp-out-n03;
	Fri, 02 Mar 2018 18:10:55 -0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id a23so12963316qtn.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2018 10:10:54 -0800 (PST)
X-Gm-Message-State: AElRT7GcNMZQ/btvsJp251+0nzafBgaoQ44lh/oHLiUPH5h/vSURzg9w
	YAYSOkhBk0Ka6UXSYQg7COaQd5b9/dcNKDFP60M=
X-Google-Smtp-Source: AG47ELvuMqYUiUM/T+IX+ZojfwQ+9QL5R0J7sdbM6ujUv2t8wjZ6f0J6fKcVOzUhw1yB4Xk1yTOT2Q165or2v4+BLtY=
X-Received: by 10.200.50.75 with SMTP id y11mr9564656qta.153.1520014254248;
	Fri, 02 Mar 2018 10:10:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.35 with HTTP; Fri, 2 Mar 2018 10:10:53 -0800 (PST)
In-Reply-To: <20180302180820.3332-1-alexandru.vasiu@ni.com>
References: <20180302180820.3332-1-alexandru.vasiu@ni.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 2 Mar 2018 13:10:53 -0500
X-Gmail-Original-Message-ID: <CADNbA1qmDXLNn61VWKT3yMkU826__zDB+gpn-sRsxP82ZK=ksA@mail.gmail.com>
Message-ID: <CADNbA1qmDXLNn61VWKT3yMkU826__zDB+gpn-sRsxP82ZK=ksA@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH] Add support for pyiface
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
X-List-Received-Date: Fri, 02 Mar 2018 18:10:54 -0000
Content-Type: text/plain; charset="UTF-8"

Can this be extended to python3?  If so, can you add that as part of the
patch set?  Thanks.

-Derek

On Fri, Mar 2, 2018 at 1:08 PM, Alexandru Vasiu <alexandru.vasiu@ni.com>
wrote:

> Pyiface is a package that exposes the network interfaces of the
> operating system in a easy to use and transparent way.
>
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta-python/recipes-devtools/python/python-pyiface_0.0.2.bb | 10
> ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pyiface_0.0.2.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.2.bb
> b/meta-python/recipes-devtools/python/python-pyiface_0.0.2.bb
> new file mode 100644
> index 000000000..fad75af06
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyiface_0.0.2.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Pyiface Recipe - Adds Pyiface library for Python"
> +HOMEPAGE = "https://pypi.python.org/pypi/pyiface/"
> +LICENSE = "GPLv3+"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47
> f1"
> +
> +SRC_URI[md5sum] = "8ced1d8ef89376a5aed97a59f11ae683"
> +SRC_URI[sha256sum] = "bf5b1ff115344d388b0f9409a440ee
> 06f67478b6c63bc8d8ce8f843f2652a8d3"
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

