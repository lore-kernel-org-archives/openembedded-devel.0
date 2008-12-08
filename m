Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L9mmD-0003wv-Ja
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 21:32:22 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081208202826.VTQI8485.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 8 Dec 2008 15:28:26 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id okSX1a00L1E665w03kTg5w; Mon, 08 Dec 2008 15:28:03 -0500
X-Authority-Analysis: v=1.0 c=1 a=_VIQ-ywkdO8A:10 a=ceBA5YwD84MA:10
	a=c1QLPrNUIRTNhvBhAj8A:9 a=QkEdpHDhpQBdPYb8-olce7xk6okA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 8 Dec 2008 13:26:43 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081208202643.GN15204@smtp.west.cox.net>
References: <c384c5ea0812081135l44781a3fw1a43dba861a44f0f@mail.gmail.com>
	<20081208200545.GM15204@smtp.west.cox.net>
	<ghjveq$opa$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ghjveq$opa$1@ger.gmane.org>
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
X-List-Received-Date: Mon, 08 Dec 2008 20:32:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 08, 2008 at 09:18:34PM +0100, Koen Kooi wrote:
> On 08-12-08 21:05, Tom Rini wrote:
>> On Mon, Dec 08, 2008 at 08:35:53PM +0100, Leon Woestenberg wrote:
>>> Hello,
>>>
>>> I have come across a range of problems on non-buildable stuff lately
>>> and I think we are facing host-dependencies again wrt (at least)
>>> GNOME.
>>>
>>> How many people are building GNOME/X stuff on non-X hosts (such as
>>> Ubuntu Server)?
>>
>> I am, and found that libx11 has a dependency on host
>> /usr/include/X11/keysymdef.h (it does a very stupid does this file exist
>> test) but haven't had a chance to fix it yet.
>
> Even with this:
>
> xorg-lib/libx11_1.1.5.bb:            file://keysymdef_include.patch;patch=1"
> xorg-lib/libx11_1.1.5.bb:EXTRA_OECONF += "--without-xcb  
> --with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h"
>
> ?

Don't recall if that was in when I had that problem.

I meant to add, building things in a very empty chroot is quite helpful
:)

-- 
Tom Rini


