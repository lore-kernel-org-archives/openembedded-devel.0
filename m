Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC9960807
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 10:12:48 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q124so1509215wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 03:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sfwJt0/P7nJ5t2m/wIkV+lO/pdhvHCemRSo/gqyasw4=;
	b=QidEZ/xqTHe83UtV5MQcUZQMcd51VGV71WG9zrbnC7WJF27TFPsMCgmM67HjmrI+vg
	D+tjPzBCl0I/3I5hcXOgCMt4ON1bXvqLC+yDWOJI2EWZPb9Pfx6tXFy2L3AgNKy8RmCA
	FO2dsur4ODENZ6GOdz4zm7VL3IR3LG2OYgW/CXg4Mb+iAvwikxQsK34OIsXi10zfjvDF
	Bg4DKkJCG/pSJZp7+aCHnwCDb0yXJFE6QiR/u2zhZSZsnPpSM9bosSF4aKwwn6rZUR+W
	KcIu1CR9s2qpi0GSpIDTXO1uxoSAijcVxIZ1IQP7RGqq2bcU4o6yO+o8zopLJ4nC1e9a
	2xRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sfwJt0/P7nJ5t2m/wIkV+lO/pdhvHCemRSo/gqyasw4=;
	b=CI4e+8d2cJ4EYyr+yj6wxz/FL/ug4ZHMqtwjK44kx4wA8/o0050yNKN20Sy+EM3eCd
	klmZWsxEEHLIQwEClTpH2YX/f3PEm1dnahIu8gozNNfQoCqS99jR1ABTEpqt0QPBYUQR
	jcmPoC92Bt9T8zZLrhbticmWBsBOPsjfTgXiR8eAH8bW7GjZ47txwbBdcm6MOe35lDt+
	NwPpdEKo8GbzX4c4h9uS1IqZRPMVBfobACRKdwsKe9jTv+1/OiH9QBmQ/7ttMYlIGQ5n
	fQlKtyLGQ/aI5hHZJwpWN8D2D5IWJ9uCgBof1bIJKGCl9tGoLokNrZ5yeZMzIMmPJZxt
	zYwA==
X-Gm-Message-State: AMCzsaXu3j1Q5Z0tZ6vEqux61pnikgb8c4C0d3uqg9h0rz+DrhXQyoR/
	GBlZIYokTNhBev7fZhymlGEEMwzaHZlcU0BZHUM=
X-Google-Smtp-Source: ABhQp+TunI7xt0PoY4MvbY2IxStKfX0n3W4BjEDEnW+89OZ3lN3jPf3g2jOjhPF/SOCG/KyGAN1m3j6kRAmytgaY3tc=
X-Received: by 10.28.58.81 with SMTP id h78mr465059wma.10.1508148769701; Mon,
	16 Oct 2017 03:12:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Mon, 16 Oct 2017 03:12:49 -0700 (PDT)
In-Reply-To: <20171016014800.GU9221@denix.org>
References: <1507841087-145584-1-git-send-email-denis@denix.org>
	<CA+chaQfZKN9dg9Kn5HOt7WQNcA4LEb6spfPuj8ZEEY07ysk1Yw@mail.gmail.com>
	<20171016014800.GU9221@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Oct 2017 12:12:49 +0200
Message-ID: <CA+chaQeaGfTRNchGZndnQAvNF02YRefeVSoE2zbmeMqMqSmxGA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Mon, 16 Oct 2017 10:12:49 -0000
Content-Type: text/plain; charset="UTF-8"

I have ptest in DISTRO_FEATURES:
https://github.com/shr-project/jenkins-jobs/blob/master/jenkins-job.sh#L302

so I believe it was set to 1.

