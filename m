Received: from hxhsvr03.internetintuitive.net ([80.254.228.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OUqIY-0000eP-2n
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 02:09:37 +0200
Received: from durham.keylevel.com ([109.224.134.115]:39669
	helo=[192.168.1.98])
	by hxhsvr03.internetintuitive.net with esmtpa (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OUqDx-0001nh-Gx
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 01:04:49 +0100
Message-Id: <4BB2E2A3-3F2C-428D-96DE-C21572DB6931@keylevel.com>
From: Chris Tapp <dokuwiki@keylevel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimhN1fFCIyJK_G8WWGR903UqjtLZsXOzM6LRU4I@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sat, 3 Jul 2010 01:04:47 +0100
References: <59209027-3666-426D-9085-D9F6647B07D5@keylevel.com>
	<AANLkTin42ODhDbRm0CBbFVT5DtFJVCyTqfg1f0VakNEb@mail.gmail.com>
	<411868D6-A821-4909-9F5B-6323EE7F9802@keylevel.com>
	<AANLkTimhN1fFCIyJK_G8WWGR903UqjtLZsXOzM6LRU4I@mail.gmail.com>
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
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: 'Generic' x86 build
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
X-List-Received-Date: Sat, 03 Jul 2010 00:09:39 -0000
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

> if someone had, he would have spoken by now. I guess
> you need to debug it. swapper is a kernel process.
> probably your systems has all memory eaten up
> or there are lot of background processes.

I don't think that's the case.

- This is a 'minimal-image' with nothing added.
- There's about 145MB RAM free

I've just worked out that if I change linuxrx from being a symlink to  
busybox a file that contains:

#!/bin/sh
echo
echo "Simple initrd is active"
echo
mount -t proc /proc /proc
mount -t sysfs none /sys
/bin/sh --login
Then 'swapper' behaves itself and top shows 99.7% idle time.

And that's the only change from previously.

Chris


