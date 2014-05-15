Return-Path: <anders@chargestorm.se>
X-Greylist: delayed 330 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 May 2014 08:16:25 UTC
Received: from STOEXHUB01.domain01.net (unknown [83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9BE6098B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 08:16:25 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Thu, 15 May 2014 10:10:56 +0200
Date: Thu, 15 May 2014 10:10:52 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20140515081052.GA3079@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
	<20140504214712.GG2486@jama>
	<CAP9ODKpL+SMvus2o_kY_-gYgxu95E3ahiBsKwFQxQGn93f69ug@mail.gmail.com>
	<CAP9ODKo43jUETHixm0_wBjL=zwJcb+BdgQV2MLKnte2FdCe5Mg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo43jUETHixm0_wBjL=zwJcb+BdgQV2MLKnte2FdCe5Mg@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] qtbase.inc: Enable accessibility by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 May 2014 08:16:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Otavio Salvador <otavio@ossystems.com.br> [140514 21:12]:
> On Mon, May 5, 2014 at 9:21 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > On Sun, May 4, 2014 at 6:47 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> On Mon, Apr 28, 2014 at 12:27:39PM -0300, Otavio Salvador wrote:
> >>> qtdeclarative requires accessibility to be enabled and it is added by
> >>> default to the toolchain so we ought to have it enabled to ensure the
> >>> default toolchain generation works.

> >>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ...
> >> As I told you on gtalk, I would prefer default to stay as minimal as
> >> posible, why don't you change packagegroup-qt5-toolchain-target.bb to
> >> use RRECOMMENDS instead of RDEPENDS so that missing
> >> qtquickcontrols-qmlplugins package doesn't break it when it's not
> >> available (because it's empty)?

> > I don't have a strong opinion for either case however I think we ought
> > to know what other meta-qt5 users think about it.

> > In support to this patch addition I think we ought to provide the most
> > used features of Qt5 working out of box to users have a good first
> > use. Special cases can customize it per need basis. I think QML is
> > common enough for us to provide full support for it by default.


> Martin and I have different views on this topic and I'd like to merge
> or drop this patch. Could people comment on this one?

Well, I can understand your point, that it should be as easy as possible
to use the toolchain to build whatever you want...

However, in all the cases where I've been using Qt5 lately, both for
internal projects as well as for customers, we've always ended up
trying to minimize which part of Qt5 we're building. (To reduce build
time, flash usage etc).

With that in mind, I'd prefer a as minimal Qt5 and toolchain as
possible, letting me enable more things easily by using PACKAGECONFIG.

One way to reduce the rather large modification to the toolchain recipe
would likely be to have it RRECOMMEND as much as possible, and only
RDEPEND on the most basic parts of Qt5. (Though, I haven't tried that
version yet).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

