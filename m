Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA34360017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 08:22:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t618MRHN005167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Jul 2015 01:22:27 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Jul 2015 01:22:26 -0700
Message-ID: <5593A340.8030507@windriver.com>
Date: Wed, 1 Jul 2015 16:22:24 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1435697730-12800-1-git-send-email-gary@mlbassoc.com>
In-Reply-To: <1435697730-12800-1-git-send-email-gary@mlbassoc.com>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-browser][PATCH v2] chromium: List all PACKAGECONFIG settings to avoid warning
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
X-List-Received-Date: Wed, 01 Jul 2015 08:22:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Gary,

On 07/01/2015 04:55 AM, Gary Thomas wrote:
> OE-core now warns if PACKAGECONFIG is used to set an option that
> does not have a corresponding PACKAGECONFIG[option]="xxx" line.
> This recipe makes use of many such options & this patch suppresses
> those warnings by listing the options.
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
> ---
>   recipes-browser/chromium/chromium.inc | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
> index 8e83f6a..973d1c9 100644
> --- a/recipes-browser/chromium/chromium.inc
> +++ b/recipes-browser/chromium/chromium.inc
> @@ -17,6 +17,13 @@ PACKAGECONFIG ??= "use-egl"
>   # automatically and silently fall back to GLX
>   PACKAGECONFIG[use-egl] = ",,virtual/egl virtual/libgles2"
>
> +# Additional PACKAGECONFIG options - listed here to avoid warnings
> +PACKAGECONFIG[component-build] = ""
> +PACKAGECONFIG[disable-api-keys-info-bar] = ""
> +PACKAGECONFIG[ignore-lost-context] = ""
> +PACKAGECONFIG[impl-side-painting] = ""
> +PACKAGECONFIG[use-gl] = ""

Since you don't really use PACKAGECONFIG, why not use
ANY_OTHER_VALUE_YOU_LIKE rather than PACKAGECONFIG to configure it ?

// Robert


> +
>   GYP_DEFINES += "${ARMFPABI} release_extra_cflags='-Wno-error=unused-local-typedefs' sysroot=''"
>
>   do_configure() {
>

