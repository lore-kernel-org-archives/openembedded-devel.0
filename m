Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Q8Ils-0007S9-5H
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 22:59:12 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B0A7811000AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Apr 2011 22:57:04 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E1C20110009A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Apr 2011 22:57:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225007243.adsl.alicedsl.de
	[92.225.7.243]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Apr 2011 22:57:03 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 073463C0D2; Fri,  8 Apr 2011 22:56:13 +0200 (CEST)
Date: Fri, 8 Apr 2011 22:56:13 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110408205612.GA29980@rhein.zuhause.netz>
References: <4D9F52B0.9030808@gumstix.com>
MIME-Version: 1.0
In-Reply-To: <4D9F52B0.9030808@gumstix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: firefox fails at xpidl: missing glib
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
X-List-Received-Date: Fri, 08 Apr 2011 20:59:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 08, 2011 at 11:23:44AM -0700, Neil MacMunn wrote:
> I'm trying to bitbake firefox with this configuration.
> 
> >Build Configuration:
> >BB_VERSION        = "1.12.0"
> >METADATA_BRANCH   = "unstable"
> >METADATA_REVISION = "219f1e9"
> >TARGET_ARCH       = "arm"
> >TARGET_OS         = "linux-gnueabi"
> >MACHINE           = "overo"
> >DISTRO            = "angstrom"
> >DISTRO_VERSION    = "v20110408"
> >TARGET_FPU        = "hard"
> 
> 
> cp sysroots/x86_64-linux/usr/include/glib-2.0/glib.h
> sysroots/x86_64-linux/usr/include/ got me to another missing header
> error. Comparing the log of my last successful build, this is
> missing.

Hi,

copying the headers wild around don't get you further, the right include option
is needed. As pkg-config --cflags glib-2.0 returns it. So in the end 
you need to fix the Makefile.

Bye Henning


