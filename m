Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 50E1C71C14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 11:26:13 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id d124so178768vkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 04:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=T5Upmsj9A3uvL4UO+QwJzG0c8K9TtZOIMlEgWz5PqZk=;
	b=h4KAEJ/qLjvvVh/UqAtU8ToomYNPMeQoik4VQ/79rWWtrR54HpBHpEE03rO6Zm7JIG
	laOanFUmfSriVG/lDjYZxn99FBvB0cssKKH5Lz9Xto1yaVOST9U8UCRJaAIVK82DtzP8
	OoW2BoLx+VmRwiaUUveVpsxrV60x/WVDRogRfRq38YaYAU6bz033NWPg4bkllicdv2bf
	Y4GCDqOmmYuE4EgljRaAI2kjEv6cX0Z9R46ZlVhMmMfD8XhZ2U1EurIeerDFiBvwIkec
	ZZyl13jLfTD4MV8sdj6pclm+BVU4aoWAdixFJG8xOxwhJ4X9MfXBn/dIbTI6dnbQGonR
	WX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=T5Upmsj9A3uvL4UO+QwJzG0c8K9TtZOIMlEgWz5PqZk=;
	b=IhPwThSHWlEWVsST4MyLO7fylYF5nazEMpBxlxsY9We+yMDIjgq7vDUMMS0C0W7b7z
	Qro6mKBLJOgtTf34qG5nOBGpBlOX5Y3oXTz5OifaV2MsXXJkV5t6SBF+zkdhsq7kol//
	4oF1MH1lhtl93aopRWzSdBuqg6oGZZ/cdo5AjvkGS56bcUVWS55n0NRKonn6Vk9SKgKc
	wB+kItwFoajwJzIoVS1Bf2XwgbI4aroT8NKvl6GxABUkHLKb0gNoaheVRJLtnOYBpRrQ
	JTQvZ292Z0+gFzi0NfV315ag4TXtZzyLvy29QuFnhBHbfp5jlOIDw8vze+8IEQgfvbDM
	bt1g==
X-Gm-Message-State: AHYfb5hdmlg9IccRZH/z4fjBTVP15Hwd9A3UDHYfUowz+MICwLR415rv
	6CvJ2Lp8NF20MeHA4JYX/n+zNMUXqw==
X-Received: by 10.31.26.17 with SMTP id a17mr4035085vka.159.1502364373452;
	Thu, 10 Aug 2017 04:26:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.64.100 with HTTP; Thu, 10 Aug 2017 04:26:13 -0700 (PDT)
In-Reply-To: <20170809063259.373-1-raj.khem@gmail.com>
References: <20170809063259.373-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 10 Aug 2017 13:26:13 +0200
Message-ID: <CALbNGRSdrYSDNQBa1whHaRFFQ8hfXo_g8SQ0H_jRBNahDMWD7w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] qtwebkit: Backport a patch to fix build with icu-59
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
X-List-Received-Date: Thu, 10 Aug 2017 11:26:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2017 at 8:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0004-Fix-compilation-with-ICU-59.patch         | 92 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qtwebkit_git.bb                     |  1 +
>  2 files changed, 93 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtwebkit/0004-Fix-compilation-with-ICU=
-59.patch
>
Tested-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

