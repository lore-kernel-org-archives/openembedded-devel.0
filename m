Received: from [76.96.30.17] (helo=QMTA10.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1LlTbB-0007tz-QQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 20:44:46 +0100
Received: from OMTA03.emeryville.ca.mail.comcast.net ([76.96.30.27])
	by QMTA10.emeryville.ca.mail.comcast.net with comcast
	id WET91b0020b6N64AAKjTHb; Sun, 22 Mar 2009 19:43:27 +0000
Received: from [192.168.1.116] ([71.198.120.50])
	by OMTA03.emeryville.ca.mail.comcast.net with comcast
	id WKjS1b00115LFXK8PKjSJU; Sun, 22 Mar 2009 19:43:26 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 22 Mar 2009 12:43:25 -0700
Message-Id: <1237751005.10499.17.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Custom machine based on at91SAM9261 fails kernel_do_stage for linux_2.6.24.bb
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
X-List-Received-Date: Sun, 22 Mar 2009 19:44:46 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

When I look at the kernel_do_stage() in linux_2.6.24.bb the first thing
it does is read the link from directory located at 
/home/ed/OE/build/tmp/work/sbc9261-angstrom-linux-gnueabi/linux-2.6.24-r25/linux-2.6.24

kernel_do_stage()
ASMDIR=`readlink include/asm`
mkdir-p /home/ed/OE/build/tmp/staging/sbc9261-angstrom-linux-gnueabi/kernel/include/$ASMDIR
more code

But when I look into the
/home/ed/OE/build/tmp/work/sbc9261-angstrom-linux-gnueabi/linux-2.6.24-r25/linux-2.6.24/include directory the asm directory does not have a link associated with it.
It looks like the mkdir fails as I do not find that directory created in
the staging.

Should I change the linux_2.6.24.bb recipe so ASMDIR = asm or is there
something else that I should look at.


Thanks
Ed



