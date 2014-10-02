Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6EFC1601A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 18:59:18 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id ij19so1808519vcb.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Oct 2014 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=r5NxMhsRAqX4a5DGE9IyW9DhLP9aE88XeX0xEuHlrG0=;
	b=d09b3KGk6NjzJGAsAchka171cG3BLC3BUH+a/zgggLqljYpMOZCSv/Y8Ky9m07pLoy
	DG2NcVRcKFPPnyGJfo08J3aeuONr2EEl40Ol+KZoEMstG2n3i6h9+lfT1e4gJ+usUDJo
	tvff7+I2lfPo43O/yT09/YPdop1hbQeDmsq+KGkiUDSAxvd8GVybsV+nTbBVpy2FBxrf
	WjIzM5e9gev3hkyN4xA7WVVvAg3ysaU4eAKt6SWOtqFhUySSP1N9OyYQHJMlIKHBCs1a
	JeIT/TB+D9bAvIxHcssCMf4BAU8cpSlWwLHzrh2jJyCSI2dLT7UN7P/YocI705ogOUsw
	Ldrw==
MIME-Version: 1.0
X-Received: by 10.221.24.7 with SMTP id rc7mr481726vcb.54.1412276359480; Thu,
	02 Oct 2014 11:59:19 -0700 (PDT)
Received: by 10.52.112.65 with HTTP; Thu, 2 Oct 2014 11:59:19 -0700 (PDT)
Date: Thu, 2 Oct 2014 11:59:19 -0700
Message-ID: <CAFeBWL7RoTiY--zPVrB0CY4qaAUTXvzW5Y8F+MCvQjvAC-FVNw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Packages builds on one MACHINE but not on the other
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
X-List-Received-Date: Thu, 02 Oct 2014 18:59:26 -0000
Content-Type: text/plain; charset=UTF-8

Hello everyone, I have been trying to put a webserver (nginx) in
conjunction with uwsgi on my OMAP4 board. The issue I am having is that
uwsgi package (from meta-virtualization / meta-openstack) builds ok on
qumu86, but neither on qumuarm nor on my OMAP4 based board. The exact
problem is the binary contains an RPATH to the builder's local path. I
guess I can disable 'insane' checking, but I am hoping someone can provide
some insights as to where to look to solve the issue.

Adam

DEBUG: Executing python function sstate_task_prefunc
> DEBUG: Python function sstate_task_prefunc finished
> DEBUG: Executing python function do_package
> DEBUG: Executing python function package_get_auto_pr
> DEBUG: Python function package_get_auto_pr finished
> DEBUG: Executing python function perform_packagecopy
> DEBUG: Python function perform_packagecopy finished
> DEBUG: Executing python function split_and_strip_files
> DEBUG: runstrip: 'arm-poky-linux-gnueabi-strip' --remove-section=.comment
> --remove-section=.note
> '/media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/package/usr/bin/uwsgi'
> DEBUG: Python function split_and_strip_files finished
> DEBUG: Executing python function fixup_perms
> DEBUG: Python function fixup_perms finished
> DEBUG: Executing python function package_do_split_locales
> DEBUG: No locale files in this package
> DEBUG: Python function package_do_split_locales finished
> DEBUG: Executing python function populate_packages
> DEBUG: Python function populate_packages finished
> DEBUG: Executing python function do_package_qa
> NOTE: DO PACKAGE QA
> NOTE: Checking Package: uwsgi-staticdev
> NOTE: Checking Package: uwsgi-dev
> NOTE: Checking Package: uwsgi-dbg
> NOTE: arm-poky-linux-gnueabi-objdump -p
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi-dbg/usr/bin/.debug/uwsgi
> NOTE: Checking Package: uwsgi-doc
> NOTE: Checking Package: uwsgi
> NOTE: arm-poky-linux-gnueabi-objdump -p
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
> ERROR: QA Issue: package uwsgi contains bad RPATH
> /media/Build/master/build/tmp/sysroots/duovero/usr/lib in file
> /media/Build/master/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/uwsgi/2.0.4+gitAUTOINC+7604c67018-r0/packages-split/uwsgi/usr/bin/uwsgi
> ERROR: QA run found fatal errors. Please consider fixing them.
> DEBUG: Python function do_package_qa finished
> DEBUG: Python function do_package finished
> ERROR: Function failed: do_package_qa

