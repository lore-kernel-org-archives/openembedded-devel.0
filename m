Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GIy6e-00025Y-PL
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Sep 2006 03:46:05 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 2E6A49DD78
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2006 11:43:45 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14938-03
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Sep 2006 11:43:43 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 71AF59DB84
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2006 11:43:43 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 67306FC339F; Fri,  1 Sep 2006 11:43:43 +1000 (EST)
Date: Fri, 1 Sep 2006 11:43:43 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20060901014343.GA27386@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org
References: <20060828235951.GA16344@twibble.org>
	<20060829004122.GA22529@twibble.org>
	<44F54AA0.9050901@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <44F54AA0.9050901@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: patcher changes - quilt patching breakage?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2006 01:46:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 30, 2006 at 10:21:52AM +0200, Koen Kooi wrote:
> Jamie Lenehan schreef:
[...]
> > The patch command used to mkdir the patches directory, but this is no
> > longer happening. The following patch appears to make things work
> > again - does this look correct to people who understand this patch
> > class?
> 
> That patch isn't quite right yet, consider this recipe:

Yeah, I'd assumed if quilt was being called all the required
directories it needed had been created... which, as your point out,
is obviously not always true.

[...]
> that blows up. Does python have an os.mkdirhier?

It apparently does (as the followup by Cyril shows) and it was fixed
by Chris shortly after I submitted my change.

Thanks.

-- 
 Jamie Lenehan <lenehan@twibble.org>


