Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LDDEC-000293-IR
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 08:23:24 +0100
Received: from [172.16.23.192] (helo=buddha.tw.openmoko.com ident=Debian-exim)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.org>)
	id 1LDD9a-0000ma-NE for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 15:18:48 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.org>) id 1LDD9x-0000fB-V5
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Dec 2008 15:19:01 +0800
Date: Thu, 18 Dec 2008 15:19:01 +0800
From: John Lee <john_lee@openmoko.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20081218071901.GB2135@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.192
X-SA-Exim-Mail-From: john_lee@openmoko.org
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: openmoko-merges
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
X-List-Received-Date: Thu, 18 Dec 2008 07:23:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please review john_lee/openmoko-merges.  I started from
holger/openmoko-merges then rebased it to oe.dev.

The general principle is:

1) Minimal impact: most of the big changes apply to om distro only.
My thought is we merge this first, then apply to the general.

2) Keep history: I did it the hard way by cherry-picking one by one
since the history is different after the mtn->git switch.  Most of the
commit messages are kept, but that creates a lot of commits to review.

3) PKG_TAGS, qtopia, toolchain, om-utils and opkg stuffs are left out
for later merge.

Not sure how long it's going to take.  My plan is to merge it this
Monday if it's okay...


Regards,
John


