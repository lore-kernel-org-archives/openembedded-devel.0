Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>)
	id 1JRRxi-0006mw-JB; Tue, 19 Feb 2008 13:52:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1JCprKm003548;
	Tue, 19 Feb 2008 12:51:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03118-10; Tue, 19 Feb 2008 12:51:49 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1JCpjSM003539
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 19 Feb 2008 12:51:45 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080219143818.7e62fa44@widy.localdomain>
References: <E1JRMHZ-0002K4-Sk@linuxtogo.org>
	<20080219143818.7e62fa44@widy.localdomain>
Date: Tue, 19 Feb 2008 12:51:45 +0000
Message-Id: <1203425505.21824.40.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev ipkg: Enable debian revision	comparing
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
X-List-Received-Date: Tue, 19 Feb 2008 12:52:44 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2008-02-19 at 14:38 +0200, Paul Sokolovsky wrote:
> Hello,
> 
> On Tue, 19 Feb 2008 07:48:49 +0100
> "rpurdie commit" <openembedded-commits@lists.openembedded.org> wrote:
> 
> > ipkg: Enable debian revision comparing
> > 
> > Author: rpurdie@openembedded.org
> > Branch: org.openembedded.dev
> > Revision: d4732f85d42b87e990dd3cdfed1c9d40f04ff5e8
> > ViewMTN:
> > http://monotone.openembedded.org/revision/info/d4732f85d42b87e990dd3cdfed1c9d40f04ff5e8
> > Files: 1
> > packages/ipkg/files/enable_debversion.patch
> > packages/ipkg/files/update_version_comparision.patch
> > packages/ipkg/ipkg-native_0.99.163.bb
> > packages/ipkg/ipkg.inc
> > packages/ipkg/ipkg_0.99.163.bb
> 
> It's nice to see ipkg to be cleaned up, but I wonder how scalable is
> this? How this relates to opkg effort? I'm sure there's some plan,
> but I happen to not know about it (== it's wasn't mentioned on
> oe-devel), so would be nice to get some insight ;-).

Well, last night I "broke" builds with a valid package upgrade. My
options were to workaround (bump package epoch or bump PR of everything
depending on xcalibratext) or fix the real problem. I chose to hack ipkg
and fix the problem since it was relatively straightforward.

I have already waved the fixes at one of the opkg developers so
hopefully it will be applied there properly and OE can make a transition
to opkg in due course, all the patching won't be necessary and we can
look forward to a package manager that actually works! :)

Cheers,

Richard




