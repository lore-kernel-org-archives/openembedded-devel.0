Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 511B66012A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 01:30:06 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r68so6347764wmr.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2017 18:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/GqcaiUayEhwrFpCWrXe3PjdAxntwzysgSZSQGAN4U8=;
	b=ct7gI24KqBLF8YrZVh/wy/1puwT+BklXcBkR0W7Ip/Creb7zNkYULWcfLeQhQRePoj
	d1A0IB9U4Pj885VlDNFhnjWg595oLuc+v8AjXTDV4B/d2gg3DoROaOtmija/7zAXUEbw
	BXQzE8h4aGF7HaI7qpbaizyQq0ats+LKCGN3SvlK5M75Aon8BW2HxhrCtQR0OgfO/MIR
	5g1FgQv7yAyKAgMtxitlCamnEqw+FE60BTrDCUvVeXyxB5Xa3qLpOg9qHwt3rozUu3dN
	o17OUg5Qj5bFRta9Xk+U6YL51AkoH89dZQqJBOdISsN0Li2/0iRkoZAE5c4+aejqYBg5
	3uFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/GqcaiUayEhwrFpCWrXe3PjdAxntwzysgSZSQGAN4U8=;
	b=NO7Y30ZPuaawXEVo9v/P+meYmp53tNZ8SrsFkHWnVOzCY7T/zZvDrbFt6To7y18j2Q
	nz+ouBtRKh1rZNy0tWWu1HfjvKwU1t1iPa42L2zRbUR2z5GwoFUSLWFhPlU+cEMSxsCa
	Q+ImpFnVGA4XXsRAMuVCGY6d5ZAGaUItg52jUBgx1hZQCK8sUFF78tx9TyILqRwwKPUU
	iuA4rtFy7hXF0ONmosHQr17/VHkXvS1MdRTQsibifZjvOMiwIsoUbo+3OHnWxnkL3oGY
	rVCZ3IUDgoAiCzijPSeN9NcGfQy8lsNifrP/zDEUgys3p271hjBdqcLDaSx8hAtY705I
	w8yg==
X-Gm-Message-State: AMCzsaVrcdCM8/OKqBbT2ucX3/WT3v57V4omqfD9Fo0iNqiTnjYRk9R/
	+IkJb8TvnHabgjAhkEGJ5GDBdUkpnuwrHf0+MEQ=
X-Google-Smtp-Source: AOwi7QC6p9iNmA9w2h5AogXZebKP33S+tZ0QKCJu/EuGoMUmTQszQU3T3AL1o8STdWVbeOURe8h38wLX/Y7OqHTygbs=
X-Received: by 10.223.155.203 with SMTP id e11mr6236392wrc.104.1508117407131; 
	Sun, 15 Oct 2017 18:30:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Sun, 15 Oct 2017 18:30:06 -0700 (PDT)
In-Reply-To: <1507841087-145584-1-git-send-email-denis@denix.org>
References: <1507841087-145584-1-git-send-email-denis@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Oct 2017 03:30:06 +0200
Message-ID: <CA+chaQfZKN9dg9Kn5HOt7WQNcA4LEb6spfPuj8ZEEY07ysk1Yw@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Oct 2017 01:30:06 -0000
Content-Type: text/plain; charset="UTF-8"

This seems to cause:

Initialising tasks...ERROR: 1676 unbuildable tasks were found.
These are usually caused by circular dependencies and any circular
dependency chains found will be printed below. Increase the debug
level to see a list of unbuildable tasks.

Identifying dependency loops (this may take a short while)...

ERROR:
Dependency loop #1 found:
  Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtquick1_git.bb:do_compile_ptest_base
(dependent Tasks ['qtquick1_git.bb:do_populate_sysroot'])
  Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtquick1_git.bb:do_install_ptest_base
(dependent Tasks ['qtquick1_git.bb:do_compile_ptest_base',
'qtquick1_git.bb:do_install'])
  Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtquick1_git.bb:do_populate_sysroot
(dependent Tasks ['qtquick1_git.bb:do_install',
'qtquick1_git.bb:do_install_ptest_base',
'binutils-cross_2.29.bb:do_populate_sysroot'])

Dependency loop #2 found:
  Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_compile_ptest_base
(dependent Tasks ['qtxmlpatterns_git.bb:do_populate_sysroot'])
  Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_install_ptest_base
(dependent Tasks ['qtxmlpatterns_git.bb:do_install',
'qtxmlpatterns_git.bb:do_compile_ptest_base'])
  Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_populate_sysroot
(dependent Tasks ['qtxmlpatterns_git.bb:do_install',
'binutils-cross_2.29.bb:do_populate_sysroot',
'qtxmlpatterns_git.bb:do_install_ptest_base'])

Dependency loop #3 found:
  Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_compile_ptest_base
(dependent Tasks ['qtdeclarative_git.bb:do_populate_sysroot'])
  Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_install_ptest_base
(dependent Tasks ['qtdeclarative_git.bb:do_compile_ptest_base',
'qtdeclarative_git.bb:do_install'])
  Task /home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_populate_sysroot
(dependent Tasks ['qtdeclarative_git.bb:do_install_ptest_base',
'binutils-cross_2.29.bb:do_populate_sysroot',
'qtdeclarative_git.bb:do_install'])



On Thu, Oct 12, 2017 at 10:44 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> ptest.bbclass provides a set of standard do_*_ptest_base tasks. Each of
> them calls a corresponding regular do_*_ptest task, that components are
> supposed to override for own implementation. When PTEST_ENABLED is not
> set, an anonymous python function removes all do_*_ptest_base tasks from
> the queue. qt5-ptest.inc adds a special case for do_populate_sysroot and
> re-arranges the order or ptest tasks due to that. But, unfortunately,
> do_install_ptest was added directly, not do_install_ptest_base, hence when
> "ptest" is disabled and all other do_*_ptest_base tasks are removed, this
> one do_install_ptest task is left w/o dependencies and gets scheduled for
> execution very early on, even before pseudo-native gets built and stages
> "fakeroot" functionality. The fix is to add do_install_ptest_base task,
> which calls do_install_ptest only when "ptest" is enabled.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-qt/qt5/qt5-ptest.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qt5-ptest.inc b/recipes-qt/qt5/qt5-ptest.inc
> index 4844878..480a06d 100644
> --- a/recipes-qt/qt5/qt5-ptest.inc
> +++ b/recipes-qt/qt5/qt5-ptest.inc
> @@ -5,7 +5,7 @@ inherit ptest
>  addtask do_populate_sysroot after do_install before do_compile_ptest_base
>  deltask do_compile_ptest_base
>  addtask do_compile_ptest_base after do_populate_sysroot before
> do_install_ptest
> -addtask do_install_ptest after do_compile_ptest_base before do_package
> +addtask do_install_ptest_base after do_compile_ptest_base before
> do_package
>
>  do_compile_ptest() {
>      cd ${S}/tests
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

