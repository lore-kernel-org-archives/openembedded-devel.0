Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id AA176736B6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 21:43:09 +0000 (UTC)
Received: by ioc74 with SMTP id 74so15628734ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2015 13:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=s7wLtFrjh1W58gxGs6O8jWrWl8vw8kpHyeXhH7ZVK08=;
	b=tWEOJs+GjSVZUCotxPBfvUL3SEd+KM+xpS1lls2pWC8+lNyPT2Lrw1+XfylK+D4IZN
	lrsU/+1n5YOPwKwQVsLGAZ+4URmaVKH7yXgoOEjsC7iP8aPeDN7P+GCfK37yYS7e7IS0
	zaJfii3/XN5M9Q7Sc05yD3+tv62TCWOzjbgLzTieO2k9zmuT2FbI6HD79yGTB/58P4MY
	OKqMGcSGfS95J9V2L/igaxH7cdZVVpbYRu8A0aofWEbcOSbpckxjJTMHVNcXtaSf3ESR
	yRmpgQOemF95A6imfX9JMp1VC5lsvhyKDgPFA+9etqo73EKdBoOQNIRiHY9ZRRWRTp4s
	c6Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=s7wLtFrjh1W58gxGs6O8jWrWl8vw8kpHyeXhH7ZVK08=;
	b=FrZNT15ApyfacKKX3g7TUuS+z1QZ/opMhmjz2iOgq14Zn59+r0YmsiU+hImGWKvifP
	Xgzo++5Q64rkdUBobM+G5WV5bJUV7IoOm/V8ZmnSaDrGHj6tXJlDWbd4FqIJIT1VlaYS
	ZdimI2AxtZqj4Afb8yCn7w/0+gLQtyXrt3bGpaywh0FidOO0lz4yqbArq7mEh3necpMx
	+4mhmIQ7DrniDIJZa2kijWngbB0lJ3i9JsgqYyqZQA2a9j25QwFlvVz2Wneg1CN4ZW59
	b9itbHJc8nOim0gSV7qn5h/q0gVQkFN8Jn0VzkRpy2uzn2EtZjghQ0fFUIekacetrY6Y
	vjPg==
X-Received: by 10.107.38.70 with SMTP id m67mr6868748iom.98.1447191789272;
	Tue, 10 Nov 2015 13:43:09 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Tue, 10 Nov 2015 13:42:49 -0800 (PST)
In-Reply-To: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
References: <A3005F6B-2993-4BA5-9406-D411C19FA636@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 10 Nov 2015 14:42:49 -0700
X-Google-Sender-Auth: -C7OsG3OQlEEGTeWCwU9DivxH2M
Message-ID: <CABcZANnTbE-6KgFxaNr2p-ruzt3TKQ0jc2VR6-8fhJ-MmGcpZQ@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Volker_M=C3=B6sker?= <volker.moesker@rademacher.de>,
	Tobias Theophile <Tobias.Theophile@rademacher.de>
Subject: Re: [meta-oe][PATCH 1/3] samba: fix dependencies and QA issues
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
X-List-Received-Date: Tue, 10 Nov 2015 21:43:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 10, 2015 at 2:22 PM, Jens Rehsack <rehsack@gmail.com> wrote:

> +                   ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'lsb',
> '', d)} \
>

This really requires lsb to able build, for all sysvinit distros? That
seems unlikely. Was this intended to be based on the lsb distro feature?
Also, why add lsb to rdepends independently of the packageconfig? I'd think
using the packageconfig's 4th field for rdepends, if necessary, would work
better, unless I'm missing something?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

