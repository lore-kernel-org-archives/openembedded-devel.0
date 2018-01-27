Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8531C7875A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 00:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A898820B1E;
	Sat, 27 Jan 2018 00:50:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0F-vdVr0KaUd; Sat, 27 Jan 2018 00:50:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7771A20AF1;
	Sat, 27 Jan 2018 00:50:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E1F4616327D; Fri, 26 Jan 2018 19:50:45 -0500 (EST)
Date: Fri, 26 Jan 2018 19:50:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180127005045.GC2786@denix.org>
References: <1516085015-89929-1-git-send-email-denis@denix.org>
	<20180123223913.GA2786@denix.org>
	<CAJTo0LZDJDT8d+bGbeMLxAFD3Jr54PTbNr4GdA3mR-msbfPJSA@mail.gmail.com>
	<20180126221034.GB2786@denix.org>
	<CAJTo0LaW1k-BvGN0jtQJMcNQj74uarz6QN7qBnMKUUw-9DpD2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaW1k-BvGN0jtQJMcNQj74uarz6QN7qBnMKUUw-9DpD2Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-networking][PATCH] ndisc6: need to set USE_NLS="yes" to use gettext.h
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
X-List-Received-Date: Sat, 27 Jan 2018 00:50:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yes, but in this case upstream is the ndisc recipe - see do_configure_prepend 
in the patch below that does copying of gettext.h from STAGING_DATADIR_NATIVE.

-- 
Denys


On Fri, Jan 26, 2018 at 11:52:23PM +0000, Burton, Ross wrote:
> Oh right, presumably your distro is turning off NLS.  Yeah if the upstream
> doesn't understand how to turn it off, then yes this would be the
> workaround.
> 
> Ross
> 
> On 26 January 2018 at 22:10, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > Not really:
> >
> > ERROR: ndisc6-1.0.4+gitAUTOINC+4c794b5512-r0 do_configure: Function
> > failed: do_configure (log file is located at .../work/armv7ahf-neon-linux-
> > gnueabi/ndisc6/1.0.4+gitAUTOINC+4c794b5512-r0/temp/log.do_configure.23315)
> > ERROR: Logfile of failure stored in: .../work/armv7ahf-neon-linux-
> > gnueabi/ndisc6/1.0.4+gitAUTOINC+4c794b5512-r0/temp/log.do_configure.23315
> > Log data follows:
> > | DEBUG: Executing shell function do_configure
> > | cp: cannot stat '.../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> > gitAUTOINC+4c794b5512-r0/recipe-sysroot-native/usr/share/gettext/gettext.h':
> > No such file or directory
> > | WARNING: .../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> > gitAUTOINC+4c794b5512-r0/temp/run.do_configure.23315:1 exit 1 from 'cp
> > .../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> > gitAUTOINC+4c794b5512-r0/recipe-sysroot-native/usr/share/gettext/gettext.h
> > .../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> > gitAUTOINC+4c794b5512-r0/git/include'
> > | ERROR: Function failed: do_configure (log file is located at
> > .../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> > gitAUTOINC+4c794b5512-r0/temp/log.do_configure.23315)
> > ERROR: Task (/OE/arago-rocko/sources/meta-openembedded/meta-networking/
> > recipes-support/ndisc6/ndisc6_git.bb:do_configure) failed with exit code
> > '1'
> >
> >
> >
> > On Wed, Jan 24, 2018 at 10:53:08AM +0000, Burton, Ross wrote:
> > > That should only be true for native recipes?
> > >
> > > On 23 January 2018 at 22:39, Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > > Ping.
> > > >
> > > >
> > > > On Tue, Jan 16, 2018 at 01:43:35AM -0500, Denys Dmytriyenko wrote:
> > > > > From: Denys Dmytriyenko <denys@ti.com>
> > > > >
> > > > > Otherwise we can get gettext-minimal-native dependency instead, which
> > > > does not
> > > > > provide gettext.h header.
> > > > >
> > > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > > ---
> > > > >  meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > > > b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > > > > index 48a83b8..58f1230 100644
> > > > > --- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > > > > +++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > > > > @@ -22,6 +22,8 @@ EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
> > > > >  LDFLAGS += "-fuse-ld=gold"
> > > > >  TOOLCHAIN = "gcc"
> > > > >
> > > > > +USE_NLS = "yes"
> > > > > +
> > > > >  do_configure_prepend() {
> > > > >      cp ${STAGING_DATADIR_NATIVE}/gettext/gettext.h ${S}/include
> > > > >      ${S}/autogen.sh
> > > > > --
> > > > > 2.7.4
> > > > >
> > > > > --
> > > > > _______________________________________________
> > > > > Openembedded-devel mailing list
> > > > > Openembedded-devel@lists.openembedded.org
> > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> >

