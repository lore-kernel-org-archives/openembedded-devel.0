Return-Path: <leo.yan@linaro.org>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1205261602
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 12:52:45 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id d5so2827910pjz.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 04:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IuQxFGtbC9m7kOF2Oym404cL2K5himy5nKtQFJKPHmQ=;
	b=fusRhKmlzeQEqMG65Ximi9a69jQSS4WilNbcwzeaREAMkmRYJB0EDeA0ZMNBKLn219
	TQhktJg3SbeeiPeXsKFM1AWz1dYH0IMCisn7VzHbRMgKHDnARBwYgtW0nqc0nJ7FknYY
	IIe7APxzNuJaOp/id945dhE6CI/kG2Ft2qzytgoGfJDYAABuDyGcPbpMhaj84wMoJ4BI
	TWG59QJf/SZTNyA9BkshkwvPu5eQnJzdOOezPU2o8/3dd/BzX/VErduyQsQMb+wydlr8
	/u6xnKnlXidpKOoxoYvgmw7g//aE8AI+QQgdzWMn4p3XLGKjFcIS/Zui+ldpVP8lmy2O
	zaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IuQxFGtbC9m7kOF2Oym404cL2K5himy5nKtQFJKPHmQ=;
	b=aARmk4r1G3xklB/hHJGVs2xFxxHYAVJ0/zgHLnUg2oPH11u/QT2zRqlVVrCCCqHbQ4
	GqF/xtWVB8tPXeTGWRQoKjlb10P/WASX0wM2ATNp2uvEVS5UEUqA2dCjJqW0dVOhurOU
	BkcEg1A6dIsc9Iox/vo6XSDC5F/M0sLZ2kq1mYcR5UtMJZN7jaaizPDa6bOSopv1VuAa
	u/frGAsS9FGdb7RwQ+vu5PAeJI+d2//oQA+XRGDWS9PZ/tI1IzmWiOHmTOyBUknKSo7y
	T5DHpMdKsZx9TV0Xi+SBwQOZ1YgQX9MMTrdFuhXcuBAXFnBGbMF7d4wY4WjeJEsKFs3W
	M0iQ==
X-Gm-Message-State: APjAAAWMzdz8MuDKITrPKfvUYVdeUQS5aDGkTKN+jZA/pjCuI68crylL
	Lco1Vept5eh7fij1CZf7i4vuRQ==
X-Google-Smtp-Source: APXvYqz4d28DLlKCxUxyQ9arOMqTW+3ElF4Km0JYTmz24SJWQzShFqxU7iKmXA2Wc+j2POcE6TvTsw==
X-Received: by 2002:a17:90a:d78f:: with SMTP id
	z15mr14670767pju.36.1582462366923; 
	Sun, 23 Feb 2020 04:52:46 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:32da])
	by smtp.gmail.com with ESMTPSA id
	o14sm8745972pgm.67.2020.02.23.04.52.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 23 Feb 2020 04:52:46 -0800 (PST)
Date: Sun, 23 Feb 2020 20:52:31 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Message-ID: <20200223125231.GA22823@leoy-ThinkPad-X240s>
References: <20200221104340.21294-1-leo.yan@linaro.org>
	<CAO5Uq5QWcpy11_ibDE-nFJQpakdXEwE8GJZn+SGJdxPx4Bgm5g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5QWcpy11_ibDE-nFJQpakdXEwE8GJZn+SGJdxPx4Bgm5g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] Ply: Add recipe for git version
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
X-List-Received-Date: Sun, 23 Feb 2020 12:52:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alex,

On Fri, Feb 21, 2020 at 05:08:22PM +0000, Alex Kiernan wrote:

[...]

> > +do_configure_prepend() {
> > +    ( cd ${S}; ./autogen.sh; cd - )
> > +}
> > +
> > +do_configure() {
> > +    ( cd ${S}; ./configure --host=${TARGET_SYS} --prefix=${D}${prefix}; cd - )
> > +}
> > +
> > +do_compile() {
> > +    ( cd ${S}; oe_runmake; cd - )
> > +}
> > +
> > +do_install() {
> > +    ( cd ${S}; oe_runmake install; cd - )
> > +}
> > +
> 
> Can't all of these do_...  steps be replaced with `inherit autotools-brokensep`?

Have tested with 'autotools-brokensep', it works very well for ply
building.  Thanks a lot for this good suggestion!

Thanks,
Leo

