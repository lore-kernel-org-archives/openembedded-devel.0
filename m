Return-Path: <eu@felipetonello.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B3C1377B39
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 16:28:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z129so4477952wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 May 2017 09:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=felipetonello-com.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=RougFP5GmofzAu/mpNlj84m/B/Fa9YfnTQ3N3Vcr7to=;
	b=MScIR+ApxfnpYxiR8SE7jKP0Jfs648dMRT7LmTBar6amP7RMxqFI4bjDRMlEIXBoYP
	3ZfH17Z/2NYyPzncuT0RA9BOnlrDVs0IQYisFK9lprOk3TImjbS7FjaN9J7rVD0yqLdz
	2bGques+P5heBwyB2uHDs1FRnGY5KXZVvtlJxJ2YrCivjgwDufzRhVrsxjsSf5lkQ1/w
	gOfuB46UX+QbzMRGIMmBfKI8AzJJrdcX6FQIVgwxaIpFt3+lcg21vCQAEw/kdaw2Mn9f
	B4BCGFVXvQrtn+uk2E8sNehllzkes2MItoa5i4/pYvNd6fIDiefSf5Qd4vpV1c5+sP8w
	JWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RougFP5GmofzAu/mpNlj84m/B/Fa9YfnTQ3N3Vcr7to=;
	b=ZnmYNwmsPvT+DTy5px1553eTZw5lk1HK4jWc29f8YKAWnV8ea6jdzAtU4Q9nxmHViq
	lWoXBLSokIcCmd26JIXB7jdWwjFoTGfdQ03kcfO/k3KA2w9j5YOntGAGyvPacGuiXM6w
	nNcC5mza3W0CwMyEsHxYbcDU2xpBWZXACVQpIVcp2cJjCVW14YdpuugaFcBPD7SC38Hr
	+0fHXRqTmxs2ZMQF6pYICRSSDRtTW88pPe1eoZbkvmjD8rEVwhbdnbCtvDJ+FECcn92J
	8IeoY2VQgNZghw2uh7GaPwmpu3H31aUN50eJJBGWxYluZHOLrjo9uc0lOplBDQNE21FP
	lQSg==
X-Gm-Message-State: AN3rC/7U42MfXroV9QixdpRe/jWNdAWcdrBQ96pAr8hUFlVAtraL7WlJ
	0P/FgeZzWi6uGPZnxYU=
X-Received: by 10.28.191.195 with SMTP id o64mr2612573wmi.68.1493915307913;
	Thu, 04 May 2017 09:28:27 -0700 (PDT)
Received: from [10.55.10.149] ([81.145.202.106])
	by smtp.gmail.com with ESMTPSA id q19sm2366837wmd.1.2017.05.04.09.28.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 May 2017 09:28:27 -0700 (PDT)
From: Felipe Ferreri Tonello <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
References: <20170504160244.30690-1-eu@felipetonello.com>
Message-ID: <1af48bc9-0873-2008-0e79-1e9edc2fe58f@felipetonello.com>
Date: Thu, 4 May 2017 17:28:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0.1
MIME-Version: 1.0
In-Reply-To: <20170504160244.30690-1-eu@felipetonello.com>
Subject: Re: [PATCH] juce: Updated JUCE to 5.0.1
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
X-List-Received-Date: Thu, 04 May 2017 16:28:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I have sent a v2 of this patch to fix a filename.

On 04/05/17 17:02, Felipe F. Tonello wrote:
> JUCE 5 doesn't require juce_events to have x11 dependency anymore. Also
> there were many improvements on Projucer.
> 
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> ---
>  meta-multimedia/classes/juce.bbclass                 |  3 +--
>  meta-multimedia/recipes-multimedia/juce/projucer.inc | 12 ++++++------
>  2 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/meta-multimedia/classes/juce.bbclass b/meta-multimedia/classes/juce.bbclass
> index 715282fd15c1..3927235ef13f 100644
> --- a/meta-multimedia/classes/juce.bbclass
> +++ b/meta-multimedia/classes/juce.bbclass
> @@ -1,8 +1,8 @@
>  inherit pkgconfig
>  
> +# List of JUCE modules that requires external dependencies
>  JUCE_MODULES ??= " \
>    juce_core \
> -  juce_events \
>    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'juce_audio_devices', '', d)} \
>    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'juce_graphics juce_gui_basics', '', d)} \
>    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'juce_opengl', '', d)} \
> @@ -11,7 +11,6 @@ JUCE_X11_DEPS = "libx11 libxext libxinerama libxrandr libxcursor"
>  
>  PACKAGECONFIG_prepend= "${JUCE_MODULES} "
>  PACKAGECONFIG[juce_core] = ",,curl,"
> -PACKAGECONFIG[juce_events] = ",,libx11,"
>  PACKAGECONFIG[juce_audio_devices] = ",,alsa-lib,"
>  PACKAGECONFIG[juce_graphics] = ",,${JUCE_X11_DEPS} freetype,"
>  PACKAGECONFIG[juce_gui_basics] = ",,${JUCE_X11_DEPS},"
> diff --git a/meta-multimedia/recipes-multimedia/juce/projucer.inc b/meta-multimedia/recipes-multimedia/juce/projucer.inc
> index 6f696e26f928..41297f868865 100644
> --- a/meta-multimedia/recipes-multimedia/juce/projucer.inc
> +++ b/meta-multimedia/recipes-multimedia/juce/projucer.inc
> @@ -3,19 +3,19 @@ DESCRIPTION = "Projucer is used to build and generate support files and build in
>  JUCE supported platforms, including Linux and Embedded Linux."
>  SECTION = "utils"
>  HOMEPAGE = "http://juce.com/"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://README.txt;md5=9ab765ccda8890efc753f287911a1958"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://README.txt;md5=65c50b4ff3522b99436da100536ccd1c"
>  
>  inherit pkgconfig
>  
>  DEPENDS = "libx11 libxext libxinerama libxrandr libxcursor freetype alsa-lib curl"
>  
> -SRCREV = "a8a7fa28e2e9cb19db6a27fcccb567a8ccfe6109"
> -BRANCH = "develop"
> -SRC_URI = "git://github.com/julianstorer/JUCE.git;protocol=https;branch=${BRANCH}"
> +SRCREV = "4f41f28b47d01b939559123d145b4e5860528bb7"
> +BRANCH = "master"
> +SRC_URI = "git://github.com/WeAreROLI/JUCE.git;protocol=https;branch=${BRANCH}"
>  
>  S = "${WORKDIR}/git"
> -PV = "4.2.3+git${SRCPV}"
> +PV = "5.0.1"
>  
>  JUCE_PROJUCER_BUILD_PATH = "${B}/extras/Projucer/Builds"
>  JUCE_PROJUCER_MAKEFILE_PATH = "${JUCE_PROJUCER_BUILD_PATH}/LinuxMakefile"
> 

-- 
Felipe

