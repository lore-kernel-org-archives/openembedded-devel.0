Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by mail.openembedded.org (Postfix) with ESMTP id 9D8EF6CCF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Feb 2014 01:54:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s171sFwi015589;
	Thu, 6 Feb 2014 19:54:15 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s171sFRH007234;
	Thu, 6 Feb 2014 19:54:15 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 6 Feb 2014 19:54:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s171sENP001154;
	Thu, 6 Feb 2014 19:54:14 -0600
Date: Thu, 6 Feb 2014 20:54:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20140207015414.GL31128@edge>
References: <1385430478-31824-1-git-send-email-denis@denix.org>
	<1385430478-31824-2-git-send-email-denis@denix.org>
	<CAP71Wjx52AHWurONaP7Fsq9A9jGKuy1S9+xviYQ7+iCUGYnRdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjx52AHWurONaP7Fsq9A9jGKuy1S9+xviYQ7+iCUGYnRdw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 1/2] nativesdk-qtbase: add nativesdk version of qtbase necessary for SDK tools
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
X-List-Received-Date: Fri, 07 Feb 2014 01:54:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 07, 2014 at 01:15:34AM +0100, Nicolas Dechesne wrote:
> hi,
> 
> On Tue, Nov 26, 2013 at 2:47 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > +do_install() {
> > +    # Fix install paths for all
> > +    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_NATIVE}${STAGING_DIR_NATIVE},(INSTALL_ROOT)${STAGING_DIR_NATIVE},g"
> > +
> > +    # switch back the proper qmake
> > +    rm ${B}/bin/qmake
> > +    mv ${B}/bin/qmake-real ${B}/bin/qmake
> > +
> > +    oe_runmake install INSTALL_ROOT=${D}
> > +
> > +    # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
> > +    # e.g. qt3d, qtwayland
> > +    ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
> > +}
> 
> about this patch (which was merged already), i am wondering if this is
> okay to do something like above. basically in the do_install task we
> are 'corrupting' the output of the do_compile task. Here we remove
> ${B}/bin/qmake for example. so if the do_install fails for whatever
> reason, it will never be able to resume properly, since ${B} is no
> longer what it should be after a legitimate do_compile. i was
> debugging some weird build issues, and I am wondering if my problem
> doesn't come from that...

Hmm, never thought of it like that. I guess there are couple options:

1. Make the qmake switch above at the end of do_compile instead
2. Keep it in do_install, but manipulate ${D} instead of ${B} by installing 
${B}/qmake-real into ${D}/qmake

-- 
Denys

