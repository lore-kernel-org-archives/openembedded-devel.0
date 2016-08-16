Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D61C075C60
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:40:26 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q83so103406457iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 03:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=y7kmr83vc5zVmlOoz5JuE3xHcOg3Y+qKT5gCxMa6mpY=;
	b=EQdrRuPL3hiRHZvGuw1/WZUcr8OmSJn/zOmurQkaCnfk0BfzQRCPH5uDylmOJdh4L9
	EPx03u8IX9UbpcspuA/PxwADEfK8zHPc7a099UfqZS96yUvuDnA2xXoWuv+i2BtaGceN
	cRq5CH1MyOXDumwjSeYR/WO0NsblTur8XlUFs9ODsCDOv4nqxbk5rFl/Pxfeqm34Bk82
	lpdqBxC73QuvqiPrzVxotGnUh2ftDQauZABPfRipv6Ae/f2ykPZ47N3fwQ8GG8gHUT+4
	PT87XJipu7oG9EwL3uPGcF3jSbW6voe8WAEvP3A0cGRApO0D0fxzzENxAvvFRf9V49hF
	+fSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=y7kmr83vc5zVmlOoz5JuE3xHcOg3Y+qKT5gCxMa6mpY=;
	b=XJDIOXwJLTK+YSsg2Hc4rZfW2c/hvFczOj1p3Eez2BKmFQ6og7mvhqeaeoczfAZAON
	PL9UJrzQA8J3e2x87tdITLYkFIqp9ENeVJprbFJrb6ytISlPgsEES32L/jKGryMH++Bc
	c+xR8lSpMKXkeetQrTCc2cG2Tbft65/HyE02RjAMjB3i52OOMk7pi1f11umN4HVfPD3v
	AsNBU4ary58mtAafrFnFJolFJ6Gz5oqmzgnO7PrN9tFiGRU4rIAuWYWo3c2BS1ACOCqA
	55iEK0BLeucocKm6OelH3404fTIU0EALHLNejRNaDmFrPJLuU2odB+sWcM5pR4R74YUo
	/Teg==
X-Gm-Message-State: AEkooutdM22kePohE7HsBL0z3vAucBZorca6oINDwGVlIKXiI/HIZ3my+uyBMjmLfP7qbP9k7j4Yrq2Hi6D5LWTV
X-Received: by 10.107.135.142 with SMTP id r14mr42576584ioi.133.1471344027098; 
	Tue, 16 Aug 2016 03:40:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 03:40:06 -0700 (PDT)
In-Reply-To: <1471343516-6946-1-git-send-email-jeremy.rosen@smile.fr>
References: <1471343516-6946-1-git-send-email-jeremy.rosen@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 11:40:06 +0100
Message-ID: <CAJTo0LYKYph9e_JaLVbFbByCCwk9a2zmHVLAMEoed7h5rGeArQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] [jethro] fix gcc-cross when BUILD_* are set
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
X-List-Received-Date: Tue, 16 Aug 2016 10:40:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16 August 2016 at 11:31, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> When building with a compiler which is not gcc the gcc-croos will still
> use the $CC and $CXX variables
>
> These variables are not set properly to BUILD_CC and BUILD_CXX by the
> recipe.
>
> This is problematic now for jethro because gcc-6 is the default compiler
> for some distros (debian testing) which can't build jethro anymore
>

Needs to go to openembedded-core@, and needs to be for/tested with master
before hitting the stable branches.

Ross

