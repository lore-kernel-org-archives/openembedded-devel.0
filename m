Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B947161222
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 12:25:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7CCPau9001118
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Aug 2013 05:25:36 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.146.23) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 12 Aug 2013 05:25:36 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Aug 2013 08:25:45 -0400
Message-ID: <2627145.WSXbXYcGLU@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; x86_64; ; )
In-Reply-To: <20130812065905.GH17945@jama>
References: <1376187025-22368-1-git-send-email-mark.asselstine@windriver.com>
	<8194550.0BPKn9U7hO@helios> <20130812065905.GH17945@jama>
MIME-Version: 1.0
X-Originating-IP: [128.224.146.23]
Cc: openembedded-devel@lists.openembedded.org, joe.macdonald@windriver.com
Subject: Re: [meta-networking][PATCH] dnsmasq: don't expect systemd support to be set
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
X-List-Received-Date: Mon, 12 Aug 2013 12:25:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On August 12, 2013 08:59:05 Martin Jansa wrote:
> On Sun, Aug 11, 2013 at 09:41:32PM +0100, Paul Eggleton wrote:
> > Hi Mark,
> > 
> > On Saturday 10 August 2013 22:10:25 Mark Asselstine wrote:
> > > If you don't have 'systemd' set in your DISTRO_FEATURES 'dnsmasq' will
> > > fail to package due to a QA error;
> > > 
> > > ERROR: QA Issue: dnsmasq: Files/directories were installed but not
> > > shipped
> > > 
> > >   /lib
> > > 
> > > Check for systemd in DISTRO_FEATURES before performing installation
> > > instructions related to systemd.
> > > 
> > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > ---
> > > 
> > >  meta-networking/recipes-support/dnsmasq/dnsmasq.inc | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc index
> > > 0f5b273..b9e7ff6 100644
> > > --- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > +++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
> > > @@ -31,8 +31,10 @@ do_install () {
> > > 
> > >      install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
> > >      install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
> > > 
> > > -    install -d ${D}${systemd_unitdir}/system
> > > -    install -m 0644 ${WORKDIR}/dnsmasq.service
> > > ${D}${systemd_unitdir}/system +    if
> > > ${@base_contains('DISTRO_FEATURES',
> > > 'systemd', 'true', 'false', d)}; then +        install -d
> > > ${D}${systemd_unitdir}/system
> > > +        install -m 0644 ${WORKDIR}/dnsmasq.service
> > > ${D}${systemd_unitdir}/system +    fi
> > > 
> > >      if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=
> > >      ""
> > > 
> > > ]; then install -d ${D}${sysconfdir}/dbus-1/system.d
> > 
> > There's already a global fix for this in OE-Core:
> > 
> > http://cgit.openembedded.org/openembedded-core/commit/meta/classes/systemd
> > .bbclass?id=ac5d20f4adac69ea1702694fb50849c9e465b443
> I wanted to reply the same, but it doesn't fix empty /lib after
> /lib/systemd is removed.

Correct, /lib hanging around is not corrected by the fix Paul mentions. I am 
fine with the more global solution trumping my fix and Joe has already 
indicated that he will wait for this to resolve this issue. Thanks for having 
a look and getting this fixed for everyone.

Mark 

> 
> We should add this:
> rmdir --ignore-fail-on-non-empty ${D}/lib
> 
> into that global fix to cover also this case.
> 
> (I'm intentionally not using base_libdir, because systemd_unitdir is
> also defined as bitbake.conf:export systemd_unitdir = "/lib/systemd")
> 
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

