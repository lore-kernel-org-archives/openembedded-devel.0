Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OgRNT-00011h-JV
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 01:58:43 +0200
Received: from gandalf.denix.org ([unknown] [71.255.225.53])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6L00HCWP90GO63@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	03 Aug 2010 18:58:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D92F014AF60; Tue,
	03 Aug 2010 19:58:11 -0400 (EDT)
Date: Tue, 03 Aug 2010 19:58:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100803235811.GC17391@denix.org>
References: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
	<i38mr6$ng8$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <i38mr6$ng8$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Tue, 03 Aug 2010 23:58:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Aug 03, 2010 at 11:17:26AM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 02-08-10 22:19, Frans Meulenbroeks wrote:
> > This patch removes all occurrences of
> > do_stage() {
> >         autotools_stage_all
> > }
> > including all kind of variants w.r.t whitespace
> 
> [..]
> 
> > my proposal would be to apply it, and if there are a 
> > few recipes broken after that, accept is as collateral damage and fix 
> > it afterwards.
> 
> Agreed
> 
> Acked-by: Koen Kooi <koen@openembedded.org>

First collateral damage - libxcb was broken, due to xcb-proto.inc having 
do_stage(). Worked with Khem to find the cause and thanks for pushing the fix:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b0061845a60d7781f9287ae6955585485f5ba8e9

-- 
Denys


