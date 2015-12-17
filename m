Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9661A6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:38:55 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id wq6so42040920pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 04:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=Wrtz/IGonGd/Q1O74Ov+HfOgzCZhyvEsR7mVsp9bed0=;
	b=nZXRga2lxIo/288IoKrtLGr3EMCTdcpwON4H6QVuZw3Dowe52/ze7ejeGQnOSEp0/A
	k19cPcwe6R3TBUhVwKgzzvHDuscevBSlsSFVI5LyNbShyp9H9kcbb+eCC191BsHYQ4XG
	G+nBmUZdb7D6HCjIawgqpJ3MmOmdOIeoqJ/Ttr2WnPj1CYV2vD9O5Mpuy/Qyj4mgK4rJ
	L/pQ9ThMmiPjKzDKOGBMadmM4gE1iY6zbfaIjgRCNpG7Q9cQ9gOuBa7cP6Ouz/A0GEnR
	G51xWHd8aZyd1umlNsSIktVsJQnaqt0JFg2dAJIBf4KVVOdVpuQ5RgxlZzJqtXmdvWUa
	geqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=Wrtz/IGonGd/Q1O74Ov+HfOgzCZhyvEsR7mVsp9bed0=;
	b=IeF0eGDsxuXgW7DnJ+59bSWVyvX/JgTyK1/UW6OsTFaNvqiDqOxn5/9GzwK+Hb74EA
	gyvP+shsEfPWnwh14PDpUeBHexjMzWNYIq2287e8PoTTan+GAyrGaS+cgl7Os2ie1zZi
	3XWnq/u8YHVPV7LIOJ3U1kPaMczoz9IsxQ6Zauqcc7O23bWkftmeV0lTuyYY/C/d1qvR
	v5+qoq40KjFl9gpmHTPnOriukWZad67ULQBx/lEYB5FqYtC4a+c4nxfY50GK9rW4p7/7
	JaeoEzg0R6MyXgYESxg7pPnQ76AwvhZc24VJgf0DwhE2BmH6XoeT7sgoTz2g/Tjuws7f
	FVbQ==
X-Gm-Message-State: ALoCoQl4+9y4hUm/NNRtXvfnROk4n/UVqEWnxvyoSWIJZf2H3uoHOtmPDeIpI0ZLFmW2HtrS+uoFGjPPp0aW5C4pFTD/3MhsLw==
X-Received: by 10.66.236.229 with SMTP id ux5mr69464872pac.91.1450355935908;
	Thu, 17 Dec 2015 04:38:55 -0800 (PST)
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com.
	[209.85.192.181]) by smtp.gmail.com with ESMTPSA id
	rt6sm15779746pab.17.2015.12.17.04.38.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Dec 2015 04:38:54 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f181.google.com with SMTP id 68so30429020pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 04:38:54 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.80.8 with SMTP id e8mr13796720pfb.88.1450355934040; Thu,
	17 Dec 2015 04:38:54 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Thu, 17 Dec 2015 04:38:53 -0800 (PST)
In-Reply-To: <1450260223-19633-1-git-send-email-jackie.huang@windriver.com>
References: <1450260223-19633-1-git-send-email-jackie.huang@windriver.com>
Date: Thu, 17 Dec 2015 10:38:53 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrLR3CEgir5TgRstVA_we7AXLRBAgch165CmVDCUyx_Rw@mail.gmail.com>
Message-ID: <CAP9ODKrLR3CEgir5TgRstVA_we7AXLRBAgch165CmVDCUyx_Rw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] cacao-initial-native build issues on gcc 4.4
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
X-List-Received-Date: Thu, 17 Dec 2015 12:38:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 16, 2015 at 8:03 AM,  <jackie.huang@windriver.com> wrote:
> From: Amy Fong <amy.fong@windriver.com>
>
> The following error is seen when cacao-initial is built with gcc 4.4:
>
>   LOG: [0x00007f595fed3700] We received a SIGSEGV and tried to handle it, but we were |
>   LOG: [0x00007f595fed3700] unable to find a Java method at: |
>   LOG: [0x00007f595fed3700] |
>   LOG: [0x00007f595fed3700] PC=0x0000000000459a37 |
>   LOG: [0x00007f595fed3700] |
>   LOG: [0x00007f595fed3700] Dumping the current stacktrace: |
>           at java.lang.String.<clinit>()V(String.java:185) |
>   LOG: [0x00007f595fed3700] Exiting... |
>   Aborted (core dumped)
>
> Adapting fix from the following (add -fno-strict-aliasing to CFLAGS):
>
>   2009-06-24 Andrew John Hughes <ahughes@redhat.com>
>
>   * patches/cacao/no-strict-aliasing.patch:
>   New patch to fix CACAO build on GCC 4.4 (see PR129).
>   * Makefile.am: Add new patch.
>   * HACKING: Update.
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

I understand there are people which uses old toolchain however I don't
think we ought to add support for this on master. I think this
specific patch should be handled by your vendor distro (or customer
layer) as it adds non-needed code for OE-Core supported toolchains.

I am nacking this patch!

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

