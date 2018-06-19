Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 396F875454
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 09:53:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5J9rFwd021746
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 19 Jun 2018 10:53:17 +0100
Message-ID: <f34caf7c04fd2b2dd33e9c1c14f53a37bb28080b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.asselstine@windriver.com, Andreas =?ISO-8859-1?Q?M=FCller?=
	<schnitzeltony@gmail.com>
Date: Tue, 19 Jun 2018 10:53:15 +0100
In-Reply-To: <CAPuovEL5c3SF6YkRZMiobfAsyV7XLJzJz_E-oYdOzekmfSt1nw@mail.gmail.com>
References: <1529333146-6459-1-git-send-email-mark.asselstine@windriver.com>
	<CALbNGRTtOYpc9QWEAttxjgeD4Xog4U_4btnuy_v3m7PW-JKJfw@mail.gmail.com>
	<1883916.pZAjriCjz1@yow-masselst-lx1>
	<1f9bbaf400d215f993042b2fd2b24342aff1b29f.camel@linuxfoundation.org>
	<CALbNGRRK=096t=CpWX21Sk8aHTFD7Vtbmt2L1pO-A5CVo-8Rng@mail.gmail.com>
	<CAPuovEL5c3SF6YkRZMiobfAsyV7XLJzJz_E-oYdOzekmfSt1nw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-panel: fix QA issue 'installed-vs-shipped'
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
X-List-Received-Date: Tue, 19 Jun 2018 09:53:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2018-06-18 at 19:25 -0400, Mark Asselstine wrote:
> On Mon, Jun 18, 2018 at 6:27 PM, Andreas Müller <schnitzeltony@gmail.
> com> wrote:
> > On Mon, Jun 18, 2018 at 11:42 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > Off-Topic / FYI for me gmail considered your email spam
> > > 
> > > Removing the libtool files became the project default a while ago
> > > (Jan
> > > 2017):
> > > 
> > > meta/conf/distro/defaultsetup.conf:INHERIT_DISTRO ?= "debian
> > > devshell sstate license remove-libtool"
> > > 
> > > so I suspect you're in the minority not using that now.
> > 
> > Maybe true. But breaking builds consumes resources on many sides -
> > this thread is a good example
> > > 
> > > http://git.yoctoproject.org/cgit.cgi/poky/commit/meta/conf/distro
> > > /defaultsetup.conf?id=3e2a47fdfceccd5f8832235b7a2df83076e84a98
> > > 
> > 
> > The more I think about this:
> > 
> > * Why is remove-libtool something a distro can override? If causing
> > trouble it can be deactivated recipe-wise.
> 
> 
> That was my feeling as well as we were having this discussion,
> without digging into the history it felt as if this should have been
> made core functionality and not optional, especially given the
> opportunity for recipes to opt out. At any rate I am about to send a
> commit to get things buildable for when the 'remove-libtool' distro
> feature is absent and as long as it remains optional I suppose all
> recipes should function with and without the feature.

There are many different features which "distro maintainers" can turn
on/off which can break the builds. I was always reluctant to add the
libtool change but we reached the point where it simply no longer made
sense to keep those files around, they caused more problems than it was
worth effort for.

Its not a setting I'd recommend anyone use now because as you're
finding, the .la handling metadata is bitrotting. As with many things
in the project, its "at your own risk and maintenance burden". Its not
a combination I have any plans to add tests for.

The better solution would be to drop all the .la file FILES directives
and handle .la files in a similar way to the way we handle debug files
into -dbg packages. If anyone cares at this point.

Cheers,

Richard

