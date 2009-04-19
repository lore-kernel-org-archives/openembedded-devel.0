Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1LvbwX-0004Td-Bg
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Apr 2009 20:40:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id B0EE22C7FD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Apr 2009 18:34:25 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDsxxzIsnpAh
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Apr 2009 18:34:19 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTP id 431492C797
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Apr 2009 18:34:19 +0000 (UTC)
Message-ID: <49EB6F02.1030402@gmail.com>
Date: Sun, 19 Apr 2009 20:35:46 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: devshell not working with screen remote shell
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
X-List-Received-Date: Sun, 19 Apr 2009 18:40:56 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

devshell is not working when you run bitbake in a screen remote ssh shell
(also potest here http://bugs.openembedded.net/show_bug.cgi?id=5084)


$ bitbake -cdevshell bluez-utils
NOTE: Handling BitBake files: - (6658/6658) [100 %]
NOTE: Parsing finished. 6398 cached, 0 parsed, 260 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200904192010: started

OE Build Configuration:
BB_VERSION        = "1.8.13"
METADATA_BRANCH   = "stable/2009"
METADATA_REVISION = "6ea387ca312c4686746c387b56735f7b96f599b3"
TARGET_ARCH       = "i586"
TARGET_OS         = "linux"
MACHINE           = "qemux86"
DISTRO            = "kaeilos"
DISTRO_VERSION    = "2008.1-test-20090419"

NOTE: oestats: build 140918
...snip...
NOTE: package bluez-utils-3.36-r5: task do_patch: completed
NOTE: Running task 32 of 32 (ID: 4,
/home/koan/devel/openembedded/recipes/bluez/bluez-utils_3.36.bb,
do_devshell)
NOTE: package bluez-utils-3.36-r5: task do_devshell: started
ERROR: function do_devshell failed
ERROR: log data follows
(/home/koan/devel/build/kaeilos/tmp/work/i586-kaeilos-linux/bluez-utils-3.36-r5/temp/log.do_devshell.5388)
| cannot open display:
| Run 'gnome-terminal --help' to see a full list of available command line
options.


I already tried to solve this time ago using different option in bitbake
code
(trying to activate xterm instead of the default x terminal) and trying
to set
DISPLAY and xauth in several ways without success.

/marco


