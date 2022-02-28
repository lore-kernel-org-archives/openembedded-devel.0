Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A915C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:56:37 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.1846.1646088996504568745
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:56:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=XqKdjg8g;
 spf=pass (domain: cold-front.org, ip: 66.111.4.28,
 mailfrom: jsbronder@cold-front.org)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id D95F55C0069
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:56:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 28 Feb 2022 17:56:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=0rinFHWDk+dYyYNTrUHebqtokmSJkLrvSl/
	e97GsHyY=; b=XqKdjg8gJQml44zt8uEmFOtusZjiJoaxFWOjkQZJX1A6YEk8xvq
	FcR7CIIi16G+0LpS1xr82USoJdOFmI3Cf2/Agt2n3UOuXCL6DZWc8DbCAg9H4cmy
	nUF2yoThacU7rhbXNvEbqglT7BnQXrcNXFfW9NyWP/dzkU/qQgwcqGPI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0rinFHWDk+dYyYNTr
	UHebqtokmSJkLrvSl/e97GsHyY=; b=UNwQfItgnIFd7x9+SeKikk3BibGOOOHIy
	1SvkU/NLYWLT9PDmiSBw979pqyQz2Rzc2UwAqUCMBRM9BYx7UYySkEdHXX12ul/X
	hIHyYSsmjI/gtYxHpfyqEH6wzQCXRD3dO+KTyt4m5GsSaCmjbvdPTl2+Y6FpJa4x
	mTQ5OeXNXYAI/FVreCscuCRS2bIIYZ58WEsrpM3CDHsk3a6LYMYCcadQJogGFEBA
	DUml3wX6T8GZjZ1c8PlQj7FJjsqxigmor4sun0y8VJwNW+kDtxIb38Ifwksp3o9Z
	r+sQEf4Z38X06VxgN1PqMTrfuPsb0+ygcrLyU+WYR/zaIKzxpZsNQ==
X-ME-Sender: <xms:I1MdYgQhU-6Y3wXNwLuhPMQG7aWPqa21Qzkiefv5QFtE7jGv2CWp3Q>
    <xme:I1MdYtzCtFhly6Ms6A-mWaytoqvj6XJyzafHi5M7MnledWoN--rpocll2daOU0FDd
    X9MKZpzlnridX7xCQ>
X-ME-Received: 
 <xmr:I1MdYt33OI6gO-AWq0AbXKwjRVtuCO0HjLw-sGnkLrPLsBZTQjgMoLDaBGzbwMDuBuoZbhk6qTI-sAWUdLxsuRCU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtuddgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeegvedtgfekue
    evgfdugfdvjeeitddufffgueegteelkeehueegueeigeevhffgvdenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtoh
    hlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:I1MdYkCDkSeaTyLPn-Bb0hH0Fgh_OwRjho-a3uK5UE3Bf4ZhzBv9SA>
    <xmx:I1MdYpgmJFA2gJK8WVsOsmOw02_bs1RKk2rdrsqol_58w05I_1GMmQ>
    <xmx:I1MdYgqbF39dwuzREgao9MMLFKTtR6oIiPTAG794ayofFufpHhmRog>
    <xmx:I1MdYjf14_F0fcIwRrZE_-qIxMeukwAxAmHXvaIXlD1WAlWPlmR6Fg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Mon,
 28 Feb 2022 17:56:35 -0500 (EST)
Date: Mon, 28 Feb 2022 17:56:35 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: python3-termcolor: Use setuptools instead of distutils
Message-ID: <Yh1TI+NaXzec30cv@ravine.members.linode.com>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	openembedded-devel@lists.openembedded.org
References: <20220228224810.218466-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228224810.218466-1-raj.khem@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:56:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95607

So, am I right to stand corrected that patching stagnant projects to use
distutils over setuptools is preferable to dropping the recipe?  I had assumed
from other distribution work that cleaning things out when the opportunity arose
was the norm.  If so, I'll stop trying to figure out if upstream is active and
will fix the package along with sending patch upstream.

Regardless,

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>

On 28/02/22 14:48 -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Justin Bronder <jsbronder@cold-front.org>
> ---
>  ...-Use-setuptools-instead-of-distutils.patch | 27 +++++++++++++++++++
>  .../python/python3-termcolor_1.1.0.bb         |  3 ++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>  create mode 100644 meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
> 
> diff --git a/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch b/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
> new file mode 100644
> index 0000000000..a55a6a914b
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-termcolor/0001-setup.py-Use-setuptools-instead-of-distutils.patch
> @@ -0,0 +1,27 @@
> +From e30308284c721210e2ba50d8b3d159cedf5eada8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 28 Feb 2022 14:44:42 -0800
> +Subject: [PATCH] setup.py: Use setuptools instead of distutils
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + setup.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/setup.py b/setup.py
> +index c4fe4ed..dad1d29 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -23,7 +23,7 @@
> + # Author: Konstantin Lepa <konstantin.lepa@gmail.com>
> + 
> + import os
> +-from distutils.core import setup
> ++from setuptools import setup
> + 
> + prjdir = os.path.dirname(__file__)
> + 
> +-- 
> +2.35.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
> index 17df7f983d..15bab622a6 100644
> --- a/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-termcolor_1.1.0.bb
> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=809e8749b63567978acfbd81d9f6a27d"
>  
>  inherit pypi setuptools3
>  
> -SRC_URI[md5sum] = "043e89644f8909d462fbbfa511c768df"
> +SRC_URI += "file://0001-setup.py-Use-setuptools-instead-of-distutils.patch"
> +
>  SRC_URI[sha256sum] = "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
>  
>  BBCLASSEXTEND = "native"
> -- 
> 2.35.1
> 

-- 
Justin Bronder

