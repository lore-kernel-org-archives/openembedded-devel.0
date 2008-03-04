Received: from [62.70.27.150] (helo=hoat.troll.no)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tcooksey@trolltech.com>) id 1JWVT2-000647-UP
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 12:38:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by hoat.troll.no (Postfix) with ESMTP id 71CBF581AE
	for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 12:35:57 +0100 (CET)
Received: from hoat.troll.no ([127.0.0.1])
	by localhost (hoat.troll.no [127.0.0.1]) (amavisd-maia,
	port 10024) with LMTP
	id 28517-04 for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 12:35:56 +0100 (CET)
Received: from sx01.troll.no (sx01.troll.no [62.70.27.21])
	by hoat.troll.no (Postfix) with ESMTP id 35579581A4
	for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 12:35:56 +0100 (CET)
Received: from sx01.troll.no (localhost.localdomain [127.0.0.1])
	by sx01.troll.no (8.13.8/8.13.8) with ESMTP id m24BacrI008109
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Mar 2008 12:36:38 +0100
Received: from tomdev.troll.no (tomdev.troll.no [10.3.5.39])
	by sx01.troll.no (Scalix SMTP Relay 11.3.0.11339)
	via ESMTP; Tue, 04 Mar 2008 12:36:38 +0100 (CET)
Date: Tue, 4 Mar 2008 12:40:17 +0100
From: Tom Cooksey <thomas.cooksey@trolltech.com>
To: openembedded-devel@openembedded.org
Message-ID: <200803041240.17891.thomas.cooksey@trolltech.com>
x-scalix-Hops: 1
Organization: Trolltech
User-Agent: KMail/1.9.7
MIME-Version: 1.0
X-Virus-Scanned: Maia Mailguard 1.0.2a
X-SA-Exim-Connect-IP: 62.70.27.150
X-SA-Exim-Mail-From: tcooksey@trolltech.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Missing includes in STAGING_INCDIR
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
X-List-Received-Date: Tue, 04 Mar 2008 11:38:03 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Disposition: inline

I am writing a recipie for Qt/Embedded 4.4 beta (using qt4 recipies as a base). At the 
moment Qt's configure test fails on dbus. I have added -I${STAGING_INCDIR}/dbus-1.0
to the configure flags so the configure test now picks up dbus/dbus.h correctly.

However, dbus.h itself includes dbus/dbus-arch-deps.h, which is not in 
${STAGING_INCDIR}/dbus-1.0/*, but _is_ in the dbus work dir. This means I have to add 
the dbus work dir to the include list, which feels wrong.

I have had the same problem with gstreamer too. I think something has broken recently, 
as I've tried building the existing qtopia core recipies and had the same failures.

I'm building using the org.openembedded.dev & com.gumstix.collection collections for
Angstrom 2008.1, gumstix-verdex machine. Am I missing something?


Cheers,

Tom


