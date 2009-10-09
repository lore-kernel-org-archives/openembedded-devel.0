Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MwEwZ-0005C9-6r
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Oct 2009 14:51:38 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 8A70116E235;
	Fri,  9 Oct 2009 14:50:45 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 47DCC2A426F;
	Fri,  9 Oct 2009 14:50:45 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 9 Oct 2009 14:52:14 +0200
Message-ID: <4ACF317D.7060808@dresearch.de>
Date: Fri, 09 Oct 2009 14:50:05 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ACEFD4C.6060606@dresearch.de>
In-Reply-To: <4ACEFD4C.6060606@dresearch.de>
X-OriginalArrivalTime: 09 Oct 2009 12:52:14.0796 (UTC)
	FILETIME=[536BC8C0:01CA48DF]
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build exception in sgmlspl-native
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
X-List-Received-Date: Fri, 09 Oct 2009 12:51:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> 'bitbake sgmlspl-native' fails in dev-branch (with last commit
> b696acdd7296726efce684e3434f6a6445ddd992) with this exception:
> 
> ERROR: Error in executing:
> /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
> ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'
> 
> For details see attached log. Could this be a linux vs. linux-gnu
> related problem?

I've done some tests and the build was definitly broken by

 commit d685ab28a425740b4d6c98abb1423d7904240724
 Author: Khem Raj <raj.khem@gmail.com>
 Date:   Wed Oct 7 12:39:04 2009 -0700

    insane.bbclass: Use linux-gnu for TARGET_OS

    * Add linux-uclibcspe

Can you please have a look at this.

Thx,
Steffen




