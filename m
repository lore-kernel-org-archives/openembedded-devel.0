Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L9mRY-0007PU-AE
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 21:11:00 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081208200705.UQDP8485.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 8 Dec 2008 15:07:05 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id ok5a1a0051E665w04k6gMv; Mon, 08 Dec 2008 15:07:04 -0500
X-Authority-Analysis: v=1.0 c=1 a=_VIQ-ywkdO8A:10 a=ceBA5YwD84MA:10
	a=HOtL71IXdx7QqhmA8moA:9 a=E-9oj_9f8K2mOES6NlRvdTOJdhUA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 8 Dec 2008 13:05:45 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081208200545.GM15204@smtp.west.cox.net>
References: <c384c5ea0812081135l44781a3fw1a43dba861a44f0f@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0812081135l44781a3fw1a43dba861a44f0f@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: OE buildable on headless hosts?
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
X-List-Received-Date: Mon, 08 Dec 2008 20:11:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 08, 2008 at 08:35:53PM +0100, Leon Woestenberg wrote:
> Hello,
> 
> I have come across a range of problems on non-buildable stuff lately
> and I think we are facing host-dependencies again wrt (at least)
> GNOME.
> 
> How many people are building GNOME/X stuff on non-X hosts (such as
> Ubuntu Server)?

I am, and found that libx11 has a dependency on host
/usr/include/X11/keysymdef.h (it does a very stupid does this file exist
test) but haven't had a chance to fix it yet.

-- 
Tom Rini


