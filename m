Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id B59F47771E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Mar 2017 14:21:58 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u48so11833017wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Mar 2017 06:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=62mJ1A8j5p8rWXN9gA+I8suyige2KhxX6STFlQjBToE=;
	b=iZRB3sduF1NStYsF7V0w5DaAAhaAX4W2Tu7eWAQ3USKc+ZeirfDL6WrEnE0QQqL8U0
	eaahq+jFY2uaPA/V7lkzAOuH2Z9A3g/qV+Wm69+PyYOtig0+vba6/tDtbdq7st10UnbD
	ZL+YVXlC7ZsexHh/T/rl8KUw25ufja94WL6f9ybDmCcC0XbbK6AtYdyfV7E0m3WDhiaG
	mt6ixfde/iZeMUlfpDjOJAJk2CpGggjNLMJTspD/6ROJSDJ38gXYG+t5afPVL+uaeHKp
	myMGkzMVQQcvzliVth/cMXHg53NLt615rT5I+WxelJQvM+LJ01V+gCDwhEWeQdiTo/DV
	emTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=62mJ1A8j5p8rWXN9gA+I8suyige2KhxX6STFlQjBToE=;
	b=LmCtWWVGJbHrVi3Yh2uMJAVawK5hcR0hVF7fcpIzcy+CjChKyGVNxWLaeFGy/FsaRq
	+eTds3M/UG61MSXG4i2kNUBvQYCMh8IgxIVwWGg4rwJAFHntBwAmcfgjnnOBmKFfoht8
	TQoL9JfxPVn9W0DJ76HiYqzqiEW6IkD+PIjqiHCizeiKtM24Vfug/XJduvz2jqNxYnK7
	Ickel0DhmONsO4877yTAHTscDtsOjddhvVsPCnHfEXlS1s4t2J2QHJ0aeTvb8VMro6w4
	HajSSmtxLMQsaqeiFGrU79/woX4mMQmqr9MHsJ8pfgUds71KGB6zVZDl5H8txdAR/cO/
	lXoA==
X-Gm-Message-State: AMke39nh+aF9/2xSjSn+9Wjuy16HWqJDCPXy70mJptlaUrI4x4DiuAV9nGbclqGoRYOSVFUEbVtSBBbOOG3hPg==
X-Received: by 10.223.129.74 with SMTP id 68mr15007164wrm.183.1489155718609;
	Fri, 10 Mar 2017 06:21:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Fri, 10 Mar 2017 06:21:58 -0800 (PST)
In-Reply-To: <1489025504-3002-1-git-send-email-yi.zhao@windriver.com>
References: <1489025504-3002-1-git-send-email-yi.zhao@windriver.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Fri, 10 Mar 2017 15:21:58 +0100
Message-ID: <CAAQYJAvKj7F0YhCkwAk6dnMn2sAvZhVVgjcgg6TraDCGGJ1JgQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] postfix: remove references to buildmachine paths in target makedefs.out
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
X-List-Received-Date: Fri, 10 Mar 2017 14:21:59 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 9, 2017 at 3:11 AM, Yi Zhao <yi.zhao@windriver.com> wrote:
> Clean the buildmachine paths in makedefs.out
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
> index 03b7985..5bb2491 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix.inc
> +++ b/meta-networking/recipes-daemons/postfix/postfix.inc
> @@ -214,7 +214,7 @@ do_install_append_class-native() {
>
>  do_install_append_class-target() {
>      # Remove references to buildmachine paths in target makedefs.out
> -    sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
> +    sed -i 's:-fdebug-prefix-map[^ ]*::g; s:--sysroot=${STAGING_DIR_TARGET}::g' ${D}/etc/postfix/makedefs.out
>  }
>
>  NATIVE_INSTALL_WORKS = "1"

While I can't test the patch right now I see an offending line ^
NATIVE_INSTALL_WORKS is deprecated.

This layer appartently has not been fixed back then.

Cheers

Andrea

> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

