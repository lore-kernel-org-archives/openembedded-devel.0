Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 701A87D6B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 14:52:28 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v13so9146574ljk.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=73SmAeng89GxXFNzti3fnkaTHTpvuOzDzW2/g7OyBBI=;
	b=f5z+ClAAzFLRQZAUtqVGls/6cBbcJmxiuz0+pjikQwmDqGQ+nQa4ewqSjTFY6H8UhD
	3tpkUgniUuuIUn/S03VcXTyma8U9GVuPKQ51pynyfukZ2BaMjg0RcVWhsaZohEiJ9XSV
	6e3dBmeU8umH2Ss4PbfhDSOtbZuC6+6YM5MDWmEva7b/W4OyZt3Gtn1uqPDXozI5EgJq
	RplD0HXYoVVKWsoQ6ATIlIU1Jq7mq9dl7vh0RY1FRC0sthFqF9y8+Tn3wnM2wDMUrnR7
	E3IjNSs4s778CzF0v5Tmj8Yruwz4mEN59iqQubAM38aqkDTAR0UgAwVZE/Ag0EkCdq5w
	vXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=73SmAeng89GxXFNzti3fnkaTHTpvuOzDzW2/g7OyBBI=;
	b=Iiz6CH6aqCoUjdlsjdmHetbeKcIGc6mflpwDTt/M3gQaD7m5QiccFuuKbnSSv9BEnI
	1fMO4kAIbl8UmSvfBFSgsJyr9iOXgj+FdQtmqDzJ7eHhrx9zB0xp0pzwX7v9i5K/Mxe7
	L9Bn7LJTQpZUzcWx00eQcPz4VLo/ByedJPA4oMOenkO8riTB8XhfhDkTK+1rBUa09SY0
	wBXERsPEDQiann5cie7G1appR/1ZC/6EGmBIlanS88NxvLTDJDKAWoFs8agl1s5smdW2
	jeBxidrfUI7iE9ofkVSSGottAZPjcst2ue2OxyvTdgVe/w8exUONwFvmoUIczGiF/66+
	qrtA==
X-Gm-Message-State: APjAAAXo53A51mW3uPF3fFfhg4UziMUI93Vd5AO5/wJaS75gfSJigFqF
	sI3mX3IL1P+j6yYBVZ7Mzfo8SS/HPI+bkDhlgQw=
X-Google-Smtp-Source: APXvYqyC796yzm/7Qou7sqIjh/XWWMQUU8KjRsWYdqxbjH+twNVKv1GYG/VvxJK5tAf4k0RrcopfhWWuitKTXOho//Y=
X-Received: by 2002:a2e:1311:: with SMTP id 17mr19508020ljt.75.1555080748859; 
	Fri, 12 Apr 2019 07:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190408212312.86791-1-joe.slater@windriver.com>
In-Reply-To: <20190408212312.86791-1-joe.slater@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Apr 2019 10:52:17 -0400
Message-ID: <CADkTA4Mdw2ii0mMm1fJnTSwXT8pHN0e7wCv4W_XeicofxegiWg@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@yoctoproject.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-virtualization] [meta-virt][m-c-s][v2][PATCH 1/1] libibverbs: do not try to build for arm 32 bit or any mips
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
X-List-Received-Date: Fri, 12 Apr 2019 14:52:28 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Joe.

v2 is now merged.

Bruce

On Mon, Apr 8, 2019 at 5:23 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> arch.h does not contain macros for 32 bit arm or any mips arch.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-extended/libibverbs/libibverbs_1.2.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-extended/libibverbs/libibverbs_1.2.1.bb b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> index dd74522..fa7eee6 100644
> --- a/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> +++ b/recipes-extended/libibverbs/libibverbs_1.2.1.bb
> @@ -29,3 +29,6 @@ do_install_append() {
>
>  PROVIDES = "virtual/libibverbs"
>  RPROVIDES_${PN} = "virtual/libibverbs"
> +
> +COMPATIBLE_HOST_mipsarch = "none"
> +COMPATIBLE_HOST_arm = "none"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

