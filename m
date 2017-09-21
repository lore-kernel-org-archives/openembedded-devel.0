Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1DDC97820F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 18:32:32 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e64so5970385wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 11:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W/SVVFPx4BTo/zbGePvM+is41mYrDfbI7CSjiSFBUF0=;
	b=ifD4iKu+sTlM1O5GfuED8U1UwqNproMYXZHS9kn4BXpMqU4HfGLyFBdBKJ4KOe7PmM
	6maYE5AgShnJhFd6+ZgUYcc+2pOW6zbexCF9h6g05EEAOMtyEQUsGldJTkhWEIFl7Wd6
	riTXp48VcFdgmeUJMKD5mpvEIgsxVvY17mG3Z/ESP0Zzfr2OBCsA5H+JfFvGAk6qEAXh
	zNYdBxIicoi0K9oL2aeVi8HI3WASi9/kk3b9Hg9Y9BY72NcCbeErw0fs8oNlgtvzctjJ
	DERekVh+2y051bwDAv9g61hg6/I8ASq/xZwCIy5WNDILne3wf8cfk6nYhG5EQxYJYKF3
	8QgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W/SVVFPx4BTo/zbGePvM+is41mYrDfbI7CSjiSFBUF0=;
	b=k22Hu9z3T5dqyoPIP1MRpJn9B9wf6D6hyrOP3VzC59HVFzvX3nzgI6ARqTT4mqYq3G
	FgH82byybzeVbGp6gdD0CIk2m0+OFvVUck5mv8LPI5B6pYN7Qx93gxTeS7ZAlpbC5D+4
	1OlsNJcRNhsPIlNbZzSmS8EaUxew8m0IE7onYUrX4a03vX1yvWa9ErSdLipkbydJ5KBb
	YuRhcfJ9sh9osZ6WR76ePIUSEymJ6rPFE3zWTHwAzNYOjD6ogolhXVyspAhPUvrnrnaW
	7/LZ72FoPs1W5K4b9tPlDVTkhM0hv7f2CZSAzS0kEFDua9hdvWgFWFWgUnVElrbM8SNl
	S36Q==
X-Gm-Message-State: AHPjjUgg8G1Anxvjk6DtXPwI5dbsVElrdOKVBbBgkrdqq/aVGL+ufLvO
	FBzIpHllDfR4STwlaXdQtgqqMtQdvyFVIfa4i6A=
X-Google-Smtp-Source: AOwi7QBnAhpl0xIvyx4daBt6E0pZyQyYg3PCAujfkTvks/Aj6nS9HceAqkF2N7aElpVSN9Kf+nSyzhcxUueCn/nKNNY=
X-Received: by 10.28.128.19 with SMTP id b19mr1743807wmd.136.1506018753740;
	Thu, 21 Sep 2017 11:32:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Thu, 21 Sep 2017 11:32:33 -0700 (PDT)
In-Reply-To: <1505995283-14453-1-git-send-email-pascal.bach@siemens.com>
References: <1505995283-14453-1-git-send-email-pascal.bach@siemens.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 21 Sep 2017 11:32:33 -0700
Message-ID: <CAJ86T=WM_gReqwOCpznqzSkkGzeFtA7W72OYQzSyEGzWSyVm0Q@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] luajit: create developer symlinks
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
X-List-Received-Date: Thu, 21 Sep 2017 18:32:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 21, 2017 at 5:01 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> LuaJIT tries to call ldconfig during installation which doesn't work.

Presumably this stopped working recently (since host tools now need to
be whitelisted and ldconfig is not included in HOSTTOOLS)? If so,
maybe mention that in the commit message.

> This causes the .so and .so.2 symlinks to no be created.
>
> By setting "LDCONFIG= :" the call will be skipped the same as on Darwin
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> index d7477ed..1e06e34 100644
> --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> +++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> @@ -52,6 +52,7 @@ EXTRA_OEMAKE = "\
>      \
>      'PREFIX=${prefix}' \
>      'MULTILIB=${baselib}' \
> +    'LDCONFIG= :' \
>  "
>
>  do_compile () {
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

