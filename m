Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4F1FF6E7CC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 20:51:16 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id uz6so8266638obc.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Mar 2014 13:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=mPQEQ+3UvJ8naSoDTolIeJOO+APzMLv4v32RaLrmf3I=;
	b=cBqzhGaXQeR3+YEYMNyT3tlyZhd6B+C8NRc8PsXjGMs/k0lqidCGMqesd9vBSpFvV6
	FkNP9uWdc1le/NuQhv31atlT9HsD+eceJGTkqcvgu27hs8E/7/fiMEJJ6fP1xYIhT6h/
	6COTUkkHxApb97b1Mo6Sc4FJ5Gawgb1YuB+IZGMC1BM+R/8OlMMArtM4PPkXCSnSGWq4
	JZIq8dzT3763+baKXqGVJ3kOjJZD4LS9KiotkMXEQC9Z3/2ib+G0dB6qIApfCs8Pr+hl
	SOnECT/y4MmDTboRuRh0VLmKVYEeEk6sBdCdVdUlmNiNikDjMHHJXZTyYmVrrdYp1139
	YzRg==
X-Gm-Message-State: ALoCoQnlW/BX3wlfKrofOfYEn2XbJX1txXfGfEP7JVSo23jQims/aaH4txoEwMSQScw6ezFYLsWx
X-Received: by 10.60.155.180 with SMTP id vx20mr18455891oeb.28.1396212677577; 
	Sun, 30 Mar 2014 13:51:17 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id j1sm4228462obw.7.2014.03.30.13.51.16
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 30 Mar 2014 13:51:16 -0700 (PDT)
Message-ID: <533883C0.3000508@linaro.org>
Date: Sun, 30 Mar 2014 16:51:12 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1386455381-40913-1-git-send-email-ulf@emagii.com>
In-Reply-To: <1386455381-40913-1-git-send-email-ulf@emagii.com>
Cc: Ulf Samuelsson <ulf@emagii.com>
Subject: Re: [PATCH] xfconfig: use sysroot and target perl
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
X-List-Received-Date: Sun, 30 Mar 2014 20:51:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/07/13 17:29, Ulf Samuelsson wrote:
> xfconf-4.10.0 does not use OE sysroot as is.
> --with-sysroot=yes 
> will make configure run CC --print-sysroot
> and use that.
>
> Signed-off-by: Ulf Samuelsson <ulf@emagii.com>
> ---
>  meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> index 4ea2b88..6d5bf57 100644
> --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.10.0.bb
> @@ -2,10 +2,14 @@ DESCRIPTION = "Xfce configuration daemon and utilities"
>  SECTION = "x11/wm"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -DEPENDS = "dbus-glib libxfce4util perl-native"
> +DEPENDS = "dbus-glib libxfce4util perl"
> +PR="r1"
>  
>  inherit xfce
>  
> +EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
> +EXTRA_OECONF += "--with-sysroot=yes"
> +
>  SRC_URI += "file://0001-Simplify-checks.patch"
>  SRC_URI[md5sum] = "4ed48150a03fb5f42b455494307b7f28"
>  SRC_URI[sha256sum] = "175219a441cc7d0f210bbd1a3b0abba41598627cd9db27235811400c3e100576"

This patch is causing the build to emit a QA warning:

xfconf-4.10.0: xfconf: configure was passed unrecognised options: --with-sysroot

Is this really the right option to supply for what you're trying to do?

http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.20140329_001343.log/qa.log


On my machine this package builds with this option (--with-sysroot)
removed, but I realize that testing on one machine is probably not
sufficient.

