Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PJPWe-0004Md-BA
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 12:53:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 24416314AD79
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 12:52:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Em81PXhhHyrX
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 12:51:56 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 18214314ACEA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Nov 2010 12:51:56 +0100 (CET)
Message-ID: <4CE664DB.30709@opendreambox.org>
Date: Fri, 19 Nov 2010 12:51:55 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <E1PJA5d-0001qe-R1@melo.openembedded.org>
	<AANLkTinfS==Wq=xreD6uJA8g7sNKwDw8roPGXRAsihkw@mail.gmail.com>
In-Reply-To: <AANLkTinfS==Wq=xreD6uJA8g7sNKwDw8roPGXRAsihkw@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Andreas Oberritter : pkgconfig.bbclass: don't blindly install every . pc file
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
X-List-Received-Date: Fri, 19 Nov 2010 11:53:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Andrea,

thanks for spotting this.

On 11/19/2010 09:46 AM, Andrea Adami wrote:
> Hello, I suspect this commit broke two packages of x11-gpe-image
> (do_configure fails, libcontactsdb and libtododb).
> 
> http://tinderbox.openembedded.net/packages/994709/
> http://tinderbox.openembedded.net/packages/994704/
> 
> 
> For the rest, console-image, opie-image and x11-image built just fine.
> I'll investigate later today.

Please try removing the do_install function from libgpepimc.inc first.

If this does not work for whatever reason, libgpepimc.pc needs to be
installed manually in do_install like this:

install -d ${D}${libdir}/pkgconfig
install -m 0644 ${WORKDIR}/libgpepimc.pc ${D}${libdir}/pkgconfig

Regards,
Andreas


