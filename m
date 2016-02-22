Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 39B6D77142
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 12:01:45 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id e127so92039883pfe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 04:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=LDTvHS+wyRVolVb57vtQ1R+hBpMr8Pjadu6rEJK/W3s=;
	b=Bpskrcc0tbsAAoJ1zDchy5lYFsm6jVLhyF8mnVvdPkPJWOOMi4zPQ9wgVVndOvCfeq
	bkiX/OAcxP7OUAHiPHrJgdFoAg927q46y+32uuol91WZQaHFRRo4dLT17xemfTgduxBM
	a6TrRupb98iMF9ciUBzogGupYkYB+u40fq4QVosA5z66fkkWwayt6PUi3B1LbBncj0Rs
	yvS/tWGQbK6gnRbokSjjMrYhWW2xiOZS7tXeqq0FkdRCUIjkLPmkcHkmYUwFGMd/QQyC
	7OPsNam6lqAqhanAQfLF1Y37TzR70QOLOzJs98Pd1w5aL7OZBFqidaZI84uzE2w/OWVu
	zgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=LDTvHS+wyRVolVb57vtQ1R+hBpMr8Pjadu6rEJK/W3s=;
	b=g9nEESEyfGlaXPrchSyV6hG9VS/BjZEDqp30F+9bBqxx1SVAKGJ+ST94Zo1tSF066I
	k+MCLlcTA7tAD05bf2sVu255WwQlHy95A9DIKhi1vc6KJT9n40bYSHzwu3gYjadzy1kK
	XHp4lYA5WnoLKpo9Ybw2cCOZoqVhq8M5txqb+U47FJDyf4Hg6nb5KsbAOwC3ukr3ZICg
	ujvoC8EqTSByQ/cvxJ1WTSGl7dfMHfTciVRg+Vdde7WwBwia2CxN5QVqkXZc91DIe9Ct
	LyiFgj0v6Pu6o/eQriX4JFvrb4aXexL7cAwCxM2RZBjkxJ0uubjo8i6sRuj9riraROf9
	oHhg==
X-Gm-Message-State: AG10YOQ6431UkP9PevQHDFSswtkR7duH+QbcgOi1dg2BRSpyGRe51U9fbZ5Sv8tBc0fgow==
X-Received: by 10.98.74.93 with SMTP id x90mr37183534pfa.80.1456142506597;
	Mon, 22 Feb 2016 04:01:46 -0800 (PST)
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com.
	[209.85.192.175]) by smtp.gmail.com with ESMTPSA id
	o17sm36424880pfj.50.2016.02.22.04.01.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 04:01:45 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f175.google.com with SMTP id c10so94904548pfc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 04:01:45 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.93.155 with SMTP id n27mr37422926pfj.88.1456142505002;
	Mon, 22 Feb 2016 04:01:45 -0800 (PST)
Received: by 10.67.3.163 with HTTP; Mon, 22 Feb 2016 04:01:44 -0800 (PST)
In-Reply-To: <20160222100451.GA5300@ad.chargestorm.se>
References: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
	<6E3439D2-FEE9-4286-88C5-0D7E3E2AF4B2@gmail.com>
	<CAP9ODKpXkzdSki8exzpbge08Uns1M3rQcc2C1UTPGpuA-WUKOQ@mail.gmail.com>
	<20160222100451.GA5300@ad.chargestorm.se>
Date: Mon, 22 Feb 2016 09:01:44 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpAy8MR9S7B07xSG0QNuK5TvGX=yotueUpsAhexqdk+tg@mail.gmail.com>
Message-ID: <CAP9ODKpAy8MR9S7B07xSG0QNuK5TvGX=yotueUpsAhexqdk+tg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Fabio Berton <fabio.berton@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python] Python Flask recipes
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
X-List-Received-Date: Mon, 22 Feb 2016 12:01:46 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 22, 2016 at 7:04 AM, Anders Darander <anders@chargestorm.se>
wrote:

> * Otavio Salvador <otavio.salvador@ossystems.com.br> [160219 14:32]:
>
> > On Fri, Feb 19, 2016 at 1:46 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > >> On Feb 18, 2016, at 10:33 AM, Fabio Berton <
> fabio.berton@ossystems.com.br> wrote:
> > >> I noticed that a few days ago were added some python-flask recipes.
>
> > >> I've been maintaining a layer with python-flask recipes, hosted here
> > >> http://code.ossystems.com.br/gitweb?p=meta-python-flask.git;a=summary
>
> > >> There are recipes in meta-python-flask that were added to meta-python
> > >> and I want to simplify maintenance and avoid duplicate recipes.
>
> > >> So, do I send recipes from meta-python-flask to meta-python or we
> move all
> > >> python-flask recipes from meta-python to meta-python-flask, using a
> layer
> > >> only for Flask web framework?
>
> > > Here is a hierarchy one can envision
>
> > > 1. Core python runtime support - Oe-core
> > > 2. python extended modules and infrastructure - meta-python
>
> > > now if you think this framework is quite commonly used and is kind of
> core
> > > to python world, its fine to have it in meta-python, if you think its
> > > too specific then move the common packages to meta-python
> > > and maintain it as a separate layer
>
> > Agreed but this is a specific framework which is not 'core' to python.
> > Do you think we ought to merge those on meta-python or keep them split
> > out?
>
> I'd lean towards merging them in meta-python.
>
> Currently (according to the layerindex) we have python-flask in:
> * meta-virtualization
> * meta-uav
> * meta-python
>
> and if I understood your other email correct, there's also your
> meta-python-flask layer.
>
> I'd think that this makes flask used enough to warrant having it
> directly in meta-python.
>

Ok; this is indeed a good justification.

Fabio, lets send the patches to include the recipes on meta-python and also
for the other layers to remove the respective recipes from them.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

