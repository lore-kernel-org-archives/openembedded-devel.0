Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K7aHZ-0004i8-An
	for openembedded-devel@openembedded.org; Sat, 14 Jun 2008 20:15:23 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K7aH9-00086k-CQ
	for openembedded-devel@openembedded.org; Sat, 14 Jun 2008 18:14:55 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 14 Jun 2008 18:14:55 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Jun 2008 18:14:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 14 Jun 2008 20:14:43 +0200
Message-ID: <g311qk$q73$1@ger.gmane.org>
References: <20080613225643.86B4D1881B6@amethyst.openembedded.net>	<20080613231709.GB3606@cimmeria.hyboria>	<g2vvg5$3hh$1@ger.gmane.org>	<d1b08f940806140210o54897e92wbcf5e7962c0c49a3@mail.gmail.com>	<g305u5$jbi$1@ger.gmane.org>	<d1b08f940806140634k47bfb782hef80608e39e23c5b@mail.gmail.com>
	<20080614170647.GA3428@cimmeria.hyboria>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a2pre (Macintosh/2008060303)
In-Reply-To: <20080614170647.GA3428@cimmeria.hyboria>
Sender: news <news@ger.gmane.org>
Subject: Re: [oe-commits] org.oe.dev udev-118: go back in time to udev-115 which seems to work slightly better on some Zaurus models
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 14 Jun 2008 18:15:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Sat, Jun 14, 2008 at 03:34:34PM +0200, Andrea Adami wrote:
>> Koen,
>>
>> no evident problems == same behaviour as 118
>>
>> could you keep an eye on the oebug 4118?
>>
> Well I tried to build for tosa, but Im falling over on the fact the
> kernel doesnt build and libtool seems to be busted :-(

I tracked this problem down to the fact that both libtool-cross and 
libtool install stuff into staging.

A possible solution would be to mimic gcc(-cross) so libtool-cross 
creates libltdl packages and stages things and libtool doesn't. This 
does mean that both libtool-cross and libtool need to be the same version.

To get around the current problem:

bitbake -b packages/libtool/libtool-cross_2.2.4.bb

That will tell packaged-staging to (re)stage the correct headers and m4 
files.

regards,

Koen



