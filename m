Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F4B577E76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 05:07:05 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id t193so1935242pgc.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 22:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/LNMj4KNBsv2n+OdAUCpy+5JZThspeQwphmnwoOouqQ=;
	b=hR6Pofj6hWnlubXXwX14LnjGVLO9+TZNG5JaGGXw6piSJPLzB3VXrb2kkfTGxEB7tI
	qZhF9weCceNyNxhP9voqLdd7ridQSaB+d91t5wNOoSIGP+XZQSyejNijUqvXKCLz0bCX
	s3yHwwiZx3w9c16MNiOYP6c3+HWtuUPTABLLuN0lPP4KFA4RgGU36gs9/er3pQop7hoC
	oNujelxD5rPtPKCHG5e4QN+Uo33ZORp1oPzrg7rk8pd57GRJSSRxxKpYtlxDYmnAUMah
	FI2xzxyOWy+x7n2ODQuW7tAxwRc2eNO9G5zTsMSSLpp6zBijYHnpxXpdlWhBC0xCXzFu
	ZAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/LNMj4KNBsv2n+OdAUCpy+5JZThspeQwphmnwoOouqQ=;
	b=IlhP7sZif1hqT+wHWTcW4vn1d70HYWkFYX9/FxIFdJHAD3KmeWknq0k583TedkJZzJ
	TbdKEQpwA8KToKQkZ3gUUvKILbBE6T0kKwPxRjMud+Qdnsl2F8nxJcdjU+QtrVqLSwo9
	+wtU9ULPjz1X6SE/b55hdheZpm9sitQFHbaezPmdwywy4QnqZL//hjTq0WMrQOnPiZz5
	QvNKADM5gwHQSD1ZhIDj0HYlrZ6chvGOY0Y236f+/uW3VK2N5Bpz56iWNKl5b7Fj6IQk
	vs38Z9Ewa7pXFAz2MQ5W0QQPUJ4tmOR0rtptuR6M6N7mtStWtH8cCK8xlGLZ5U/cb2Ci
	0Luw==
X-Gm-Message-State: AHYfb5i/dOeOz4zXeSyRzCR+l7SFoUunZuyDgGRVEdiNXCqi6BRoCpqH
	a+lNUiTGM/IzUBzSPzqTPoi2jSKHVQ==
X-Received: by 10.98.2.210 with SMTP id 201mr2818224pfc.151.1503983226815;
	Mon, 28 Aug 2017 22:07:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Mon, 28 Aug 2017 22:06:36 -0700 (PDT)
In-Reply-To: <1503977887-29630-1-git-send-email-bruce.ashfield@windriver.com>
References: <1503977887-29630-1-git-send-email-bruce.ashfield@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Aug 2017 22:06:36 -0700
Message-ID: <CAMKF1spC+B8DhcFZ3jP84J66Uucw_UWujCyA+UHtTJ5zvJNcRw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireguard: fix kernel 4.12 build issues
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
X-List-Received-Date: Tue, 29 Aug 2017 05:07:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 28, 2017 at 8:38 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> We upgrade the module + tools recipes to fix the following build error:
>
>  wireguard-module/0.0.20170517-r0/WireGuard-0.0.20170517/src/device.c:
>  In function 'setup':
>  |
>  wireguard-module/0.0.20170517-r0/WireGuard-0.0.20170517/src/device.c:269:7:
>  error: 'struct net_device' has no member named 'destructor'; did you
>  mean 'priv_destructor'?
>  |   dev->destructor = destruct;
>  |        ^~~~~~~~~~
>  |        priv_destructor
>
> We also add a RDEPENDS on "bash" to the wireguard-tools recipe to fix
> the following QA issue that appeared with the version bump:
>
>   ERROR: wireguard-tools-0.0.20170810-r0 do_package_qa: QA Issue:
>   /usr/bin/wg-quick contained in package wireguard-tools requires
>   /bin/bash, but no providers found in RDEPENDS_wireguard-tools?
>   [file-rdeps]
>

already fixed with
https://patchwork.openembedded.org/patch/143341/
https://patchwork.openembedded.org/patch/143280/

your commit msg is better though

> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  ...eguard-module_0.0.20170517.bb => wireguard-module_0.0.20170810.bb} | 0
>  ...ireguard-tools_0.0.20170517.bb => wireguard-tools_0.0.20170810.bb} | 2 +-
>  meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20170517.bb => wireguard-module_0.0.20170810.bb} (100%)
>  rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20170517.bb => wireguard-tools_0.0.20170810.bb} (93%)
>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb
> similarity index 100%
> rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170517.bb
> rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20170810.bb
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
> similarity index 93%
> rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
> rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
> index 79d420f1a417..c4ddbcb0e90f 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170517.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20170810.bb
> @@ -24,4 +24,4 @@ FILES_${PN} = " \
>      ${bindir} \
>  "
>
> -RDEPENDS_${PN} = "wireguard-module"
> +RDEPENDS_${PN} = "wireguard-module bash"
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> index 9e38c57ffa5b..b26536d3308c 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "e9969ebbdf525fcbe91a513db8a5c864"
> -SRC_URI[sha256sum] = "7303e973654a3585039f4789e89a562f807f0d6010c7787b9b69ca72aa7a6908"
> +SRC_URI[md5sum] = "8dd3e080407b8295c25565a847a4ca27"
> +SRC_URI[sha256sum] = "ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7"
>
>  S = "${WORKDIR}/WireGuard-${PV}/src/"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

