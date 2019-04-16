Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
	[217.70.183.200])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC5D79CCB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 03:37:42 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7E79420007;
	Tue, 16 Apr 2019 03:37:42 +0000 (UTC)
Message-ID: <5c1d0aa631564af5cde6565a70fd54a58a46c97b.camel@redrectangle.org>
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Apr 2019 20:37:38 -0700
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
X-List-Received-Date: Tue, 16 Apr 2019 03:37:43 -0000
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

Was able to do a musl build and confirmed it builds and runs on my x86
boards.

Thanks,
Robert


