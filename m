Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBB86080F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:37:53 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id f6so12388146ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 00:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZUSDq+fU4NyQ7XO0t8b8iTEy2wNRGq9w0TviJueCZTM=;
	b=E25Cd5tYHqGj7fYlAxj0lj+JIjR0Dj4w7iYy2anHm/l64XfmOYIfTkaxkGvfcPw7QD
	XJSHLIYfEn0B9MUhOJbzBM/rBY4F9EZfdFXTlRqYYRY7VqwnSHWZy2btb9qQdt32/fpz
	ybbTWN3cWnzH6PFDlXsrorVNbLjuEzN13yLacRXFr+EChrJUfWchEpm82xxd71wxpOS3
	AB03fC7xtZLqiHxwR8pWMkJoPfVfJgfpbcgodICNH1Hy64ZeN8WxEqa0SyfN1BMd1x/m
	r8WC7xozGPUjd5pO4MLc4Zp2mj9S5MWjFwWYwb8t8kBFmdX4MfzP5XL27t7aCVEQlUJ6
	OKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZUSDq+fU4NyQ7XO0t8b8iTEy2wNRGq9w0TviJueCZTM=;
	b=DkmisZ424PyqehMhd1WIS8wQIorz7aHZ4YixVi9PzjvWnio4azh7yVgDWRy/z9Xc1G
	Ik4FRWm3fV9K7qhbTeoRmJfzvyiIIl44iV6b4AwCvMQwfxHfvI5LDL+36ORpZpmVEhEt
	U3vC4zJ/SPaXiLnoLRgKzk3BC2rKmAYDFD9gkvzu4qnjozuUSj9JIN2hu3lSshZnekeq
	yT3/3o67NUNgZMv2fgRVPTAqLpVNmbIUDxGBIjkvSv07YxN2KFQnisvv/U9ZcjnnDX65
	N0LG0dS8IV3ZdzD19xqisJJvciIn6JVupOf9Cljp1c084mwpzPrGa4l1lZsfUnKLmaxI
	Ovpg==
X-Gm-Message-State: ALyK8tL/G1T6oJuPP9l0a20p9h6+T8ivnxf6UlMyfAqcEqcDRgCyAgC0F7mJ+1EUwK+YRXayJAm1juD8MhyNiWQV
X-Received: by 10.36.87.140 with SMTP id u134mr1005611ita.38.1468913874238;
	Tue, 19 Jul 2016 00:37:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 19 Jul 2016 00:37:34 -0700 (PDT)
In-Reply-To: <CADkTA4OMij4vsjGfw9Vwjh3ymGYkJDUsAKou6=hU7f0Yt05FXA@mail.gmail.com>
References: <CAJTo0LYNjoPfahXjaKEVP6ey=mY3MKDKK5DoCPB9Dp151UgFpw@mail.gmail.com>
	<1468880306.2228.69.camel@pbcl.net>
	<CADkTA4OMij4vsjGfw9Vwjh3ymGYkJDUsAKou6=hU7f0Yt05FXA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Jul 2016 08:37:34 +0100
Message-ID: <CAJTo0La3a32dQXSKZVCZCzFjX-C-kHYgHd5cAVfqDUxvz0JaHw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Phil Blundell <pb@pbcl.net>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [Openembedded-architecture] Removal of uclibc from oe-core?
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
X-List-Received-Date: Tue, 19 Jul 2016 07:37:55 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2016 at 23:48, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> But do we need a sharpened stake to make sure it doesn't come back ?
>

I was hoping for agreement but wasn't expecting such a strong reaction :)

I'll sent this patch shortly.

Ross

