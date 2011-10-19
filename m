Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGYQP-0004Sr-KT
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 17:51:26 +0200
Received: by pzk33 with SMTP id 33so4695444pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 08:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=sdSG0E0gln9mUClq/JlWunxjzNLieZOxxlrPSXa0334=;
	b=Ww9RLBW+5r8dJWVt7vba38BkPhQ/tYOR3doZoLi1eXVKUbem0p/G9XzBrXcbPpK6lJ
	yDzaahJaKwM3h3v5Y6ZQwH7Fp5CNY2PMq5nRtn/PPhll7/PxyvEZqLrMR/sGDWfsNvoS
	yFBzWUfjBAY2Z4axWmMGzKKUGpLghx1WjkibI=
Received: by 10.68.9.2 with SMTP id v2mr13188814pba.101.1319039130150;
	Wed, 19 Oct 2011 08:45:30 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net.
	[99.57.141.118])
	by mx.google.com with ESMTPS id jm5sm8592328pbc.1.2011.10.19.08.45.28
	(version=SSLv3 cipher=OTHER); Wed, 19 Oct 2011 08:45:28 -0700 (PDT)
Message-ID: <4E9EF092.3080300@gmail.com>
Date: Wed, 19 Oct 2011 08:45:22 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
	<1319037014-29473-2-git-send-email-ulf_samuelsson@telia.com>
In-Reply-To: <1319037014-29473-2-git-send-email-ulf_samuelsson@telia.com>
Subject: Re: [PATCH 2/3] Use linux2 when configuring python-2.6.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Oct 2011 15:51:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2011 8:10 AM, ulf_samuelsson@telia.com wrote:
> From: Ulf Samuelsson<ulf_samuelsson@telia.com>
>
> Signed-off-by: Ulf Samuelsson<ulf.samuelsson@telia.com>
>
> ---
>   ...64-bit-host.-Use-linux2-instead-of-linux3.patch |   40 ++++++++++++++++++++
>   recipes/python/python_2.6.6.bb                     |    1 +
>   2 files changed, 41 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch
>
> diff --git a/recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch b/recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch
> new file mode 100644
> index 0000000..46ce713
> --- /dev/null
> +++ b/recipes/python/python-2.6.6/0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch
> @@ -0,0 +1,40 @@
> +From 3fbd3d4aa2f9b0aaa806ec9f19dc589a0928ef0c Mon Sep 17 00:00:00 2001
> +From: Ulf Samuelsson<ulf_samuelsson@telia.com>
> +Date: Wed, 19 Oct 2011 15:46:32 +0200
> +Subject: [PATCH] Support 64 bit host. Use linux2 instead of linux3


can you explain why this change is needed.

> +
> +Imported from the Buildroot project.
> +
> +Signed-off-by: Ulf Samuelsson<ulf.samuelsson@telia.com>
> +---
> + configure    |    1 +
> + configure.in |    1 +
> + 2 files changed, 2 insertions(+), 0 deletions(-)
> +
> +diff --git a/configure b/configure
> +index d0731c3..dc8d029 100755
> +--- a/configure
> ++++ b/configure
> +@@ -2814,6 +2814,7 @@ then
> + 	darwin*) MACHDEP="darwin";;
> + 	atheos*) MACHDEP="atheos";;
> +         irix646) MACHDEP="irix6";;
> ++	linux*)	MACHDEP="linux2";;
> + 	'')	MACHDEP="unknown";;
> + 	esac
> + fi
> +diff --git a/configure.in b/configure.in
> +index 609d8f2..8b8b77c 100644
> +--- a/configure.in
> ++++ b/configure.in
> +@@ -264,6 +264,7 @@ then
> + 	darwin*) MACHDEP="darwin";;
> + 	atheos*) MACHDEP="atheos";;
> +         irix646) MACHDEP="irix6";;
> ++	linux*)	MACHDEP="linux2";;
> + 	'')	MACHDEP="unknown";;
> + 	esac
> + fi
> +--
> +1.7.5.4
> +
> diff --git a/recipes/python/python_2.6.6.bb b/recipes/python/python_2.6.6.bb
> index eacc5c2..ae057a2 100644
> --- a/recipes/python/python_2.6.6.bb
> +++ b/recipes/python/python_2.6.6.bb
> @@ -18,6 +18,7 @@ SRC_URI = "\
>     file://python-module-rpath-fix.patch \
>     file://sitecustomize.py \
>     file://pkgconfig-support.patch \
> +  file://0001-Support-64-bit-host.-Use-linux2-instead-of-linux3.patch \
>   "
>   SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
>   SRC_URI[sha256sum] = "134c5e0736bae2e5570d0b915693374f11108ded63c35a23a35d282737d2ce83"



