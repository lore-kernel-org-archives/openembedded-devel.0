Return-Path: <denis@denix.org>
X-Greylist: delayed 3613 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 Dec 2014 00:28:41 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6E82D724C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Dec 2014 00:28:41 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NGA003P7EJ6XDK1@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	08 Dec 2014 17:28:19 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=AMzggXLk c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=A92cGCtB03wA:10	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8
	a=XrLeSPr7pYZwr1OYSsQA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 08FE620177; Mon,
	8 Dec 2014 18:28:18 -0500 (EST)
Date: Mon, 08 Dec 2014 18:28:17 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20141208232817.GG13319@denix.org>
References: <1415923119-4861-1-git-send-email-denis@denix.org>
	<20141124194823.GB25432@denix.org>
MIME-version: 1.0
In-reply-to: <20141124194823.GB25432@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH 1/2] nativesdk-qtbase.inc: avoid removing directories, namely /usr/lib itself
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
X-List-Received-Date: Tue, 09 Dec 2014 00:28:47 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

ping^2

On Mon, Nov 24, 2014 at 02:48:23PM -0500, Denys Dmytriyenko wrote:
> ping
> 
> On Thu, Nov 13, 2014 at 06:58:38PM -0500, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-qt/qt5/nativesdk-qtbase.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
> > index 6f1f880..06fb049 100644
> > --- a/recipes-qt/qt5/nativesdk-qtbase.inc
> > +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
> > @@ -230,7 +230,7 @@ do_install() {
> >             ${D}/${OE_QMAKE_PATH_PLUGINS} \
> >             ${D}${libdir}/cmake \
> >             ${D}${libdir}/pkgconfig
> > -    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and \
> > +    find ${D}${libdir} -maxdepth 1 -name 'lib*' -and -not -type d \
> >                                     -not -name 'libQt5Core.so*' -and \
> >                                     ${QTLIBSPRESERVE} \
> >                                     -not -name 'libQt5Bootstrap.a' \
> > -- 
> > 2.1.2
> > 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

