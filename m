Received: from mail.reciva.com ([62.7.80.110] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1PJ1Qr-0006QC-KT
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 11:09:34 +0100
Received: from [192.168.106.10] (helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1PJ1Pk-0001tg-Dd
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 10:08:25 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1PJ1Pk-0005bF-7T
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 10:08:24 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<ic06a8$uft$1@dough.gmane.org> <4CE3A6DE.2070203@xora.org.uk>
	<ic0aj2$hqc$1@dough.gmane.org>
	<AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>
Date: Thu, 18 Nov 2010 10:08:23 +0000
Message-ID: <1290074903.3183.202.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-Broken-Reverse-DNS: no host name found for IP address 192.168.106.10
X-SA-Exim-Connect-IP: 62.7.80.110
X-SA-Exim-Mail-From: philb@gnu.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Thu, 18 Nov 2010 10:09:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-11-17 at 11:26 -0800, Khem Raj wrote:
> Should we create a release branch before we release and solidify that ? 

Yes, please do that.  We discussed this issue at yesterday's TSC meeting
(full minutes to follow shortly) and the consensus was that trying to
enforce a complete freeze on master at short notice is not going to be
practical.

Obviously the exact process you use is up to you, but I would suggest
something along the lines of:

1. make a stabilisation branch from some semi-arbitrary point, maybe one
of the existing weekly test versions.

2. do testing on this branch.

3. cherry-pick and/or revert changesets on the branch as
necessary/desired.

4. iterate steps 2/3 until you are happy with the quality or the
deadline is reached.

5. tag the release from the current head of that branch.

p.




