Return-Path: <obi@opendreambox.org>
X-Greylist: delayed 349 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Jan 2020 13:20:27 UTC
Received: from relay.dream-property.net (relay.dream-property.net
	[178.19.67.222])
	by mail.openembedded.org (Postfix) with ESMTP id CBC2B7FC8F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 13:20:27 +0000 (UTC)
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 6263510048FB3;
	Mon, 20 Jan 2020 13:20:28 +0000 (UTC)
Received: from localhost (ip-176-199-141-47.hsi06.unitymediagroup.de
	[176.199.141.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 090A73140060;
	Mon, 20 Jan 2020 14:20:28 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org; 
	s=dkim; t=1579526428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=lcQXoA3CNpmBEWvAkHXRQwzHUgdsNcbl89CGKBYw2f4=;
	b=Ud8HhMUqD7QNZ4fxJbJPRTGtQ56Lv6r6teEraa5wPx8/NUKRnRfrG7qOMYANcpZULWwkg7
	ufkMMo54i77aApDw==
Date: Mon, 20 Jan 2020 14:20:25 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200120142025.7ee3bc42@opendreambox.org>
In-Reply-To: <20200120003527.1518697-4-raj.khem@gmail.com>
References: <20200120003527.1518697-1-raj.khem@gmail.com>
	<20200120003527.1518697-4-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 4/5] meta-oe: Remove using python2
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
X-List-Received-Date: Mon, 20 Jan 2020 13:20:28 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Khem,

On Sun, 19 Jan 2020 16:35:26 -0800
Khem Raj <raj.khem@gmail.com> wrote:

> diff --git a/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb b/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
> index d00d1e2a08..ab657e6f08 100644
> --- a/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
> +++ b/meta-oe/recipes-devtools/python/python-jsmin_2.2.2.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a3301ce2ad647e172f4a1016c67324d"
>  
> -inherit setuptools pypi
> +inherit setuptools3 pypi
>  SRC_URI[md5sum] = "00e7a3179a4591aab2ee707b3214e2fd"
>  SRC_URI[sha256sum] = "b6df99b2cd1c75d9d342e4335b535789b8da9107ec748212706ef7bbe5c2553b"
>  

You added python3-jsmin in patch 1/5, so you'd better just remove python-jsmin.

> diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
> index 0cbd07f666..af95e327c4 100644
> --- a/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
> +++ b/meta-oe/recipes-devtools/python/python-pygobject_3.34.0.bb
> @@ -5,9 +5,9 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
>  
>  GNOMEBASEBUILDCLASS = "meson"
> -inherit gnomebase gobject-introspection distutils-base upstream-version-is-even
> +inherit gnomebase gobject-introspection distutils3-base upstream-version-is-even
>  
> -DEPENDS += "python glib-2.0"
> +DEPENDS += "python3 glib-2.0"
>  
>  SRCNAME = "pygobject"
>  SRC_URI = " \

Rename to python3-pygobject?

> diff --git a/meta-oe/recipes-devtools/python/python-which_1.1.0.bb b/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
> index 901fdc7637..67488acd33 100644
> --- a/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
> +++ b/meta-oe/recipes-devtools/python/python-which_1.1.0.bb
> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=030b09798681482b9ad12ac47be496ea"
>  
> -inherit setuptools pypi python-dir
> +inherit setuptools3 pypi python3-dir
>  
>  SRCREV = "425bdeeb2d87c36e2313dc4b8d69ff2bb5a02ee9"
>  PYPI_SRC_URI = "git://github.com/trentm/which"

python3-which?

Best regards,
Andreas

