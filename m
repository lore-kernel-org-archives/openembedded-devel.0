Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JX033-0006iv-O9
	for openembedded-devel@openembedded.org; Wed, 05 Mar 2008 21:17:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25KFkwi015605
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 20:15:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15383-05 for <openembedded-devel@openembedded.org>;
	Wed,  5 Mar 2008 20:15:41 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m25KFUO9015514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 5 Mar 2008 20:15:30 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803051942.12586.mickey@vanille-media.de>
References: <200803051942.12586.mickey@vanille-media.de>
Date: Wed, 05 Mar 2008 20:15:32 +0000
Message-Id: <1204748132.8110.165.camel@dax.rpnet.com>
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
Subject: Re: sysroot vs. finding header files
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
X-List-Received-Date: Wed, 05 Mar 2008 20:17:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Mickey,

On Wed, 2008-03-05 at 19:42 +0100, Michael 'Mickey' Lauer wrote:
[...]
> With pkgconfig now pointing to /usr (and friends), this no longer finds a 
> keysymdef.h until you have X on your buildhost.
> 
> Any ideas how to fix that in the best way? (I hope there are not more of these 
> things hidden)

You will be pleased to know that:

a) Poky has a patch to "fix" that
b) I've not seen any other package do anything that insane

The bad news is upstream refused the patch on the grounds that "sysroot
is a hack". Once the pkgconfig sysroot stuff becomes more common place,
maybe they'll change their mind...

Cheers,

Richard



