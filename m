Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id C4D8277794
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 23:34:40 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id n125so7393998vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 16:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=79CJZsTeSagcw4jXB8EnttSSNeNABzY2ISFM9K977Go=;
	b=DhLrL3zUvfiDU+T78gew2ALxTCP9mOZ1C7T8PlN/snkpkrhRn+WVSf2ogrSiEzPuNg
	4PAH4Uw9ghxDWcxBNmXNJz/oXAvOFcS9Lv+HlbGuUPXw5i19ZPWdF4yvqGCOLY+J6PC2
	qaDQZoH99oryaID0YK6cxcr6O4t3Q8bAL6VU2Xy5Y6BrtrFP6Va5ja9KZDrVH4vuTL8Q
	9ryWWjWm9SJHEPveVVMK8zzZZecvlufx7ON1A0pLW9fSgk4Z+w072i61QQ7oSLFaQSTM
	a4lUHtEWtrsc5mbFt66JCkxgm7dTiPpbcmgNJgAA6sCAL8mxTxLi5H+pZhQMxXfsWYU4
	We5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=79CJZsTeSagcw4jXB8EnttSSNeNABzY2ISFM9K977Go=;
	b=hvsKHXlUb5cdfJ9kAnIEwQOXO15mw2/s2eOYjVLyBFMrEp+Y2wbYmzTKaC3h+/d03D
	svxfOuveBQk4bLRUdev1xc81UXObJaoWkitHRZ4pPyIMa+1u7n6DiwyPW5UIoml+z56Y
	py8p5rhZdysIardIeaxjQ3GHvsrl9QTbJAXrQRrlTw1lzLg8fyds1zaIAgII1/Y7+O3/
	0F6sLrQb+0C9CL6YnDXp+ns2wuglT3QpP5uypp720uAbmHYSd9F1lpNbbLQPQxq/5OAQ
	jPbjzOe5PJamJ73sp1LSau0uYVcz0M66I3Nr5ueo7rewWpBlsrX1irPSXiYwv+Itf39R
	+Srg==
X-Gm-Message-State: AHYfb5g2kL+iRuRs7Uxnnb2I+FF8ubJkQGEkWyYvgMU0jjDDA1e+njGH
	toAYuuPw53tgFxj5KWSEleiWxrGW3N/K
X-Received: by 10.31.131.69 with SMTP id f66mr20565616vkd.9.1502840081346;
	Tue, 15 Aug 2017 16:34:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.51.10 with HTTP; Tue, 15 Aug 2017 16:34:40 -0700 (PDT)
In-Reply-To: <20170815225855.81205-1-jslater@windriver.com>
References: <20170815225855.81205-1-jslater@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 16 Aug 2017 01:34:40 +0200
Message-ID: <CALbNGRRw9BGtqWnqL6nStjc5DF=+yz=8ZNyL4+5=C4u19Cc7zA@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] php: disable this version by default
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
X-List-Received-Date: Tue, 15 Aug 2017 23:34:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 12:58 AM, Joe Slater <jslater@windriver.com> wrote:
> There are many unaddressed CVEs which are fixed in 7.1.7
> and later versions.  Allow the user to define php_5.6.26
> to enable building the recipe.
>
I am not using php so I surely missed something: why do we keep 5.6.26 at all?

Andreas

