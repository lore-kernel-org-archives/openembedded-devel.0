Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6E60276710
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 19:34:06 +0000 (UTC)
Received: by vkex70 with SMTP id x70so12219833vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NbxCqcUi5+6vSiaCMPKXvDxF0TKv/xNiNuXw33O5SJs=;
	b=BYYj97VttEI9z0EJ3vEggzHQ7IZku6mxzP3Mj6wb6yjC9A3f4w3/4bAUVSymIny7w2
	2vIDokCkuEa1WRYh6Z/lqJ7TQ5mN942whl9H0c9S/l5ltpVr+/S+XdvMD9WsSbcoJwLC
	NBoVPMUoeKmtss8q8MmNtjtmANfYhLIO6PzTO0I8i2UAvfo9LBmFfpoXvTwb5IsZmUe5
	RWh6iYzSKhkqXBLpzT6ktB+dluFb6jR+/m0aN4txHRKeBdfCtERvTe1+3aHFGOfyz425
	2V9GEk5z564QOnhP2soBWIPTWti87Ul3pzAGPs4rrsJSUjpElmKlq6sKfc/syr/o/B6p
	pKtA==
MIME-Version: 1.0
X-Received: by 10.31.141.130 with SMTP id p124mr33214811vkd.44.1446060846779; 
	Wed, 28 Oct 2015 12:34:06 -0700 (PDT)
Received: by 10.31.237.197 with HTTP; Wed, 28 Oct 2015 12:34:06 -0700 (PDT)
In-Reply-To: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
Date: Wed, 28 Oct 2015 13:34:06 -0600
Message-ID: <CACS+7ZR3ok=Dh-ckPXwYVOjVVprkU30TPP_chAtAfCQ5LioXgQ@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Wed, 28 Oct 2015 19:34:07 -0000
Content-Type: text/plain; charset=UTF-8

On 28 October 2015 at 12:01, Jens Rehsack <rehsack@gmail.com> wrote:
>
> This adds openjdk-8 for native and target builds and allows a stripped
> openjre-8 being built as well instead of trying to cherry-pick jre
> components from jdk-image.
>
> The recipes allow building openjdk-8 with or without:
> * x11
> * cups
> * alsa/pulseaudio
> and let packager enable unlimited-crypto, if desired.
>
> Since there can be only one PROVIDES for virtual/java-native and virtual/javac-native,
> move the provides to openjdk-8-native (I think everyone agrees it's a better
> choice than ecj-bootstrap-native).
>
> Plus: Applying a fix from openjdk-9 repository which fixes build issues using gcc5
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

My biggest issue with this patchset (I haven't looked at it too
closely yet, but it does seem to work) is
that the new recipes and recipe include files have inconsistent
whitespace. This matches the openjdk-7
recipes, but I'd rather not see it perpetuated with new recipes. How
you feel about doing a tab kill and
using spaces?

< snip >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

