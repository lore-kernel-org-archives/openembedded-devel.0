Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id EE93E71A54
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 12:11:22 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id q89so11273057lfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jan 2017 04:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=3ZAHDThdfTdvKTsJZZt01f073bCetD1zczd8v+ibV0k=;
	b=Xtr2zSlQOKoZNYFCAq+tD7mO2g+FxB27aHRB2abrMF7VI5a9zRwOHZcr5IjFY1Vzte
	+e3tluT/V/VwaUQWPB1BxZFkYuiIu5N5wjGWk/g2AXcCXFdQ4Z2a9kBQqWF/HGc4zgR8
	uutZQvnycbZhgq4C0WNp68gP6KSlSTxDDL7goRSYcugUR8J8DILqdvgqP8cBPY03RFh2
	pOVytDjKUXb23zDgjSenewmry6LCwd3bJhEA3KOTFKN2jZnEY+jAws70WkVhseoU54tv
	sWf31NkwssjoXt02HDGYLkQi9b8zZHqIc2X3nd9Ps56VrfaM7AG6Qedktlqoyirt0AxO
	sQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=3ZAHDThdfTdvKTsJZZt01f073bCetD1zczd8v+ibV0k=;
	b=B1UA9lUw/QwUyEcgoHSJTJWMdpgMcWRzvdwfg6S8DVMofhe88YinkYnXUwlRl5SuC2
	wZTjw2+7CSRn2fhmvHvOzxRvUMKEYx5VRkp4PoOXOkN3ezGuWsSWeQlnwmc2a6vOtBKl
	1d7r148lgKHfJD1KJIeL89q2B5nQO4ZlNhyEyFv3zl6DZOROTgAGW064F3G5cfKWJy0k
	MKK+W25qnNbUgiGFWKasezuajc6qEYrH66edm6hX9M+JzhLXaaDEPLP+Ik5oAuZY7Iv4
	XPoOC71aku9zsB+Q1zwZIqasy0KwV5LuKO5hNOgHDLyTmQQTPt4svya5/GbCZLVJFn0w
	XI3w==
X-Gm-Message-State: AIkVDXLdVd945QuU4Uf2J+4JcNwHqusbQRlQjWZnzqegYYbyMLkaGuqoYV2jsJmyM+U/y8MpuvULSXPZ31lJfQ==
X-Received: by 10.46.72.18 with SMTP id v18mr3047023lja.12.1484136682434; Wed,
	11 Jan 2017 04:11:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.41.70 with HTTP; Wed, 11 Jan 2017 04:10:51 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <CALbNGRSOCgDRk+Md_FcJSGrdDjrTMoDw6mKcS-M39yx9hbg5ww@mail.gmail.com>
References: <1484074127-21458-1-git-send-email-schnitzeltony@googlemail.com>
	<1484074127-21458-2-git-send-email-schnitzeltony@googlemail.com>
	<CAAPZna1k+N+gbqb2n+fOLpmE6=RLasGku9rR7zebHvJRex-Htw@mail.gmail.com>
	<CALbNGRSOCgDRk+Md_FcJSGrdDjrTMoDw6mKcS-M39yx9hbg5ww@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 11 Jan 2017 10:10:51 -0200
Message-ID: <CAAPZna3QY9=4KbBter73oCrYwjC2d8Cs_gVoJwY_6aWGWm57sg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser][PATCH V2 2/3] firefox: use pkg-config to find nspr
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
X-List-Received-Date: Wed, 11 Jan 2017 12:11:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Yes.

On Wed, Jan 11, 2017 at 10:07 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Wed, Jan 11, 2017 at 12:57 PM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > This patch doesn't apply.
>
> is git://github.com/OSSystems/meta-browser.git
>
> still correct repo for meta-browser?
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

