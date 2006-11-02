Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lenehan@twibble.org>) id 1GfmRL-0005QU-Aq
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Nov 2006 00:57:43 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 8F4A4B7502;
	Fri,  3 Nov 2006 10:56:45 +1100 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18772-02; Fri, 3 Nov 2006 10:56:43 +1100 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 968ECB74ED;
	Fri,  3 Nov 2006 10:56:43 +1100 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 886E72ACAD; Fri,  3 Nov 2006 10:56:43 +1100 (EST)
Date: Fri, 3 Nov 2006 10:56:43 +1100
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20061102235643.GA30907@twibble.org>
Mail-Followup-To: Jamie Lenehan <lenehan@twibble.org>,
	openembedded-devel@lists.openembedded.org,
	Martin Dietze <di@fh-wedel.de>
References: <E1GfdiZ-0005X2-My@linuxtogo.org>
Mime-Version: 1.0
In-Reply-To: <E1GfdiZ-0005X2-My@linuxtogo.org>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Subject: Re: [oe-commits] org.oe.dev libintl-perl: added do_compile() function needed for crosscompilation
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
X-List-Received-Date: Thu, 02 Nov 2006 23:57:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 02, 2006 at 03:38:55PM +0100, "MartinDietze commit" wrote:
> libintl-perl: added do_compile() function needed for crosscompilation
> - the function has obviously been forgotten to add for version 1.16

Hi Martin,

this should not be needed. I've updated clasess/cpan.bbclass to pass
the correct values during configure so that this don't need to be
done in all the perl modules. It works for the few targets I test.

It might by the ld flags that are the problem for you - whatever you
are building for might need the s/ld/gcc/ changes, which I've only
made apply for sh3/sh4 at the moment (but plan to turn on for all
archs to make all the perl stuff a bit simplier).

If you could send me what errors you got without this change and let
me know what target you are building for I'll see if I update
classes/cpan.bbclass to do the right thing. This wuill make sure all
the perl modules build for your target and remove the need to put
this stuff thoughout the perl modules.

-- 
 Jamie Lenehan <lenehan@twibble.org>


