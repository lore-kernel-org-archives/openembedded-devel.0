Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id BC4BA60079
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 10:37:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1532428645; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: In-Reply-To: References: MIME-Version: Sender;
	bh=Ethstp7fybcQUubZHWj6X3tTzN/NfYDVUx0o/aU3uro=;
	b=Q/FS2gdNKimNV/ZmkRDN1un4Mgu5v1VOc4NLhcGItL9ijmUvgbIWTtlnL0ucHTQ9AXrEZg8D
	gdd4yDbrqO7qc+Rn4bgbsbEmH71auJ4NU3wGcfhWp04BFrVSXbcmH4ne6sk7QYj2mgMM6Rkq
	LBRysg6WyNIuG11vm0ccTmDMWQ0=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mxa.mailgun.org with ESMTP id 5b570165.7f9d71071330-smtp-out-n03;
	Tue, 24 Jul 2018 10:37:25 -0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id h23-v6so2948351ita.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 03:37:25 -0700 (PDT)
X-Gm-Message-State: AOUpUlHP12hTLosmBvJhHkPBMswiDRqk4i5b9qY0EAaOlcugF+z9sdUb
	nQ7VFMtqf650tqL3p2M8aLhnmJWBCfidgI1sU4k=
X-Google-Smtp-Source: AAOMgpfly3alwXwo6TCerzcaA6GDjUbUEKP8QsWPatYX4I7V/6mDI8bleSt6ewZFUszaSEXt7MWRTbqg50oJkpWMm0I=
X-Received: by 2002:a02:5e42:: with SMTP id
	h63-v6mr14871763jab.117.1532428644798; 
	Tue, 24 Jul 2018 03:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180724082715.11769-1-alexandru.vasiu@ni.com>
In-Reply-To: <20180724082715.11769-1-alexandru.vasiu@ni.com>
From: Derek Straka <derek@asterius.io>
Date: Tue, 24 Jul 2018 06:37:13 -0400
X-Gmail-Original-Message-ID: <CADNbA1qXNc5=0wiit1u9sR9Jc5peJf6Ti82yiEUCzaCaLmrzMg@mail.gmail.com>
Message-ID: <CADNbA1qXNc5=0wiit1u9sR9Jc5peJf6Ti82yiEUCzaCaLmrzMg@mail.gmail.com>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-python][PATCH] python-pyiface: Upgrade to version 0.0.9
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
X-List-Received-Date: Tue, 24 Jul 2018 10:37:25 -0000
Content-Type: text/plain; charset="UTF-8"

Can you remove the old version too?  Thanks

On Tue, Jul 24, 2018, 4:29 AM Alexandru Vasiu <alexandru.vasiu@ni.com>
wrote:

> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta-python/recipes-devtools/python/python-pyiface.inc       | 4 ++--
>  meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb  | 2 ++
>  meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb | 2 ++
>  3 files changed, 6 insertions(+), 2 deletions(-)
>  create mode 100644 meta-python/recipes-devtools/python/
> python-pyiface_0.0.9.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-pyiface_0.0.9.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-pyiface.inc
> b/meta-python/recipes-devtools/python/python-pyiface.inc
> index 895a0ae09..a1156f428 100644
> --- a/meta-python/recipes-devtools/python/python-pyiface.inc
> +++ b/meta-python/recipes-devtools/python/python-pyiface.inc
> @@ -5,7 +5,7 @@ LICENSE = "GPLv3+"
>
>  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=4fe869ee987a340198fb0d54c55c47f1"
>
> -SRC_URI[md5sum] = "1bbc53c281925eae5f508b8b1a1f8259"
> -SRC_URI[sha256sum] =
> "83a64f5672cda48776ca9ed228dbf2e2df7b074a7dcb52ed4f6987322051928d"
> +SRC_URI[md5sum] = "bc94e3d0c1cf8f49ac86514a8e90ed5c"
> +SRC_URI[sha256sum] =
> "a58367d456ac0b4b9d1d5c31d5dd24363ad6c5bcc73edf027ded63732f784cf4"
>
>  inherit pypi
> diff --git a/meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb
> b/meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb
> new file mode 100644
> index 000000000..854cb30ee
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-pyiface_0.0.9.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools
> +require python-pyiface.inc
> \ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb
> b/meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb
> new file mode 100644
> index 000000000..721e7b1c9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyiface_0.0.9.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-pyiface.inc
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

