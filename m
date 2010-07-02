Received: from hxhsvr03.internetintuitive.net ([80.254.228.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OUpZW-00049u-2X
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 01:23:02 +0200
Received: from durham.keylevel.com ([109.224.134.115]:14485
	helo=[192.168.1.98])
	by hxhsvr03.internetintuitive.net with esmtpa (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OUpUv-0007xf-Nd
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Jul 2010 00:18:17 +0100
Message-Id: <411868D6-A821-4909-9F5B-6323EE7F9802@keylevel.com>
From: Chris Tapp <dokuwiki@keylevel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTin42ODhDbRm0CBbFVT5DtFJVCyTqfg1f0VakNEb@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Sat, 3 Jul 2010 00:18:17 +0100
References: <59209027-3666-426D-9085-D9F6647B07D5@keylevel.com>
	<AANLkTin42ODhDbRm0CBbFVT5DtFJVCyTqfg1f0VakNEb@mail.gmail.com>
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
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Fri, 02 Jul 2010 23:23:02 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

> how about MACHINE=i686-generic or MACHINE=i586-generic
> distro could be angstrom or minimal.

Thanks - Not sure how I managed to miss that one!

Anyway, I've tried i586-generic / minimal for console-image.

- The inittab file included in the rootfs isn't valid for busybox;
- The 'swapper' process is using 100% cpu after the system has booted  
and it's doing nothing.

Does anyone else have this, or is it just me?

Chris



