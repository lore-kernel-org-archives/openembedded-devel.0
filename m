Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id E944B76FF2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:42:46 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NU40071TEZA3P20@vms173021.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	03 Sep 2015 16:42:47 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=kj9zAlcOel0A:10 a=ff-B7xzCdYMA:10
	a=pGLkceISAAAA:8 a=NEAV23lmAAAA:8	a=Q4-j1AaZAAAA:8
	a=rDyOR5l_sIc18ZDnecMA:9
	a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 84CCD161BD4; Thu,
	3 Sep 2015 17:42:46 -0400 (EDT)
Date: Thu, 03 Sep 2015 17:42:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20150903214246.GE8323@denix.org>
References: <1440332209-8802-1-git-send-email-net147@gmail.com>
	<20150827141522.GP26375@denix.org>
	<D4C07404-5127-46A0-867F-D21F90BBFDA7@gmail.com>
	<CANwerB1W1iqe72aV2Y4CvytbrE15JnM8ktWgoBTDWhB7w0CgXA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CANwerB1W1iqe72aV2Y4CvytbrE15JnM8ktWgoBTDWhB7w0CgXA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5][PATCH] qtbase: replace host paths with qmake built-in properties in qconfig.pri
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
X-List-Received-Date: Thu, 03 Sep 2015 21:42:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Aug 28, 2015 at 06:46:04PM +1000, Jonathan Liu wrote:
> Hi Khem,
> 
> On 28 August 2015 at 15:57, Khem Raj <raj.khem@gmail.com> wrote:
> > Denys
> >
> > I have posted an incremental fix, here
> > https://github.com/meta-qt5/meta-qt5/commit/a0a5002ed4bfcce50d6462897c4701246061581a
> >
> > Jonathan
> >
> > Can you see if it still fixes the usecase that you originally were trying to fix ?
> 
> Your patch misses some host paths that aren't in
> ${STAGING_DIR_HOST}/usr (referred to as ${STAGING_EXECPREFIXDIR} in
> your patch):
> ${STAGING_DIR_HOST}/lib
> ${STAGING_DIR_HOST}
> 
> You can change the following in your patch:
> -e 's| ${STAGING_EXECPREFIXDIR}| $$[QT_INSTALL_PREFIX]|g' \
> 
> To:
> -e 's| ${STAGING_DIR_HOST}| $$[QT_SYSROOT]|g' \
> 
> So that it covers the host paths missed by sed.
> 
> Regards,
> Jonathan

Ping on this one. Did we get an updated fix for it? Sorry, I was busy lately 
with own releases and wasn't paying attention, but the tip of meta-qt5 is 
still broken on qtwebkit. Thanks.

-- 
Denys


> >> On Aug 27, 2015, at 7:15 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> >>
> >> This seems to cause a build issue in qtwebkit and qtwebengine as well.
> >>
> >> It manifests in not being able to find glib.h or gio/gio.h headers.
> >>
> >> Khem, Martin and I are still discussing this on IRC, but I propose to revert
> >> this commit until it's tested better for all modules.
> >>
> >> --
> >> Denys
> >>
> >>
> >> On Sun, Aug 23, 2015 at 10:16:49PM +1000, Jonathan Liu wrote:
> >>> This avoids qconfig.pri in the Qt SDK incorrectly including paths from
> >>> the build host that may not exist on the SDK host. As the paths are
> >>> now correct, qmake can correctly detect system include paths and use
> >>> -isystem instead of -I for Qt's include directories which allows the
> >>> suppression of warnings from library headers when building Qt
> >>> applications.
> >>>
> >>> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >>> ---
> >>> recipes-qt/qt5/qtbase_git.bb | 5 +++++
> >>> 1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
> >>> index ae63150..324a115 100644
> >>> --- a/recipes-qt/qt5/qtbase_git.bb
> >>> +++ b/recipes-qt/qt5/qtbase_git.bb
> >>> @@ -234,6 +234,11 @@ do_install_append() {
> >>>     # Remove macx-ios-clang directory because /usr/lib/qt5/mkspecs/macx-ios-clang/rename_main.sh:#!/bin/bash
> >>>     # triggers QA Issue: qtbase-mkspecs requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]
> >>>     rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
> >>> +
> >>> +    # Replace host paths with qmake built-in properties
> >>> +    sed -i -e 's| ${STAGING_DIR_NATIVE}| $$[QT_HOST_PREFIX]|g' \
> >>> +        -e 's| ${STAGING_DIR_HOST}| $$[QT_INSTALL_PREFIX]|g' \
> >>> +        ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
> >>> }
> >>>
> >>> PACKAGES =. " \
> >>> --
> >>> 2.5.0
> >>>
> >>> --
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