On Mon, Oct 16, 2017 at 3:48 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> Do you have PTEST_ENABLED set to 1 or 0?
>
>
> On Mon, Oct 16, 2017 at 03:30:06AM +0200, Martin Jansa wrote:
> > This seems to cause:
> >
> > Initialising tasks...ERROR: 1676 unbuildable tasks were found.
> > These are usually caused by circular dependencies and any circular
> > dependency chains found will be printed below. Increase the debug
> > level to see a list of unbuildable tasks.
> >
> > Identifying dependency loops (this may take a short while)...
> >
> > ERROR:
> > Dependency loop #1 found:
> >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> qtquick1_git.bb:do_compile_ptest_base
> > (dependent Tasks ['qtquick1_git.bb:do_populate_sysroot'])
> >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> qtquick1_git.bb:do_install_ptest_base
> > (dependent Tasks ['qtquick1_git.bb:do_compile_ptest_base',
> > 'qtquick1_git.bb:do_install'])
> >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> qtquick1_git.bb:do_populate_sysroot
> > (dependent Tasks ['qtquick1_git.bb:do_install',
> > 'qtquick1_git.bb:do_install_ptest_base',
> > 'binutils-cross_2.29.bb:do_populate_sysroot'])
> >
> > Dependency loop #2 found:
> >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> qtxmlpatterns_git.bb:do_compile_ptest_base
> > (dependent Tasks ['qtxmlpatterns_git.bb:do_populate_sysroot'])
> >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> qtxmlpatterns_git.bb:do_install_ptest_base
> > (dependent Tasks ['qtxmlpatterns_git.bb:do_install',
> > 'qtxmlpatterns_git.bb:do_compile_ptest_base'])
> >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> qtxmlpatterns_git.bb:do_populate_sysroot
> > (dependent Tasks ['qtxmlpatterns_git.bb:do_install',
> > 'binutils-cross_2.29.bb:do_populate_sysroot',
> > 'qtxmlpatterns_git.bb:do_install_ptest_base'])
> >
> > Dependency loop #3 found:
> >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> qtdeclarative_git.bb:do_compile_ptest_base
> > (dependent Tasks ['qtdeclarative_git.bb:do_populate_sysroot'])
> >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> qtdeclarative_git.bb:do_install_ptest_base
> > (dependent Tasks ['qtdeclarative_git.bb:do_compile_ptest_base',
> > 'qtdeclarative_git.bb:do_install'])
> >   Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/
> qtdeclarative_git.bb:do_populate_sysroot
> > (dependent Tasks ['qtdeclarative_git.bb:do_install_ptest_base',
> > 'binutils-cross_2.29.bb:do_populate_sysroot',
> > 'qtdeclarative_git.bb:do_install'])
> >
> >
> >
> > On Thu, Oct 12, 2017 at 10:44 PM, Denys Dmytriyenko <denis@denix.org>
> wrote:
> >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > ptest.bbclass provides a set of standard do_*_ptest_base tasks. Each of
> > > them calls a corresponding regular do_*_ptest task, that components are
> > > supposed to override for own implementation. When PTEST_ENABLED is not
> > > set, an anonymous python function removes all do_*_ptest_base tasks
> from
> > > the queue. qt5-ptest.inc adds a special case for do_populate_sysroot
> and
> > > re-arranges the order or ptest tasks due to that. But, unfortunately,
> > > do_install_ptest was added directly, not do_install_ptest_base, hence
> when
> > > "ptest" is disabled and all other do_*_ptest_base tasks are removed,
> this
> > > one do_install_ptest task is left w/o dependencies and gets scheduled
> for
> > > execution very early on, even before pseudo-native gets built and
> stages
> > > "fakeroot" functionality. The fix is to add do_install_ptest_base task,
> > > which calls do_install_ptest only when "ptest" is enabled.
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  recipes-qt/qt5/qt5-ptest.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/recipes-qt/qt5/qt5-ptest.inc
> b/recipes-qt/qt5/qt5-ptest.inc
> > > index 4844878..480a06d 100644
> > > --- a/recipes-qt/qt5/qt5-ptest.inc
> > > +++ b/recipes-qt/qt5/qt5-ptest.inc
> > > @@ -5,7 +5,7 @@ inherit ptest
> > >  addtask do_populate_sysroot after do_install before
> do_compile_ptest_base
> > >  deltask do_compile_ptest_base
> > >  addtask do_compile_ptest_base after do_populate_sysroot before
> > > do_install_ptest
> > > -addtask do_install_ptest after do_compile_ptest_base before do_package
> > > +addtask do_install_ptest_base after do_compile_ptest_base before
> > > do_package
> > >
> > >  do_compile_ptest() {
> > >      cd ${S}/tests
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
>

