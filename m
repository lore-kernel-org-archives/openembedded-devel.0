Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1Gn1Ex-0007OM-T7
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Nov 2006 00:10:52 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 4A370BD4BE;
	Thu, 23 Nov 2006 10:07:57 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 04219-08; Thu, 23 Nov 2006 10:07:55 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 03CE0BD4BD;
	Thu, 23 Nov 2006 10:07:55 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id EEE781631DA4; Thu, 23 Nov 2006 10:07:54 +1100 (EST)
Date: Thu, 23 Nov 2006 10:07:54 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: Paul Sokolovsky <pmiscml@gmail.com>
Message-ID: <20061122230754.GA20164@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	Paul Sokolovsky <pmiscml@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20061120043254.GA19760@twibble.org>
	<1616846329.20061122174526@gmail.com>
Mime-Version: 1.0
In-Reply-To: <1616846329.20061122174526@gmail.com>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Changes to populate-volatile.sh / new volatiles class
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
X-List-Received-Date: Wed, 22 Nov 2006 23:10:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 22, 2006 at 05:45:26PM +0200, Paul Sokolovsky wrote:
[...]
>   Jamie, doing something about populate-volatile.sh is good. Once I
> found it to be taking pretty long time on load, but it was with
> Familiar. I know that OE uses cache and that should help. Still,
> didn't you think about nice short populate-volatile.c? I guess, config

I haven't really noticed any issues with it from a speed point of
view (too busy noticing it not working when I add packages) so I
didn't think about a C version. That update-alternatives thing on the
other hand I have definately been thinking about redoing in C when I
get a chance - it's painfully slow. But yeah, it should be pretty
trivial to do populate-volatiles in C and that would remove the need
for the cache thing altogether.

For now I'm probably more concerned with fixing the things that are
broken then making things work faster ;)

-- 
 Jamie Lenehan <lenehan@twibble.org>


