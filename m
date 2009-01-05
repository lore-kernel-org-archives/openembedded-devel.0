Received: from [65.182.109.73] (helo=mta4.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1LJy62-0001LB-56
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Jan 2009 23:38:54 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta4.brinkster.com (Postfix) with ESMTP id 8A3EF5ECFA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2009 17:32:53 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
X-Spam-Flag: NO
X-Spam-Score: -0.3
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 tagged_above=-10 required=5 tests=[AWL=0.417,
	BAYES_00=-2.599, RCVD_IN_PBL=0.905, RCVD_IN_SORBS_DUL=0.877,
	RDNS_DYNAMIC=0.1]
Received: from mta4.brinkster.com ([127.0.0.1])
	by localhost (mta4.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9DQzjlJIHlw
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2009 17:32:53 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta4.brinkster.com (Postfix) with ESMTP id 96AD55ECDCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2009 17:32:52 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF596@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF596@hiob.intern.dresearch.de>
Date: Mon, 5 Jan 2009 22:32:18 -0000
Message-ID: <1B316A38B36F4183B9DE5E801598F11D@distantearth.home>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AclvRHy5ySDDzoRLS0yUBfIPXLmXSQAQDY+Q
X-MimeOLE: Produced By Microsoft MimeOLE V6.0.6001.18049
Subject: Re: Problem with bitbake after update
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
X-List-Received-Date: Mon, 05 Jan 2009 22:38:54 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

>After making an svn update from bitbake 1.8.11 (SVN r1080) to 1.8.13 (SVN 
>r1150) i've a little problem with my environment. I use some vars to 
>configure the it:

<snip>

>In the local.conf i use some of them to setup some bbfile collections.

<snip>

>Hmmmm? What's wrong here?

BitBake does not deal with stuff exported to the environment in the same way
in SVN over the old .11. This tripped me up but it is an easy fix :).

I just exported the variables I used to the BitBake white list. 

i.e.

export BB_ENV_EXTRAWHITE="MACHINE DISTRO ANGSTROM_MODE PANDORATOP OEBRANCH
OMAP3BRANCH USERBRANCH"

in my case.

Regards,

John




