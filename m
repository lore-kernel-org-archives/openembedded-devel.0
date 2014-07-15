Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 405 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Jul 2014 00:54:13 UTC
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 93C267039F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 00:54:13 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20140715004728581
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 00:47:28 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-devel@lists.openembedded.org>
Received: from [99.240.204.5] (port=39495 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1X6qtu-0000mC-FR for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jul 2014 20:47:22 -0400
Date: Mon, 14 Jul 2014 20:47:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CABcZANmegnOviMs-iqARkU+HM88W9hZdoX6W1sJULr9NV9j5Zg@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1407142046220.8165@localhost>
References: <alpine.LFD.2.11.1407120720110.19807@localhost>
	<CABcZANkY6NJLP=YVJj1YM5LJ89MUtENCV9PMwKa2CKhr_NzmgQ@mail.gmail.com>
	<alpine.LFD.2.11.1407140605330.4257@localhost>
	<CABcZANmegnOviMs-iqARkU+HM88W9hZdoX6W1sJULr9NV9j5Zg@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
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
X-List-Received-Date: Tue, 15 Jul 2014 00:54:20 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 14 Jul 2014, Christopher Larson wrote:

> On Mon, Jul 14, 2014 at 3:11 AM, Robert P. J. Day <rpjday@crashcourse.ca>
> wrote:
>
> > if what chris writes is accurate, there are some broken class and
> > recipe files in oe-core:
> >
> > classes/kernel.bbclass:addtask do_strip before do_sizecheck after
> > do_kernel_link_vmlinux
> > classes/staging.bbclass:addtask do_populate_sysroot_setscene
> > classes/insane.bbclass:addtask do_package_qa after do_packagedata
> > do_package before do_build
> > classes/insane.bbclass:addtask do_package_qa_setscene
> > classes/package_rpm.bbclass:addtask do_package_write_rpm_setscene
> > classes/license.bbclass:addtask do_populate_lic_setscene
> > classes/archiver.bbclass:addtask do_ar_original after do_unpack
> > classes/archiver.bbclass:addtask do_unpack_and_patch after do_patch
> > classes/archiver.bbclass:addtask do_ar_patched after do_unpack_and_patch
> > classes/archiver.bbclass:addtask do_ar_configured after do_unpack_and_patch
> > classes/archiver.bbclass:addtask do_dumpdata
> > classes/archiver.bbclass:addtask do_ar_recipe
> > classes/archiver.bbclass:addtask do_deploy_archives before do_build
> > classes/deploy.bbclass:addtask do_deploy_setscene
> > classes/package_deb.bbclass:addtask do_package_write_deb_setscene
> > classes/package.bbclass:addtask do_package_setscene
> > classes/package.bbclass:addtask do_packagedata_setscene
> > classes/package_ipk.bbclass:addtask do_package_write_ipk_setscene
> > recipes-core/eglibc/eglibc-package.inc:addtask do_install_locale after
> > do_install before do_populate_sysroot do_package
> > recipes-core/base-passwd/base-passwd_3.5.29.bb:addtask do_package after
> > do_populate_sysroot
> > recipes-core/meta/package-index.bb:addtask do_package_index before
> > do_build
> > recipes-devtools/gcc/gcc-configure-common.inc:addtask do_preconfigure
> > after do_patch before do_configure
> > recipes-support/boost/boost.inc:addtask do_boostconfig after do_patch
> > before do_configure
> >
> >   surely all of the above can't be broken, can they?
> >
>
> I stand corrected, looks like code in bb.build.addtask automatically
> adds do_ if it isn't present. We probably should pick one and fix
> the metadata to be consistent, however :)

  ah, yes, there it is:

def addtask(task, before, after, d):
    if task[:3] != "do_":
        task = "do_" + task

  that just invites abuse, doesn't it? :-)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


