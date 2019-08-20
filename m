Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE567ED62
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 20:12:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Chlj5wVTz4V;
	Tue, 20 Aug 2019 22:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566331923;
	bh=Ns0Qj9d8If+vi1EGAaXuMnrivc5voTgg/XC4AIpg2/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KoP48JIqwhZdlZyAan3NKj4Nmh8Tv81MjRUjGNHV+Bh7K9tcrgrdkotvZDnPYjmk1
	fxqmEQ7X7eNlvSi7EubyElgdlqd0oExjCBuNnlHXCce6YQjIWaEWYzmje637kkHACD
	FNFND48QeFiOiG0tak5VpYtsDgevR9CstxcpAhy2oYtxL+sOA5gFy9vTAYCgBZ5Oz9
	lAxy2mCzMvsjStRtkxHFE1gbKMogaieC6moqCrSci0faxx5M1XyF8WLrVSjEzTJAJS
	7IV5F48WxuNUWA8Bw3Bp92u8Ej+GqWNFcP8XyPP5+cSZikyofk0B0sUdZByGA2BIwL
	GqNtWciD1RCVsgZUnhgyOwUH1qJD3mdjYE8QK4NbLlRMiwNUfftVe2b4cClRhR0AMi
	vFCzLMBN7Nd43vG/HG3C75aOAjSWg1soMiGgbGykw6J1sowpx7qsQG45M/ZTNuc/G+
	99dMMC1loYqfqZhaJWR9XTNd7Eppy+BED3c4tJZG/YCkLXKt4FjlhdATnHwYc7T79G
	xHlN3IM8WVzKTn3CYa9yzP65SZ5r9hywDoaJdCn8c+lQmHyAqUI99DMlyu73uxdU14
	P+hDCqm7AU/vFojlsUH5B3G9I4iqFndlPp3l78KB05Q8fO3892tLihnu16I+wS5qqW
	7HPfLxVquncYnCg8qoYTJqDc=
Date: Tue, 20 Aug 2019 23:11:59 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190820201159.GA4592@localhost>
References: <1566293810-37527-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1soZbx6HH9d4Rhe+RpqYgiBNxpGkYu84LGaY7m+9=WahYQ@mail.gmail.com>
	<20190820164438.GB24268@localhost>
	<CAMKF1sqqUo3haTA8RpCd+8bLb2rw2OKJjVVVPk+tbPhS--tDnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqqUo3haTA8RpCd+8bLb2rw2OKJjVVVPk+tbPhS--tDnA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poppler: compile with -fpermissive to workaround code diagnostics errors on armv5
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
X-List-Received-Date: Tue, 20 Aug 2019 20:12:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 20, 2019 at 09:53:11AM -0700, Khem Raj wrote:
> On Tue, Aug 20, 2019 at 9:44 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Tue, Aug 20, 2019 at 09:30:36AM -0700, Khem Raj wrote:
> > > On Tue, Aug 20, 2019 at 2:37 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
> > > >
> > > > Build on qemuarmv5 failed:
> > > > ...
> > > > |poppler-0.79.0/splash/SplashFont.h:69:36: error: passing '    const
> > > > SplashCoord' {aka 'const FixedPoint'} as 'this' argument discards
> > > > qualifiers [-fpermissive]
> > > > ...
> > >
> > > I wonder why this warning only shows up for armv5 and not for other
> > > arm subarches or
> > > non-arm arches.
> > >...
> >
> > https://gitlab.freedesktop.org/poppler/poppler/issues/821
> 
> I see. This makes sense now. I wonder if we should just disable the
> support instead of keeping
> it dragging along ?

Patch sent.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


