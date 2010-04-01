Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NxMan-0004AM-SM
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 17:46:03 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NxMXb-0005vK-Ov from Tom_Rini@mentor.com ;
	Thu, 01 Apr 2010 08:42:43 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Apr 2010 08:42:43 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  1 Apr 2010 15:41:52 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Apr 2010 08:41:49 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270135981.4993.128.camel@rex>
References: <1270135981.4993.128.camel@rex>
Organization: Mentor Graphics Corporation
Date: Thu, 01 Apr 2010 08:41:49 -0700
Message-ID: <1270136509.6277.97.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Apr 2010 15:42:43.0597 (UTC)
	FILETIME=[F82373D0:01CAD1B1]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "Lock, Joshua" <joshua.lock@intel.com>
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 15:46:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-01 at 16:33 +0100, Richard Purdie wrote:

> * Added relocatable binary processing from Poky for -native binaries=20
>   using chrpath. This isn't enabled for -cross packages due to the=20
>   relative path length problems.

Is there a reason to not use $ORIGIN here instead?  The patch Chris
Larson posted ages ago does get this right (the hard part is
gcc/gdb/binutils due to the multi configure running).  And any path
length issues you hit with -cross you should be able to hit with
-native, no?

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


