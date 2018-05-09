Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id A25ED74B52
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 13:02:10 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id g72-v6so17338410vke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 06:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Se0l6T+Y4MFIKLuEGCmgEUtNywNyDNEtvARgXzhKqE4=;
	b=Dm/pOZ/VC9fYaXVKg/AyMifW4+Sjo8aoZPDbPoSHAAArjr9Hra9dc27PWnk7fgu29m
	RFQ4qc5lSQ3NpCx3VGXLbAc42B2IX8Omr+QzKg2rhpktF1+LFkIFsHjBDgepdvMcSEyz
	XtoGxs/ho3i/sHN6uciYKkDnX/QzMmC3igIp6zzw71N+pakwWWmVbK1qA2P2aroeYo4e
	NwWNfo1dpG57LMQJpO7hfrCMOg+Z5el3DWT5WM5WsK7h81hYtuk0RGv87o4HPVeZyfFT
	MD/uArZ1As/THKCkLkYM0kPqf4WU7wZFHPWvPCyvNFhJ3A3VaF4jh4paHs9fGe27CFcD
	1RkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Se0l6T+Y4MFIKLuEGCmgEUtNywNyDNEtvARgXzhKqE4=;
	b=lzcnMxKpF9JRWGsCRpZp0oIdC2m2N1adniggZhj5Y8fuoeBZX6PPSNgi8XPWui09s8
	JrwJYKHD50eYwLBM46qJ46eZDtEgLt7mcFM5QRBdVRGpVj9k4NeL1/CexxgzcWy6FI17
	mIttKlIj2p5nm3QRHW7q28w/nRobh0ExGdFXfJ7IjPlz3DTAR0jbZCTefg7yS9oHHrLB
	PuytfRL1SU3bBUDjdNNsrN0ZJj+kyX5kZ2uem2yb7dJPesDAWl2eRy8EAhBjkNY3cKy+
	TaR34aAkLesA33iog9lrlDFchMIC7bDhVVTAXJ8HD2P7TPf2KPMveTccEqd0NXnY+5sp
	PbRQ==
X-Gm-Message-State: ALKqPwdUwzdLp3hNj5i11+fAbPgzCBhgNuWaqwCyBFFNwdUYBPWeoh1a
	DHUNlWyOd70HCm28Tqg0fN7ltv6UoSbp4aeyfd0=
X-Google-Smtp-Source: AB8JxZo84JmbPp3icW9loUuWKGdpCgvx7maMXVcdOMRp0BdK8H4fleXnNULWJ2yeZm0ZYKWssTp9EEXLd7Do4Sw0+jc=
X-Received: by 2002:a1f:ac43:: with SMTP id
	v64-v6mr11798114vke.182.1525870930440; 
	Wed, 09 May 2018 06:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <1525829867-22734-1-git-send-email-sipke.vriend@gmail.com>
In-Reply-To: <1525829867-22734-1-git-send-email-sipke.vriend@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 09 May 2018 13:02:00 +0000
Message-ID: <CANx9H-CnBpsQK4NT9KJrRqDE0wQDvBcvqd-GVwnCo0MMWTA6bA@mail.gmail.com>
To: Sipke Vriend <sipke.vriend@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-robotframework: Add runtime dependencies to robot framework
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
X-List-Received-Date: Wed, 09 May 2018 13:02:10 -0000
Content-Type: text/plain; charset="UTF-8"

Please also provide patch for python3-robotframework or indicate it is not
needed.
On Tue, May 8, 2018 at 6:38 PM Sipke Vriend <sipke.vriend@gmail.com> wrote:

> Add the runtime dependencies robot framework has so they are available on
> images including it.
>
> Signed-off-by: Sipke Vriend <sipke.vriend@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-robotframework.inc | 11
> +++++++++++
>  .../recipes-devtools/python/python-robotframework_3.0.2.bb    |  4 ++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python-robotframework.inc
> b/meta-python/recipes-devtools/python/python-robotframework.inc
> index cc20d64..78bbbc6 100644
> --- a/meta-python/recipes-devtools/python/python-robotframework.inc
> +++ b/meta-python/recipes-devtools/python/python-robotframework.inc
> @@ -13,3 +13,14 @@ inherit pypi
>
>  SRC_URI[md5sum] = "ea49a54b9d7e38302712194e85c37eaa"
>  SRC_URI[sha256sum] =
> "2018f233568227f9af8c366f93e243a157b742f3baf5b649ecc9750ac0ee1ff7"
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-shell \
> +    ${PYTHON_PN}-pprint \
> +    ${PYTHON_PN}-xml \
> +    ${PYTHON_PN}-difflib \
> +    ${PYTHON_PN}-threading \
> +    ${PYTHON_PN}-html \
> +    ${PYTHON_PN}-docutils \
> +    ${PYTHON_PN}-ctypes \
> +"
> diff --git a/meta-python/recipes-devtools/python/
> python-robotframework_3.0.2.bb b/meta-python/recipes-devtools/python/
> python-robotframework_3.0.2.bb
> index 16eaa78..ff7dedb 100644
> --- a/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python-robotframework_3.0.2.bb
> @@ -1,2 +1,6 @@
>  inherit setuptools
>  require python-robotframework.inc
> +
> +RDEPENDS_${PN} += " \
> +    ${PYTHON_PN}-zlib \
> +"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

