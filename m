Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1176.1585244382255837764
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 10:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8E5FF40BFE;
	Thu, 26 Mar 2020 17:39:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8TaGuffq0EM; Thu, 26 Mar 2020 17:39:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 41AFA40BFD;
	Thu, 26 Mar 2020 17:39:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EB9601718F1; Thu, 26 Mar 2020 13:39:36 -0400 (EDT)
Date: Thu, 26 Mar 2020 13:39:36 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-qt5] qtwebkit 5.15 update failure
Message-ID: <20200326173936.GI1578@denix.org>
References: <20200326000257.GF1578@denix.org>
 <20200326005529.c77siajyzfgxdc4a@jama>
 <20200326170721.GH1578@denix.org>
 <CAMKF1srxY6873+cEoy+2jOQrQxjbnmq+nFxXSEFpXH5pgqM2bg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srxY6873+cEoy+2jOQrQxjbnmq+nFxXSEFpXH5pgqM2bg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2020 at 10:13:52AM -0700, Khem Raj wrote:
> On Thu, Mar 26, 2020 at 10:07 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Thu, Mar 26, 2020 at 01:55:29AM +0100, Martin Jansa wrote:
> > > On Wed, Mar 25, 2020 at 08:02:57PM -0400, Denys Dmytriyenko wrote:
> > > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:116: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacast(char const*)'
> > > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:121: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacall(QMetaObject::Call, int, void**)'
> > > > | Source/WebKit/CMakeFiles/WebKitWidgets.dir/WebKitWidgets_autogen/mocs_compilation.cpp.o:mocs_compilation.cpp:WebKit::DefaultFullScreenVideoHandler::staticMetaObject: error: undefined reference to 'QWebFullScreenVideoHandler::staticMetaObject'
> > > > | /usr/src/debug/qtwebkit/5.14.99+gitAUTOINC+ab1bd15209-r0.arago8/git/Source/WebKit/qt/WidgetSupport/DefaultFullScreenVideoHandler.cpp:45: error: undefined reference to 'vtable for QWebFullScreenVideoHandler'
> > > >
> 
> Yeah I have seen this failure too on master.
> 
> > > > FWIW, it was building just fine before the update...
> > >
> > > If you care about qtwebkit, then please send patches for this.
> >
> > On the other hand - if you don't care about qtwebkit, why would you update it
> > from a working version to a broken one?
> >
> > The issue is that with the upcoming 3.1 LTS around the corner, many of us are
> > trying to finalize and stabilize our own code bases in master. I was very
> > close to resolving most of the breakages for my builds just couple days ago,
> > and now I got few more unexpected failures from meta-qt5...
> >
> 
> meta-qt5 has already branched out dunfell before bumping QT version,
> so we should be good there

Ah, that's good to know, I missed that!


>  unless Martin plans to backport it into dunfell branch
> 
> > Anyway, I'll see if I can find some time to look into this breakage...
> >
> > --
> > Denys
> > 

> 

