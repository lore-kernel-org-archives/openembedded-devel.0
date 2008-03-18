Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>)
	id 1Jbk1b-0002vH-RT; Tue, 18 Mar 2008 23:11:17 +0100
Received: from [212.23.103.13] (helo=[10.129.53.66])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.60)
	(envelope-from <zecke@selfish.org>)
	id 1Jbk1b-0000oG-6u; Tue, 18 Mar 2008 23:11:15 +0100
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Mar 2008 23:11:01 +0100
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200803182311.01445.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 212.23.103.13
X-SA-Exim-Connect-IP: 81.169.183.159
X-SA-Exim-Mail-From: zecke@selfish.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-users@lists.openembedded.org
Subject: The tzdata package and a bug with tzdata-dbg
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
X-List-Received-Date: Tue, 18 Mar 2008 22:11:17 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hey,

there are not many consumers of the tzdata package but there is one issue you 
might have when updating:
	Both tzdata and tzdata-dbg are providing tzdata and at least my version of 
	ipkg preferred tzdata-dbg over tzdata. The result is that you don't have the
	standard zoneinfo information for cities like New_York.

You want to get rid of tzdata-dbg and you want to get tzdata in this case, I 
have no idea how to do this in ipk terms. An Replace in tzdata 
for "tzdata-dbg" is not enough. I think tzdata-dbg should stop providing 
tzdata and at one point be removed. I have a fix in the OpenMoko OE tree and 
will do one for OE.dev now.


z.

PS: Do we have a policy for such kind of bugs?


