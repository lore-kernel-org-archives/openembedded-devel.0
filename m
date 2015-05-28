Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 940AE6E5D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 13:19:40 +0000 (UTC)
Received: by wgez8 with SMTP id z8so36248753wge.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 May 2015 06:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Cq07sjJzPJdua/yuu/NsV2l9/nH/RPaG9bRvnYhVvEE=;
	b=EwgKZORiuY+mdobA8HIpLkW5LptqvXx44dwIynoJUcBKt/7ORHK0QF8xvVkpIPvhIq
	+QIZM4iYs9Rs4w1RbvjPM04VHJaGdchdijuxrxbe5GgFaXUXEr0u1T+dcMA2y9bhhLJ1
	z8L8B57Bi7yyZ2RmjjhsvVmmwKDLD6EVkXuwZCjo+GA5CH0JsNiC9R3SztoVRDYmfnqK
	Qq9H/ogXPtnJ7wnjq9ZqDldmYc51OS46U0xkwcAQRm5n+geeB7LIsINvCoVSFwzYAR5u
	jLBTKdfnd8FrKT5aHkn0GaOvvTBMu6HoxfZx09zKc7ZGWlPSjoGuTAP8Q37BgriS7SD6
	+F9g==
X-Received: by 10.180.11.230 with SMTP id t6mr8062313wib.91.1432819181330;
	Thu, 28 May 2015 06:19:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	em17sm3988577wid.11.2015.05.28.06.19.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 06:19:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 May 2015 15:20:02 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150528132002.GG2383@jama>
References: <20150528103631.GF2383@jama>
	<CALbNGRS6mWddxw+L76PSt9HMUkhtJL9Q=zDOXtE91rsbyKz2Og@mail.gmail.com>
	<1766894.osXu7KzV3v@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1766894.osXu7KzV3v@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Dropping tarball recipes from meta-qt5
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
X-List-Received-Date: Thu, 28 May 2015 13:19:43 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2015 at 11:49:22AM +0100, Paul Eggleton wrote:
> On Thursday 28 May 2015 12:46:33 Andreas M=FCller wrote:
> > On Thu, May 28, 2015 at 12:36 PM, Martin Jansa <martin.jansa@gmail.com>=
=20
> wrote:
> > > I'm still working on finishing 5.5-beta1 recipes for qt5, I'm getting
> > > tired of maintaining 2 sets of patches and 2 versions of recipes in t=
he
> > > same layer branch.
> > >=20
> > > 1) Would people mind dropping 5.4 support in master branch (who wants=
 to
> > > use 5.4 can continue to use "fido" branch of meta-qt5, there are patc=
hes
> > > for 5.4.2 git recipes as well).
> >=20
> > As soon as 5.5 is out I have no problem.
> >=20
> > > 2) Would people mind having only git recipes? It will be easier to
> > > update them. Only disadvantages I can think of are the need to clone
> > > from git and not being aligned with exact release for long time (git
> > > recipes usually track newer revisions in e.g. 5.4 branch than 5.4.0 or
> > > 5.4.1 tarbal recipes.
> >=20
> > Advantage for me would be that recipe-wise changing versions for test
> > is easier - so no I appreciate.
>=20
> Indeed, it sounds reasonable. My only question though would be is there a=
=20
> significant penalty in terms of do_fetch time? We've had complaints about=
 other=20
> recipes that fetch large git repos taking ridiculously long to fetch.

Initial fetch is of course a bit longer, but once it's on premirror it's of=
ten
even faster to do smallish git pull, then re-ownloading new tarball

I'm very surprised how small qtwebkit repo is, our qtwebkit fork repo has c=
ouple GB :).

