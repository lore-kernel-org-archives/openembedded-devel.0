Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6D09078305
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2017 18:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 02B1B208CF;
	Wed, 18 Oct 2017 18:45:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mbVGBO51HtZZ; Wed, 18 Oct 2017 18:45:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C18692010C;
	Wed, 18 Oct 2017 18:45:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 64CCF162705; Wed, 18 Oct 2017 14:45:03 -0400 (EDT)
Date: Wed, 18 Oct 2017 14:45:03 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20171018184503.GQ9221@denix.org>
References: <1507841087-145584-1-git-send-email-denis@denix.org>
	<CA+chaQfZKN9dg9Kn5HOt7WQNcA4LEb6spfPuj8ZEEY07ysk1Yw@mail.gmail.com>
	<20171016014800.GU9221@denix.org>
	<CA+chaQeaGfTRNchGZndnQAvNF02YRefeVSoE2zbmeMqMqSmxGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQeaGfTRNchGZndnQAvNF02YRefeVSoE2zbmeMqMqSmxGA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCH] qt5-ptest.inc: fix qtxmlpatterns:do_install_ptest out-of-order call
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
X-List-Received-Date: Wed, 18 Oct 2017 18:45:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

v2 posted

On Mon, Oct 16, 2017 at 12:12:49PM +0200, Martin Jansa wrote:
> I have ptest in DISTRO_FEATURES:
> https://github.com/shr-project/jenkins-jobs/blob/master/jenkins-job.sh#L302
> 
> so I believe it was set to 1.
> 
> On Mon, Oct 16, 2017 at 3:48 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > Do you have PTEST_ENABLED set to 1 or 0?
> >
> >
> > On Mon, Oct 16, 2017 at 03:30:06AM +0200, Martin Jansa wrote:
> > > This seems to cause:
> > >
> > > Initialising tasks...ERROR: 1676 unbuildable tasks were found.
> > > These are usually caused by circular dependencies and any circular
> > > dependency chains found will be printed below. Increase the debug
> > > level to see a list of unbuildable tasks.
> > >
> > > Identifying dependency loops (this may take a short while)...
> > >
> > > ERROR:
> > > Dependency loop #1 found:
> > >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> > qtquick1_git.bb:do_compile_ptest_base
> > > (dependent Tasks ['qtquick1_git.bb:do_populate_sysroot'])
> > >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> > qtquick1_git.bb:do_install_ptest_base
> > > (dependent Tasks ['qtquick1_git.bb:do_compile_ptest_base',
> > > 'qtquick1_git.bb:do_install'])
> > >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> > qtquick1_git.bb:do_populate_sysroot
> > > (dependent Tasks ['qtquick1_git.bb:do_install',
> > > 'qtquick1_git.bb:do_install_ptest_base',
> > > 'binutils-cross_2.29.bb:do_populate_sysroot'])
> > >
> > > Dependency loop #2 found:
> > >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> > qtxmlpatterns_git.bb:do_compile_ptest_base
> > > (dependent Tasks ['qtxmlpatterns_git.bb:do_populate_sysroot'])
> > >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> > qtxmlpatterns_git.bb:do_install_ptest_base
> > > (dependent Tasks ['qtxmlpatterns_git.bb:do_install',
> > > 'qtxmlpatterns_git.bb:do_compile_ptest_base'])
> > >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> > qtxmlpatterns_git.bb:do_populate_sysroot
> > > (dependent Tasks ['qtxmlpatterns_git.bb:do_install',
> > > 'binutils-cross_2.29.bb:do_populate_sysroot',
> > > 'qtxmlpatterns_git.bb:do_install_ptest_base'])
> > >
> > > Dependency loop #3 found:
> > >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> > qtdeclarative_git.bb:do_compile_ptest_base
> > > (dependent Tasks ['qtdeclarative_git.bb:do_populate_sysroot'])
> > >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> > qtdeclarative_git.bb:do_install_ptest_base
> > > (dependent Tasks ['qtdeclarative_git.bb:do_compile_ptest_base',
> > > 'qtdeclarative_git.bb:do_install'])
> > >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> > qtdeclarative_git.bb:do_populate_sysroot
> > > (dependent Tasks ['qtdeclarative_git.bb:do_install_ptest_base',
> > > 'binutils-cross_2.29.bb:do_populate_sysroot',
> > > 'qtdeclarative_git.bb:do_install'])
> > >
> > >
> > >
> > > On Thu, Oct 12, 2017 at 10:44 PM, Denys Dmytriyenko <denis@denix.org>
> > wrote:
> > >
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > ptest.bbclass provides a set of standard do_*_ptest_base tasks. Each of
> > > > them calls a corresponding regular do_*_ptest task, that components are
> > > > supposed to override for own implementation. When PTEST_ENABLED is not
> > > > set, an anonymous python function removes all do_*_ptest_base tasks
> > from
> > > > the queue. qt5-ptest.inc adds a special case for do_populate_sysroot
> > and
> > > > re-arranges the order or ptest tasks due to that. But, unfortunately,
> > > > do_install_ptest was added directly, not do_install_ptest_base, hence
> > when
> > > > "ptest" is disabled and all other do_*_ptest_base tasks are removed,
> > this
> > > > one do_install_ptest task is left w/o dependencies and gets scheduled
> > for
> > > > execution very early on, even before pseudo-native gets built and
> > stages
> > > > "fakeroot" functionality. The fix is to add do_install_ptest_base task,
> > > > which calls do_install_ptest only when "ptest" is enabled.
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  recipes-qt/qt5/qt5-ptest.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/recipes-qt/qt5/qt5-ptest.inc
> > b/recipes-qt/qt5/qt5-ptest.inc
> > > > index 4844878..480a06d 100644
> > > > --- a/recipes-qt/qt5/qt5-ptest.inc
> > > > +++ b/recipes-qt/qt5/qt5-ptest.inc
> > > > @@ -5,7 +5,7 @@ inherit ptest
> > > >  addtask do_populate_sysroot after do_install before
> > do_compile_ptest_base
> > > >  deltask do_compile_ptest_base
> > > >  addtask do_compile_ptest_base after do_populate_sysroot before
> > > > do_install_ptest
> > > > -addtask do_install_ptest after do_compile_ptest_base before do_package
> > > > +addtask do_install_ptest_base after do_compile_ptest_base before
> > > > do_package
> > > >
> > > >  do_compile_ptest() {
> > > >      cd ${S}/tests
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> >

