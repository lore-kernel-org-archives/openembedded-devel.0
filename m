Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JQpBV-0006I9-MO
	for openembedded-devel@openembedded.org; Sun, 17 Feb 2008 20:28:23 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JQpAu-0004kP-GV
	for openembedded-devel@openembedded.org; Sun, 17 Feb 2008 19:27:44 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 Feb 2008 19:27:44 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 17 Feb 2008 19:27:44 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 17 Feb 2008 20:27:30 +0100
Message-ID: <fpa1r2$fa6$1@ger.gmane.org>
References: <foteat$i6s$1@ger.gmane.org> <47B853FA.5060206@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <47B853FA.5060206@gmx.net>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] push those patches, push'em up
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
X-List-Received-Date: Sun, 17 Feb 2008 19:28:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> while I like the idea I wonder what we do with patches taken from other
> famous distributions.

Hi Robert,

thank you for the important question.  I guess there is not one single
answer, but I think taking patches from other distributions makes a lot
of sense.  That is where the proposed and optional "origin:"-line would
come into play.

Now what to do about "upstream:".  I guess there are two possibilities here.

1) you can establish that the patch is already pushed upstream.  Then
   all you need to do is include the URL of the bug report somebody else
   made.  You get extra kudos for making a comment in that bug report
   that OE also uses and endorses the patch.  This is the most desirable
   and thus you should search the upstream bug tracker first.
2) you cannot establish that the patch is already pushed upstream.  I'd
   say, it is best then to open a new bug report upstream, include the
   URL to it in "upstream:" and let the upstream people mark it as dupe
   should there have been another report.  Mentioning the debian origin
   should increase the likelihood of it getting applied, I assume.

I just realize now that this approach depends on debian and other
distros using public channels to push their patches upstream.  Do you
happen to know if that is usually the case?

Regards

Rolf



