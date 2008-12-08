Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L9mcl-0000UG-Mi
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 21:22:35 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L9mZ0-0006Wg-8F
	for openembedded-devel@openembedded.org; Mon, 08 Dec 2008 20:18:42 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 20:18:42 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 08 Dec 2008 20:18:42 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 08 Dec 2008 21:18:34 +0100
Message-ID: <ghjveq$opa$1@ger.gmane.org>
References: <c384c5ea0812081135l44781a3fw1a43dba861a44f0f@mail.gmail.com>
	<20081208200545.GM15204@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <20081208200545.GM15204@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Mon, 08 Dec 2008 20:22:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08-12-08 21:05, Tom Rini wrote:
> On Mon, Dec 08, 2008 at 08:35:53PM +0100, Leon Woestenberg wrote:
>> Hello,
>>
>> I have come across a range of problems on non-buildable stuff lately
>> and I think we are facing host-dependencies again wrt (at least)
>> GNOME.
>>
>> How many people are building GNOME/X stuff on non-X hosts (such as
>> Ubuntu Server)?
>
> I am, and found that libx11 has a dependency on host
> /usr/include/X11/keysymdef.h (it does a very stupid does this file exist
> test) but haven't had a chance to fix it yet.

Even with this:

xorg-lib/libx11_1.1.5.bb:            file://keysymdef_include.patch;patch=1"
xorg-lib/libx11_1.1.5.bb:EXTRA_OECONF += "--without-xcb 
--with-keysymdef=${STAGING_INCDIR}/X11/keysymdef.h"

?



