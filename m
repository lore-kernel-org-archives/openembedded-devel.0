Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1OVSJd-0004eL-E8
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 18:45:15 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0F964110009E
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Jul 2010 18:40:27 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 1AD0D110009B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Jul 2010 18:40:26 +0200 (CEST)
Received: from rhein.familie-heinold.de (g225147025.adsl.alicedsl.de
	[92.225.147.25]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Jul 2010 18:40:26 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id A50C23C097; Sun,  4 Jul 2010 18:40:14 +0200 (CEST)
Date: Sun, 4 Jul 2010 18:40:14 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100704164014.GA32175@rhein.zuhause.netz>
References: <FE629F29-C087-4DF5-8C22-99EF4853FAF5@keylevel.com>
MIME-Version: 1.0
In-Reply-To: <FE629F29-C087-4DF5-8C22-99EF4853FAF5@keylevel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cross compile badness - /usr/include in /usr/include
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
X-List-Received-Date: Sun, 04 Jul 2010 16:45:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 04, 2010 at 12:37:11PM +0100, Chris Tapp wrote:
> I sometimes get "Cross compile badness - /usr/include in /usr/
> include", most recently when trying to build libsdl-ttf.
> 
> I finally tracked down that the cause was having part of the SDL
> development environment installed on the build host, leading to me
> having a /usr/include/SDL directory.
> 
> Uninstalling this package from the host allowed the build to work.
> 
> 1) Is this a 'known issue' with building?
> 2) Is there any way I can guard against it? I do now have a clue to
> what it means, but the cause may not always be so obvious.
> 3) Can I modify the .bb files to prevent this?
> 
> Is it possible to 'chroot' (or so such) so that the likes of /usr
> are constrained to the build environment?
> 
> Chris

The Problem is a bad .m4 file from sdl which searches hardcoded first in /usr/include
instead of our sysroot-dir. Fix the bad .m4-File and the problem is gone.

Bye Henning


