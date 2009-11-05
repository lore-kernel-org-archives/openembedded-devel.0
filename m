Received: from [150.254.30.30] (helo=libra.cs.put.poznan.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1N63yE-0000ny-As for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 16:09:57 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id C6E8784
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 15:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id zU+WJRhomiZC
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 16:08:40 +0100 (CET)
Received: from [150.254.31.31] (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 8BF6982
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2009 16:08:40 +0100 (CET)
Message-ID: <4AF2EAF3.5020808@cs.put.poznan.pl>
Date: Thu, 05 Nov 2009 16:10:43 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
Organization: Poznan University of Technology
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1257427464-316-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
	<20091105140617.GA27537@mi.fu-berlin.de>
In-Reply-To: <20091105140617.GA27537@mi.fu-berlin.de>
X-Enigmail-Version: 0.96.0
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] boost-1.33.1: Corrected GNU_HASH error.
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
X-List-Received-Date: Thu, 05 Nov 2009 15:09:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Henning Heinold wrote:
> thanks for the patch, but I wonder who is using this older version. Mainly 1.3.36 is used.

Did you mean 1.36?

I agree, the older versions look like unmaintained for a long time.

> I prefer and started to fix the apps in oe which are using boost, to get working with 1.4 and
> would be much help if more people joins at this. So in the end we can remove all the 1.3 boost recipe.

Well... this is much up to the deprecation policy. I don't know the
policy for OE regarding deprecation, but common sense suggests removal
when nobody uses -- or at least, when nobody will be surprised.

For me this would be e.g. acceptable in dev branch when announced
appropriately earlier. In stable... I'd restrain from removing anything
harmless.

I aim for 1.40, too, but feeling no pressure I postponed it, as it looks
time consuming (for me, at least).

Przemek



