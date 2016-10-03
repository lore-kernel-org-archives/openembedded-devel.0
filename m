Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id E3E91719B0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Oct 2016 21:08:13 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id n13so161879744uaa.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2016 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G5x/wIddp9HfmfjAhnP1g+975m8NIimvw9X0sVU1RVc=;
	b=LhfaHsFjIqnZcVzaowEnLCGoObI71AbgchGMN2iupoJ1EaSJocbWIYGGpfGrZrrrin
	ca+LcKcYFnitWa275IdO51QO3eS+R1AZOQvjHMHGaph9HUCPGtzDxQYUfC9u5PjerU46
	g7ixC4MSQC848rkJIXSULJZLtuEgbhXQXW0IfAyEmXN8EbVCQHzlZn8LTu9CaATWMYq6
	h4j7A2Zrl/H6MEr6IK25x9pbmfpbwlz8OjK4oU9QXgdGt3uDhTbFPpicAJ+Iiz4PoGRg
	ncK5/yN9N5kqiftFA/d8jn6IKhNspuknMc3hEzcB9+6HS8QulNyuGtl/2kmc+ePDDZ9I
	C2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G5x/wIddp9HfmfjAhnP1g+975m8NIimvw9X0sVU1RVc=;
	b=SUUu5UxMmnAFuY8ZkQDEQPlsJwtIsCyO4tIQ0KehxASeDQgV6gTptnkwLHTu/bxe8a
	VGDvebP81FK0qXyzfZgCgoFfw9i6sF7Swm0AnJ+lucmDfzMI5+EDl22xXoObLJCPllZw
	YZl83n/trPAk5gcRejsepQgBJm1G4HnRRwbv5Py69DsRrPQQwjOQGwxGnggPmXoKlCJK
	GcHLtZ1BePOhfIjVdjWy9/ArHNZAPtFPIFtt2HSPpUlP8ZBZ/rUP6JpIRMUIQ+TdRIui
	mLvkhQjgW3HuKUB0njOwZhiCMKh3xRtIvLwlayfPmA2lLBD7OP9oMQ2+dcdM38Pg0tDr
	s/oQ==
X-Gm-Message-State: AA6/9RliVy4awIvkmgQkOdNmMvbkE42xOahyQfaWxhXfEoXfp3Si0lU7cU/amsv9K/DOW4rgaW6e6KHxfnt98w==
X-Received: by 10.176.86.84 with SMTP id z20mr42046uaa.17.1475528894846; Mon,
	03 Oct 2016 14:08:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.114.9 with HTTP; Mon, 3 Oct 2016 14:08:14 -0700 (PDT)
In-Reply-To: <20161003201702.9024-1-otavio@ossystems.com.br>
References: <20161003201702.9024-1-otavio@ossystems.com.br>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 3 Oct 2016 14:08:14 -0700
Message-ID: <CANx9H-APXBh+4Jkc5p4MQ_rBz61sQ20Y+vr3TQkwvD542XzRCQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-python for-krogoth PATCH] pypi.bbclass: Allow fetching without requiring the hash
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
X-List-Received-Date: Mon, 03 Oct 2016 21:08:14 -0000
Content-Type: text/plain; charset=UTF-8

Thank you. I was about to do this myself.

Acked-by: Tim Orling (Intel) <ticotimo@gmail.com>
Tested-by: Tim Orling (Intel) <ticotimo@gmail.com>

On Mon, Oct 3, 2016 at 1:17 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> This allow the fetching of packages in a backward compatible way[1],
> using un-hashed packages.
>
> 1. https://bitbucket.org/pypa/pypi/issues/438/backwards-
> compatible-un-hashed-package
>
> A equivalent fix is available on master in commit 7edad4d (pypi:
> update the base pypi url to use the package info without requiring the
> hash) so this is really a backport but without unrelated changes.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  meta-python/classes/pypi.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.
> bbclass
> index 659e1c0..cd27cd2 100644
> --- a/meta-python/classes/pypi.bbclass
> +++ b/meta-python/classes/pypi.bbclass
> @@ -13,7 +13,7 @@ def pypi_src_uri(d):
>      package = d.getVar('PYPI_PACKAGE', True)
>      package_ext = d.getVar('PYPI_PACKAGE_EXT', True)
>      pv = d.getVar('PV', True)
> -    return 'https://pypi.python.org/packages/source/%s/%s/%s-%s.%s' %
> (package[0], package, package, pv, package_ext)
> +    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s'
> % (package[0], package, package, pv, package_ext)
>
>  PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
>
> --
> 2.10.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

