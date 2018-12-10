Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4D6E16D2EA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2018 05:53:27 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d18so11028027qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Dec 2018 21:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D0p8fz0qDZHTUaq5pTXqOnGetD9JTAzb5eMLj5Jv29U=;
	b=uQ5X3zqANIe3u/+LbF4ANOeEpw8qQnxqMF75wkIK11ehIuKCZwUbwoOByWT1E2NlbO
	2hiRp/5JgW/SSm+eo+ai/zNtpESVvQ0fwYXAKsJ1ng+dnkVUQNOatVbG0rfXV88GwGDN
	Cb+WIe8BNIGYY700cvzJEvr6EsRSAeiF5oBu9hS7RkS48XgVNXDVwVI6opjCmAc3khVA
	tyFTgPQ1ZSIfaQPd+umWCVwh+3msTHV0UX4RfEz7RD30wDxVxCGR06hTo30mfiRIskAg
	TsBWo8tAbtSX2u+LL2zm73zDHIz06EaS2c3M16vH/YrfGp1a1/4OewEOkJEOoUMIQ7UI
	S36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D0p8fz0qDZHTUaq5pTXqOnGetD9JTAzb5eMLj5Jv29U=;
	b=h5Zw0iW1+Z3IJkBFHbqUGD3pxTrbcyIXb3VxqUQjjhSgg/p0YQAHi9YBpVH0rT6IEI
	SyvQ5RnHLZlxZ1RWZQFYjziFdOE6Wd501rt+HvX0GBeciCPnljA9L2l1Hz8JJwPlvpLb
	PFOxPDD+XHshOlC6+PJIr5wSrkKj0whktOeyNPtl0ljZ4NLrKB5PFPnSxqsrnz7Mdi1V
	XIAwpxnot1RoMyhrRzu/2y+qQS4Cq6j/1Axx9JCoDCDRNl7Id67PW/R+asqCyh74wGyw
	Vxh2xBNKKyUbqL9jJ/eTCs+8kkpUzBoycJ1njsVOu7OHBd7fmKrVufGezAiTYcu7elsS
	b+LA==
X-Gm-Message-State: AA+aEWazYJJVCkeAfK9R7jVeuH7NVKyvtlnXRxYIw1/W0sHQIDT0/QJv
	P6BPq+gY3WoUmg8m3EpeF6JGAoJOAqb12lZx1Ls=
X-Google-Smtp-Source: AFSGD/X1FYgeLstR0CWEheWYw8ti00LoakzzHxsoBI1d8SfwsMd5NR//Rd2t6TWh+ceBrDaD2pcLLOtaGTpjsQbEk+k=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr10014109qvd.224.1544421207934;
	Sun, 09 Dec 2018 21:53:27 -0800 (PST)
MIME-Version: 1.0
References: <1544416185-25058-1-git-send-email-aehs29@gmail.com>
	<1544416185-25058-7-git-send-email-aehs29@gmail.com>
In-Reply-To: <1544416185-25058-7-git-send-email-aehs29@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 9 Dec 2018 21:53:01 -0800
Message-ID: <CAMKF1sra8=oOUT20r2QbTqsdk-Fqi7L3pz5mRtEGWSTy5xaNfA@mail.gmail.com>
To: aehs29@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 7/7] meta-openwrt: Add compatibility with thud
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
X-List-Received-Date: Mon, 10 Dec 2018 05:53:27 -0000
Content-Type: text/plain; charset="UTF-8"

can you send the patches for meta-openwrt as git pull request plz
On Sun, Dec 9, 2018 at 8:30 PM Alejandro Hernandez <aehs29@gmail.com> wrote:
>
> Signed-off-by: Alejandro Hernandez <aehs29@gmail.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index bf7b4c7..d73be93 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -10,5 +10,5 @@ BBFILE_PRIORITY_openwrt-layer = "8"
>
>  LAYERDEPENDS_openwrt-layer = "core openembedded-layer networking-layer"
>
> -LAYERSERIES_COMPAT_openwrt-layer = "sumo"
> +LAYERSERIES_COMPAT_openwrt-layer = "thud"
>
> --
> 2.7.4
>

