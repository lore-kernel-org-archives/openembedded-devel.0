Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD3D78302
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 18:53:42 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g127so34784080wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 11:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zzuYDsZaS0SgWpgw0WvEsYyMBmFlfVgEDXOIRTCATI0=;
	b=MD+RVAtjXZw4uqHAlN7t4ofT7iMznOToUH5/EuBC8Z6KrQ7Fo61kVMZirbaD3Q4/ED
	ZgdFjNn3ul/zOBCVU2/xlun1ik/6WJp2ZAHlpXUTv04pSTCUL/8kxh2X4XA6gzopDzhE
	uPnk3MYRigCM550y8xeA9iLXS1UK4ryzONHA4CJ3TqiWN1KABpz0kqrDs4TRJqGyWjc6
	D9Bas3zWn2XzZpZ2qo82x++xQfY2JUPxcUAfmHdOGhWDJ/DJJLlT7P4nuPkWeph//aq+
	+qf1j3uAz1eF4dAOgXlE19J+ZRvvLfi6GZ2vdODn9teeCgsHkUZRsSfzRV3ZFXvyTLDj
	eK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zzuYDsZaS0SgWpgw0WvEsYyMBmFlfVgEDXOIRTCATI0=;
	b=QJX0iLYcjJds8JO9Qrjrj1LgPHVeHha7KCPGiXyXj69uj2cpD8t8mI6ZuvUvVnOxYt
	f+A6/eKaIgEI/Q3Nt1oQmqZX/zOiRBbmKcOnx+JpxfNlLt9OCm6hI0BtlGXQ3AOz7DQ/
	+pbYsZjiy/3eyMLqe+ZEtK6BcF0ELumsDkvzYpJPkaBH6k6l4n2bgu6HXd7wWeuWd3rh
	8BoawT4CWaCpESKF6GWQomXgIDilGB0Ji2sNiS9iQsep18fjt3Pi42qlIRj13hkIpBcP
	jdYSQVxYIQg1hc8coD8Iq7a36ZSnPpdONzvfbL06bk7y9WK/3J7Z32RtdivAM9XLpDDR
	nPjA==
X-Gm-Message-State: AIVw112Fj2zmlkYkzq5ureZXhXCL2W4U3g3SbPcFJGwk8ovw8GWqasT9
	vHVQSNCNNaFLvzAtQ7zd0ul8v3eQYJQ+
X-Received: by 10.80.217.141 with SMTP id w13mr3695392edj.228.1500576824215;
	Thu, 20 Jul 2017 11:53:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Thu, 20 Jul 2017 11:53:13 -0700 (PDT)
In-Reply-To: <CAGkS5bn1Ke-k4W_-aCAQ9Mcp2ZvW4g+9ahx9CLrrpAf05SnLcw@mail.gmail.com>
References: <CAGkS5bn1Ke-k4W_-aCAQ9Mcp2ZvW4g+9ahx9CLrrpAf05SnLcw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jul 2017 14:53:13 -0400
Message-ID: <CAMKF1sq=EmOidjmsMqEs2uYGiU6W3qs-EuzFNOOd4VuNjN7gRg@mail.gmail.com>
To: Jason Liu <jason.liu@gumstix.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Pull Request
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
X-List-Received-Date: Thu, 20 Jul 2017 18:53:43 -0000
Content-Type: text/plain; charset="UTF-8"

Jason

On Thu, Jul 20, 2017 at 12:42 PM, Jason Liu <jason.liu@gumstix.com> wrote:
> Hi Openembedded,
>
> Currently we are developing our kernel using morty branch openembedded
> recipe and we found that there is no libvdpau package in morty branch. So I
> did cherry-pick to apply the commit from master to add the bb file in.
>
> The pull request is https://github.com/openembedded/meta-
> openembedded/pull/48.
> Please confirm the changes.
>

We do not follow the github pull request workflow, the github repos
are mirrors for distributing the pulls
you should submit the patches to openembedded-devel mailing list.

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

> Regards,
>
> Jason
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

