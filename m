Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OluNu-0003GG-BR
	for Openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 03:58:23 +0200
Received: by wwe15 with SMTP id 15so376238wwe.24
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 18:57:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.23.206 with SMTP id v56mr88010wev.67.1282183038369; Wed,
	18 Aug 2010 18:57:18 -0700 (PDT)
Received: by 10.216.15.79 with HTTP; Wed, 18 Aug 2010 18:57:18 -0700 (PDT)
Date: Wed, 18 Aug 2010 21:57:18 -0400
Message-ID: <AANLkTikKsOoeyhu1NgpZ8hm9ihJrWXEwbaZS8P9i0=2-@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gnome-utils and gnome-applets configuring without scrollkeeper
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
X-List-Received-Date: Thu, 19 Aug 2010 01:58:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

From what I've seen, EXTRA_OECONF = "--disable-scrollkeeper" does not
eliminate the dependency on scrollkeeper.

Taking a read of configure's command-line help:
--disable-scrollkeeper  do not make updates to the scrollkeeper
database

I don't think that means that there isn't a dependency on
scrollkeeper, only that the database isn't updated.  I can tell you
that configure won't complete until I run 'bitbake
scrollkeeper-native'.

Has anyone really been able to build these without scrollkeeper?  Can
anyone suggest how to proceed to create a patch?


