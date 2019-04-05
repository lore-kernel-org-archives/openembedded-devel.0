Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2317D5ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 22:36:24 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id p20so9248055qtc.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 15:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zNc+NzyuLMhI/cUr4Udexc5jx57FtEXc4/1l+Y0aeWE=;
	b=eQs+EVO2E4e1VX6svAJVxiY4zbDTIS46r7YTBvXHxMa712E/a9lRefksJUmufkRuT4
	lMskLkibdRox0LlizDn5QsIUXMk9+r9bQCUOLiIHYpDlFLzV34s6s0YNERf+h8j41Kcw
	93Dn1alJjVh0RogBXq5CL1m2FCneipT4lq8BtbxnUD4zRZ42KRJwC5APD1PRjZseXTSS
	xobEfA537wnikgA+NZZeE9e43F/XvaHclPU4PaB0qs1zFow6Wbokm42muv0WoPsFPrd2
	M2AlWugo81M1kwVucOxNTk1H5OB9ag+oCOfyjDC+cM8k00bqcVaA25D6fKykZYiO7pNp
	C3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zNc+NzyuLMhI/cUr4Udexc5jx57FtEXc4/1l+Y0aeWE=;
	b=B/uFdcguMgcZ+NTNPNmbuiHdjRwPEU/oUrVRj8M33zsEbxHpjXOsghOzmBluOwr23n
	/2dz8FXDVbzbRzI9fmBUnUhJXO1fXebm9xR9DX1/GEZg9fnoY9hcp7WYMJl64SaCqF6t
	EMDi5X9j6H0ggjm+yygf6OkCoBJg3fVz/NYf4J4gCcfvUPAEvd3oRGGOh0QeBGaefvWp
	5VsOY0zU2YtG1dimbzscNSXPDO5DJi4asKLF/OPRghiCREQlX4U4w/NgVVW6uNSBqS2c
	WayiLtkr+ccEQCy5xKT+IIfXtIlxVNFd7UF0AO6A8YCThjZJQ3zPHoxLEYCxf+UXgHDY
	aDgg==
X-Gm-Message-State: APjAAAU/2880L+NklKoCtefuFudDwZ1mJnVpZfK/s3FzXTSt2a0s8NFk
	FpcF6bYDac9HvPAVynVZ415pR3hJzidZ5IL/Agc=
X-Google-Smtp-Source: APXvYqzilO6O3ckpTzh+VYI/P3RkhbesN2htboXnOD322H5bpQ3T+w+JSeStB84KXsuAq9iscVFAVPKibxg20CuhURo=
X-Received: by 2002:a0c:d0f8:: with SMTP id b53mr12446575qvh.46.1554503784884; 
	Fri, 05 Apr 2019 15:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190405213513.6857-1-joe.slater@windriver.com>
In-Reply-To: <20190405213513.6857-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2019 15:35:58 -0700
Message-ID: <CAMKF1sq0fPa1SKtsoKU+08P_dhJKWJVZsfk4FSDyP-5vviYYdA@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@yoctoproject.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-virt][m-c-s][PATCH 1/1] libibverbs: do not try to build for arm 32 bit or any mips
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
X-List-Received-Date: Fri, 05 Apr 2019 22:36:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 5, 2019 at 2:36 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> arch.h does not contain macros for 32 bit arm or any mips arch.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-extended/libibverbs/libibverbs_1.2.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> index dd74522..2becf35 100644
> --- a/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> +++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> @@ -29,3 +29,7 @@ do_install_append() {
>
>  PROVIDES = "virtual/libibverbs"
>  RPROVIDES_${PN} = "virtual/libibverbs"
> +
> +# We can build for arm64

this comment will be confusing. Lets remove it.

> +COMPATIBLE_HOST_mipsarch = "none"
> +COMPATIBLE_HOST_arm = "none"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

