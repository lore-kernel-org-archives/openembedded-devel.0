Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3720A70249
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 00:41:48 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id ty20so3330406lab.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 17:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=0hccAexrDwfUGJXHmCWwzMJKlL1TeXvsFkn5m9IygYc=;
	b=U7t1o25ebCchiPW4GDnh7OaYT6U2ocbunOr/CswA7talaEGi1M4V+klJRy8l1NZMpa
	JIeFc7Yzob1eSg7PmlK5IU9RflXPmucXULiO/6a4hW64SQig66FQ1H/CMinTkrGGeFH2
	wg56OPfip3gEGslHwDM8cKoBN97Au7Oq+z30JR9txkMrGip5a5/L8oiZtV+mQmhKbFBS
	0pCdg5p/2e284TT7TMFEgtChpVdy51Dvf4pXQk7A5lHRlQMd8mRg9ND8UTiQy+f85EJy
	LbQRJChDh6h0aDwgAlMCg5mZ2CTAPKuihxmj6+ez6szlpp/lkDzSbEAyiFlGfyhBigaM
	LnXA==
X-Received: by 10.112.202.39 with SMTP id kf7mr15573876lbc.37.1405384909296;
	Mon, 14 Jul 2014 17:41:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.168.66 with HTTP; Mon, 14 Jul 2014 17:41:29 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.11.1407140605330.4257@localhost>
References: <alpine.LFD.2.11.1407120720110.19807@localhost>
	<CABcZANkY6NJLP=YVJj1YM5LJ89MUtENCV9PMwKa2CKhr_NzmgQ@mail.gmail.com>
	<alpine.LFD.2.11.1407140605330.4257@localhost>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 14 Jul 2014 17:41:29 -0700
X-Google-Sender-Auth: yoXOxB8VF2Q02R7dJUFSufOHDmg
Message-ID: <CABcZANmegnOviMs-iqARkU+HM88W9hZdoX6W1sJULr9NV9j5Zg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: is it "addtask do_X ..." or "addtask X ..." or does it matter?
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
X-List-Received-Date: Tue, 15 Jul 2014 00:41:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 14, 2014 at 3:11 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> if what chris writes is accurate, there are some broken class and
> recipe files in oe-core:
>
> classes/kernel.bbclass:addtask do_strip before do_sizecheck after
> do_kernel_link_vmlinux
> classes/staging.bbclass:addtask do_populate_sysroot_setscene
> classes/insane.bbclass:addtask do_package_qa after do_packagedata
> do_package before do_build
> classes/insane.bbclass:addtask do_package_qa_setscene
> classes/package_rpm.bbclass:addtask do_package_write_rpm_setscene
> classes/license.bbclass:addtask do_populate_lic_setscene
> classes/archiver.bbclass:addtask do_ar_original after do_unpack
> classes/archiver.bbclass:addtask do_unpack_and_patch after do_patch
> classes/archiver.bbclass:addtask do_ar_patched after do_unpack_and_patch
> classes/archiver.bbclass:addtask do_ar_configured after do_unpack_and_patch
> classes/archiver.bbclass:addtask do_dumpdata
> classes/archiver.bbclass:addtask do_ar_recipe
> classes/archiver.bbclass:addtask do_deploy_archives before do_build
> classes/deploy.bbclass:addtask do_deploy_setscene
> classes/package_deb.bbclass:addtask do_package_write_deb_setscene
> classes/package.bbclass:addtask do_package_setscene
> classes/package.bbclass:addtask do_packagedata_setscene
> classes/package_ipk.bbclass:addtask do_package_write_ipk_setscene
> recipes-core/eglibc/eglibc-package.inc:addtask do_install_locale after
> do_install before do_populate_sysroot do_package
> recipes-core/base-passwd/base-passwd_3.5.29.bb:addtask do_package after
> do_populate_sysroot
> recipes-core/meta/package-index.bb:addtask do_package_index before
> do_build
> recipes-devtools/gcc/gcc-configure-common.inc:addtask do_preconfigure
> after do_patch before do_configure
> recipes-support/boost/boost.inc:addtask do_boostconfig after do_patch
> before do_configure
>
>   surely all of the above can't be broken, can they?
>

I stand corrected, looks like code in bb.build.addtask automatically adds
do_ if it isn't present. We probably should pick one and fix the metadata
to be consistent, however :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

