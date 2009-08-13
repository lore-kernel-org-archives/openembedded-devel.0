Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbUl3-0002tY-Oy
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 09:29:57 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A5BC8BE002517BC for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 09:13:26 +0200
Message-ID: <4A83BD15.7070006@atmel.com>
Date: Thu, 13 Aug 2009 09:13:25 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 13 Aug 2009 07:29:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Since I will need to test multiple boards,
I decided to write some scripts which I will
check in later today in origin/ulf/linux-2.6.30.2

I generated a "MAKEALL" script which will
source a file "board_list.sh" with board build commands

<SOF>
build_board	sam9263dfc	x11-gpe-image
build_board	sam9g45ek	opie-image
build_board	sam9g10df	x11-gpe-image
build_board	sam9g20dfc	console-image
build_board	sam9260dfc	console-image
build_board	sam9261df	x11-image
build_board	sam9xedfc	console-image
<EOF>

The script assumes the existance of a "build-<board>"
directory with a configuration file in "build-<board>/conf".
"build-<board>/conf/local.conf" is a link to
"build-<board>/conf/<board>.conf"

I have also generated a script "scripts/make-local.conf.sh"
to automatically generate the "build-<board>" directory
with updates taken from definitions in "environment.sh"
in the topdirectory

<SOF>
#/bin/sh
# Example environment.sh

DOWNLOAD=/usr/local/install/downloads
MAKEJOBS=4
THREADS=4
KERNEL=2.6.30
<EOF>

You call
openembedded/scripts/make-local.conf.sh at91sam9263ek
to create the build-at91sam9263ek directory.

The MAKEALL script will prepare this directory
for full or incremental build and create
the symbolic link "build" before bitbake starts

-- 
Best Regards
Ulf Samuelsson



