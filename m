Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id D689A7FA33
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 15:24:35 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id z3so1076664qvn.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 07:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EZShJhc0FCXviAnizl/ANLVik2mJiqluftwZ9IuLReM=;
	b=fCBBARzg5KEsYaYoZKVPd+3041y7RSmd6TbuhiXAIF8s9NC32BJxxp3sGSPS78brR1
	GT6yu9oBGbJQB7fQWP9y+fJgLewqkynoi3eBOJVdpj/ak4GPJZ3Aoi/Ka+B2SRhm4yV9
	3EiT1PvEhLoXEPP1EeeZk2ey3uv4r3NTA5J0sUp+KOKtL6lQIhspcUj0mBsSGI6hIA+K
	PmXmzDyEM76Qq/KkPo7a58HoJv0FhM1SalXwdqor57C50ysXL49sVp9wWGYfvzhHvEvN
	Iyb7Ud0C4185LwNtPqkhVUTrboI8jiBEAtM6egn0IftSo1K0laJT/Wu8xdaGkvBcFOBI
	j50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EZShJhc0FCXviAnizl/ANLVik2mJiqluftwZ9IuLReM=;
	b=s1fUH4rB8Fa9jY5neWc3XzQ/8+NvMvj5NYulKBIBLZmtdYllcV+VTlPB9Xkw0DOWCL
	o+JjCAjvvSmI7kcaCYUJydNJ7zF+FG6uzYTwumFASfNRFrGXwL+/GKYppmWCFJ+EZCMK
	1UGVmNkglnNSIF1LPSl5TYMKD5nG+owUTcVerZNLFK9Ezf+Skztxfhf2zc8uKuRfR72f
	WNX4FGDFdIbpctXkjnwqxl+brGxdRT2aU5n48ezo9IcVPQvCPPdpZc7vWDYGm0TFjQUp
	HP2/gZn0QKcIGF0w+X+08k6BmtHUE5xONRErzc+Czxb9CG8rGVr6ywFz/4zLawRLpSr3
	r7xA==
X-Gm-Message-State: APjAAAWuNFzjmnwxXZ6pQY+cGwAAmdq90L9jg0YQpY080H898Bf8G51+
	hfGwSwbN+coUK0dL3KB5hzBJEIkylD2fs5s9biE=
X-Google-Smtp-Source: APXvYqxGIbVDOZWpWPTAXWfsDMfGERRyX3FqRSMn9BhkuP6I872fRCvb9eITnHYD+T0rzhhRNExmj12cx5jJZO5JrXc=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr17266926qvm.206.1575732276298;
	Sat, 07 Dec 2019 07:24:36 -0800 (PST)
MIME-Version: 1.0
References: <1575723834-22763-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1575723834-22763-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Dec 2019 07:24:09 -0800
Message-ID: <CAMKF1sphbUBWh3BTpoYcCyzH05dhm8yP+oOsh-wCdDAqXx7wpA@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Agner <stefan.agner@toradex.com>, simon.bueler@toradex.com
Subject: Re: [meta-oe] [PATCH] ostree: introduce OSTREE_PULL_TRANSPORT
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
X-List-Received-Date: Sat, 07 Dec 2019 15:24:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 7, 2019 at 5:04 AM <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <liu.ming50@gmail.com>
>
> It could be soup or curl, for convenience to be overridden by other
> meta layers, like in meta-updater, it is choosing curl as the pull
> transport.
>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> index 4f437f3..c3e3a12 100644
> --- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> +++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
> @@ -43,6 +43,11 @@ S = "${WORKDIR}/git"
>
>  inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconfig ptest-gnome systemd
>
> +# Value: soup or curl
> +# We include soup because ostree can't (currently) be built without
> +# soup or curl - https://github.com/ostreedev/ostree/issues/1897
> +OSTREE_PULL_TRANSPORT ??= "soup"

are these options exclusive? then we need a check as well to ensure
both are not used

> +
>  # Package configuration - match ostree defaults, but without rofiles-fuse
>  # otherwise we introduce a dependendency on meta-filesystems
>  #
> @@ -50,15 +55,13 @@ inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconf
>  PACKAGECONFIG ??= " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
> -    soup \
> +    ${OSTREE_PULL_TRANSPORT} \
>  "
>
> -# We include soup because ostree can't (currently) be built without
> -# soup or curl - https://github.com/ostreedev/ostree/issues/1897
>  PACKAGECONFIG_class-native ??= " \
>      ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
>      builtin-grub2-mkconfig \
> -    soup \
> +    ${OSTREE_PULL_TRANSPORT} \
>  "
>
>  PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

