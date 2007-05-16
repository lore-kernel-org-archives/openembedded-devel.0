Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1Ho9xT-0002ee-Qv
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 May 2007 05:13:48 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id EE5E0103EB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2007 13:13:31 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32145-02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2007 13:13:30 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 3C261D8DA8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2007 13:13:30 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 0462CB70149; Wed, 16 May 2007 13:13:29 +1000 (EST)
Date: Wed, 16 May 2007 13:13:29 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070516031329.GA5205@twibble.org>
References: <464613B3.8090003@dominion.kabel.utwente.nl>
	<46461B73.8070900@trolltech.com>
	<46461D72.4020206@dominion.kabel.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <46461D72.4020206@dominion.kabel.utwente.nl>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: uclibc 0.9.29 recipe
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
X-List-Received-Date: Wed, 16 May 2007 03:13:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 12, 2007 at 10:02:58PM +0200, Koen Kooi wrote:
[...]
> I'll add it once I solved the linux-libc-headers problems. Machine and distro maintainers
> need to provide their parts of the uclibc configs to make it usefull, though.

Do we really need different distro based settings? It's always been a
bit annoying that some things will build with uclibc for one build
but not another due to differing uclibc settings - things are a lot
easier if there's only a single configuration.

For now I'd like to see a

  mtn -e mv uclibc-0.9.29/angstrom/uClibc.distro uclibc-0.9.29/uClibc.distro

and then only add distro based configuration if it turns out to be
really needed by some distro. This'll also gives us a default
configuration for people using other distros.

-- 
 Jamie Lenehan <lenehan@twibble.org>


