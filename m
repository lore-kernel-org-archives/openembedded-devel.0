Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id CAA7878F62
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 15:22:44 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id b77-v6so14610930vkb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qLBMoZP03+Lmjm5cM4uJNfzDQewLC9viTdIaKGomyus=;
	b=JL7Dez5zdOXTgXlvIqueY7w8qSfN99dLBoo7UaPPpb14WPXsbHzDfcEZxhDDtU1nTk
	CTyRfglroAxzS4rHS0evinNkA9QpVxUpsBmQ/xlIgwDLhm8bOORYey6FurNuAoiiqdJu
	ocaEAEZPZpvmt0BsWxiX2QhN+BkMjfWFmYBIcIuROyneSoYljYCTGn4YpW1Qb0qaqimB
	r8KorZPD6bAyk+8kUIwVxdrJLeNrKAoc11T1r9WcIJbgFTgyxADmdTqd3iCWr7e+TPNb
	dHNMwYgYif4FxF0EooIOGZXbHRhQA2aSLPE40IH3vxcYHOSuJ++rrZBI1QRZc+jqeFPV
	R6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qLBMoZP03+Lmjm5cM4uJNfzDQewLC9viTdIaKGomyus=;
	b=CENTnx5VK4dbkuFTctQiDDTtJZ6QemxybSFoQhjVpXvhlp6TdvQpjgM7Gkuhx5xVJ2
	1MRJjV5BPpnLTgfou4ElEEy7CSqCgfaYoPYcXN5+qGwAr/jcfr6MYqUS8x3eghBBkohI
	XWJsBZkCEQYnzM1Zk75dJ2c0Hw9H24yiph73F626PL73CVwbNqKMt3vYpCzjFGCG1U38
	CkphpJU5JXiZ0Z131JowE9pQ9JBtur2pey4cqmJYMjxawiyjWXnbTaUSo02CUo/jvIeY
	oYHPWtgXF4R0gu50TVKiVsS7fzOm30QrPDyF7Vt1Lqo9pERXz6+kWcHVYobA/9S72YEj
	g4bA==
X-Gm-Message-State: APt69E1EM3YfiChFc+5nITBn9Nvn5IOTENp5sxX3L0Ivcu9E5P5yTERs
	/JTwkYaLpSiwg9xjmdUSwbIKp4kbGd7QznwSFzc=
X-Google-Smtp-Source: ADUXVKJ0iSZGI3GOxh7zrRphuE+d4IO9MSwul6v4tN/q4oEpqTb6VlKXid8IojrsDm1boOagYmEVd6tymtyJfvMRU+w=
X-Received: by 2002:a1f:4b86:: with SMTP id
	y128-v6mr548919vka.146.1528816965388; 
	Tue, 12 Jun 2018 08:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180610012354.12172-1-dev@sashko.rv.ua>
In-Reply-To: <20180610012354.12172-1-dev@sashko.rv.ua>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jun 2018 08:22:28 -0700
Message-ID: <CAMKF1spf_Ja6Xhc5Kq-=wrx-LWM7UA00bwmCN6OHac-iKV2NHQ@mail.gmail.com>
To: open.source@oleksandr-kravchuk.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@sashko.rv.ua
Subject: Re: [meta-oe][PATCH] mercurial: upgrade to 4.6.1
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
X-List-Received-Date: Tue, 12 Jun 2018 15:22:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 9, 2018 at 6:24 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <dev@sashko.rv.ua>
> ---
>  .../mercurial/{mercurial_4.4.bb => mercurial_4.6.1.bb}       | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/mercurial/{mercurial_4.4.bb => mercurial_4.6.1.bb} (79%)
>
> diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb b/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
> similarity index 79%
> rename from meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb
> rename to meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
> index 90524974b..7e0df2e66 100644
> --- a/meta-oe/recipes-devtools/mercurial/mercurial_4.4.bb
> +++ b/meta-oe/recipes-devtools/mercurial/mercurial_4.6.1.bb
> @@ -10,8 +10,9 @@ RDEPENDS_${PN} = "python python-modules"
>  inherit python-dir
>
>  SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
> -SRC_URI[md5sum] = "c1d9fad1b7ed7077b0d4ae82e71154db"
> -SRC_URI[sha256sum] = "234af4a67565c85923b0a1910c704ab44bcf12f69b85532687208776563d87de"
> +SRC_URI = "https://www.mercurial-scm.org/release/mercurial-4.6.1.tar.gz'."

this line is duplicated. Its going to cause issues now since we have
two entries for main tarball in SRC_URI

> +SRC_URI[md5sum] = "f9b2e4a3b5901ef744fa3abe4196e97e"
> +SRC_URI[sha256sum] = "89fa8ecbc8aa6e48e98f9803a1683ba91367124295dba2407b28c34ca621108d"
>
>  S = "${WORKDIR}/mercurial-${PV}"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

