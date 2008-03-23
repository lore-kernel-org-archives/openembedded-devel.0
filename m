Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1JdIa5-0002sr-Td
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Mar 2008 06:17:18 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx04.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JdIa5-0004n4-AZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Mar 2008 00:17:17 -0500
Message-ID: <47E5E7DD.4030304@dls.net>
Date: Sun, 23 Mar 2008 00:17:17 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.12 (Windows/20080213)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803180849.21108.geoffrey@pager.net>	<frojpb$m6j$1@ger.gmane.org>	<1205858910.7500.39.camel@dax.rpnet.com>	<frosov$c0b$1@ger.gmane.org>
	<47E5A67B.5030809@dls.net>
In-Reply-To: <47E5A67B.5030809@dls.net>
Subject: Re: [RFC] move to opkg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Mar 2008 05:17:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Here's what I've found out: There is no such thing as a 
"PREFERRED_VERSION" or "PREFERRED_PROVIDER" solution for this ipkg/opkg 
problem.  A simple grep tells us why (some random lines I picked out of 
the output from grep):

classes/image.bbclass:          echo "src/gz local-$arch 
${FEED_DEPLOYDIR_BASE_URI}/$arch" >> 
${IMAGE_ROOTFS}/etc/opkg/local-$arch-feed.conf
classes/rootfs_ipk.bbclass:                     opkg-cl ${IPKG_ARGS} 
flag unpacked `basename $i .postinst`

etc, etc -- it's pretty clear that opkg is hardcoded all over the place.



So it seems that everyone *MUST* comply, and migrate to opkg -- unless 
you want to just freeze your distro on an old version of OE.

Now after several hours trying to figure out what to do with this opkg 
stuff, it seems that there's something that is supposed to make 
compatability possible, although there are no documents anywhere on this 
.  So I added opkg-ipkg-compat to task-slugos.bb, and bumped the PR.

Here's what it has started to add to the image (there may be more than 
this):

libgpg
libgpg-error
libcrypt
lzo
pth
libassuan
gnutls


We have a grand total of 8 MBytes of flash on this device; space is at a 
premium -- I don't think that ipkg was so bad that we should be adding 
all of this to the image!  What should we remove to make room for these 
libraries?  The kernel?  Maybe we don't need busybox.  I guess if we 
require a soldered-on serial port, we *could* get rid of openssh...

I hope I'm exaggerating and these libraries aren't that huge, but still, 
we fight for every 10KByte chunk of flash we can get back, and opkg 
seems like a huge, and terribly painful loss.

In the short term:

A) Where are the docs on opkg?
B) How does one modify distros to live in the new world order that's 
been decreed?
C) How much "fat" can we trim off of opkg, and how do we do that, so 
that we don't have to throw out other niceties that users appreciate?

And in the long term:
How do we go about setting up fixing all this opkg stuff so that we 
properly abstract it, allowing a distro to select ipkg, opkg, upkg, and 
sometimes-ypkg that they desire?

Thanks
Mike (mwester)


