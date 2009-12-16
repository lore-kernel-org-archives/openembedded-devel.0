Received: from smtp-out114.alice.it ([85.37.17.114])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NKxYs-0001bf-Hk
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 18:21:21 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out114.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 16 Dec 2009 18:18:27 +0100
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 16 Dec 2009 18:18:25 +0100
Received: from [192.168.1.116] ([80.117.39.136]) by FBCMCL01B01.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 16 Dec 2009 18:18:24 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <F32E8C2599F37641BB4E3F3AC4A3C412016E0369E56F@ws>
References: <F32E8C2599F37641BB4E3F3AC4A3C412016E0369E56F@ws>
Date: Wed, 16 Dec 2009 18:18:19 +0100
Message-Id: <1260983899.3448.6.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-OriginalArrivalTime: 16 Dec 2009 17:18:26.0199 (UTC)
	FILETIME=[C7357A70:01CA7E73]
X-SA-Exim-Connect-IP: 85.37.17.114
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: recipe for libgdiplus
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
X-List-Received-Date: Wed, 16 Dec 2009 17:21:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2009-12-12 at 22:55 +0100, Konrad Mattheis wrote:
> Hi,
> 
> try to build a recipe for libgdiplus. This is a library which you need
> if you want to get Winforms with mono working.
> 
> A lot of stuff is already working but it always stops because it 
> don't find the "glib.h"
> 
> In this headerfiles basic types of the glib are described.
> see:
> http://library.gnome.org/devel/glib/unstable/glib-Basic-Types.html
> 
> I already wrote in my recipe:
> 
> DEPENDS = "... glib-2.0 ..." but I don't solve the problem.
> 
> Any ideas??
> 
> bye
> Konrad
could you post your recipe somewhere, and give more infos on the
failure?
by the way is glib already bitbaken?
can you specify the include dir path for glib(if it uses the autotools
in ./configure)?
The file you are talking about should be somewhere like
${STAGING_INCDIR}/glib-2.0/glib.h
so it's directory should be:
${STAGING_INCDIR}/glib-2.0

Denis.




