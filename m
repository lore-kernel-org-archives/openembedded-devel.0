Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1M9hoh-0001SL-7u
	for openembedded-devel@openembedded.org; Thu, 28 May 2009 17:46:51 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1M9hgZ-0005ts-E9
	for openembedded-devel@openembedded.org; Thu, 28 May 2009 10:38:28 -0500
Message-ID: <4A1EAFEF.8010902@dls.net>
Date: Thu, 28 May 2009 10:38:23 -0500
From: "Mike Westerhof (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <87d49uaq9f.wl%peter@chubb.wattle.id.au>
In-Reply-To: <87d49uaq9f.wl%peter@chubb.wattle.id.au>
Subject: Re: console-image trying to build X?
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
X-List-Received-Date: Thu, 28 May 2009 15:46:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Peter Chubb wrote:
> Hi,
> 	I'm using the tip-of-tree as of this morning openembedded
> recipes to build a console image for the Beagleboard.  After a while,
> I see:
> ...
> NOTE: collecting binary locales from locale tree
> NOTE: Multiple libraries (libnss_nis.so.2, libnss_nisplus.so.2, libnss_hesiod.so.2) found, but LEAD_SONAME 'libc.so' doesn't match any of them
> NOTE: Couldn't find shared library provider for libgcc_s.so.1
> NOTE: Tasks Summary: Attempted 554 tasks of which 0 didn't need to be rerun and 1 failed.
> ERROR: '/home/peterc/src/OpenEmbedded/openembedded/recipes/xorg-proto/xproto-native_7.0.15.bb' failed

xproto-native is missing the dependency on util-macros-native.

I lack the familiarity with the X recipes to know where this dependency
should be added; perhaps someone who knows this better can just add that.

In the meantime, just "bitbake util-macros-native", and restart your
original build; this time xorg-proto will build correctly.

> Why are the recipes even trying to build X for a console-image?  (to
> me, console means no X or graphics) And how can I work out how to fix
> the error? 

This has been a topic of discussion from time-to-time.  In all
likelihood, X is being pulled in to satisfy dbus or bluez (I don't
recall which off the top of my head).  You probably will not end up with
the full X packages on your resulting image; OE just need to build that
in order to satisfy some very specific build-time dependencies.

As a side note, I have been meaning for some time to create a "no-X"
version of the particular package that causes this, to suit my own
needs; once that gets done there might be an easy way to do a build that
won't have this dependency.

Regards,
Mike (mwester)


