Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jin@mediatomb.cc>) id 1JCGYW-0001Xx-Eb
	for openembedded-devel@openembedded.org; Tue, 08 Jan 2008 16:39:56 +0100
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id 04DCC832C8; Tue,  8 Jan 2008 16:15:25 +0100 (CET)
Date: Tue, 8 Jan 2008 16:15:25 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@openembedded.org
Message-ID: <20080108151525.GA30805@deadlock.dhs.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: initscripts ignores IMAGE_DEVICE_TABLES and installs it's own table
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
X-List-Received-Date: Tue, 08 Jan 2008 15:39:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

after being too annoying about this on IRC it was suggested that I write
to the mailinglist :>

I already submitted a bug report regarding this:
http://bugs.openembedded.org/show_bug.cgi?id=3593

Here is the problem:
I am using a custom Angstrom-2007 based distro, I use a static dev table (no
udev and no devfs). 

I defined a custom device table file in my machine conf by setting the
IMAGE_DEVICE_TABLES variable appropriately.

From what I can see, image.bbclass makes use of this variable when creating the
rootfs. However, the initscripts_1.0.bb package has it's own device_table.txt
version (located in initscripts-1.0/device_table.txt).

This file gets installed to /etc/device_table on the target. I guess it does
not matter when udev takes over, but remember - I am using a static dev; so in
my case the init.d/devices script checks what is used, it first looks for udev,
then for devfs, does not find those and finally populates /dev with
device_table from /etc/device_table which was installed by initscripts.

It did cost me quite some time to figure out where all those dev entries
were coming from, so it would be nice to have this fixed in a clean way.

Unfortunately a clean solution did not come to my mind, so I hacked the 
initscripts_1.0.bb locally by adding:
file://../../../../../../site/files/my_device_table.txt 
to the SRC_URI, further doing a:

do_install_prepend () {
    cp ../../../../../../site/files/my_device_table.txt  ${WORKDIR}/
}

and finally tuning the line in do_install:
install -m 0755  ${WORKDIR}/my_device_table.txt ${D}${sysconfdir}/device_table

As you can see this is quite an ugly approach, I hope someone can suggest
how to solve this properly?

Kind regards,
Jin



