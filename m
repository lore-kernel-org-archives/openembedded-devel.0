Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f45.google.com (mail-yh0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id 313DD65E8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 15:17:50 +0000 (UTC)
Received: by mail-yh0-f45.google.com with SMTP id z6so704614yhz.18
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=cN/+YAOq2ugNTnLza6t87jlSLynKVrd46CvqtmBLQkg=;
	b=0RD+aDNjsVd8givx2P9jSbkT4vscY1C/GvCTGuqa1wdEU3W/GXIEkcG0nxNAHGEfIU
	Hb5L2OiK08iIiBE0icffyJls7As48vwxjVP55/zgAC0/iN9TTi6bGiBaa7fAblXqslCt
	6u3cm/+xQBlIApsc6IA+iwGq9mn5B8vxDi11XMZEkht7eVRU8OjMTvvwYdTFHCG66ZXT
	MxitbXlqpBe6d3YoYg4v9r6huc6O88R7EcOaIQ2xwW9uexk0k/BndcxeI2mjVUZkVktk
	NFIpiYNYY3f1KosIBuYGTg3NasXwYsPEShVOsDsZBUnMDms3176gpHeZibglPqX91xfb
	T4cQ==
MIME-Version: 1.0
X-Received: by 10.236.189.198 with SMTP id c46mr39164532yhn.47.1398698271611; 
	Mon, 28 Apr 2014 08:17:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Mon, 28 Apr 2014 08:17:51 -0700 (PDT)
In-Reply-To: <1398597711-17825-3-git-send-email-dv@pseudoterminal.org>
References: <1398597711-17825-1-git-send-email-dv@pseudoterminal.org>
	<1398597711-17825-3-git-send-email-dv@pseudoterminal.org>
Date: Mon, 28 Apr 2014 12:17:51 -0300
X-Google-Sender-Auth: 5hjCpghw750obeF0nIi9xRkOIxQ
Message-ID: <CAP9ODKoby8uGvM5L8-tXs7t1mpAXpwTrL-vPStxgVCpxif1D3w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 2/4] Add variable to contain extra command-line arguments
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
X-List-Received-Date: Mon, 28 Apr 2014 15:17:51 -0000
Content-Type: text/plain; charset=UTF-8

Hello Carlos,

On Sun, Apr 27, 2014 at 8:21 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> With this patch it becomes possible to add extra command line options to
> the "chrome" call in /usr/bin/google-chrome script .
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
...
> diff --git a/recipes-browser/chromium/chromium_35.0.1883.0.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
> index 203474d..080282b 100644
> --- a/recipes-browser/chromium/chromium_35.0.1883.0.bb
> +++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
> @@ -33,6 +33,9 @@ EXTRA_OEGYP = " \
>  "
>  ARMFPABI_armv7a = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'arm_float_abi=hard', 'arm_float_abi=softfp', d)}"
>
> +CHROMIUM_EXTRA_ARGS = " \
> +"

CHROMIUM_EXTRA_ARGS ?= ""

>  export GYP_DEFINES="${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
>  do_configure() {
>         cd ${S}
> @@ -54,6 +57,10 @@ do_install() {
>         install -d ${D}${bindir}
>         install -m 0755 ${WORKDIR}/google-chrome ${D}${bindir}/
>
> +       # Add extra command line arguments to google-chrome script by modifying
> +       # the dummy "CHROME_EXTRA_ARGS" line
> +       sed -i "s/^CHROME_EXTRA_ARGS=\"\"/CHROME_EXTRA_ARGS=\"${CHROMIUM_EXTRA_ARGS}\"/" ${D}${bindir}/google-chrome

Nice!

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

