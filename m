Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id C264D78975
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 15:10:14 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id c24so5561266wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CwBIkD6VWG632xG0Mpkv4VLfgLh1tF5OIbODHdZAsS8=;
	b=jMv3obIW8j//BQzdDjf8trykH/ZrV++W65DErLyqZTRqI+WYlmf19CIopMw86Hhsp/
	XhU1Kn5Pv6xe1FSIxcZhNG5pqzvdS7HJIdGK2CKax4pOdURdOIWtMEK5qIpGGck7to5p
	FqayPhPZ5M5JqvxqtOIDxWWlb35X2lJNcsqkWrYtRpKJd28ySPamCjsa4XFvFQth05bU
	sOKi5xMN5wguczQ8RPQZQgCLadHQ4UBW2MKA1324JHJQCOdWM2WvvsE/eyNrEyEE1Lo8
	cemfe8lmP7b7Y/v4CKisRp7EQK3eqQPe99/nyItSW0IyTq7uVOTmcmrwkQG0veAMeywG
	el3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CwBIkD6VWG632xG0Mpkv4VLfgLh1tF5OIbODHdZAsS8=;
	b=GS5fe2O1lQpW936t5Zufo8O7w3YP6Gm3NoJevKa4Mrk3nFAa2Gcx4d3DiWT27C/VQc
	vNzBjKjMJmI9D08PK1o5oBuNrs1dL+6XpszgTciCahcfE/j/phzAtNZJo7+zMqTszRHw
	azvBMSIboAZXmk8mrDxEXw/unS9CKwpp3duV6YJxXRg3EC+b/a1/jr8aV58152KxrZYw
	aya02vIJSVESzk9UFvQo2vhuzN/5e7tQCQAib4Kby7ushnSekZewYXFX14FDnIbwbOh/
	sndUTWfvf5wDh/8Sg9J4MONV39LFRVovZKiZK6CM5GIxQJOUwo+ISBiirNiV9uE4Y5eO
	HGYg==
X-Gm-Message-State: AElRT7FEUzuVItE4883PQd7CCmvA06HxwNlnaLlZpZAVVdhPwfxzTfjJ
	RUmtHqyZGfaNosgaGk2h7c6RBz1R3S0IjP/KWmk=
X-Google-Smtp-Source: AG47ELsdYi1bvDO6HRob7bfwnXywrPxYnuJO4jfoqKGPejiGvXE04cJTjivx+YcDez0lrfusiafTPBTeATtmlt2Hf1o=
X-Received: by 10.223.189.14 with SMTP id j14mr5523103wrh.138.1521645015473;
	Wed, 21 Mar 2018 08:10:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Wed, 21 Mar 2018 08:10:14 -0700 (PDT)
In-Reply-To: <1521641775-2171-3-git-send-email-akuster808@gmail.com>
References: <1521641775-2171-1-git-send-email-akuster808@gmail.com>
	<1521641775-2171-3-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Mar 2018 16:10:14 +0100
Message-ID: <CA+chaQc8wWibtJ1yAV3wvR5q7T85qfVpafpGVbhAzLqV9eOFww@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "akuster@mvista" <akuster@mvista.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/4] libxml++2: remove X11 distro check
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
X-List-Received-Date: Wed, 21 Mar 2018 15:10:15 -0000
Content-Type: text/plain; charset="UTF-8"

You can remove distro_features_check inherit as well.

On Wed, Mar 21, 2018 at 3:16 PM, Armin Kuster <akuster808@gmail.com> wrote:

> looks like its not needed.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-core/libxml/libxml++_2.40.1.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
> b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
> index c3d647c..a38315c 100644
> --- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
> +++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
> @@ -18,8 +18,6 @@ DEPENDS = "libxml2 glibmm"
>
>  inherit distro_features_check autotools pkgconfig ptest
>
> -REQUIRED_DISTRO_FEATURES = "x11"
> -
>  do_compile_ptest() {
>    oe_runmake -C examples buildtest
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

