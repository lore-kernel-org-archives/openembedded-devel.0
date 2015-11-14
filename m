Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7EC77340
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 16:19:29 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so130068692pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Nov 2015 08:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=bP/ZIdcFGgov+rpjqSFBIkW2Z1Hc5sA4X2X/2A5oYvc=;
	b=E5zLSfOQvUhFiOz8phC1MUKgWXSsIR/6D9ooQQoETUGnKY/LCT3JyuPtfoiXGKLEDQ
	TPCqPh0uFCvGcJb8EHi2EkgQJd0qiU61G0bFGyMszibp+P3ACMOsiMSyUiSZwWVbvbty
	IduvL0n2AutqhH1zGaUC+AdzOjszU9TbcX0sy+K1PQ1zfSqhX0dxgoP8Y/+0lH9zRYht
	+cTc91ftRUdwZ1v80X6pYieGh2Uw1aRJWvUra7Mfe7lMooICIEJS06l4/oRm6c4s95Kh
	9xyKvvhK/w5GaT5UnPa60xLAvhanSp2wF41Nwy5V2u9euIVoDrtiJjskO2vBhs43xDaz
	73Jg==
X-Received: by 10.68.238.100 with SMTP id vj4mr40837322pbc.103.1447517969864; 
	Sat, 14 Nov 2015 08:19:29 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1239:4137:4912:eb79:3eb?
	([2601:202:4000:1239:4137:4912:eb79:3eb])
	by smtp.googlemail.com with ESMTPSA id
	ey2sm26689054pbd.77.2015.11.14.08.19.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 14 Nov 2015 08:19:28 -0800 (PST)
To: Nicolas Ferre <nicolas.ferre@atmel.com>,
	openembedded-devel@lists.openembedded.org
References: <1447432157-15189-1-git-send-email-nicolas.ferre@atmel.com>
	<1447432157-15189-2-git-send-email-nicolas.ferre@atmel.com>
From: akuster808 <akuster808@gmail.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56475F06.102@gmail.com>
Date: Sat, 14 Nov 2015 08:19:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1447432157-15189-2-git-send-email-nicolas.ferre@atmel.com>
Subject: Re: [meta-python][jethro][PATCH] python-evdev: add python-evdev 0.5.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Nov 2015 16:19:35 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Nicolas,

meta-openembdded is closed to new packages. Bug and security fixes only.


- armin

On 11/13/2015 08:29 AM, Nicolas Ferre wrote:
> Python-evdev is a Python module that gives access to the input event interface
> from userspace.
> https://python-evdev.readthedocs.org/en/latest/
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> ---
>  meta-python/recipes-devtools/python/python-evdev_0.5.0.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-evdev_0.5.0.bb
> 
> diff --git a/meta-python/recipes-devtools/python/python-evdev_0.5.0.bb b/meta-python/recipes-devtools/python/python-evdev_0.5.0.bb
> new file mode 100644
> index 000000000000..2435b456b5e6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-evdev_0.5.0.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "Python evdev lib"
> +HOMEPAGE = "https://github.com/gvalkov/python-evdev"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2b500cb3c70f576a0a75125beda9491a"
> +
> +SRC_URI = "https://github.com/gvalkov/python-evdev/archive/v${PV}.zip"
> +SRC_URI[md5sum] = "30c11ee7bd4a943f8ae586d839b860f2"
> +SRC_URI[sha256sum] = "ce6a757e28b56a12a9ad4e86420db4b11918b75ba1cd70f7444e904a7284b6fe"
> +
> +inherit setuptools
> 

