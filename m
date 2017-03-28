Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id D42B66AC37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:06:46 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id l43so111865513wre.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 11:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ztMHNAKQ2V2m0NHXZSQ3PLtxMhHWuPKxF1z/J8aJ9CQ=;
	b=bM0qnNVCVO64I6dMfeqzfZ4ldR4iB2rolgtutdgdJIsAX7eBoN18zGct41KtjfZPv1
	K7FkrGvXkjCuSJAMVgNgNV68p1/dmkJTaemqkQYfcgcMTzWWaPEiNxD+4wRWZ/q+RlcN
	fJ7J3jODEDS/1GJ8PSQ9AcZbH+2iZ8rY8UT1o++eDoV5CKwYGh5lZPx9LQyGiw1UjLKo
	/ERvIZ/BM1G+LjUT4AaVf3iwZ9SIiJzNbuVz4U/S+uPtA0aj8b8H0g+bCXEbNEvuErsf
	pyE4ka9T2lDKRk3uKQyBa8VdJZ9gqA8KF+IZE/hG9iLqufA2wgyC5F7LjC2MeQmzYRbC
	D8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ztMHNAKQ2V2m0NHXZSQ3PLtxMhHWuPKxF1z/J8aJ9CQ=;
	b=GOt2yOYye4e3Cg4Vvcee2gNKrJljmW4XrwJpPLuPegy+uTPkqKy5V2MsKZTEWWuQRS
	YXQTLN5bgt/0lefcIkwGc+MoxNMMKFk1qfQhzuTU6F0d5zPIOabnciCUpig4ysW1+cT+
	WRQsLzzj3GAoxSNcCX/kjjEGpqqwGj7piC4gDGCw0sQ94DZqYzn6GD+D3uscZeCkM8V9
	jbGBtWM9A78ShgzpGr7vPbpHYDyKLMBQZMtcSFHFaPat8RqP1J4IypIeXyqbzkrGiNKS
	04tOWnpTDFEKhhlxV1CkplkltfOZ/CBxUOfLtrwJfkpGk7Q54Tez9i5cTpIEw7/oaD+z
	uMSg==
X-Gm-Message-State: AFeK/H1aoFuMVix6xhp1wB6hDh5QWfo826XINGMsWnll11IaYtiZPrJ6GwXonC02igNO2ZcEJRNxrb1ceOkpmQ==
X-Received: by 10.223.152.243 with SMTP id w106mr5438143wrb.151.1490724407450; 
	Tue, 28 Mar 2017 11:06:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.152.55 with HTTP; Tue, 28 Mar 2017 11:06:46 -0700 (PDT)
In-Reply-To: <1490372204-4336-1-git-send-email-cody@arrc.ou.edu>
References: <1490372204-4336-1-git-send-email-cody@arrc.ou.edu>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 28 Mar 2017 11:06:46 -0700
Message-ID: <CAJ86T=U6Xyrh2D4xYizX6Ly7b=6gg+Wxid1VkB60_0idG=RBwg@mail.gmail.com>
To: Cody Piersall <cody@arrc.ou.edu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-OE] Remove do_install_append() from zsh recipe.
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
X-List-Received-Date: Tue, 28 Mar 2017 18:06:47 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 24, 2017 at 9:16 AM, Cody Piersall <cody@arrc.ou.edu> wrote:
> do_install_append() removes a lot of useful functionality from the zsh shell.

What exactly is this "useful functionality" ?

Maybe it could be put in a separate package.

> If a user requires this limited shell, they can add it in a bbappend file.
> ---
>  meta-oe/recipes-extended/zsh/zsh_5.0.5.bb | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
> index 39b2d95..d5bb1b7 100644
> --- a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
> +++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
> @@ -44,10 +44,6 @@ do_configure () {
>      oe_runconf
>  }
>
> -do_install_append () {
> -    rm -fr ${D}/usr/share
> -}
> -
>  pkg_postinst_${PN} () {
>      touch $D${sysconfdir}/shells
>      grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >> $D${sysconfdir}/shells
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

