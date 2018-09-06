Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id BCA3C79645
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 14:23:02 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id t39-v6so12412817qtc.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 07:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dnX7AMle47Rnaj3vZvePzJ8VaI5d7OCFSTkHfKX0ARM=;
	b=HJPibbYLl3uHPK19USJwyIh4ulGmLtKP+zG7O5fJjDsLwumGUv6zgUJL549UZHYRHQ
	I1DNXntJI2gpmBSP0sl5JzUBoa1ljKJV8j18cPNT2iMs1ur22k29gMjfCVedkJJ9iUh3
	yrDYi+ylH8SPji5p34p103liLcZDae6X3lHafzr9QS5xavfjCLhAl6md9ZNgfX7xwBeW
	AK2LHROyN2ndTp7c8PC7j+DVO92NXsqbuvCNbgrczRZ4i1lyZJiZtYLPxEMo9QqcCWem
	iarlJdggyEhYlaN71VyZmHSbvq7gGbF88Jd86eqo08m7ZDyAio4qL0ILeR+OzahmRpgp
	XA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dnX7AMle47Rnaj3vZvePzJ8VaI5d7OCFSTkHfKX0ARM=;
	b=qABaM5CiI6UnbYorlY53ryKdUcRJ8ob7+MGfmg/3UQvr3rs9O6V6l9Dap2jnsbB+92
	wwmrU3419aMq7W/0Bty279igmfiWmJ18FZGTj9Ue28gfek/1ZCmz/fc/VSIa+66J4qyy
	L6iCnSIaDgLmSqZJFB7nSJcBduIzVgSnlNAfc9tbTtspFy/ttN50MUD3/b3pCuUU0TIA
	/DQJ12VUewjz4RnqZyY5v57wmmvasclbxGOq08Zz7xGkR0Th9fanNm6g+VixuXP8K5ES
	maQyun565u/Re3NSap1cIFIwAMMs/qrCJfXRMBsbIUV0SLXpyt/eL8cNwPSpYV3uJR6f
	Dfnw==
X-Gm-Message-State: APzg51Dka6zs+opOTWCeTdm1rqR8rPb6mu/9PH9JZQnRpD19dl8OpiFM
	z37kfZGuRieSCn6tGwcJW0VHFNWjx1ETXJLlxAzV1RoY
X-Google-Smtp-Source: ANB0Vda1Eq/hdD1ync9rpy26rpsCBcK+IlAUBA/cdWXWQ9MuoPfS7hpjWe+YFx1tQsLcVW9VcpipJ0IYbEvaF/4SGEo=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr2278464qte.218.1536243783351; 
	Thu, 06 Sep 2018 07:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20180906034847.53858-1-timothy.t.orling@linux.intel.com>
In-Reply-To: <20180906034847.53858-1-timothy.t.orling@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Sep 2018 07:22:37 -0700
Message-ID: <CAMKF1spq7BjF9d1SqkmewrWM0wFqjnALe8XCO7i-AxvAVuOyOQ@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cpuid: upgrade 20170122 -> 20180519
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
X-List-Received-Date: Thu, 06 Sep 2018 14:23:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 8:49 PM Tim Orling
<timothy.t.orling@linux.intel.com> wrote:
>
> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> ---
>  .../recipes-devtools/cpuid/{cpuid_20170122.bb => cpuid_20180519.bb}   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/cpuid/{cpuid_20170122.bb => cpuid_20180519.bb} (86%)
>
> diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
> similarity index 86%
> rename from meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
> rename to meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
> index 5dd1bdd4ee..4b07e2193a 100644
> --- a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
> +++ b/meta-oe/recipes-devtools/cpuid/cpuid_20180519.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
>             file://0001-Fix-Add-sys-sysmacros.h-to-fix-build-issue.patch"
> -SRC_URI[md5sum] = "1c46a6662626c5a6eaca626f23a5a7d7"
> -SRC_URI[sha256sum] = "667612aae6704341dd10844e97c84c5c5c8700817a5937a3c293b55013bc4865"
> +SRC_URI[md5sum] = "b3b4e44ef49575043a91def0207dcc76"
> +SRC_URI[sha256sum] = "967823be36f23cbc972eb0aa882d069c1d155a5978990ac3bcf425e6a2e7ff9a"
>

fails to patch
http://errors.yoctoproject.org/Errors/Details/191375/

>  COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
>
> --
> 2.14.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

