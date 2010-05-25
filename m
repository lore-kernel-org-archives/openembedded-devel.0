Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henri.bragge@dcombus.com>) id 1OGqvZ-0005SB-ED
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 12:00:03 +0200
Received: from [100.100.100.68] (unknown [83.150.95.26])
	by smtp-68.nebula.fi (Postfix) with ESMTP id 2224832B08DD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 12:54:00 +0300 (EEST)
Message-ID: <4BFB9E89.30206@dcombus.com>
Date: Tue, 25 May 2010 12:55:21 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1274770197-13394-1-git-send-email-raj.khem@gmail.com>	<htftsf$ilt$1@dough.gmane.org>
	<AANLkTin5VBoB7K2n6JakiKoN2kfIF9JFgB4_3Ut3-z5n@mail.gmail.com>
In-Reply-To: <AANLkTin5VBoB7K2n6JakiKoN2kfIF9JFgB4_3Ut3-z5n@mail.gmail.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: henri.bragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] udev: Use udev.inc and add udevadm to udev pacakge instead of udev-utils
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
X-List-Received-Date: Tue, 25 May 2010 10:00:07 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Grzegorz Toporek wrote:
> Could you upload this patch to the git respiratory? Or this is just
> non-official change?
>
> I'm trying now to compile base-image on angstrom distro and I got error from
> udev_151.bb recipe. May be your patch will help with this...
>
> This is what I got:
>
> Does anyone met with this error? Sorry if it's not a right place to post.
>
>   
I've another issue concerning acl and attr that udev-151 requires, and 
I'm hoping that this patch would help me too. Btw I didn't have this 
problem with bitbake 1.8.18, but 1.10 with newest oe fails with output:

| make[4]: Entering directory 
`.../tmp/work/armv5te-angstrom-linux-gnueabi/attr-2.4.44-r3/attr-2.4.44/attr'
| ../include/install-sh -o hbragge -g 1002 -m 755 -d /usr/bin
| chmod: changing permissions of `//usr/bin': Operation not permitted
| make[4]: *** [install] Error 1
| make[4]: Leaving directory 
`.../tmp/work/armv5te-angstrom-linux-gnueabi/attr-2.4.44-r3/attr-2.4.44/attr'
| make[3]: *** [attr-install] Error 2
| make[3]: Leaving directory 
`.../tmp/work/armv5te-angstrom-linux-gnueabi/attr-2.4.44-r3/attr-2.4.44'
| FATAL: oe_runmake failed
NOTE: package attr-2.4.44-r3: task do_install: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of .../openembedded/recipes/udev/attr_2.4.44.bb do_install 
failed
ERROR: Task 1641 (.../openembedded/recipes/udev/attr_2.4.44.bb, 
do_install) failed with 256

Building acl does the same thing. Something is wrong with environment 
variables exported by acl/attr recipes, which should point in ${D} but 
are now pointing into root. I'm executing bitbake from a makefile, which 
also seems to have and effect on this (starting bitbake directly 
preserves those variables).

- Henri


