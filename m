Return-Path: <leo.yan@linaro.org>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4714561144
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 03:56:42 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id u12so4405930pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 19:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Guhmj4nt3mSJY6Alx4rMM7dbkQSr03P6Yd+oioZNNks=;
	b=zQw2d2G3SXSqlKecKpUzjJ/urbPuJ8K/iTvEdcYs0TXgofg48bgsM0LO2iYo+DMzvf
	V+Mx0kedKrXh4+Q0+0qUb5c4UVTjRfkbUwxvRCd0e+/T7V7gjG8bWF1EnKfItGQHcIku
	+16sVxbiEVZ/eZ/Fl8EBn9x8XHf3WlAf84cUoR2EhK4SIbrUGrSFUe3hgZIjc6damFgs
	jSxC7jw3wUH4oUca6iW8If3xAnm5Vi3jToMDT72Qk9lDDl1eySaJJNvW/qKJhBk2qkzo
	zCWA562OMANDaGBjf2Be1GWpeZw9LLyANwmvV3sC2WOcP1kxCSQswEi5HDHeLh4zmVMc
	liOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Guhmj4nt3mSJY6Alx4rMM7dbkQSr03P6Yd+oioZNNks=;
	b=Sqfu+twv23B79TupQSCCjOGgzTqNkCMuR7uo4FNf8P8qdlPDiOUmlNfyJb2zjnu6GR
	9s39nU5Kz5BS4yJ8WOr9hmQyI3Sktu166jtdNPaE8r71E9VSkl7LU6BphDe2N8x74yYz
	fhs2mDAZj1x2VjE+ef4LBb0UgQeaJNXciNSeb6q75ao5z5z4xiKpIIdhIy8xiHG7GU8I
	UjKjqHOH4BmuhDVI4224fxIVpe78tDs7mZgTcob1HzYPLWDExL5oFncw7knw7HSLN3FP
	7PPhlpltP456ZTFQ1TiELroXfwAYjeuBQ7R+Dg9cxHjYPY2GFeiEcGYEPfEyk894OWH7
	d1Gg==
X-Gm-Message-State: APjAAAXnhU2y34yGkG1SIpfiaTaV5eh0dCx1m5jhb7HBk+421mGLS793
	rCWt9+QY2VKlK/ZIaujozmTLng==
X-Google-Smtp-Source: APXvYqzdx2BDuxnnSeznsvfcuJO4D9SVT/op8euCBlYNn5nG8dpcoVMLxmirII3xY2L35ChZzTR1nw==
X-Received: by 2002:aa7:85d3:: with SMTP id z19mr49908630pfn.62.1582516603234; 
	Sun, 23 Feb 2020 19:56:43 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:32da])
	by smtp.gmail.com with ESMTPSA id
	g21sm11292621pfb.126.2020.02.23.19.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 23 Feb 2020 19:56:42 -0800 (PST)
Date: Mon, 24 Feb 2020 11:56:36 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200224035636.GB5175@leoy-ThinkPad-X240s>
References: <20200223053549.7056-1-leo.yan@linaro.org>
	<3e126d8b-ed9e-3e5b-5fa7-61e043c10355@gmail.com>
	<20200224011017.GA5175@leoy-ThinkPad-X240s>
	<CAMKF1sq6aiSaL5a9BR8urL0=Yd4=CBB=kPFMBE4tY5Ub4h1veg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq6aiSaL5a9BR8urL0=Yd4=CBB=kPFMBE4tY5Ub4h1veg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Mon, 24 Feb 2020 03:56:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Sun, Feb 23, 2020 at 07:47:28PM -0800, Khem Raj wrote:

[...]

> > > > +PV = "2.1.0+${SRCPV}"
> > >
> > > I think we will endup in trouble when 2.1.0 releases, so perhaps we
> > > should leave room for  sorting 2.1.0 higher than whatever we do now
> > > perhaps PV = ""2.0.5+2.1.0-beta3" would be workable.
> >
> > This suggestion is fine for me.  But I have some concern for this since
> > the naming might introduce confusion when later someone reads this
> > recipe, which combines two different versions together.  So seems to
> > me PV = "2.1.0-beta3" is more directive, and it can reflect the exact
> > version for the building.  How about you think for this?
> >
> 
> The version scheme has a purpose and that is to track package feeds and
> they can not go backward for obvious reasons
> 
> The suggestion I had for you is commonly used in oe  while it might not
> look simple and clean it serves the purpose

Will do it.  Thanks for explanation.

Leo

