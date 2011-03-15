Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PzcMQ-00077e-8e
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 23:05:02 +0100
Received: from gandalf.denix.org ([unknown] [71.251.48.61])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LI400K0ID91KFJ0@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	15 Mar 2011 17:03:02 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2945F14AF6A; Tue,
	15 Mar 2011 18:03:01 -0400 (EDT)
Date: Tue, 15 Mar 2011 18:03:01 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110315220301.GC3042@denix.org>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
MIME-version: 1.0
In-reply-to: <1300180117.2522.14.camel@eha>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Eliminating dependency race-conditions (was Re: [PATCH]	net-snmp: disable libnl use)
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
X-List-Received-Date: Tue, 15 Mar 2011 22:05:02 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 15, 2011 at 10:08:37AM +0100, Esben Haabendal wrote:
> On Fri, 2011-03-11 at 12:04 +0100, Steffen Sledz wrote:
> > which occurred sometimes depending on build order (not in clean
> > package only builds).
> 
> I would like to raise awareness of the underlying problem here.
> 
> The current dependency/staging model of OE basically has this feature
> that a build can be influenced not only by it's own dependencies, but
> also what has been build before it (or not).
> 
> I strongly believe that this has to be fixed on the architectural level,
> and not just on a case-by-case level as is currently needed.
> 
> I haven't received much feedback on the preivous posting about the
> per-recipe staging principle implemented in OE-lite, but I decided to
> take this opportunity to re-iterate the fact that the OE-lite
> implementation of staging and build dependencies eliminates this
> problem.
> 
> I am still very much interested in discussing how to move this
> technology from OE-lite to OE, but as it impacts all recipe metadata
> (build dependencies has to be redefined), OE community at a large really
> needs to value the benefits of solving this problem.

Esben,

Thanks for raising this issue and making people aware of it!

This has previously been discussed several times, including last time during 
the Yocto Summit in December, where I brought up the question of per-package 
staging/dependency to Richard's attention, when he introduced the new Shared 
State (sstate). While per-package dependency wasn't considered a critical 
must-have feature right away, it was acknowledged as something worthwhile 
looking at and, according to Richard, should be easy to accomplish with the 
new sstate functionality...

-- 
Denys


