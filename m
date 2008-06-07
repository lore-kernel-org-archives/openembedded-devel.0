Received: from [209.85.146.179] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1K4wb9-0001FM-S5
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jun 2008 13:28:40 +0200
Received: by wa-out-1112.google.com with SMTP id j37so1045561waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jun 2008 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=R7bgwfcqj+ML4NOPpBS9M9cdQYjb3Z/qortjdDxfvpU=;
	b=ZRIh1toZtA+wwPiQw40mgxy+YE59hO0w0MrsY7iOWQPhOrb4HILiOVn7Wxv2awx0WB
	+mT1FJILC3TNDOwqIubQqQ2xZEOft2kuY+v2NtmhqGpKKtKio86onXDsXap0Zrx/jXDb
	MD8UOzO4NQBxhENvBXRVjDCv5EHLQKbzVD+Ws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=LVqNd8d0WnWRnrsPnVBTcW5C841xNtRFoz4JVf4/1PwqZksGAQaH0GF5tlWDMMm5YQ
	PYwN7/yDf1aK00F4SiOJgy/vQ0ehBntAFk/feH/yr/15WaUzgtdipzpzROkDhYURs4gz
	zavjxyUaYdFqCSkGWOUB3OstbIv/dNqkG31Qg=
Received: by 10.114.112.1 with SMTP id k1mr1362784wac.10.1212837821429;
	Sat, 07 Jun 2008 04:23:41 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Sat, 7 Jun 2008 04:23:41 -0700 (PDT)
Message-ID: <f96d234e0806070423k5361f4a7g2b48cee0f8f0a659@mail.gmail.com>
Date: Sat, 7 Jun 2008 07:23:41 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: "Using OE" <openembedded-users@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0806060651g12575666k2699643198a78262@mail.gmail.com>
MIME-Version: 1.0
References: <f96d234e0805301122s1b48445ardf7d268fcebdec50@mail.gmail.com>
	<200806021019.50397.openembedded@haerwu.biz>
	<f96d234e0806020753l21423d51kef19c7bc00f02244@mail.gmail.com>
	<loom.20080605T225939-65@post.gmane.org>
	<loom.20080606T002255-512@post.gmane.org>
	<f96d234e0806060651g12575666k2699643198a78262@mail.gmail.com>
Subject: Re: adding German local files to an image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 07 Jun 2008 11:28:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jun 6, 2008 at 9:51 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> Another observation, I can install glibc-locale-de on a device using
> opkg, but not at rootfs time:
>
> Works on device:
>
> root@:~# opkg install glibc-locale-de
> Installing glibc-locale-de (2.6.1-r4) to root...
> Downloading http://hq.bec-systems.com/feeds/armv5te/glibc-locale-de_2.6.1-r4_armv5te.ipk
> 100% |========================================================================|
> Configuring glibc-locale-de
> root@:~# opkg files glibc-locale-de
> Package glibc-locale-de (2.6.1-r4) is installed on root and has the
> following files:
> /usr/share/locale/de/LC_MESSAGES/libc.mo
>
> But not at rootfs build time if I add glibc-locale-de to IMAGE_INSTALL
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: '['/build//_build/oe/oe/custom/packages/images/rootfs-vac-table-image.bb']'
> RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
> 'glibc-locale-de' but it wasn't found in any PACKAGE or RPROVIDES
> variables
> NOTE: Runtime target 'glibc-locale-de' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['glibc-locale-de']
> ERROR: Required build target 'rootfs-vac-table-image' has no buildable
> providers.
> Missing or unbuildable dependency chain was:
> ['rootfs-vac-table-image', 'glibc-locale-de']
> cbrake@happy:/build//_build/oe$

The reason for the above behavior is locale packages are created
dynamically, so bitbake has no knowledge of them.  Adding the
following to bitbake.conf as as suggested on IRC last night would fix
that:

PACKAGES_DYNAMIC = "${PN}-locale-*"

Any objections to adding this?

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


