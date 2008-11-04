Received: from [206.46.252.46] (helo=vms046pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1KxBA1-00058e-0S
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Nov 2008 02:56:49 +0100
Received: from gandalf.denix.org ([71.255.226.167])
	by vms046.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K9S000RHAK0G9J2@vms046.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	03 Nov 2008 18:55:13 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 719CC6B83B5; Mon,
	03 Nov 2008 19:55:12 -0500 (EST)
Date: Mon, 03 Nov 2008 19:55:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081104005512.GA12988@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: hal-0.5.11 fails with external toolchain/SDK
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
X-List-Received-Date: Tue, 04 Nov 2008 01:56:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

New hal-0.5.11 from OpenMoko breaks builds with external-toolchain/SDK, as it 
hardcodes linux/input.h like this:

EXTRA_OECONF += "--with-linux-input-header=${STAGING_INCDIR}/linux/input.h"

In case of external-toolchain/SDK, linux-libc-headers are not installed in 
staging, but rather supplied by the SDK and referenced with extra "-I" in 
TARGET_CPPFLAGS_append, thus there is no ${STAGING_INCDIR}/linux/input.h

The above EXTRA_OECONF is used mainly for hal-right-input-h.patch (see link
below), which piggy-backs HAL's --with-linux-input-header option to use the
correct linux/input.h file in the tools/Makefile.am for proper
hal-setup-keymap-keys.txt, but breaks the build of
hald/linux/probing/probe-input.c, where it tries to include the missing
hardcoded linux/input.h

http://gitweb.openembedded.net/?p=openembedded.git;a=blob;f=packages/hal/files/hal-right-input-h.patch;hb=org.openembedded.dev

Unfortunately, the location of linux/input.h and linux-libc-headers inside the
SDK are not very standardized. I've seen them in several localtions, such as:

${SDK_PREFIX}/${TARGET_SYS}/libc/usr/include
${SDK_PREFIX}/target/usr/include

Any ideas on how to fix hal-0.5.11 with external-toolchain/SDK are welcome.

I've also submitted a ticket to track this issue - #4799

-- 
Denys


