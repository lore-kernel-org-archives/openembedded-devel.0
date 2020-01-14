Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id AC48B7FA20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 21:58:16 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id b19so15578314wmj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jan 2020 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=bl5e5/G543TAD0D+v+mTVSD5lx6hHYYGSplfh6QUSiQ=;
	b=TFKVzBe/4+kyGyQ4sJmHiwUUbfm2VeGR/9hUoRHX1cqKxCW1bRw+6kMJJU4DqEKOG6
	29G894ewc1rbxo+SuhgmJS75o/bfpY1weDd5rPxv10xapiCjcP2GGmQ3t05OGaABV5Yv
	j8zv1dGvI1ZTkYKCo5XmiYtBIw/6+JmmEBmRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bl5e5/G543TAD0D+v+mTVSD5lx6hHYYGSplfh6QUSiQ=;
	b=c2g3bKM2BFkdpzfBHG8oDKiuX33eD4khfTedP7Sz54nkIeWwB4nq+ij3VPpA8wA9eZ
	EWmgxZKc2/L9VP9lNyd7ooh2ky4SPCQSyjhONuDzrkDAYkvHCcMd1DMzjbp3QCdjfndg
	dJe+ACtkWelQInJzj10GNKRlt/RcXIIwcexdFnns8Lfa4CVyGI2StVWXUKZ5AVnFxCEM
	FZRJheqvBJAuyuPjo4X9XrEN5iUQwHSAW1aHqXQdSRsL4+Ubwz/ouIYFLewHITAU8o//
	LsFkELtBBq9wY1I01y0c+wVRVevNtJ5ud0QN1IzV018WFpyv0KbK9yNUFxH44CgQTlbe
	6pLQ==
X-Gm-Message-State: APjAAAVG7eOvgOcDjZQKM07QiAZixNviVVxMkDJzgrdBE+fLejWvipGr
	cwuTNnKvuhEgtQjl9Dx7D9GifQ==
X-Google-Smtp-Source: APXvYqyoHSJ1IlQ1JSifkKKtkaxCS8Oabzfjh1pMf1CvLC+Qxn3nHv0ZfN1sviWIKxkrV1ofq31eLQ==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr28710808wma.106.1579039097387; 
	Tue, 14 Jan 2020 13:58:17 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q6sm22621838wrx.72.2020.01.14.13.58.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 13:58:16 -0800 (PST)
Message-ID: <02b79c273128c1e16671ce1d53968482ca8e7520.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Jan 2020 21:58:14 +0000
In-Reply-To: <CA+chaQdbbzzGQRxRvyKe2HXhoFZw0ySRNvR3qD5XUFz9CQofBg@mail.gmail.com>
References: <157903709591.16469.5017474364348868055@git.openembedded.org>
	<20200114212458.07B2B232B91@git.openembedded.org>
	<CA+chaQdbbzzGQRxRvyKe2HXhoFZw0ySRNvR3qD5XUFz9CQofBg@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 28/29: sstatesig: Improve debug output if getpwuid() fails
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
X-List-Received-Date: Tue, 14 Jan 2020 21:58:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-14 at 22:55 +0100, Martin Jansa wrote:
> Would it makes sense to print the exception in the same bb.warn, so
> that the missing UID is written in the same line as the path - not in
> the exception stack trace printed after? But maybe it's not important
> as with raise there will always be just one exception like this and
> it will be printed immediately after (while in my debug before I was
> listing all the files with this issue without leaving the build to
> fail).

I'm torn on that, I don't really want to interfere with the error
handling path, equally as it stands today the traceback isn't so useful
without knowing where it failed. Not straight forward :/.

Cheers,

Richard


