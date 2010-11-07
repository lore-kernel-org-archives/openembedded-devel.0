Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PF1Cl-0000M2-1l for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 10:06:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PF1Bq-0002dX-R4 for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 10:05:30 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 10:05:30 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 10:05:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 07 Nov 2010 10:05:20 +0100
Message-ID: <ib5q4g$847$1@dough.gmane.org>
References: <4C78D1E1.9080101@mlbassoc.com> <4CB081A4.9010908@mlbassoc.com>
	<20101106141118.GG6691@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <20101106141118.GG6691@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] TI tools - make EULA unpack work when /opt is writeable
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
X-List-Received-Date: Sun, 07 Nov 2010 09:06:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-11-10 15:11, Stefan Schmidt wrote:
> Hello.
> 
> On Sat, 2010-10-09 at 08:52, Gary Thomas wrote:
>> On 08/28/2010 03:07 AM, Gary Thomas wrote:
>>> This patch addresses the problem where the TI tools that need
>>> the EULA unpack into the wrong place if the user has write
>>> permission in /opt. The current behaviour of expecting the
>>> unpacker to fall back to the $HOME environment variable should
>>> not be relied on. The patch changes the unpack step to use
>>> the --prefix= option which will always work.
>>>
>>> Version 2:
>>> * Update patch to be against org.openembedded.dev branch
>>> * Incorporate full description into patch
>>
>> What about this patch?  It's been nearly 6 weeks and no discussion
>> or anything.
>>
>> The problem persists in today's tree.
> 
> Can we have a comment form the TI devs here?

I'm against automatic application of patches.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM1mvQMkyGM64RGpERAjceAJ9CKgqOlknrKWrHs0uX45LbdWFlwwCeMvXy
UCksWN+a/+jo4uNLQOu+rI0=
=SDiM
-----END PGP SIGNATURE-----



