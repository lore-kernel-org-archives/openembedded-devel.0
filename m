Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id D92CC7E553
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 17:29:01 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id w20so3522396edd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jun 2019 10:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5T0LBYcBsxnyJwc9ilCZtMiTQyXXEzxOztqboBm+LhI=;
	b=JveoAgcQzhSguMsRoZm0sC2ULx/SI7o1iKchQfKBN4ad5Lt5TuktPIX5qd0IC7LqDH
	kh6xLN2mqCX+rxnN56vHuNlwJppaAYPgf7pI7YxG146DWtMrlJvQdoTYqQL+3tIw6B3n
	U7mGynVle15Jy9edoYRPfoF5PDx40pI8I8fvcG5d7/hX8RImUseEcN3SZVBWdzJqyujx
	rwLFJe69rpS7t+rsj8q3p8kD3V6+9r/TGMwCxx9LluIhO+RL4AMXoic8hTLuXmcKKPPL
	sIeungzFzzpmWIXQnZOoppT2RTv7yiXtknolxkw2y6VDnLQowbS2r4KPforAnOGLJcla
	KJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5T0LBYcBsxnyJwc9ilCZtMiTQyXXEzxOztqboBm+LhI=;
	b=Onb66x0SrSd4w3kCgJKjIQrH5hnq9Notm8tXu164C8gRmqTsKLTp9zvG4uQXK5pT3C
	p0QbWVsreZSvMwRcJPYs6sCAjd9b29VsVwnQnRmqUedcipaPUDFLSnQqTIX31C4jDn0A
	Yr7UZvFB/cUZNQ1zWjApEdW85gMt0KA49U4dMXwe9PBHl4WHeWvTX+73pbDhN8+HzHHs
	pKcA/ka5i5cLivAfVlfJMtEw5K6AVHzTlH083l7sknzXtnYx+nDKm9p96ANDGj9WkuQt
	y+m53gyfhZcJZiB8Ujh8PQf+9xet6vz83rKLD2m2xeEBdbZjsin1hXbjv6XRYNl8Q43E
	M9MQ==
X-Gm-Message-State: APjAAAVi5JsyGP1ODlA5Y4jDMAKv3hoXjcLCL/O7sAgcCI6zh2XH0xaL
	xj3WMrzUGyYcyeinRNO5b37lue3i1KmDhqbvpno=
X-Google-Smtp-Source: APXvYqzzDi59id5Rr5oHO9oWU7hgPadIWTgVTTOFAcOT+3i02z8vuZyx7U0C39e4XU4ZMbrf2MEFEkuL+yWRjrnB1xA=
X-Received: by 2002:a50:8be8:: with SMTP id
	n37mr126817606edn.216.1561138142627; 
	Fri, 21 Jun 2019 10:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190621151424.25736-1-ankit.tarot@gmail.com>
In-Reply-To: <20190621151424.25736-1-ankit.tarot@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jun 2019 19:28:51 +0200
Message-ID: <CA+chaQfj9RQPmPKKzw-uzNTy9xPh5euJ6yFBt3bAW9W9h_uDuQ@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] safec: Remove aarch64 from COMPATIBLE_HOST
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
X-List-Received-Date: Fri, 21 Jun 2019 17:29:02 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW: I've the same commit with "slightly" longer commit message in
jansa/master branch:
http://git.openembedded.org/meta-openembedded-contrib/commit/?h=jansa/master&id=ec8d03074c65ce1dfa90b740f2b074086371139b


On Fri, Jun 21, 2019 at 5:14 PM Ankit Navik <ankit.tarot@gmail.com> wrote:

> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  meta-oe/recipes-core/safec/safec_3.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/safec/safec_3.4.bb
> b/meta-oe/recipes-core/safec/safec_3.4.bb
> index d55d081f346b..b4c125faf433 100644
> --- a/meta-oe/recipes-core/safec/safec_3.4.bb
> +++ b/meta-oe/recipes-core/safec/safec_3.4.bb
> @@ -10,6 +10,6 @@ S = "${WORKDIR}/git"
>  SRCREV = "62e6b2df55084316d027165d286e46beb40513dc"
>  SRC_URI = "git://github.com/rurban/safeclib.git"
>
> -COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm|aarch64).*-linux'
> +COMPATIBLE_HOST = '(x86_64|i.86|powerpc|powerpc64|arm).*-linux'
>
>  RDEPENDS_${PN} = "perl"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

