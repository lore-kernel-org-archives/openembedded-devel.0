Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id B4531784CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 06:50:49 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id e17so3955498ywa.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Mar 2018 23:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tsw6xaUR+lR2V6D5KNR7A5HGV/qp2AR9YlgGGEwDifM=;
	b=NsBoWzC+pRFYrWOPI2f8BSTzIne1TQ0OkZEDL/E+/y7EqLIdoCyJn3R3A2S/1cRZKI
	7AX7m3WYVP9btd3tb7ljTAaYfGjogCUK59K8koyoDknaIp9fqFd0oE2hwWZb1hgz2rKw
	kgzxlwMGTakPck5c/Oi7S/9HqSN68yyt969fkdv62h4Y/sEFZsco09gSDnFNJ+26Zv0m
	8fi9pI/fPAidBtVG0euyYTEcbL0fXJ+WvAzLHAX+P8CaJFs0zXcdGakoFcuGAdIwrNw6
	cn/hcr+1Y1m1gsamXopGUdxS5pIye5JXSgbThlQOIh51LBGVE6I0DItCzrKGnewo3RZu
	PBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tsw6xaUR+lR2V6D5KNR7A5HGV/qp2AR9YlgGGEwDifM=;
	b=nv4ge0MsGddCKpet0va4WqmQlCem4Igi/fwwu0O7D931CftfcV79R4nFAJxYNe0fvn
	dJaSZQjHmHw+0AHhuh1/hJm7MKZWZN9GEapVs8crFEsF93ZSLy13yvQ3O7b3mqDl/JCk
	IMpJubM9faPU7IKu9kl88c64n8TYDbG1g8HjXZ2oWpCd9K70ekkNDJ3zj4QScVwGnOBw
	VB3Vs8lO5hkGS6GODnY4tr40fdY8qkrcDTrgYhyTGbJ7L567+b78xNEWiPOq8anUL/mV
	ZzaOictCJboKoeBpm5p6Fcqohc+IwGwG5oJrTGq0vMeB/+6D84NsSuoq1l4lqFyA3UtK
	Z+JA==
X-Gm-Message-State: AElRT7F0EUBPEeUG7dKk4udAnD1jaaFZloYlt7daDZXBRUXVxpkiqAfc
	HyesdWvtDANx77sQOpPqTUOKZA6/+1Sb9z4/REA=
X-Google-Smtp-Source: AG47ELtmEORb8TByPwKj6JqxisuhAlhd1oYogTYqDKV/sexYTl3+rcmMrFOHq4bBORfV2v3gZ/TmZLocf4Z43ChahEQ=
X-Received: by 10.13.211.195 with SMTP id v186mr22635906ywd.163.1522047050776; 
	Sun, 25 Mar 2018 23:50:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Sun, 25 Mar 2018 23:50:50
	-0700 (PDT)
In-Reply-To: <20180325230452.40908-1-raj.khem@gmail.com>
References: <20180325230452.40908-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 26 Mar 2018 08:50:50 +0200
Message-ID: <CALbNGRTRsNOgr9AZD+cWeoUmfHKetXgQuGGd0r-yb_h_FU9RJA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] qtwebkit: Fix build on armv7ve (rpi)
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
X-List-Received-Date: Mon, 26 Mar 2018 06:50:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 26, 2018 at 1:04 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-qt/qt5/qtwebkit_git.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
> index b23d4d6..0f5cbbc 100644
> --- a/recipes-qt/qt5/qtwebkit_git.bb
> +++ b/recipes-qt/qt5/qtwebkit_git.bb
> @@ -18,6 +18,19 @@ DEPENDS += "qtbase qtdeclarative icu ruby-native sqlite3 glib-2.0 libxslt gperf-
>  ARM_INSTRUCTION_SET_armv4 = "arm"
>  ARM_INSTRUCTION_SET_armv5 = "arm"
>
> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
> +# https://bugs.webkit.org/show_bug.cgi?id=159880
> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
> +ARM_INSTRUCTION_SET_armv7a = "thumb"
> +ARM_INSTRUCTION_SET_armv7r = "thumb"
> +ARM_INSTRUCTION_SET_armv7ve = "thumb"
> +
> +# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> +# Segmentation fault
> +GI_DATA_ENABLED_armv7a = "False"
> +GI_DATA_ENABLED_armv7ve = "False"
> +
>  # Patches from https://github.com/meta-qt5/qtwebkit/commits/b5.10
>  # 5.10.meta-qt5.1
>  SRC_URI += "\
> --
> 2.16.2
>
Hmm strange - my builds for Rpi are fine. Are you sure that this is
not caused by musl in particular gi part?

Andreas

