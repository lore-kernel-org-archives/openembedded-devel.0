Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1L3Xr4-0001yQ-5o
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Nov 2008 16:23:34 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 7A40E16DF7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2008 16:29:51 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id B5EA62A4145
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Nov 2008 16:20:56 +0100 (CET)
Received: from [10.24.0.58] ([10.24.0.58]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 21 Nov 2008 16:20:57 +0100
Message-ID: <4926D1D1.6030204@dresearch.de>
Date: Fri, 21 Nov 2008 16:20:49 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.17 (X11/20080922)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gg6aes$5vf$1@ger.gmane.org>
In-Reply-To: <gg6aes$5vf$1@ger.gmane.org>
X-OriginalArrivalTime: 21 Nov 2008 15:20:57.0964 (UTC)
	FILETIME=[C107AAC0:01C94BEC]
Subject: Re: Revert "busybox: Disable busybox shadow support for Angstrom"
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
X-List-Received-Date: Fri, 21 Nov 2008 15:23:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Graeme and I reverted "busybox: Disable busybox shadow support for
> Angstrom", the commit message explains it:
> 
> "Revert "busybox: Disable busybox shadow support for Angstrom"

Mea culpa! Mea maxima culpa!

My fault. I will write down the new committers instructions 100 times as penalty. OK?

But back to the problem. It was reportet as bug 4808 (see http://bugs.openembedded.net/show_bug.cgi?id=4808) on November the 6th. Busybox 1.11.3 for Angstrom is build with shadow support, but Angstrom does not install /etc/shadow. This results in problems when calling the passwd command. Earlier busybox versions do not enable shadow support for Angstrom.

I see two possible solutions:

1. the patch i committed illegaly

2. install /etc/shadow and fully support it (i believe ther is something more to do here)

Regards,
Steffen


