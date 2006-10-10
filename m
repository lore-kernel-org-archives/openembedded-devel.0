Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GXPuc-0006RY-Dw
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Oct 2006 00:17:22 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id F2D0CAD8FF;
	Wed, 11 Oct 2006 08:11:08 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23569-10; Wed, 11 Oct 2006 08:11:07 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 53CE6AD89F;
	Wed, 11 Oct 2006 08:11:07 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 4B1E7122F691; Wed, 11 Oct 2006 08:11:07 +1000 (EST)
Date: Wed, 11 Oct 2006 08:11:07 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
Message-ID: <20061010221107.GB20799@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Koen Kooi <koen@dominion.kabel.utwente.nl>,
	openembedded-devel@lists.openembedded.org
References: <20060914001918.GA8432@twibble.org>
	<452B83DC.2020503@dominion.kabel.utwente.nl>
Mime-Version: 1.0
In-Reply-To: <452B83DC.2020503@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: site/* Common site files
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
X-List-Received-Date: Tue, 10 Oct 2006 22:17:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 10, 2006 at 01:28:28PM +0200, Koen Kooi wrote:
[...]
> 
> The consensus is that we want this in OE, how to we proceed to get this added into .dev?

If my implementation was ok then I can push it in over a few days.
The order being:

 - add config_info.bbclass

 - modify recipes that use the site file directly to use config_info instead.

 - update autotools.bbclass to use config_info.bbclass

Then it's ready to actually use. Merging those x86 site files would
be a good place to start.

-- 
 Jamie Lenehan <lenehan@twibble.org>


