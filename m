Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PQjzk-000160-1Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:09:29 +0100
Received: by yxd5 with SMTP id 5so1548493yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Dec 2010 09:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=CK3RlSn/mUYqjz3Znbhh8STUxd/C2hHm6ybAlQaBorQ=;
	b=HC0xeJMJs5z+B/UPFr/9blFgSTso1XMSKqAJ8BBruJxAcdqOQPISLfXOqMyfVi2jj0
	afuUezuFDdjDsrnh2L2EJXGbQx9Ah2kKIC5VB/+V1fae48zn5DJV5nKApZRP6YaKv4m2
	WtdBoIb98af+/fc0fJEFHyQy5q0Jk/JxXYI/k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=FlUVzgMu0bdOVm6J7jx84SDcIAP3TpU59IOKTv7pCPe6p23Qf99AuTHW1FVgjbU/L2
	oLWJPMiKYoD4EE15aFbMVutySv1PUkSun+6EcI5WM6umnh/Smf4YzmXz5lm9VuyfUyfX
	HMTIlZLwc0Xj4VJ+5xHrjLPJeiQGDEbttnyAU=
Received: by 10.204.75.158 with SMTP id y30mr3582249bkj.126.1291914475870;
	Thu, 09 Dec 2010 09:07:55 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q15sm1066274bkk.13.2010.12.09.09.07.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 09 Dec 2010 09:07:53 -0800 (PST)
Date: Thu, 9 Dec 2010 18:07:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101209170734.GM3186@jama>
References: <4D00F942.6040103@comcast.net>
 <4D010B10.1060903@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4D010B10.1060903@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Release-2010.12 build failure - eglibc do_package Failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Dec 2010 17:09:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 09, 2010 at 09:00:00AM -0800, Tim Harvey wrote:
> On 12/09/2010 07:44 AM, Ed Nelson wrote:
> > I am using the latest release-2010.12 and doing a completely new build
> > for the AT91SAM9g20 development board(no tmp directory and source
> > directory empty).
> > I am trying to build a base image that includes python.
> > My build machine is running Ubuntu 10.04LTS.
> >
> > Build Configuration:
> > BB_VERSION = "1.10.0"
> > METADATA_BRANCH = "release-2010.12"
> > METADATA_REVISION = "dec3967"
> > TARGET_ARCH = "arm"
> > TARGET_OS = "linux-gnueabi"
> > MACHINE = "at91sam9g20ek"
> > DISTRO = "angstrom"
> > DISTRO_VERSION = "next"
> > TARGET_FPU = "soft"
> >
> >
> > The build fails on eglibc do_package with the following information.
> >
> > NOTE: Running task 1006 of 4003 (ID: 143,
> > /home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb,
> > do_package)
> > NOTE: package eglibc-2.12-r17.7+svnr11982: task do_package: Started
> > NOTE: preparing tree for binary locale generation
> > NOTE: generating locale es_NI (UTF-8)
> > ERROR: TaskFailed event exception, aborting
> > ERROR: Build of
> > /home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb do_package
> > failed
> > ERROR: Task 143
> > (/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb,
> > do_package) failed with 256
> > ERROR:
> > '/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb'
> > failed
> > NOTE: Task failed: localedef returned an error (command was
> > PATH="/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/usr/armv5te/bin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/usr/sbin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/usr/bin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux/sbin:/home/ed/oe/build-at91sam9g20-angstrom/tmp/sysroots/i686-linux//bin:/home/ed/oe/oe-release-2010.12/bitbake-1.10.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
> > I18NPATH="/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree/usr/share/i18n"
> > qemu-arm -s 1048576 -r 2.6.24 -L
> > /home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree
> > -E
> > LD_LIBRARY_PATH=/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree/lib
> > /home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree/bin/localedef
> > --force --old-style --no-archive
> > --prefix=/home/ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi/eglibc-2.12-r17.7+svnr11982/locale-tree
> > --inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).
> > NOTE: package eglibc-2.12-r17.7+svnr11982: task do_package: Failed
> > ERROR: TaskFailed event exception, aborting
> > ERROR: Build of
> > /home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb do_package
> > failed
> > ERROR: Task 143
> > (/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb,
> > do_package) failed with 256
> > ERROR:
> > '/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb'
> > failed
> > ERROR:
> > '/home/ed/oe/oe-release-2010.12/openembedded/recipes/eglibc/eglibc_2.12.bb'
> > failed
> >
> > There are 2 eglibc directors in
> > ed/oe/build-at91sam9g20-angstrom/tmp/work/armv5te-angstrom-linux-gnueabi
> > eglibc-2.12-r17.7+svnr11982
> > and
> > eglibc-intial-2.12-r17.7+svnr11982
> >
> > The file run.package_do_package.23963 was empty
> >
> > Any ideas
> > Thanks
> > Ed
> 
> I've started seeing the same recently with glibc:
> 
> Build system: native Ubuntu 10.04 i686
> 
> Build Configuration:
> BB_VERSION        = "1.11.0"
> METADATA_BRANCH   = ""origin/release-2010.12""
> METADATA_REVISION = ""a5eeff8b2e4cb9ffa86af214850dcbbe32432242""
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "overoevm"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "devel"
> TARGET_FPU        = "hard"
> ...
> ERROR: Task 218 
> (/home/tharvey/oe/commonos-sync/org.openembedded.dev/recipes/glibc/glibc_2.9.bb, 
> do_package) failed with 256
> NOTE: Task failed: localedef returned an error (command was 
> PATH="/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux/usr/armv7a/bin:/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux/usr/sbin:/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux/usr/bin:/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux/sbin:/home/tharvey/oe/commonos-sync/tmp/sysroots/i686-linux//bin:/home/tharvey/oe/commonos-sync/bitbake/bin:/home/tharvey/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" 
> I18NPATH="/home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree/usr/share/i18n" 
> qemu-arm -s 1048576 -r 2.6.16 -L 
> /home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree 
> -E 
> LD_LIBRARY_PATH=/home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree/lib 
> -cpu cortex-a8 
> /home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree/bin/localedef 
> --force --old-style --no-archive 
> --prefix=/home/tharvey/oe/commonos-sync/tmp/work/armv7a-commonos-linux-gnueabi/glibc-2.9-r37.4/locale-tree 
> --inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).

better to go to that directory dirrectly and running that command in
terminal to see whole output from localedef, it can be unrelated issue like this one

http://sourceware.org/bugzilla/show_bug.cgi?id=11258

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


