Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1I7vfx-0003f9-3m
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 18:01:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l69FtkPv029764
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Jul 2007 16:55:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29577-03 for <openembedded-devel@openembedded.org>;
	Mon,  9 Jul 2007 16:55:40 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l69FtdRu029742
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 9 Jul 2007 16:55:39 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <128309124.20070709154303@gmail.com>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
Date: Mon, 09 Jul 2007 16:55:38 +0100
Message-Id: <1183996538.5757.55.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 16:01:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-07-09 at 15:43 +0300, Paul Sokolovsky wrote:
>   Oh, I guess it's the other way around - it's a simple config and
> shell script which can do things for which whole big daemons with
> gross dependencies are required ;-).
> 
>   More seriously, it makes no sense to ignore the fact that X with
> freedesktop.org's novelties is not the only and won't become the only
> choice for embedded GUI. Many adhoc toolkits pop up, and some of them
> will be leveraged by vendors and it makes no sense to say that OE is
> not place for them (though community distros are of course much less
> interested in them). It would be nice to anticipate the need for a
> lightweight, flexible, and consistent way to query device params for
> them.

Agreed.

> > And
> > we were explicitly asked *not* to merge it into OE by someone from o-hand.
> 
>    Pity.

I'm not going to stop anyone, it just at least needed discussion which
is now happening.

> >>   I think that it is great tool, and we should merge and leverage it
> >> in OE by all means. But it handles only runtime configuration,
> 
> > And we already have sufficient tools inplace to handle that, formfactor just muddies the
> > waters.
> 
>   Hopefully cleans up, though yes, it opens question that GPE scripts
> would be needed converted to it, etc.

I guess GPE would need to decide this and the OE needs to decide whether
to follow its own approach or patch GPE to use some internal OE method.

>   Also a note of exact semantics of those vars - they provide *some
> default* screen resolution and orientation. Actually not some, but the
> most appropriate after-install default. So, in particular,
> notebook-style keyboarded devices would have:
> 
> MACHINE_DISPLAY_WIDTH_PIXELS=640
> MACHINE_DISPLAY_HEIGHT_PIXELS=480
> 
> A device with vertical PDA layout would have
> 
> MACHINE_DISPLAY_WIDTH_PIXELS=480
> MACHINE_DISPLAY_HEIGHT_PIXELS=640

The intent was to provide the hardware resolution the device should
default to along with any rotation parameter.

For spitz, this is 480x640 with 270 degree rotation.

Since the c7x0 can rotate in hardware, that defaults to 640x480 with no
rotation.

My point is that the above is the default hardware resolution which has
to be combined with a rotation parameter to be fully meaningful.

Cheers,

Richard




