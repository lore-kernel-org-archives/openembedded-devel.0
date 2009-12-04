Received: from p3plsmtpa01-04.prod.phx3.secureserver.net ([72.167.82.84])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NGOvE-000541-PG
	for openembedded-devel@openembedded.org; Fri, 04 Dec 2009 04:33:36 +0100
Received: (qmail 19379 invoked from network); 4 Dec 2009 03:25:14 -0000
Received: from unknown (209.242.7.187)
	by p3plsmtpa01-04.prod.phx3.secureserver.net (72.167.82.84) with ESMTP;
	04 Dec 2009 03:25:14 -0000
Message-ID: <4B18811D.8020206@mwester.net>
Date: Thu, 03 Dec 2009 21:25:17 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 72.167.82.84
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Commit 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00 breaks opkg
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
X-List-Received-Date: Fri, 04 Dec 2009 03:33:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Commit 2fdf1aa1c869ea9deecee86206f49a2eca9d7c00 (Koen) breaks
opkg-nogpg-nocurl.  I have no idea what else might be broken, but the
fact that it removes all the critical patches that make it work on
small-memory machines is the most obvious cause of the breakage.

So what do you all want me to do about this?  We can revert the commit. 
Or someone can try to sort out a way to let opkg change without
impacting the tiny-memory version of opkg (which will get more and more
difficult as the two diverge).  Or I can just create
opkg-nogpg-nocurl-slugos.bb in hopes that it won't get stomped on.

Thanks,
Mike (mwester)


