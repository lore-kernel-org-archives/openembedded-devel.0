Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4CBA260119
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 16:37:38 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id v205so49419955vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 09:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=4S26ASc+GAxhjAHjy9KLgrV/5mmXnja2yHrNZkiyP70=;
	b=UBOZQtVrTTmLIrt99P3y2Ctur6Q8dkLtKGHangzT7SXsKHlKas3YUOYX/mQMqT3+gc
	nuO2zqpx96lLQYkMW5EakNg2h0bJXfBPHJUmpnM5jCmUUqw14ELWSwI/fstvhcKoewnq
	oyqgI+q98Mx50Vnk2VlUdWj0rRNxF7687gH5D9jZVMTYEHcE3xcoNhHXrb43AavUTuMM
	PSZ1RkdE21s+0rxbQU3ENlydgbvtlAbSoK1/VXRT65Kb5ZUUugdH40wc7LPTVgUpHrMU
	4lPMIQ0hMDk5F7c1nEAntxv3PlBv6CMgcyMa/Lz5VIQach4RJnkk9j033hyDfEQsz4Hv
	0bkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=4S26ASc+GAxhjAHjy9KLgrV/5mmXnja2yHrNZkiyP70=;
	b=XGl1Xb95hsBYW6NgOSnjJioOAYUoQJEslD4lhKGzFVKDZImOxmAzwoRcCS3YU3O8CL
	9hlkv0t9TDob35VsRxX/jPFqR58y9vTzEOIoZORwnk5+u/CooTHOqPqmYH35MrFR+pjp
	/xj/GRxz3GBk4EvzNg+zUHY2NJeX3JFn5AmLlpizwiJ53GdUaGPI5Um1OCOrHEV6jvlc
	2vw3ltg56oIfsze43BbNz+kT+IvqOZx511w8MFeGxQMld9we/qQ+/Ip+vqkdVMn4Oi8A
	vEMBBZ8mBlCiEPxjRh0bwa/TpgQq3PdArNAjaa7twLw1amOizGmvHYK99MxQCAjNRevY
	PfQg==
X-Gm-Message-State: AA6/9RnpLOSvJvy2W1KR2CkRx3HUpHrHhSqIYVHTfDTd0QJh26JJ4ZUUBJLcVl2rf3DGmBCqqrLMXVL601ec7w==
X-Received: by 10.31.180.195 with SMTP id d186mr17807598vkf.139.1475080659531; 
	Wed, 28 Sep 2016 09:37:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 28 Sep 2016 09:37:38 -0700 (PDT)
Received: by 10.176.86.206 with HTTP; Wed, 28 Sep 2016 09:37:38 -0700 (PDT)
In-Reply-To: <20160928021717.28355-1-jackie.huang@windriver.com>
References: <20160928021717.28355-1-jackie.huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Sep 2016 09:37:38 -0700
Message-ID: <CAMKF1soN+e18xvZ7iuKb_Bxf++sj59=851q+_UH_UCH24_uLvA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH] ntp : Add openssl to default PACKAGECONFIG options
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
X-List-Received-Date: Wed, 28 Sep 2016 16:37:39 -0000
Content-Type: text/plain; charset=UTF-8

Is this the common usecase ?

On Sep 27, 2016 7:35 PM, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> Add openssl to default PACKAGECONFIG options so ntp
> is configured to have crypto support by default.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> index f3344c0..202d1a3 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
> @@ -46,7 +46,7 @@ USERADD_PARAM_${PN} = "--system --home-dir
> ${NTP_USER_HOME} \
>                         --shell /bin/false --user-group ntp"
>
>  # NB: debug is default-enabled by NTP; keep it default-enabled here.
> -PACKAGECONFIG ??= "cap debug refclocks \
> +PACKAGECONFIG ??= "cap debug refclocks openssl \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
>  "
>  PACKAGECONFIG[openssl] = "--with-openssl-libdir=${STAGING_LIBDIR} \
> --
> 2.8.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

