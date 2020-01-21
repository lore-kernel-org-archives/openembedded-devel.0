Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
	[209.85.166.44])
	by mail.openembedded.org (Postfix) with ESMTP id DF2577FC42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 03:29:03 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id b10so1266616iof.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 19:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6urzWxt2JNxdydDKRCfy4R03HKVEmgAsozlx6Mi7Htc=;
	b=FGMWLjCfb+kp0ZWqXrj/xR4pwrTQYJwpyCL5sl0fmU53tL0bJukQd1saOCIjvjDZOA
	W7LhVJw6PeNgqjC84N/dlVm9jzxuQ4C5t95vuGcTfsWrsnFpJKuutAFz5l79ax2311H1
	Qlizl3rEA50rTcARzBORI62O8R7yK+0waex4r3Pd/Xt51Zif3gACTgmRHKYg3bJCVYpp
	ngnAvZ9BYCBeTto+w5hUhd8KMdR/c/Cjk3m3bhDIe3zR/P2eZjZ/JA0Xowaf6TSp3hnI
	mAIhhpEYXj6hxDpGN6poFixLXCRLJkNGz2NJOoXLURsIvhhLSmTL87fQ9RpDPvgpTYMR
	RBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6urzWxt2JNxdydDKRCfy4R03HKVEmgAsozlx6Mi7Htc=;
	b=TfJPi/HvK8FNnlcvs5+f/i9t04DKSgZcamAuF2ShgmQG66V4BexdFyqoeBRQ+b3xjQ
	eNSL+4YI4chRyWqvtNWac3ehG5sfTo9smBaXBiSNax/sKClGVZ3WvRrRHeRRx+LDKZWH
	Ei4pJPNQV/t0A/pRPfp60cxwhxzaGxUDUBvm755iferJlhcEHvhJ/eE1yp0Z0ARyuwGG
	virojqWi7RXlNyTCswaFHoJ1XPTTrGIJ1MVSpQDNTF3zs+PP0qeEUSaN3GZWTF9Rsway
	tStGvpAq6pERfN7F+eV39/giVvOt7a3ve6cZm5tnRSD/NnVkVGlSLUPvw71ELLyMZpjE
	bxMw==
X-Gm-Message-State: APjAAAUVgBeHPXBVbtRyAs64Ur+HAV1YFFuI4Vs05dFilR+zAJy3koCK
	75kVRPCeyOIAZvw2C0eCgG4OkbKYaE2HV6NZ7CY=
X-Google-Smtp-Source: APXvYqxw00SJaK9V5EHpufZtBFxyghNVOYw1i9YaWvS79sI3niseO9xs61oBVsiCvy5vpzebBNSOcXwFABgVr8AA5Ec=
X-Received: by 2002:a6b:700e:: with SMTP id l14mr1696230ioc.170.1579577344633; 
	Mon, 20 Jan 2020 19:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20200102070429.26514-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20200102070429.26514-1-zangrc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 20 Jan 2020 19:28:52 -0800
Message-ID: <CANx9H-CwprW7RNkOXPNuSgN_Pyk4Tr83eENzz61dKG=67SY6GA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ross Burton <ross@burtonini.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-pymisp: upgrade 2.4.117.2 -> 2.4.119.1
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
X-List-Received-Date: Tue, 21 Jan 2020 03:29:04 -0000
Content-Type: text/plain; charset="UTF-8"

This now has a dependency on {python}-decorators [1][2], which you have not
provided. Please RUN-TIME test your upgrades. Fujitsu is providing upgrades
that break things. At some point we will simply have to deny all your
upgrades, because they are not of high quality. Please correct this.

root@qemux86-64:~# python
Python 2.7.17 (default, Oct 19 2019, 18:58:51)
[GCC 9.2.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import pymisp
WARNING [__init__.py:56 - <module>() ] Unable to load pymisp properly: No
moduld
>>>

[1] https://pypi.org/project/Deprecated/#files
[2]
https://github.com/MISP/PyMISP/blob/fac748dd4c63c9eef4056c5fc5201e811a97be10/setup.py#L44

On Wed, Jan 1, 2020 at 11:03 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-pymisp.inc         | 4 ++--
>  ...{python-pymisp_2.4.117.2.bb => python-pymisp_2.4.119.1.bb} | 0
>  ...ython3-pymisp_2.4.117.2.bb => python3-pymisp_2.4.119.1.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pymisp_2.4.117.2.bb
> => python-pymisp_2.4.119.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.117.2.bb
> => python3-pymisp_2.4.119.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc
> b/meta-python/recipes-devtools/python/python-pymisp.inc
> index 4c61d9fff..6c474920e 100644
> --- a/meta-python/recipes-devtools/python/python-pymisp.inc
> +++ b/meta-python/recipes-devtools/python/python-pymisp.inc
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
>  LICENSE = "BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>
> -SRC_URI[md5sum] = "77aef367e57ba7dcc6f9b3d445a960ed"
> -SRC_URI[sha256sum] =
> "de67196f6a8916b9c52a84a1c45ea967c53fa9d2b3795b070ad2c1cbc28d79d7"
> +SRC_URI[md5sum] = "57184785340e25469e4a80ff9ddce09e"
> +SRC_URI[sha256sum] =
> "594ea0a9e150052232425009eac6dd104a80f494d0e273cc48dd114d7ea8482b"
>
>  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-dateutil \
> diff --git a/meta-python/recipes-devtools/python/
> python-pymisp_2.4.117.2.bb b/meta-python/recipes-devtools/python/
> python-pymisp_2.4.119.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-pymisp_2.4.117.2.bb
> rename to meta-python/recipes-devtools/python/python-pymisp_2.4.119.1.bb
> diff --git a/meta-python/recipes-devtools/python/
> python3-pymisp_2.4.117.2.bb b/meta-python/recipes-devtools/python/
> python3-pymisp_2.4.119.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/
> python3-pymisp_2.4.117.2.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.119.1.bb
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

