Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NchbP-0001fW-O6
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 16:57:18 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 23382491264;
	Wed,  3 Feb 2010 16:54:50 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 3 Feb 2010 16:55:27 +0100
Message-ID: <4B699C5A.70909@dresearch.de>
Date: Wed, 03 Feb 2010 16:55:06 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>
	<4B684D9D.2030001@dresearch.de>
In-Reply-To: <4B684D9D.2030001@dresearch.de>
X-OriginalArrivalTime: 03 Feb 2010 15:55:27.0444 (UTC)
	FILETIME=[4DE18140:01CAA4E9]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Wed, 03 Feb 2010 15:57:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
>> I am building ossie-image in openembedded using bitbake command but
>> it is giving error of not finding boost_filesystem library.
>> What exactly is this error.Plz guide me.
> 
> Since today i see a similar problem when doing a clean bitbake of
> glib-2.0. It seems to be a problem with automake/automake. :(

I think i've identified this patch as cause of the problems.

  commit b1caa21ab2590689f3b6ff68483803701c12d721
  Author: Graeme Gregory <dp@xora.org.uk>
  Date:   Tue Jan 26 12:02:08 2010 +0000

Steffen



