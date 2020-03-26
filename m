Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.4849.1585253400384275216
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2020 13:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B240040C0A;
	Thu, 26 Mar 2020 20:09:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rud1HInCFB_k; Thu, 26 Mar 2020 20:09:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E46F40C06;
	Thu, 26 Mar 2020 20:09:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0449D1718F1; Thu, 26 Mar 2020 16:09:58 -0400 (EDT)
Date: Thu, 26 Mar 2020 16:09:57 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-qt5] qtwebkit 5.15 update failure
Message-ID: <20200326200957.GJ1578@denix.org>
References: <20200326000257.GF1578@denix.org>
 <20200326005529.c77siajyzfgxdc4a@jama>
 <20200326170721.GH1578@denix.org>
 <20200326193418.fiehd5wti6gd7yfw@jama>
MIME-Version: 1.0
In-Reply-To: <20200326193418.fiehd5wti6gd7yfw@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 26, 2020 at 08:34:18PM +0100, Martin Jansa wrote:
> On Thu, Mar 26, 2020 at 01:07:21PM -0400, Denys Dmytriyenko wrote:
> > On Thu, Mar 26, 2020 at 01:55:29AM +0100, Martin Jansa wrote:
> > > On Wed, Mar 25, 2020 at 08:02:57PM -0400, Denys Dmytriyenko wrote:
> > > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:116: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacast(char const*)'
> > > > | Source/WebKit/WebKitWidgets_autogen/J52LRV53MS/moc_DefaultFullScreenVideoHandler.cpp:121: error: undefined reference to 'QWebFullScreenVideoHandler::qt_metacall(QMetaObject::Call, int, void**)'
> > > > | Source/WebKit/CMakeFiles/WebKitWidgets.dir/WebKitWidgets_autogen/mocs_compilation.cpp.o:mocs_compilation.cpp:WebKit::DefaultFullScreenVideoHandler::staticMetaObject: error: undefined reference to 'QWebFullScreenVideoHandler::staticMetaObject'
> > > > | /usr/src/debug/qtwebkit/5.14.99+gitAUTOINC+ab1bd15209-r0.arago8/git/Source/WebKit/qt/WidgetSupport/DefaultFullScreenVideoHandler.cpp:45: error: undefined reference to 'vtable for QWebFullScreenVideoHandler'
> > > > 
> > > > FWIW, it was building just fine before the update...
> > > 
> > > If you care about qtwebkit, then please send patches for this.
> > 
> > On the other hand - if you don't care about qtwebkit, why would you update it 
> > from a working version to a broken one?
> 
> I didn't update qtwebkit.
> 
> qtwebkit isn't part of regular Qt upgrades since 5.9, I've already
> removed it a while ago and then restored it based on Andreas's request,
> see last few commits:
> 
> c8cd55b0 qtwebkit: build with python3
> 23914740 Revert "qtwebkit: remove"
> a35403dc qtwebkit: remove
> a797f85c python-pyqt5, qtwebengine, qtwebkit, qt-kiosk-browser: skip without meta-python2
> b1f4f1fd Revert "recipes: Use python3 during build"
> 47fb26de recipes: Use python3 during build
> 
> I have not intention to support it myself, either send patches or maybe
> Andreas will do.

I understand the sentiment, but it's still a nice fallback option to have. 
Like I said, I'll see if I can find time after the release to look into the 
breakage...


> > The issue is that with the upcoming 3.1 LTS around the corner, many of us are 
> > trying to finalize and stabilize our own code bases in master. I was very 
> > close to resolving most of the breakages for my builds just couple days ago, 
> > and now I got few more unexpected failures from meta-qt5...
> 
> Yes, that's why there is dunfell branch as mentioned in the PR, see:
> https://github.com/meta-qt5/meta-qt5/pull/294

Yeah, as we already established with Khem, I missed the fact that meta-qt5 
already branched off dunfell, since I don't monitor github, sorry. I'm good 
now using 5.14 again from dunfell branch.

-- 
Denys
