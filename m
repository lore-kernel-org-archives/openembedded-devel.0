Received: from [67.19.73.58] (helo=pug.o-hand.com ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <richard@openedhand.com>) id 1Mm8Wr-0006Yw-T5
	for openembedded-devel@openembedded.org; Fri, 11 Sep 2009 17:59:21 +0200
Received: from [192.168.1.3] (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 6159612EC118;
	Fri, 11 Sep 2009 11:11:38 -0500 (CDT)
From: Richard Purdie <richard@openedhand.com>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Fri, 11 Sep 2009 16:59:50 +0100
Message-Id: <1252684790.17396.29.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 67.19.73.58
X-SA-Exim-Mail-From: richard@openedhand.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: poky <poky@o-hand.com>
Subject: $prefix and the $layout_* variables
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
X-List-Received-Date: Fri, 11 Sep 2009 15:59:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Going back a while I tried to fix a number of path issues in OE at a
time when we changed the layout of staging. This was when the layout_*
variables came into being, they seemed a good idea at the time and
cleaned up a lot of cruft. They are now however effectively useless.

I think it unlikely OE will ever switch to having a different layout of
staging to that of the target system again due to sysroot so lets
discount that.

These groups of variables define a filesystem layout. We have at least
four areas in OE which may or may not have different layouts:

* native staging
* target staging
* cross staging
* sdk staging

At the moment native == target. sdk is special, not used by many
packages and does insane workarounds and is basically broken (hence a
number of my current problems trying to extend sdk). cross is special
and just hardcoded.

To illustrate the problem consider an SDK installing into SDKPATH which
should be $layout_prefix. When we change $layout_prefix we totally break
PATH since PATH uses $layout_bindir to find native binaries. We
therefore leak path layout information between the different
filesystems.

Very little cross filesystem knowledge is actually needed and I'm
thinking something semi hardcoded but simpler and working would be
better.

The way I'm thinking things could go is:

bitbake.conf:

Set all layout_* variables to * (layout_bindir = "{bindir}")
Remove all layout_ variables ultimately
Change $prefix and friends to the values in $layout_*
Add:

base_bindir_native = "/bin"
base_sbindir_native = "/bin"
bindir_native = "/usr/bin"
sbindir_native = "/usr/sbin"
libdir_native = "/usr/lib"
bindir_cross = "/bin"
includedir_native = "/usr/include"
sysconfdir_native = "/etc"
datadir_native = "/usr/share"

(which are used to remove certain references to layout_* in things like
PATH)

native.bbclass can then become:

# Path prefixes
export base_prefix = "${STAGING_DIR_NATIVE}"
export prefix = "${STAGING_DIR_NATIVE}/usr"
export exec_prefix = "${STAGING_DIR_NATIVE}/usr"

cross and sdk classes similarly.

I'm still experimenting with this but does anyone have any comments?

Yes, it hardcodes some information and native.bbclass needs to match the
*_native definitions but I think we can live with that for the benefits
it brings?

Cheers,

Richard




