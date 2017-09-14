Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 3BD2E783B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:24:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id ED416260447
Message-ID: <1505391854.3560.17.camel@collabora.co.uk>
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Sep 2017 14:24:14 +0200
In-Reply-To: <bb4c384945a04d3cb2e3690aeef5d48d@XBOX02.axis.com>
References: <cover.1505333001.git.fabien.lahoudere@collabora.co.uk>
	<bb4c384945a04d3cb2e3690aeef5d48d@XBOX02.axis.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
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
X-List-Received-Date: Thu, 14 Sep 2017 12:24:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-09-14 at 08:01 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Fabien Lahoudere
> > Sent: den 13 september 2017 22:06
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] [meta-multimedia][PATCH v4 0/2] Add libupnp1.8 recipe
> > 
> > In order to build gerbera, we need to support libupnp >= 1.8.
> > However mpd won't build with this version probably due to API break.
> 
> Wouldn't it be more appropriate to copy the current libupnp 1.6 recipe 
> to libupnp16 and then update the libupnp recipe to 1.8? Presumably we 
> want to get rid of the 1.6 version whenever mpd is updated to support 
> the new API.

It is not a problem for me. Both solution are fine.
The decision concerns only maintainers and their preferences.

> 
> > So we add a new recipe libupnp1.8 to be able to use both version.
> > Both version can be run in parallel.
> > 
> > ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
> > neon/libupnp_1.6.21-r0_armhf.deb
> > drwxrwxrwx root/root         0 2017-09-13 17:26 ./
> > drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/
> > drwxr-xr-x root/root         0 2017-09-13 17:26 ./usr/lib/
> > -rwxr-xr-x root/root     31600 2017-09-13 17:26
> > ./usr/lib/libixml.so.2.0.8
> > -rwxr-xr-x root/root     17912 2017-09-13 17:26
> > ./usr/lib/libthreadutil.so.6.0.4
> > -rwxr-xr-x root/root    117676 2017-09-13 17:26
> > ./usr/lib/libupnp.so.6.3.4
> > lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libixml.so.2
> > -> libixml.so.2.0.8
> > lrwxrwxrwx root/root         0 2017-09-13 17:26
> > ./usr/lib/libthreadutil.so.6 -> libthreadutil.so.6.0.4
> > lrwxrwxrwx root/root         0 2017-09-13 17:26 ./usr/lib/libupnp.so.6
> > -> libupnp.so.6.3.4
> > ?:~/src/oe-core/build$ dpkg-deb -c tmp-glibc/deploy/deb/cortexa9hf-
> > neon/libupnp1.8_1.8.2-r0_armhf.deb
> > drwxrwxrwx root/root         0 2017-09-13 17:43 ./
> > drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/
> > drwxr-xr-x root/root         0 2017-09-13 17:43 ./usr/lib/
> > -rwxr-xr-x root/root     35696 2017-09-13 17:43
> > ./usr/lib/libixml.so.10.0.1
> > -rwxr-xr-x root/root    155128 2017-09-13 17:43
> > ./usr/lib/libupnp.so.10.1.1
> > lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libixml.so.10
> > -> libixml.so.10.0.1
> > lrwxrwxrwx root/root         0 2017-09-13 17:43 ./usr/lib/libupnp.so.10
> > -> libupnp.so.10.1.1
> > 
> > mpd and gerbera have been built successfully with this fix.
> > 
> > The patch also clean a bit gerbera recipe and fix dependency issue.
> > 
> > Changes since v3:
> > 	- Drop RDEPENDS from gerbera recipe.
> > 	- use git fetcher instead of github archive for libupnp
> > 
> > Fabien Lahoudere (2):
> >   libupnp: Add recipe for version 1.8.2
> >   gerbera: clean recipe
> > 
> >  .../recipes-connectivity/libupnp/libupnp1.8.bb       | 20
> > ++++++++++++++++++++
> >  .../recipes-multimedia/gerbera/gerbera_git.bb        | 12 ++++++------
> >  2 files changed, 26 insertions(+), 6 deletions(-)
> >  create mode 100644 meta-multimedia/recipes-
> > connectivity/libupnp/libupnp1.8.bb
> > 
> > --
> > 2.11.0
> 
> //Peter
> 

