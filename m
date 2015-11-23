Return-Path: <mario.goulart@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 38EFA6012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 12:13:15 +0000 (UTC)
Received: by vkha189 with SMTP id a189so35387700vkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2015 04:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=yIitGxymqhLPVd/0Pelz2TwjgnyKF48EsSb+xqH/5RU=;
	b=Bu2hJdUuGIR6cWFEnAxQkRf8JMyqDLmCrNQ8+3L/uRT3VADgmAYHjsgMC9K+z3KAfr
	CDdK5PgQCO+yteBKiqYizM8roQUCLxtdNOIyHb82avN09JxuOkvrRGzCuXijzPb/Gag1
	mkFI27vGoBanGZOACB3FdIWyS4ZdeGfHO1aflgZsrRQYQekPyybdDfZinShh/FYctm8j
	CqwaUvUmQ1YHly3Zaha83ZEoqdQlm71vLwjJd0L+xMr2BD1e+n1aLheEZ9NLauZGYFgQ
	TNkZXXRtDdKT2khYEciXIwVI4N7EVlXOw/0JNR1DEPDrXPGXK329nir5AsAHq3XrOEuc
	jYoA==
X-Received: by 10.31.2.67 with SMTP id 64mr18164587vkc.22.1448280795854;
	Mon, 23 Nov 2015 04:13:15 -0800 (PST)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94]) by smtp.gmail.com with ESMTPSA id
	188sm10534894vki.27.2015.11.23.04.13.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Nov 2015 04:13:15 -0800 (PST)
From: Mario Domenech Goulart <mario.goulart@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1448279098-24980-1-git-send-email-otavio@ossystems.com.br>
Date: Mon, 23 Nov 2015 12:13:14 +0000
In-Reply-To: <1448279098-24980-1-git-send-email-otavio@ossystems.com.br>
	(Otavio Salvador's message of "Mon, 23 Nov 2015 09:44:58 -0200")
Message-ID: <87h9kcoqw5.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ruby][meta-xfce][PATCH] Move imsettings from meta-ruby to meta-xfce
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
X-List-Received-Date: Mon, 23 Nov 2015 12:13:17 -0000
Content-Type: text/plain

On Mon, 23 Nov 2015 09:44:58 -0200 Otavio Salvador <otavio@ossystems.com.br> wrote:

> The imsettings requires xfconf to run, making it dependent of XFCE. It
> makes no sense to make meta-ruby dependent of XFCE so we move the
> imsettings recipe to meta-xfce and add the meta-ruby dependency there.

s/dependent of/dependent on/

>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-ruby/conf/layer.conf                                               | 2 +-
>  meta-xfce/conf/layer.conf                                               | 1 +
>  .../imsettings/imsettings/gtk-is-required-by-notify.patch               | 0
>  .../multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch      | 0
>  .../recipes-extended/imsettings/imsettings_1.6.8.bb                     | 0
>  5 files changed, 2 insertions(+), 1 deletion(-)
>  rename {meta-ruby => meta-xfce}/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch (100%)
>  rename {meta-ruby => meta-xfce}/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch (100%)
>  rename {meta-ruby => meta-xfce}/recipes-extended/imsettings/imsettings_1.6.8.bb (100%)
>
> diff --git a/meta-ruby/conf/layer.conf b/meta-ruby/conf/layer.conf
> index b053450..b526a5d 100644
> --- a/meta-ruby/conf/layer.conf
> +++ b/meta-ruby/conf/layer.conf
> @@ -12,4 +12,4 @@ BBFILE_PRIORITY_ruby-layer = "7"
>  # cause compatibility issues with other layers
>  LAYERVERSION_ruby-layer = "1"
>  
> -LAYERDEPENDS_ruby-layer = "core openembedded-layer xfce-layer"
> +LAYERDEPENDS_ruby-layer = "core openembedded-layer"
> diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> index 64b1077..778abac 100644
> --- a/meta-xfce/conf/layer.conf
> +++ b/meta-xfce/conf/layer.conf
> @@ -17,6 +17,7 @@ LAYERDEPENDS_xfce-layer += "openembedded-layer"
>  LAYERDEPENDS_xfce-layer += "gnome-layer"
>  LAYERDEPENDS_xfce-layer += "openembedded-layer"
>  LAYERDEPENDS_xfce-layer += "meta-python"
> +LAYERDEPENDS_xfce-layer += "ruby-layer"
>  
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    xfce4-session->machine-host \
> diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch b/meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
> similarity index 100%
> rename from meta-ruby/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
> rename to meta-xfce/recipes-extended/imsettings/imsettings/gtk-is-required-by-notify.patch
> diff --git a/meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch b/meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
> similarity index 100%
> rename from meta-ruby/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
> rename to meta-xfce/recipes-extended/imsettings/imsettings/multi-line-ACLOCAL_AMFLAGS-isnot-supported-by-autoreconf.patch
> diff --git a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.6.8.bb
> similarity index 100%
> rename from meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
> rename to meta-xfce/recipes-extended/imsettings/imsettings_1.6.8.bb
> -- 
> 2.1.4

-- 
http://parenteses.org/mario

