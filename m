Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2B2D670241
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 17:20:35 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id uq10so30481igb.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 10:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Hj9D7G+Iw5+n5QaTM1b2sobvUbDGIk1LcoaGWJvufBI=;
	b=OZ7vUsh89fgFSPGNtBsYTOp1PwdY1ScHVEg+hxHHfUg4OP/HzYSwmWsgAjFlEEGRfU
	PZZuwyfPCUdB2OJQ9t8DKSvrMlfa4Vp1V+4mEtwp+J6XEuaS39bxowc7DymKfJNkFofW
	GXJ5gKRHRf9ME02LIif85p/4eDGKHNuO93H+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Hj9D7G+Iw5+n5QaTM1b2sobvUbDGIk1LcoaGWJvufBI=;
	b=BNgrm+lOJMQHZsAydo6FWhjoCMubul1MhBSuVepMYqCd5T8GttvfjqXZ0w1BFIbCSc
	5kcLu6ahie9It+1rNyXQ78oxTvPSqYQKDfP3PJeCWuYk1AjBL9LgVIeTQPT+t8rw7Di+
	n07G60PHmxK32DGeYq4zIZ5Kwqjpv8bQJArI5vIdD0j7BM9uc0Qf33m7T7FP+WJgm7yP
	YzjR7PVE8ejaD/yGTA06kYcm/QxHEWC3Xzmyz72Kp3Ya3aMzOXtLoMYGX5CIE8VRVArT
	E5OXVD5YPw9ob9YkKtR/QTF7Jci18C63jeJVtxSNknBF8Su3Wzl/ccvtlgUeW24pOGX3
	E53g==
X-Gm-Message-State: ALoCoQmC/Q7rWZyQo6fkfHP46G5O+S2/XG9wB06ADYMpIHgxy1jerJleT9o4BC63RxJJCERdnsur
MIME-Version: 1.0
X-Received: by 10.42.174.2 with SMTP id t2mr2074074icz.23.1405099236938; Fri,
	11 Jul 2014 10:20:36 -0700 (PDT)
Received: by 10.50.225.73 with HTTP; Fri, 11 Jul 2014 10:20:36 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407111114310.25692@localhost>
References: <alpine.LFD.2.11.1407111114310.25692@localhost>
Date: Fri, 11 Jul 2014 10:20:36 -0700
Message-ID: <CA+gsK-q9aK49C5s7H3uzXxYnWSsU3pBmWzip-kOiaTuJhJgvTw@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: a bit of pedantry about core images
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jul 2014 17:20:39 -0000
Content-Type: text/plain; charset=UTF-8

Hi Robert,


>   documenting some stuff about core images and a few quick questions.
> first, in core-image.bbclass:
>
> # By default we install packagegroup-core-boot and packagegroup-base
> packages - this gives us
> # working (console only) rootfs.
>
>   actually, not quite true:
>
> CORE_IMAGE_BASE_INSTALL = '\
>     packagegroup-core-boot \
>     packagegroup-base-extended \        <------
>
> so that comment just needs to be fixed, i can take care of that.
>
> Kind of. You can look at it either way. packagegroup-base.bb defines a
whole bunch of package groups that depend on each other.
packagegroup-base-extended depends on all of them hence adding it to an
image will add all of them.


>   next, i've always cringed at this bit of code:
>
>   CORE_IMAGE_BASE_INSTALL = '\
>     packagegroup-core-boot \
>     packagegroup-base-extended \
>     \
>     ${CORE_IMAGE_EXTRA_INSTALL} \
>     '
>
>   CORE_IMAGE_EXTRA_INSTALL ?= ""
>
>   IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
>
> could that not just be written as:
>
>   CORE_IMAGE_EXTRA_INSTALL ?= ""
>
>   CORE_IMAGE_BASE_INSTALL = '\
>     packagegroup-core-boot \
>     packagegroup-base-extended \
>     '
>
>   IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}" ${CORE_IMAGE_EXTRA_INSTALL}
>
> Yes, I agree, that is much cleaner but you have to place the quotes
correctly.

Cheers,
:rjs

