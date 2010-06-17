Received: from hxhsvr03.internetintuitive.net ([80.254.228.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OPLQ4-0002oO-Mw
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 22:10:37 +0200
Received: from durham.keylevel.com ([109.224.134.115]:3048 helo=[192.168.1.98])
	by hxhsvr03.internetintuitive.net with esmtpa (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OPKh9-00027V-5R
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 20:24:11 +0100
Message-Id: <89BAD49D-B779-4C20-BBC0-F220F8C440AA@keylevel.com>
From: Chris Tapp <dokuwiki@keylevel.com>
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 17 Jun 2010 20:24:08 +0100
X-Mailer: Apple Mail (2.936)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hxhsvr03.internetintuitive.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - keylevel.com
X-SA-Exim-Connect-IP: 80.254.228.43
X-SA-Exim-Mail-From: dokuwiki@keylevel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: New user would like some help
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
X-List-Received-Date: Thu, 17 Jun 2010 20:10:37 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi,

I've recently come across Openembedded and really like what I see :-)

I'm trying to use it to produce a minimal Linux image and have built  
one for 'minimal-image' using the 'minimal'  distro for the 'alix'  
machine. This builds and boots in Qemu, so looks good.

I now want to add some other libraries to the image so that they will  
be available by default. I've tried to do this by adding IMAGE_INSTALL  
lines in to minimal-image.bb (I'll do this properly by making a copy  
soon!). e.g.

IMAGE_INSTALL = "task-boot \
		libsdl-native \
<rest of file>

This appears to do something at build time, but libsdl is not in the  
image that's produced.

Is this the right way to go about this? I assume not, as, but I've had  
a look at the user manual and didn't spot anything obvious in there to  
show me what I'm doing wrong.

Any help would be greatly appreciated.

Chris



