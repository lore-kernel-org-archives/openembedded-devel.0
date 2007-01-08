Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1H3jML-0005k5-5C
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 02:31:33 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1H3jG7-0007Oe-0K
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 02:25:07 +0100
Received: from r7753.r.ppp-pool.de ([89.54.119.83])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 08 Jan 2007 02:25:06 +0100
Received: from no2spam by r7753.r.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 08 Jan 2007 02:25:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 08 Jan 2007 02:18:43 +0100
Message-ID: <ens65m$i2b$1@sea.gmane.org>
References: <20061230051641.GA30225@hezmatt.org>	<1167506369.5626.46.camel@localhost.localdomain>	<20061230214326.GE15188@hezmatt.org>	<4596E33D.306@dominion.kabel.utwente.nl>	<20061230235938.GC16490@hezmatt.org>	<1167523571.5626.59.camel@localhost.localdomain>	<459786C7.70000@dominion.kabel.utwente.nl>	<1168200264.15021.54.camel@ip6-localhost>	<1662139633.20070107231632@gmail.com>
	<20070107220333.GC6625@hezmatt.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: r7753.r.ppp-pool.de
User-Agent: Thunderbird 1.5.0.9 (X11/20070103)
In-Reply-To: <20070107220333.GC6625@hezmatt.org>
Sender: news <news@sea.gmane.org>
Subject: Re: A question of workflow
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
X-List-Received-Date: Mon, 08 Jan 2007 01:31:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Matthew Palmer wrote:
> For example, a few days ago Marcin asked for a patch to make a build of a
> newer version of fakeroot; I'd have whipped that patch up by now except that
> I know that it's going to cause a conflict when the change comes back down,
> so I'm loathe to make the change until I work out how I can manage the patch
> flow

The way I handled this before having rw access was to use quilt and it 
worked nicely for me.  Actually, I still use this for stuff I cannot be 
sure to fix in one setting to commit right after.

Workflow (optimistically assuming no loops and pauses here)

  quilt new some.patch
  quilt edit packages/somepackage/some.bb
  quilt refresh

and then send the patch to the bug tracker.  Before updating monotone, I 
back out all quilt patches (cron does this for me daily)

  quilt pop -a && mtn pull && mtn update && quilt push -a

Maybe this is workable for others as well?



