Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7F68377809
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 19:03:57 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id c195so245501itb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 12:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JGrfxfa2FR6c3SarK/+ih8Om8e+O5uqXmSAKMsYaHEc=;
	b=eih4GTDUjJjsjPUId7VXwHXuuVf6vlNcBUFF/RimCwuufXZo99oL1A5jzLb0RBFSy3
	SVVyEiDD4D9syuNUNY30CfsLNxsl9mKZ8ZvQ0jUN3gVAcDycnpvhmLd3bSiZmxTujlGc
	XFr3AbTRpjLeDc/bgrLE1rg3nx9Hsc9dfTKpYiiJYXDdfuBp1PsZBh7JNEhLkTLrJbiQ
	QwjboLWIoY+36Tdb5Wat87eWDLU65XabE9ylUXn5WpU2NgTZEqdB2Gkv3HE8AhTjuNBN
	23GYJi5ihWT6W3ywBNyhI3kBo9wBEcjLW9Vi/Oon1MXZRB6xIOovpOYbBhZrxdrrQDMZ
	rjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JGrfxfa2FR6c3SarK/+ih8Om8e+O5uqXmSAKMsYaHEc=;
	b=d9QOJMg26ReuT15g9gUu06KCoKDyAxENksrpATue8u/1hEBl7FGh7QymrQWW7aeUxc
	lDngDY4b0KLUEFrn+iwhrWBSyz5Tdj5fG6v39memrsKXF0L3ox0ftijSMN+DLLkeXLhx
	kZtaUHjhUupquinHV9qC+aoZ0sWmWagcPqOEdSxtOU4oUCSpktmDMkvcF4edDuEs6+Ut
	HqmDegsiokyCwVrkPmgK7QaSSmyNMs2bseI4F+XxU7O2tQ8DYgJJFZW/mhiJjXRShF8P
	OaX2BLGGcAMMVnJbi0/LYgx5xHe5PMWDt0uSMjcE6ZkZ6kdelBGQmeXGPG0MoW+EjHAv
	zurQ==
X-Gm-Message-State: AHPjjUhTAMw6GH+Bz0rBhL2QNaB/hSIhc7RR+5gVFTed7E0PapZKR+/Z
	RnNpd9cwFFWYfIAxocsu2huVeRvzjZhSvvcd/kN9BA==
X-Google-Smtp-Source: AOwi7QD6Gtcl+fxNAtPdUo1NFj61MmYbvhYRxMviJsIKWuvt34vWibFWzWIrtJN9En0NpwrZYWW5CLYNUq1Y8Zh27Zs=
X-Received: by 10.36.162.67 with SMTP id o3mr2205524iti.27.1506366238436; Mon,
	25 Sep 2017 12:03:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 25 Sep 2017 12:03:37 -0700 (PDT)
In-Reply-To: <1506364685-32767-1-git-send-email-shantanu@senic.com>
References: <1506364685-32767-1-git-send-email-shantanu@senic.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Sep 2017 20:03:37 +0100
Message-ID: <CAJTo0Lb7HYKLTDsToYQAgFGw-+K4NEFm0wCrTgTc46tHLEAT_g@mail.gmail.com>
To: baali <shantanu@senic.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	baali <baali@muse-amuse.in>
Subject: Re: [PATCH] curl: option to enable http2 protocol support.
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
X-List-Received-Date: Mon, 25 Sep 2017 19:03:57 -0000
Content-Type: text/plain; charset="UTF-8"

On 25 September 2017 at 19:38, baali <shantanu@senic.com> wrote:

> From: baali <baali@muse-amuse.in>
>
> With default --without-nghttp2 flag set there was no way to get
> http2 protocol support using nghttp2 library. Instead moved it to
> PACKAGECONFIG options


Wrong list: oe-core patches go to openembedded-core@ instead of -devel@.


> +PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2"


The configure.ac then checks for the libnghttp2 library which isn't listed
as a build dependency, so you'll need to add this here.

Ross

