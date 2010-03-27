Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NvarD-0000tA-4m
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Mar 2010 19:35:39 +0100
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 27 Mar 2010 19:32:26 +0100
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 27 Mar 2010 19:31:52 +0100
Received: from [192.168.1.116] ([79.21.202.115]) by FBCMCL01B01.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 27 Mar 2010 19:31:51 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11003250045t34d59be1v5f64165f0066c7b7@mail.gmail.com>
References: <1269437224.1681.134.camel@rex>
	<ac9c93b11003240815o796152a7y50601b03e91be40@mail.gmail.com>
	<b6ebd0a51003240851i3f91860ia1100c4677569cf6@mail.gmail.com>
	<ac9c93b11003241317y2f6a6bbbs78936ee603d8ce3b@mail.gmail.com>
	<1269467167.1681.169.camel@rex>
	<ac9c93b11003250045t34d59be1v5f64165f0066c7b7@mail.gmail.com>
Date: Sat, 27 Mar 2010 19:31:49 +0100
Message-ID: <1269714709.2382.6.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 27 Mar 2010 18:31:52.0018 (UTC)
	FILETIME=[C500DB20:01CACDDB]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Reproducible builds (Was Re: Checksums in Bitbake)
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
X-List-Received-Date: Sat, 27 Mar 2010 18:35:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2010-03-25 at 08:45 +0100, Frans Meulenbroeks wrote:
> I've seen too often (also outside OE) that two engineers take the same
> source yet still get different results, and that bugs at a customer
> site cannot be reproduced in the lab (and yes, I do know there are
> other ways to tackle this problem) 
Also:
bitbake optionaldep
bitbake package
And:
bitbake package

could result in different binaries/packages due to configure picking
optionaldep in the first case and not in the second one.

Maybe we should start hardcoding --without-optionaldep for all optional
dependencies that are not in DEPENDS?

OR...maybe packaged-staging could save us from that issue?

( http://marcin.juszkiewicz.com.pl/2008/07/01/packaged-staging-and-what-it-gives/ )

Denis.





