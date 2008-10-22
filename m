Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1KsbbZ-0005GR-1j
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 13:10:21 +0200
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 454FC6280CC;
	Wed, 22 Oct 2008 13:09:55 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <gdmr6t$iq4$1@ger.gmane.org>
References: <gdmr6t$iq4$1@ger.gmane.org>
Date: Wed, 22 Oct 2008 13:09:54 +0200
Message-Id: <1224673794.22763.70.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.0 
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [RFC] Moving PACKAGE_EXTRA_ARCHS to include/tune-*
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
X-List-Received-Date: Wed, 22 Oct 2008 11:10:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> So
> PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te armv6 armv7 armv7a"
> Will move from beagleboard.conf to tune-cortexa8.conf but it will use 
> '+=' instead of '=' so machines can still do PACKAGE_EXTRA_ARCHS = 
> "someleetarch"

This is a bit off topic, but we also need a way to include extra staging
paths for these architectures to PATH and PKG_CONFIG_PATH (and maybe
more). It would be nice to fix it on architecture or classes level.

See my last week mail "mplayer: PATH=...STAGING_BINDIR_CROSS not
sufficient with complex PACKAGE_ARCH".

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



