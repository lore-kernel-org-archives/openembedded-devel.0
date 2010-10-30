Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PC8Ub-0003tC-6U
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 12:16:58 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LB300BODLU9MLA1@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	30 Oct 2010 05:15:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2B9F414AF6A; Sat,
	30 Oct 2010 06:15:45 -0400 (EDT)
Date: Sat, 30 Oct 2010 06:15:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101030101545.GB21651@denix.org>
References: <1288286551-4700-1-git-send-email-msmith@cbnco.com>
	<AANLkTinWpXoGqD5iNN+h-YEN9suQd3zac5E3FTvM7m39@mail.gmail.com>
	<Pine.LNX.4.64.1010281443540.5082@juice.ott.cti.com>
	<AANLkTikbv9bF9fBvFU2_C6sK13A23wBXgRzwbX++VLhq@mail.gmail.com>
	<4CC9E691.9000809@cbnco.com>
	<AANLkTimEEdaQub15asdbRzHPfatmtqXNqpTvfp2DM55o@mail.gmail.com>
	<4CCAE1DB.1030504@cbnco.com>
MIME-version: 1.0
In-reply-to: <4CCAE1DB.1030504@cbnco.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] curl: make CURL_FEATURES configurable again
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
X-List-Received-Date: Sat, 30 Oct 2010 10:16:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 29, 2010 at 11:01:47AM -0400, Michael Smith wrote:
> Khem Raj wrote:
>> On Thu, Oct 28, 2010 at 2:09 PM, Michael Smith <msmith@cbnco.com> wrote:
>>> Do you have any thoughts on how to solve it? There is not much point to
>>> having CURL_FEATURES as a variable if it's not configurable. I can just 
>>> hack
>>> over it in an amend.inc, but the recipe as it stands is broken.
>> yes if we had the recipe type overrides for native sdk and target
>> separate then this could
>> be done probably by appending to concerning override
>
> OK, what if we get rid of CURL_FEATURES entirely, and the anon python that 
> handles it. No one in-tree is using CURL_FEATURES, and it's been broken for 
> a couple weeks now.
>
> It'll be easy enough to override the depends and configure opts in a recipe 
> amend for anyone who needs that control (i.e. me).

It has been discussed before (check irc logs 7-10 days ago) and Khem made a 
change to introduce new override called "target", which can be used in this 
case. Anyway, I ended up fixing it by amend in my overlay:

http://arago-project.org/git/?p=arago.git;a=commitdiff;h=37979c41a04f7712dbf9c325871fea7c01cc737a

-- 
Denys


