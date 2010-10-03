Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1P2J3p-0003F1-Cd
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 09:32:42 +0200
Received: from [192.168.0.101] (91-64-127-39-dynip.superkabel.de
	[91.64.127.39])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 381DD1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Oct 2010 07:35:58 +0000 (UTC)
Message-ID: <4CA83188.7010203@freyther.de>
Date: Sun, 03 Oct 2010 15:32:24 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100921 Fedora/3.1.4-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CA719E0.7050409@freyther.de> <i89b3v$g4g$1@dough.gmane.org>
In-Reply-To: <i89b3v$g4g$1@dough.gmane.org>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RPATH in many modules
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
X-List-Received-Date: Sun, 03 Oct 2010 07:32:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/03/2010 03:24 PM, Koen Kooi wrote:

> Could you fix the patch to say to which (wrong) sysroot it points to?
> 
> MACHINE=beagleboard bitbake libcdio
> 
> rpath -> sysroots/x86 or rpath -> sysroots/armv7a or both?

ERROR: QA Issue with libgettextlib: package libgettextlib contains bad RPATH
/home/ich/build/arm/xscale/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
in file
/home/ich/build/arm/xscale/tmp/work/armv5te-angstrom-linux-gnueabi/gettext-0.18-r3/packages-split/libgettextlib/usr/lib/libgettextlib-0.18.so

Can you propose a better wording? From the above I try to indicate that
/home/ich/build/arm/xscale/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib
is the bad RPATH and that it is inside the libgettextlib-0.18.so


> When we last tried chrpath didn't work in cross mode :(

hmm... maybe it is something simple... :}


