Received: from [72.167.82.90] (helo=p3plsmtpa01-10.prod.phx3.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1MaA53-000664-3K
	for openembedded-devel@openembedded.org; Sun, 09 Aug 2009 17:13:05 +0200
Received: (qmail 9444 invoked from network); 9 Aug 2009 14:56:56 -0000
Received: from unknown (75.49.209.3)
	by p3plsmtpa01-10.prod.phx3.secureserver.net (72.167.82.90) with ESMTP;
	09 Aug 2009 14:56:56 -0000
Message-ID: <4A7EE3BF.9060406@mwester.net>
Date: Sun, 09 Aug 2009 09:57:03 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.22) Gecko/20090605 Thunderbird/2.0.0.22 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A792519.20506@gmail.com>
	<200908091530.20800.holger+oe@freyther.de>
In-Reply-To: <200908091530.20800.holger+oe@freyther.de>
Subject: Re: [PATCH] fix portmap on mips, remove old slugos workaround
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
X-List-Received-Date: Sun, 09 Aug 2009 15:13:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Wednesday 05 August 2009 08:22:17 Graham Gower wrote:
>> Portmap built for mipsel with gcc-4.3.3 segfaults instantly, fails to build
> 
> Great, I would like to hear something from SlugOS people though...

Graham's patch builds for SlugOS, and the resultant binary runs without
problem.

BTW, the portmap-unslung_5-9.bb recipe can be removed; it's obsolete.
I'm not in a position to push that change right now, so let's just add
that to the SlugOS cleanup in Graham's original patch.

Mike (mwester)


