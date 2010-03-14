Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NqvnH-000713-5B
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 22:56:25 +0100
Received: by gwj23 with SMTP id 23so1009002gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Mar 2010 14:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=/V1YUbNjYnZe1tbPvQZ8R3Sk9omr3mhZ85iHZ0OFOhI=;
	b=CheeucvASeDNlMg3zux1nqPUlddj0lFPIRojFHxEp++rSqDTqA0LQ3F6Nio1/ZiyoJ
	RV9bdjDDdn8SK9PYWsDEGKbPliUGiWRNnKChzVtVSosKfS6AFaWQBKPsmUgtXTHyH/hd
	flAHOeP7XiXzUk+hm4ixD8iquyNOskgg2eGS0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=SZT/s4Z7H7odGRYhNk3V6zQwLGFL1pShIPvYe2hKWtSeylQ0RfKPEbbgOzvirbz23o
	eenqccTlqSRggh5tFEmICAGyNGRSMNVNzvFpczVURjzJvrUyF5FMJnrUJpHwb+6yS71k
	PpvP7HXHlk43NE+lZo9PV4p7X8zLZZqF74ji4=
MIME-Version: 1.0
Received: by 10.101.202.12 with SMTP id e12mr4542260anq.132.1268603597385; 
	Sun, 14 Mar 2010 14:53:17 -0700 (PDT)
Date: Sun, 14 Mar 2010 22:53:17 +0100
Message-ID: <ac9c93b11003141453n7df620c7gca609efe00e0e6f@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re; [PATCH 7/8] autoconf: add 2.65
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
X-List-Received-Date: Sun, 14 Mar 2010 21:56:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Bumped upon this patch of Bernhard.
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg03649.html
As I already deleted it from my inbox I cannot reply on it directly.

I've been playing with autoconf 2.65 myself. There are some issues left:
php-native for me ended up in a hangup in configure. Apparently "yes"
was eating up 100% of my cpu.
From google I learned that php 2.3.0 needs an autoconf < 2.60
(although it builds fine for me with 2.61
Also I could not build libpcap with it. There was some faulty automake
junk generated.
I could not find a decent fix for those problems, so I reverted to 2.61
I suggest some more testing.

Btw the patch itself also apparently had some trailing spaces.

Frans.


