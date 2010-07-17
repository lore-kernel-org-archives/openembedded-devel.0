Received: from smtp-1.concepts.nl ([213.197.30.124])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1Oa9VY-0007Xw-DE
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 17:40:58 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-1.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>)
	id 1Oa9VR-0005cc-6Q; Sat, 17 Jul 2010 17:40:49 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 5E3CA6A0F3;
	Sat, 17 Jul 2010 17:40:44 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sat, 17 Jul 2010 17:40:38 +0200
User-Agent: KMail/1.9.9
References: <AANLkTikZkRU-dCiBNlVdZ6XYsdBk3MjZBksexc6JtSAT@mail.gmail.com>
	<1279373863.21888.10.camel@lenovo.internal.reciva.com>
	<AANLkTimFuoxBKczjwGexQZAVGwEXqkHqfSbCf7xf7x90@mail.gmail.com>
In-Reply-To: <AANLkTimFuoxBKczjwGexQZAVGwEXqkHqfSbCf7xf7x90@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007171740.39115.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1Oa9VR-0005cc-6Q
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.124
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: busybox mdev
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
X-List-Received-Date: Sat, 17 Jul 2010 15:40:58 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 17 July 2010 17:09:28 Bernhard Reutner-Fischer wrote:
> Baking micro-base (not -image) tries to build udev for me?

Many packages (R)DEPEND on udev, it's very hard to build anything these days 
without dragging in udev.

What I usually do is add

PROVIDES += "udev"
RPROVIDES_${PN}-mdev += "udev"

to the busybox recipe, and just assume that whatever all those packages 
claim they need udev for, is provided by mdev as well...

And set a

PREFERRED_PROVIDER_udev = "busybox"

(I do that from the distro. People might argue this has to be an image 
decision instead of a distro decision, but I prefer to set 
IMAGE_DEV_MANAGER in the distro instead of the image..)

Rgds, Pieter


