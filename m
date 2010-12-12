Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PRopG-00012w-02
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Dec 2010 17:31:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C9D21314B9DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 17:29:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 9viUZbGIAEmf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 17:29:27 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 508FB314B9DA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 17:29:27 +0100 (CET)
Message-ID: <4D04F863.6000006@opendreambox.org>
Date: Sun, 12 Dec 2010 17:29:23 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1292169236.13905.40.camel@mattotaupa>
In-Reply-To: <1292169236.13905.40.camel@mattotaupa>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OT: cross compiling: `?=` or `+=` for `INCLUDES`
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
X-List-Received-Date: Sun, 12 Dec 2010 16:31:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/12/2010 04:53 PM, Paul Menzel wrote:
> Dear OE folks,
> 
> 
> what is the best practice for Makefiles with `INCLUDES`? On the VDR list
> it was requested to use `+=` instead of `?=`. [1]
> 
>         However, in the Makefile changes:
>         -INCLUDES = -I/usr/include/freetype2
>         +INCLUDES ?= -I/usr/include/freetype2
>         
>         Shouldn't that be += instead of ?=.
>         
>         In my case, my IDE sets INCLUDES with some custom stuff. Therefore the
>         Makefile does not touch INCLUDES any more and I get an error.
> 
> Is it common when changing `INCLUDES` that one has to take care about
> this by oneself, i. e. by adding `-I/usr/include/freetype2` to
> `INCLUDES`? Or is there a better way?

IMO you should use pkg-config or freetype-config instead, e.g.:

INCLUDES ?= `pkg-config --cflags freetype2`

or better, instead of using INCLUDES at all:

FREETYPE_CFLAGS ?= `pkg-config --cflags freetype2`
CFLAGS += $(FREETYPE_CFLAGS)

This will work in most environments.

Regards,
Andreas


