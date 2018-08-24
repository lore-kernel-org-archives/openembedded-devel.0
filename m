Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AE56279493
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 08:12:42 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z78-v6so5364376qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 01:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o1rBaffnqtcOo3zREagMPABZ/SVY0Lk7XO3FD4mnde0=;
	b=UuHuuFZIy0mTbwnGM7+eWq3mQTVSfvzc6xzlxUh3AidMEXwzTiIhzeHbUboRe1gRhF
	Wxnti7FjW18dmK9/E8iEJyZISmRb2k4XpSxkAIBwQahypvcmsWcjefjznCJKHbwg2+am
	zqALNVRGKo9ttBPC6qN51jbI1dBp0DuIK0fekLM8lZA82ZLkJW2LiH1j+UceQGwiwgyN
	hOLfyrz3SDxznRC6MZ0ZA7djt5XIHm+wd8olFNiAU5qAQSH3jdJrTkguxi7HWbBnOjX0
	JNCnaajPVPeDRzRq9rBgtsVg6qQcJ4B0uAkZIoVFPY7J/lmljdg5uOGCnCJ1JCMuM0lN
	GgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o1rBaffnqtcOo3zREagMPABZ/SVY0Lk7XO3FD4mnde0=;
	b=KOzK9UviKli6abafi38F1xktj3MsSwEhesQIyEhqoGFUqCpL6Olrep3VrpL7HJGJsH
	LWOlc+CamLwTfB4wPDd9ACM9nOajk4MyM7db8dKk+EDvsxtH46mvwc95+PbjKUbgx18g
	YxbcAceqoNj7gzYzxBtG8sU65COCLtEEFVxAyroPCCFod2xL8fDE86U938EyH/lao5Q4
	m+9dNyBGhGWQIAz2BB/p9bxokgPph9OFtuWyvYZ3rK51C3g2Ck6vgLCH6G8OhxdA1cMk
	vogCk7VJW1DilcgO3qUHIcO/wbYXrLmCUgtX7i/PqTAUUQIrqg14BBHuCwPyAUIKHjpt
	MlTA==
X-Gm-Message-State: APzg51B3rj/OVlwgUtlN3JGdQUq6RLkMtnLGN+Yiyuh1zBNjwlwGEZhD
	kFlmiHkyTy3/ZduHVAumq2eTBnh7SsSVV5964VE=
X-Google-Smtp-Source: ANB0VdaZ6ewDgcqbF1KrHYj2MbW9egeWBemZ+RL9p1RoYjuiMQ2/LwqV3WbTcQOmT2B90T5hNStrZ0ZcJbYaYrdHBZg=
X-Received: by 2002:a37:1115:: with SMTP id
	b21-v6mr599755qkh.206.1535098363446; 
	Fri, 24 Aug 2018 01:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <1535024421-10058-1-git-send-email-kuo-lang.tseng@intel.com>
In-Reply-To: <1535024421-10058-1-git-send-email-kuo-lang.tseng@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 01:12:17 -0700
Message-ID: <CAMKF1soraLLWVhx+tk3fB8dv1gB7yarS8vqJMum8Vkg7C+XiHQ@mail.gmail.com>
To: kuo-lang.tseng@intel.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] turbostat: upgrade to 18.07.27
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
X-List-Received-Date: Fri, 24 Aug 2018 08:12:42 -0000
Content-Type: text/plain; charset="UTF-8"

it does not seem to build see
http://errors.yoctoproject.org/Errors/Details/187118/
On Thu, Aug 23, 2018 at 11:44 AM Kuo-Lang Tseng
<kuo-lang.tseng@intel.com> wrote:
>
> Update the license hash value also since SPDX header has been
> inserted to kernel COPYING file since v4.17.
>
> Signed-off-by: Kuo-Lang Tseng <kuo-lang.tseng@intel.com>
>
> v2: add meta-oe prefix to subject line
> ---
>  .../turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb}               | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb} (96%)
>
> diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> similarity index 96%
> rename from meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> rename to meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> index 3559417..5e64efa 100644
> --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> +++ b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> @@ -12,7 +12,7 @@ processor frequency and idle power saving state residency on supported \
>  processors."
>
>  LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>
>  COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
>  COMPATIBLE_HOST_libc-musl = "null"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

