Return-Path: <robert.joslyn@redrectangle.org>
X-Greylist: delayed 26246 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 14 Apr 2019 23:35:07 UTC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
	[217.70.183.194])
	by mail.openembedded.org (Postfix) with ESMTP id C4ABC7D913
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Apr 2019 23:35:07 +0000 (UTC)
X-Originating-IP: 64.126.170.184
Received: from [192.168.1.114] (w170184.wireless.fsr.net [64.126.170.184])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id F1D0D40006;
	Sun, 14 Apr 2019 23:35:06 +0000 (UTC)
Message-ID: <09fe191bae6b2634f6cf4137ea4326b011e78900.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Apr 2019 16:35:02 -0700
In-Reply-To: <CAMKF1sp2+DGg32W415-om0Y10zwJQEL54YARNBkWBskckYaRnw@mail.gmail.com>
References: <20190414161725.21617-1-robert.joslyn@redrectangle.org>
	<20190414161725.21617-4-robert.joslyn@redrectangle.org>
	<CAMKF1sp2+DGg32W415-om0Y10zwJQEL54YARNBkWBskckYaRnw@mail.gmail.com>
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/5] gpm: Remove duplicate definition of _GNU_SOURCE
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
X-List-Received-Date: Sun, 14 Apr 2019 23:35:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-04-14 at 11:15 -0700, Khem Raj wrote:
> 
> 
> On Sun, Apr 14, 2019 at 11:09 AM Robert Joslyn <
> robert.joslyn@redrectangle.org> wrote:
> > The Makefile already sets -D_GNU_SOURCE in CPPFLAGS, no need to
> > patch it
> > in again.
> 
> Have you build tested it with musl ?

Yes, this builds with musl, but I have not run tested. I can throw a
musl build on a board tomorrow to make sure it runs on hardware.

Thanks,
Robert


