Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCF079BBE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2018 18:43:14 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id e17-v6so33083237oig.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2018 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MRsTndWdwhj2L/7ak+JSEE6XDglg0RApV/0O4eY5G3E=;
	b=AMwmmWmWZ6+Q7kfLY9RPw4hT+FQLApP3olxvS3sQW7Pl9L06xcAYUwvy8vK+nBbnKd
	HBzeV30A2wyP8DehxreeFLGPCiK3N2t7TUO32n/xjwLH9GApjwCFUMRVItRNZXc0QxXP
	Ea2agwtvF5MPf6SuIqbopVjn5TyQ7G1A9V2RvfhNMjn7xmSUpBuwx6t2OULAcUqJKeIK
	86OeVzADsbT9Gh2adASlpqW3tknQD8ApxO+hz2fld1Ejw+ebHYhFXuWJAT+njYq7rsff
	xHZj2AUCdFppb5aP63ZSe8Hr3TCWSjaObaW9WwWCSRUFAfm34tVo6MhoiRR8YEH8/Z/s
	3gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MRsTndWdwhj2L/7ak+JSEE6XDglg0RApV/0O4eY5G3E=;
	b=JWRhL1fB8g+qXIx+bzxKCkPUDNUWicSjFOFqxGUKZk3I8Nj5g0xlppJTvjCLJCatC+
	u6jUBsx1EYWiSF0t6OtDWGO7n3HcgH1Bqg791bRleu419DRfUCcZcJyM4a+iZSndUOUy
	Ar8F4GsSkxX3gR+Lf495Ku2Pk53kenQpqYZDQgkSoqngElpGjVOpkeyPJI3J+h0Wv/Wd
	q835rnO9kNgV6iaFQ6GPLIpLm/FOqN2GWGPD7iNtJIp/yEeKazUlQVtRnuUmepVFOAxp
	689sz13AsPTItBEAoMIkhZxw42U7MmNiuCYrne/GNbxsvHhoYeaxU8YICILN+REsfIXs
	XV8g==
X-Gm-Message-State: ABuFfoivKdchWstalJbcl8lrh8rmNo0kcrokyCvlI5AIowmMGCtRT6U+
	e4PoRAS7Udiaz/mNYs/MPjPFYTxR/UHydMZATiA=
X-Google-Smtp-Source: ACcGV61Hxo7w19a8jcwPE/7KhzqbsH4cRYixIuUWKs1J4E/9zRGs3lJ9oYBgz2GZUp3xS+AReIpXHzEXF/CjwdLn/8M=
X-Received: by 2002:aca:dcd7:: with SMTP id
	t206-v6mr23413114oig.20.1540233795305; 
	Mon, 22 Oct 2018 11:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <1540223197-8004-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1540223197-8004-1-git-send-email-akuster808@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 22 Oct 2018 20:43:02 +0200
Message-ID: <CALbNGRT0S2qvjOZOXV53PdKFkuJmqF0E012bbpR56N6UOD09iQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] blueman: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 22 Oct 2018 18:43:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 22, 2018 at 5:46 PM Armin Kuster <akuster808@gmail.com> wrote:
>
> Nothing RPROVIDES 'thunar'
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Again if thunar is the only problem, that belongs to append in meta-xfce.

Andreas

