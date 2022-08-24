Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD6AC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 17:28:33 +0000 (UTC)
Received: from avasout-ptp-003.plus.net (avasout-ptp-003.plus.net
 [84.93.230.244])
 by mx.groups.io with SMTP id smtpd.web09.13879.1661362107084447718
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 10:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=LjH0Cdrn;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.244, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id QuAwo8IPapvx8QuAxoUj0a; Wed, 24 Aug 2022 18:28:24 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=ccLBE1PM c=1 sm=1 tr=0 ts=63065fb8
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=biHskzXt2R4A:10 a=Q4-j1AaZAAAA:8 a=xvloEm1rjr4Zfpfc2_0A:9
 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=Il9Sfpp+BDfmOaSeMm4XHxM2jPEX2aq0Le1Aj56PZDk=; b=LjH0C
	drnB0p2dYBnlPDPGbjmroQHAZskjE1eFv2JFoBfIZizXm2zrSf7FVcxGSkpuppLOuX0gP9E9C0oMG
	uMzAH+0xQAWG+7QHxlvaac+qwGuhkfaJJo+YNSaLrIF6FgNbQxY2TZbArhOaivCX5c39d1XL5z2la
	5FeriFW3nKfTDrjrJEc415yWGcDkBdtS494k/tPGuSogcW6+pexfLonqXnbFVu3R3Vk9XSx/QDsqw
	lTUx5dHTBOYtQw6ZxmSokTjh9zKWYSIAe9QDhUTU0IBn4FKYGoKvdgJC/QGt7NPIAT8gaI3dg1VWg
	RI3N4bRzeaHPSMULAG/osEb2wVGmQ==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1oQuAw-00Bmqx-D6; Wed, 24 Aug 2022 18:28:22 +0100
Date: Wed, 24 Aug 2022 18:28:22 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] yasm: Only depend on xmlto when docs are
 enabled
Message-ID: <YwZftsa5qzXlqtqk@mcrowe.com>
References: <20220824153539.423878-1-mac@mcrowe.com>
 <CAMKF1spmzy7HkzNA36TmsK7BjrkBxXsBvO1ZCo759Ygd-Qrk5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1spmzy7HkzNA36TmsK7BjrkBxXsBvO1ZCo759Ygd-Qrk5w@mail.gmail.com>
X-CMAE-Envelope: 
 MS4xfAHodGZOHaWEiyL8GIDuti3vs/hFc7lPZc0mLqbOgnl5VJ2oyXoz1rBgWNVckKqnE+mzHivGTl9fSm0GLLQP5WqXXtjVOnEQFV1WaYbuzuM+dAYleyXm
 wLE//ejzsH0glU57+YTzo2Xba2B79z7iDkqQXH78GxDOUV/I5JOxnsbYDF9wMGW7kkleUCukAENa9WTaSbGlbBxQKBNynHDtf3E=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 17:28:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98422

On Wednesday 24 August 2022 at 09:05:05 -0700, Khem Raj wrote:
> On Wed, Aug 24, 2022 at 8:35 AM Mike Crowe via lists.openembedded.org <mac=
> mcrowe.com@lists.openembedded.org> wrote:
> 
> > The yasm build system only requires xmlto when building its
> > documentation. It automatically detects whether it is present at
> > configure time.
> 
> 
> Does it also detect it from build machine ?

No, because of the recipe-specific sysroot it can't see my system version
of xmlto.

I have xmlto installed, yet log.do_configure contains:

checking for xmlto... no
configure: WARNING: xmlto not found, manpages will not be rebuilt.

> Perhaps better to turn the knob on and off explicitly as well for
> determinism

I couldn't find a --disable-doc/--without-xmlto knob otherwise I would have
done. :(

Or did you mean that I should explicitly set ac_cv_prog_XMLTO with
something like:

 PACKAGECONFIG[docs] = ",ac_cv_prog_XMLTO='',xmlto-native,"

?

Thanks.

Mike.

