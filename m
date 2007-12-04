Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1IzX54-0006AH-Om
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2007 13:40:54 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 9105C28C013; Tue,  4 Dec 2007 13:30:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180153100.adsl.alicedsl.de [85.180.153.100])
	by srv043.dedi23.de (Postfix) with ESMTP id 8E3F228C012
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2007 13:30:34 +0100 (CET)
Date: Tue, 4 Dec 2007 13:37:18 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1869419485.20071204133718@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1196759359.4817.1.camel@localhost.localdomain>
References: <1196552859.6697.28.camel@localhost.localdomain>
	<443804680.20071204021110@vanille-media.de>
	<1196759359.4817.1.camel@localhost.localdomain>
MIME-Version: 1.0
Subject: Re: Packaged Staging, nearly a reality!
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2007 12:40:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Ok, sorry for the false alarm.

Actually it turns out to be a dependency problem. Yesterday I felt
adventurous and bumped PARALLEL_MAKE and BB_MULTIPLE_THREADS both from 4 to
8, but immediately forgot about it.

Then everything python started to freak out. So I guess there is some
missing / wrong task dependencies. Can you recommend a good way to
debug that?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



