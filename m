Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QLwk9-000503-E3
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 14:17:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 296303150F12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 14:14:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 5P9atiwdHPe1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 14:14:51 +0200 (CEST)
Received: from [172.22.22.61] (drms-590c46b9.pool.mediaWays.net [89.12.70.185])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8E6C23150E26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 14:14:51 +0200 (CEST)
Message-ID: <4DD11539.5070701@opendreambox.org>
Date: Mon, 16 May 2011 14:14:49 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1302825782-17120-1-git-send-email-obi@opendreambox.org>	<1302825782-17120-2-git-send-email-obi@opendreambox.org>	<4DD10D32.30609@opendreambox.org>
	<1305546243.2429.1.camel@phil-desktop>
In-Reply-To: <1305546243.2429.1.camel@phil-desktop>
Subject: Re: [PATCH 2/2] kernel.bbclass: pass AR, NM and OBJCOPY to make
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
X-List-Received-Date: Mon, 16 May 2011 12:17:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/16/2011 01:44 PM, Phil Blundell wrote:
> I'm mildly curious as to what Montavista can have done that requires a
> custom version of ar.  But the patch looks fine to me anyway.

I don't know whether this change came from Montavista or from the vendor
supplying the kernel sources. Anyway, someone changed CROSS_COMPILE to
override the environment, thus using a prefix different from the
toolchain built by OE.

CROSS_COMPILE   = $(shell if [ -f .mvl_cross_compile ]; then \
                                  cat .mvl_cross_compile; \
                          fi)

With the patch applied, the variable CROSS_COMPILE isn't used anymore,
because all cross-tools are specified on the command line in the same
manner.

Another way to solve this problem could have been to set CROSS_COMPILE
on the command line instead of in the environment. I haven't tried that.
I could create an updated patch if this was preferred.

Regards,
Andreas


