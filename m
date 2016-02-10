Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A30E7317D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 17:13:38 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id 5so2167775igt.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 09:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=45KHoJgr8L8hB6hoQ/QnZBnnLaAA2zSrx6K5TkmVHFw=;
	b=ZuerAw7ZnZA2fMzU7VsIM15c4eqNoyEIK2d6Va/WbjO4bHtQJ3uStsHjsZrWJuARh/
	I7S01fHHEBsnzI941qLLWrjWLf47yFkONXG8rvcah3y802rkBY0pgLQ8cEJZXYCaCsmc
	1an6gqAwnbjqM1Tmtku71sGgtJhoFdjeffeidFbP+xRhDZY4KrPMJC4vdTqmuXd1a5C4
	K2wEyxXoFIOCzBv8vVBRgubXTWSCj9R979bCokii/bWGUZY6fadBdVn8cUpS625fae7o
	hedIKgwsfgAm3q6r6qvSoubnORxx1bAZXa5Gons31Lybecmfimk6AjUt7pZTd+vn/fCb
	zZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=45KHoJgr8L8hB6hoQ/QnZBnnLaAA2zSrx6K5TkmVHFw=;
	b=A/tXcB1MpauZNcaigqqgCrIRQn58q4EyygTlaxsKdBoy4+0/b/RzQzJ7v1MkkueMqf
	sQsvCOVU0F5USeYzScoE6numagj/+vn5dNL3IO5blB3E4ADLzvlAqzYTjvm7UE6vL1eY
	LJmOZYfvhFeIWZO8cxLmZfrwpz6EvEBcMdqLMoIVr58CpTkgkfunlQl3QI731TKMzRXU
	3tN6SqXKZxlCAplPgxkKxP1VsKPwbNMQAg5sOqh6zQrzhfUHYe7QcwGrzaw8cPcvZxJ4
	domC9dU4N/RqmwOsPX1DZ+2Muq2l6nfb/Mwndwb0+auQI30g9wtjfZx5n9NwexJof7NQ
	7UVQ==
X-Gm-Message-State: AG10YOS8RhSnPCZDbBZfPTnpN9fDBJg5I8QOYN5Juta3H160bBd8cFbW+iZxnBqfPnDfRdwR1E5bhFbtSC+kAA==
MIME-Version: 1.0
X-Received: by 10.50.126.8 with SMTP id mu8mr10716773igb.52.1455124419584;
	Wed, 10 Feb 2016 09:13:39 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Wed, 10 Feb 2016 09:13:39 -0800 (PST)
In-Reply-To: <1455115465-28799-1-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1455115465-28799-1-git-send-email-maciej.borzecki@open-rnd.pl>
Date: Wed, 10 Feb 2016 18:13:39 +0100
Message-ID: <CALbNGRTuRCbK8L_OZ2gReD8rYOcPTi66u=r=cv0irV+_6qp1iw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] lua: bump lua.pc version
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
X-List-Received-Date: Wed, 10 Feb 2016 17:13:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 10, 2016 at 3:44 PM, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> Lua was updated to 5.3.2, however lua.pc still has 5.2.2 listed as
> Version.
>
> Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> ---
>  meta-oe/recipes-devtools/lua/lua/lua.pc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/lua/lua/lua.pc b/meta-oe/recipes-devtools/lua/lua/lua.pc
> index e6f8b6f096dbcf578665699d2e3570dd22088d40..f14d227543c04189c5c31cd2c2737ac68933979f 100644
> --- a/meta-oe/recipes-devtools/lua/lua/lua.pc
> +++ b/meta-oe/recipes-devtools/lua/lua/lua.pc
> @@ -4,7 +4,7 @@ includedir=${prefix}/include
>
>  Name: Lua
>  Description: Lua language engine
> -Version: 5.2.2
> +Version: 5.3.2
>  Requires:
>  Libs: -L${libdir} -llua
>  Libs.private: -lm
> --
> 2.5.0
>
Is it possible to 'sed' this based on PV so that we don't need to do
that on next update?

Andreas

