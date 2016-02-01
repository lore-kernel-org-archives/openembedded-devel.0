Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id DF93476230
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 13:42:18 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id n128so83582826pfn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 05:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=hJJkDkIKFlomOqE8wsX3pRLUCrOM7ZPt58IENuplnJ4=;
	b=m8joLf28bX2HzpjYcyq5NCaNWT8FBH9ORSprwnf4dhVEpoMdmIpE0PtVntUx049Rpm
	XBkzicciXBWJOXhoNnlIXdNyhLvTC9nnVtXVmzZW0XtgnyPRPOmomrhDftCz+b4BjUhb
	Yi39b5+1m3RADnMKhHPP0yW3xrUmt8KW01davYr8FT3cLnuLS6MZWEvvjmKULcA9DGNX
	NRL5k8riExkH89dkszvqTxt2jm8oukbWmGRTZa+Rs99oIccRW35Oy6BDD1Wc3sXGhB6o
	ISGKk9tGmBFSVx9NGtTCWY/HIlYBDzeFSt3fMcah0WTpZokeXXE5+uPlPY5P7/xjhz6e
	032Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=hJJkDkIKFlomOqE8wsX3pRLUCrOM7ZPt58IENuplnJ4=;
	b=BNhLx1+UbTUoOMqBxQReBq1OS+XpDhp2KWRHuHIy8RGMaNXQZNpPDBURO7OEiNVQY1
	bXqgVlM0wHYMO2E0UGVLYM/Cqh1/UkzLZEtvP+/VJEMtk2NBr9XLsoAeDLm4W3Pmb0h3
	tuZLYVxEW+tof0RxpOfZF8dIFjG+TwYeDKOZgWLku2H9GdPCswZGn5eXVYBxzPGDm7pG
	9GKBYyZYMfFAaLoOV5Ma4+9B9ygD/K7aB2GjydVfscTuse0MCto8gidi+6+DXMQNOyvF
	XkFBM9lJZPYL1W7yA7zhYcqGMQPvg8OHmDvc9PnOleHthRMpIaKc4k68tNBBLLhKgaWd
	GugQ==
X-Gm-Message-State: AG10YOTyNwi+B14uxpG6PKRW+QtCu6X2AAMzh/LtozzRyxiQKZul+sFRuv91/bIyg/ztmA==
X-Received: by 10.98.67.67 with SMTP id q64mr38411149pfa.133.1454334139438;
	Mon, 01 Feb 2016 05:42:19 -0800 (PST)
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com.
	[209.85.220.46]) by smtp.gmail.com with ESMTPSA id
	q136sm43435883pfq.66.2016.02.01.05.42.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 05:42:17 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f46.google.com with SMTP id ho8so82483421pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 05:42:17 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.121.136 with SMTP id lk8mr37972039pab.1.1454334136736;
	Mon, 01 Feb 2016 05:42:16 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Mon, 1 Feb 2016 05:42:16 -0800 (PST)
In-Reply-To: <1454256375-9313-1-git-send-email-twoerner@gmail.com>
References: <1454256375-9313-1-git-send-email-twoerner@gmail.com>
Date: Mon, 1 Feb 2016 11:42:16 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqOgCvHfqCfutagDn89rLoQcvsJasqwU8DJjP4Qz7QPzA@mail.gmail.com>
Message-ID: <CAP9ODKqOgCvHfqCfutagDn89rLoQcvsJasqwU8DJjP4Qz7QPzA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][PATCH] scsirastools: autotools_stage not required
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
X-List-Received-Date: Mon, 01 Feb 2016 13:42:19 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jan 31, 2016 at 2:06 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> The functionality of autotools_stage has been incorporated into autotools,
> so openembedded-core removed the autotools_stage class, therefore remove it
> here too.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Martin, please merge this as meta-oe fails to parse in today's tip of OE-Core.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

