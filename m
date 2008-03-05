Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JX0Ub-0003JI-Bv
	for openembedded-devel@openembedded.org; Wed, 05 Mar 2008 21:45:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25KhkiT017631
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 20:43:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17310-05 for <openembedded-devel@openembedded.org>;
	Wed,  5 Mar 2008 20:43:42 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25KheEq017625
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 20:43:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803051349.39583.geoffrey@pager.net>
References: <200803051349.39583.geoffrey@pager.net>
Date: Wed, 05 Mar 2008 20:43:41 +0000
Message-Id: <1204749821.8110.178.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AVR32 + OpenEmbedded: Problems with uclibc-initial	do_populate_staging()
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
X-List-Received-Date: Wed, 05 Mar 2008 20:45:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Wed, 2008-03-05 at 13:49 -0600, Geoffrey Wossum wrote:
> I'm working on getting OpenEmbeddded to build for an AVR32 system.  Right now 
> I'm using an AT32STK1000, although eventually I'll be running on custom 
> hardware.
> 
> I've been having problems getting past the uclibc-initial (0.9.28).  I get an 
> error when it attempts do_populate_staging().  Here's the error I've been 
> getting.

I think both your fixes are correct. Those changes were already made in
poky but had got lost somewhere between there and OE.dev, I'll sync them
up. Thanks for the report and let us know if anything doesn't work after
I merge them.

Cheers,

Richard



