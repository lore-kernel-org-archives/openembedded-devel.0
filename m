Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LjjTI-0006Wn-U6
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Mar 2009 01:17:41 +0100
Received: from gandalf.denix.org ([71.255.243.27]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGO00AY8E3CUHV1@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	17 Mar 2009 19:16:30 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AE56A6B83A8; Tue,
	17 Mar 2009 20:16:24 -0400 (EDT)
Date: Tue, 17 Mar 2009 20:16:24 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090318001624.GB20384@denix.org>
References: <1237328436.20770.57.camel@homestead>
	<d1b08f940903171633l7c66f604rfa6375bd95b2c3bf@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <d1b08f940903171633l7c66f604rfa6375bd95b2c3bf@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=AWL,BAYES_40,
	FM_FAKE_HELO_VERIZON,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Cleaning tmp folder
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
X-List-Received-Date: Wed, 18 Mar 2009 00:17:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 18, 2009 at 12:33:58AM +0100, Andrea Adami wrote:
> This will change hopefully soon. There are plans to redesign the whole tmpdir.
> My first wish is to have pstage out of there, in order to reduce build
> time (I'd keep /tmp in RAM).

Ah, I just replied to the original email, but wanted to follow up with you...

As part of Koen's directory restructuring proposal, I suggested to have 
DEPLOY_DIR moved outside of TMPDIR, which was generally accepted (so I guess 
I need to prep a patch for review...)

By default, pstage is located inside DEPLOY_DIR, thus once the above change is 
done, it would be Ok to kill TMPDIR but still use pstage packages, reducing 
the build time.

There maybe some issues though, when packages don't get rebuild even though 
there were changes - mostly because PR is not bumped or because one 
of *_FEATURES variables got changed...

-- 
Denys