OE @ ~/build/oe-core $ du -hs downloads/*qt*5.4.1*xz
44M     downloads/qtbase-opensource-src-5.4.1.tar.xz
2.5M    downloads/qtconnectivity-opensource-src-5.4.1.tar.xz
18M     downloads/qtdeclarative-opensource-src-5.4.1.tar.xz
512K    downloads/qtenginio-opensource-src-5.4.1.tar.xz
14M     downloads/qtgraphicaleffects-opensource-src-5.4.1.tar.xz
2.1M    downloads/qtimageformats-opensource-src-5.4.1.tar.xz
3.2M    downloads/qtlocation-opensource-src-5.4.1.tar.xz
3.1M    downloads/qtmultimedia-opensource-src-5.4.1.tar.xz
16M     downloads/qtquick1-opensource-src-5.4.1.tar.xz
924K    downloads/qtquickcontrols-opensource-src-5.4.1.tar.xz
2.5M    downloads/qtscript-opensource-src-5.4.1.tar.xz
2.0M    downloads/qtsensors-opensource-src-5.4.1.tar.xz
252K    downloads/qtserialport-opensource-src-5.4.1.tar.xz
1.7M    downloads/qtsvg-opensource-src-5.4.1.tar.xz
8.9M    downloads/qttools-opensource-src-5.4.1.tar.xz
1.1M    downloads/qttranslations-opensource-src-5.4.1.tar.xz
244K    downloads/qtwayland-opensource-src-5.4.1.tar.xz
84K     downloads/qtwebchannel-opensource-src-5.4.1.tar.xz
109M    downloads/qtwebengine-opensource-src-5.4.1.tar.xz
3.3M    downloads/qtwebkit-examples-opensource-src-5.4.1.tar.xz
32M     downloads/qtwebkit-opensource-src-5.4.1.tar.xz
76K     downloads/qtwebsockets-opensource-src-5.4.1.tar.xz
28K     downloads/qtx11extras-opensource-src-5.4.1.tar.xz
1.3M    downloads/qtxmlpatterns-opensource-src-5.4.1.tar.xz

OE @ ~/build/oe-core $ du -hs downloads/git2/code.qt.io*git/
5.7M    downloads/git2/code.qt.io.qt-labs.qt5-everywhere-demo.git/
143M    downloads/git2/code.qt.io.qt.qt3d.git/
468M    downloads/git2/code.qt.io.qt.qtbase.git/
13M     downloads/git2/code.qt.io.qt.qtconnectivity.git/
159M    downloads/git2/code.qt.io.qt.qtdeclarative.git/
3.8M    downloads/git2/code.qt.io.qt.qtenginio.git/
31M     downloads/git2/code.qt.io.qt.qtgraphicaleffects.git/
6.2M    downloads/git2/code.qt.io.qt.qtimageformats.git/
33M     downloads/git2/code.qt.io.qt.qtlocation.git/
28M     downloads/git2/code.qt.io.qt.qtmultimedia.git/
29M     downloads/git2/code.qt.io.qt.qtquick1.git/
23M     downloads/git2/code.qt.io.qt.qtquickcontrols.git/
11M     downloads/git2/code.qt.io.qt.qtscript.git/
9.2M    downloads/git2/code.qt.io.qt.qtsensors.git/
5.1M    downloads/git2/code.qt.io.qt.qtserialport.git/
3.6M    downloads/git2/code.qt.io.qt.qtsvg.git/
11M     downloads/git2/code.qt.io.qt.qtsystems.git/
29M     downloads/git2/code.qt.io.qt.qttools.git/
9.5M    downloads/git2/code.qt.io.qt.qttranslations.git/
6.9M    downloads/git2/code.qt.io.qt.qtwayland.git/
1.4M    downloads/git2/code.qt.io.qt.qtwebchannel.git/
8.4M    downloads/git2/code.qt.io.qt.qtwebengine.git/
4.3M    downloads/git2/code.qt.io.qt.qtwebkit-examples.git/
124M    downloads/git2/code.qt.io.qt.qtwebkit.git/
2.3M    downloads/git2/code.qt.io.qt.qtwebsockets.git/
7.5M    downloads/git2/code.qt.io.qt.qtxmlpatterns.git/

older premirror tarballs (I'm not generating them in current local build)
are also relatively small as expected based on unpacked repo size

OE @ ~/build/oe-core $ du -hs downloads/git2_*gitorious*qt*gz
2.6M    downloads/git2_gitorious.org.qt.qtwayland.git.tar.gz
37M     downloads/git2_qt.gitorious.org.qt.qt3d.git.tar.gz
158M    downloads/git2_qt.gitorious.org.qt.qtbase.git.tar.gz
2.3M    downloads/git2_qt.gitorious.org.qt.qtconnectivity.git.tar.gz
58M     downloads/git2_qt.gitorious.org.qt.qtdeclarative.git.tar.gz
30M     downloads/git2_qt.gitorious.org.qt.qtgraphicaleffects.git.tar.gz
3.3M    downloads/git2_qt.gitorious.org.qt.qtimageformats.git.tar.gz
12M     downloads/git2_qt.gitorious.org.qt.qtlocation.git.tar.gz
13M     downloads/git2_qt.gitorious.org.qt.qtmultimedia.git.tar.gz
27M     downloads/git2_qt.gitorious.org.qt.qtquick1.git.tar.gz
5.4M    downloads/git2_qt.gitorious.org.qt.qtquickcontrols.git.tar.gz
9.5M    downloads/git2_qt.gitorious.org.qt.qtscript.git.tar.gz
4.4M    downloads/git2_qt.gitorious.org.qt.qtsensors.git.tar.gz
1.7M    downloads/git2_qt.gitorious.org.qt.qtserialport.git.tar.gz
2.8M    downloads/git2_qt.gitorious.org.qt.qtsvg.git.tar.gz
3.0M    downloads/git2_qt.gitorious.org.qt.qtsystems.git.tar.gz
18M     downloads/git2_qt.gitorious.org.qt.qttools.git.tar.gz
3.3M    downloads/git2_qt.gitorious.org.qt.qtwayland.git.tar.gz
3.8M    downloads/git2_qt.gitorious.org.qt.qtwebkit-examples.git.tar.gz
117M    downloads/git2_qt.gitorious.org.qt.qtwebkit.git.tar.gz
84K     downloads/git2_qt.gitorious.org.qt.qtx11extras.git.tar.gz
6.1M    downloads/git2_qt.gitorious.org.qt.qtxmlpatterns.git.tar.gz


>=20
> > > If we all use the same version from the same recipes then we can test=
 it
> > > better and it will be much easier to maintain.
> >=20
> > I think it's time to mention: Thanks for maintaining qt5 and other
> > layers - you do an excellent job!
>=20
> Seconded!!

Thanks all!

WIP patches coming soon

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

