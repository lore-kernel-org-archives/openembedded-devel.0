Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9D14871ACF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 15:24:15 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 83so8840802vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=qVTFBfZxmcQOlPopwv6/g8XTsx6MYPCGFFa0Mi1Ax6Q=;
	b=SwKQ8PSnc5iMHVcfxQpSkIAiD9IhbwcvBF4kA8okteidFXI+JsSXLNZlvdMdxV3wzG
	9Fe6jl7UWuyEqO3DIifwCXIElsp3sxLWODtfPWC0PfzrgT8nlMg9G03XJvj+pBzHjXTs
	OAwbm8cnIEW4BHWbU9UuwRU5XQTkSRRRb5uznLprQ57Pk3Cy1RxaDnzQ3bUZT6mH9jx5
	rtEr+xCIb4fRN02o1jnSJxkE2aobLXYSe09wMaW4CK/NZyheO17TL9oUXTua6wGuKZ15
	WDASmHLLvQldM79lgY8HqCr5muqasIApIfJVnnygCNC8BIph8MRti/M9tVMN4GxPWW43
	XBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=qVTFBfZxmcQOlPopwv6/g8XTsx6MYPCGFFa0Mi1Ax6Q=;
	b=lddOoaEOZVubu0jkiGmROPtp0d60ZK0y45iVzzTBaKUcrJPs5R8hHovpNAQ4cion5Y
	VlIyPVsKSjXMwhM1eisV6MLHA41aHZ2cXWFq1du3vCB62FP4Mc5PHUxerMTmnSgyaxIc
	o9XQ47Ply1fTD/CuUz4m9BizMKESu8ojjVJSbNEsOr9qWiZVkuO5tKDcHIjg30xispPB
	IDFVBQejTzymr5lswaE+lrEIBfcl83CFEWzlj9AmBEk1D1/IeE7eiLqU9ciWSZuqQAcx
	q26yNCNxYahVQ4NUNVWSRGPkKr76IdCYicEiRNJR5TYlTOCYL+5e0Hl/WFMIv+xSHYgy
	CPPg==
X-Gm-Message-State: AA6/9Rn9sFNyTtkgPWJdPyh7Ck59ota/mRXDRwKgF84HoFTwde2lWxGVlvoDA51rIIqHEg==
X-Received: by 10.31.115.8 with SMTP id o8mr1212691vkc.2.1476804256243;
	Tue, 18 Oct 2016 08:24:16 -0700 (PDT)
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com.
	[209.85.213.50]) by smtp.gmail.com with ESMTPSA id
	f189sm14149286vka.14.2016.10.18.08.24.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 08:24:15 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f50.google.com with SMTP id 83so199033287vkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 08:24:14 -0700 (PDT)
X-Received: by 10.31.47.70 with SMTP id v67mr1200681vkv.4.1476804254575; Tue,
	18 Oct 2016 08:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.120.78 with HTTP; Tue, 18 Oct 2016 08:24:14 -0700 (PDT)
In-Reply-To: <1476803797-18279-1-git-send-email-ting.liu@nxp.com>
References: <1476803797-18279-1-git-send-email-ting.liu@nxp.com>
Date: Tue, 18 Oct 2016 13:24:14 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqtXnW9D8LqeCxfmVWcx63xiEM=DRK9dt6pT_Eq0iSpKw@mail.gmail.com>
Message-ID: <CAP9ODKqtXnW9D8LqeCxfmVWcx63xiEM=DRK9dt6pT_Eq0iSpKw@mail.gmail.com>
To: Ting Liu <ting.liu@nxp.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] xterm: use ${libdir} to avoid installed-vs-shipped error on ppc64
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
X-List-Received-Date: Tue, 18 Oct 2016 15:24:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 18, 2016 at 1:16 PM,  <ting.liu@nxp.com> wrote:
> From: Ting Liu <ting.liu@nxp.com>
>
> xterm installs files into PREFIX/lib/X11/app-defaults by default.
> This leads to QA issue on ppc64 which defines libdir as /usr/lib64:
> ERROR: QA Issue: xterm: Files/directories were installed but not shipped in any package:
>   /usr/lib
>   /usr/lib/X11
>   /usr/lib/X11/app-defaults
>   /usr/lib/X11/app-defaults/UXTerm
>   /usr/lib/X11/app-defaults/KOI8RXTerm-color
>   /usr/lib/X11/app-defaults/XTerm-color
>   /usr/lib/X11/app-defaults/UXTerm-color
>   /usr/lib/X11/app-defaults/KOI8RXTerm
>   /usr/lib/X11/app-defaults/XTerm
>
> Fix it by passing --with-app-defaults=${libdir}/X11/app-defaults to configure.
>
> Signed-off-by: Ting Liu <ting.liu@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Armin/Martin: this is an important fix as ppc64 machines are currently
broken. Please apply this onto master and morty branches.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

