Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f45.google.com (mail-yw1-f45.google.com
	[209.85.161.45])
	by mail.openembedded.org (Postfix) with ESMTP id 235B5605BA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Dec 2018 23:14:59 +0000 (UTC)
Received: by mail-yw1-f45.google.com with SMTP id x2so1725498ywc.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2018 15:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t0sVGDSBuF2pWPilQCEXCHIZfkKYCp3qJmzI+vItnD8=;
	b=EYLetx4vEB8lnAJWXnCLSc04c5UOFRvkdddu9MuQs02LtmeiTyNv1iKsuPs/JtQfHX
	pPMR6eviN3E3G0axSk/It/VGzxROVdB9sPZbqKicujh98X0zEJGtoj6u50ftN8qzobng
	BxMD44s9D5j/QpS6KwNZJqhPwlEMigDvR3H2qdI59PtQSs56vQvudPoDx5NenrQDMTzu
	twr6bNI0Ut6t0m5K8kp1OQgmGO22Oiz8zr8oE0JVcd7a+GKQ4J5yMdnW2B9E6oLnlY8D
	J7xymTdl0ShAOXgP+6Mwk8P0InLZLgip1pNPb4IR8ZrVO6QGAWPyAyks01K/Pq+/8Jk9
	s/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t0sVGDSBuF2pWPilQCEXCHIZfkKYCp3qJmzI+vItnD8=;
	b=ewZ6pDbXqD7IVACpfggBgz5I9/B5NepvpJAMLix01kbPzYwuWWtTjhvuboDZJEmwWv
	pSgpwP0b9lpydckYrrW4YJnehjt7WXj1CiEkeKnP5R+E628UpBaOoqAyxTQB/OJRCaAk
	PCYWWRjwnoPkZKNpvpFhg2mRqx3Ww4xLukoYBSOAcDmOx5akmEJs6dJhiXxDY0dRx2zA
	FSpciPtNSzqrRUdINoA4CBTu6uVWwzmFpS+46vBIp/HtHwlQ5kCS3fvty4VBlVe8xDhb
	DPssB8Oy3PxC/RCo0ZSbuOQJCqVOkfvDTXjVh9uWCG7svtiAdlvzzuxnQ0AEBGO01ZkJ
	aPrA==
X-Gm-Message-State: AA+aEWYPPedFKBE3GOkE2haViv/xYCgD06y645bKwDXK17U0hHtkISoB
	gl0two7q3x+7MH2CjAYOF1hTJ75FQeK89XyD+Qs=
X-Google-Smtp-Source: AFSGD/WjaKhjTWi74sq+3ABnBNHRuG5WEkukbx8L3jZ/ykOs4iP+if1goRzRv5IJA5oXHsm+nUPmY7gO2pylTnTl/6I=
X-Received: by 2002:a81:514c:: with SMTP id f73mr4195419ywb.272.1544224500049; 
	Fri, 07 Dec 2018 15:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20181207225137.38477-1-raj.khem@gmail.com>
In-Reply-To: <20181207225137.38477-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 8 Dec 2018 00:14:46 +0100
Message-ID: <CALbNGRTMmovcLAqpa-5nCrjYvNp0k2tUUO-GUjOfVZP2xvcVQA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] doxygen: Use SOURCEFORGE_MIRROR for SRC_URI
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
X-List-Received-Date: Fri, 07 Dec 2018 23:14:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 7, 2018 at 11:51 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
> index 3137c48439..7c7024ecf4 100644
> --- a/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
> +++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.8.14.bb
> @@ -8,7 +8,7 @@ inherit cmake python3native
>
>  DEPENDS = "flex-native bison-native"
>
> -SRC_URI = "ftp://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz \
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.src.tar.gz \
>             file://0001-build-don-t-look-for-Iconv.patch"
>
>  SRC_URI[md5sum] = "41d8821133e8d8104280030553e2b42b"
> --
> 2.19.2
>
Works fine - Thanks :)

