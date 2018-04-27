Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D2DBA65D48
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2018 14:08:22 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id z9so1580991pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2018 07:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9KRbDIOKTM4Adg1G0Ja5xDnY5khgW0dsI3xpqa+ajMo=;
	b=dl3PY9RYrITkLhUS9+9IGSDGvKxKV56x996Si59lHWQsZCjxpfvD5SkZRUx8xbWjlZ
	IqJbThxF3Ypr7ZhMQZL4xxvu7KeXk9AhJq8cxnZ9RQMa4dchQsSid7uV+zJDq0jengiO
	qN1aMDeVJBoYa3jwW0GWjSTYpR5C54u9k77hPxfokvz6FW0Kh5s+6Fzd7XYx2m+ELdEW
	jFvwwD1B5/23lHbn8a3eMOYX5WY7LY2uiOT5hJE4WtlEf2JFx07Zoy1d3Rlk/lRKVhCX
	P3BvS1K2NWEahSLoYZCqR/OUeyFR7aG4IWE1XypSBLGofxHJBzY3LFt9YJibz1p6mZR+
	gSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9KRbDIOKTM4Adg1G0Ja5xDnY5khgW0dsI3xpqa+ajMo=;
	b=VCfjLi9y1n+w27fUgDaN4tPOdk2KKCoLBBVSNsRFiTH2qx6eWbhrZTdA0Y7fUSI3Os
	x9eoX9GeHiP9Pdj3fTEv/5wTxRpBad6zyrDFfrJayTYBKP2JX8g7dSqMcUCC6SNv8QdW
	y7EpyWRofJcWnRxP5KKffXNarOhWzwBWxhdkzrqTSs/QX3KRd4F4cdoInRlpvolDN8DF
	Jt1IiLmA+lbozwcbwkOlgi9eAKdZwbUfSukM1fxd9oIvMV6u2C9kX0J9fIXTNID7h92A
	RzBSWUBGYnzNJOZJbmHQrTsY+R+pzgqsyIxMYXxn/kHv7DHipM2C0Nu+sJAxkdE5DY0m
	LMjA==
X-Gm-Message-State: ALQs6tDLyt5AoLjqhzc+tuVcBg3yWQYKFezfUKONCsOHAz9lSrAgRugf
	3NG926qU0+7SJwY9J4wpuQKcDudfVU+81O6JKPc=
X-Google-Smtp-Source: AB8JxZogb7+c+OsaiNEsEUMkiUe+ojDe9gS9+zIVebMfUJsjk9DJRvRKvOQwKZSHIqk7NTrwV0Mw0xdRCqigAKGXi1Q=
X-Received: by 2002:a65:4b4a:: with SMTP id
	k10-v6mr2303496pgt.227.1524838103585; 
	Fri, 27 Apr 2018 07:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Apr 2018 14:08:13 +0000
Message-ID: <CAMKF1so20Yi_L1EjWgWs+vJRkc0he9UyeWtPM7GkjjLOP5aT6g@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/6] iscsitarget: Blacklist compile failed
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
X-List-Received-Date: Fri, 27 Apr 2018 14:08:22 -0000
Content-Type: text/plain; charset="UTF-8"

LGTM

On Wed, Apr 25, 2018 at 7:13 AM Armin Kuster <akuster808@gmail.com> wrote:

> Kernel header changes are causing this issues. iscsctarget has been
> dropping by other
> distros in favor of tgt.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>  | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git
> a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> index 6593661..5d13591 100644
> --- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
> svn502.bb
> @@ -60,3 +60,5 @@ FILES_${PN} += "${sbindir} \
>
>  RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
>  RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
> +
> +PNBLACKLIST[iscsitarget] = "error: implicit declaration of function
> 'init_timer'; did you mean 'init_timers'?; 4.15 kernel issues"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

