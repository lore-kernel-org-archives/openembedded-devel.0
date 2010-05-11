Received: from office.altell.ru ([80.246.246.162])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1OBr44-0006Un-5A
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 17:08:09 +0200
Received: from keemun.localnet (unknown [192.168.1.169])
	by mail.altell.local (Postfix) with ESMTPS id D369168416
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 May 2010 19:03:46 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 May 2010 19:04:05 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201005111904.06230.khimov@altell.ru>
X-Altell-MailScanner-ID: D369168416.E9261
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] logrotate scripts policy
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
X-List-Received-Date: Tue, 11 May 2010 15:08:09 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello all.

Seems like most OE users are fine with /var/log being on tmpfs and thus not 
care about logs and their rotation. We actually care about logs and thus need 
to rotate them. I have several patches adding logrotate scripts to recipes but 
I'd like to discuss the way they should be packaged in order to satisfy both 
camps (caring about logs and don't) and hopefully develop some policy for 
that.

As of now, my patches package logrotate scripts like this:

+PACKAGES =+ "${PN}-logrotate"
+FILES_${PN}-logrotate = "${sysconfdir}/logrotate.d/squid"
+RRECOMMENDS_${PN} += "${PN}-logrotate"
+RDEPENDS_${PN}-logrotate += "logrotate"

It works fine here, but I guess that people not caring about logs don't want 
to have logrotate installed and probably don't want /etc/logrotate.d cruft 
either. So, an opposite approach could be:

+RSUGGESTS_${PN} += "${PN}-logrotate"
+RSUGGESTS_${PN}-logrotate += "logrotate"

But then if you need logrotate scripts, you have to add all those *-logrotate 
packages to the respective image along with logrotate program itself. As the 
number of *-logrotate packages can be quite big it might be easier to add some 
IMAGE_LINGUAS-alike hook to image class with "IMAGE_LOGROTATE=y" parameter 
activating it.

So, probably a better approach and what I'm proposing is:

+RRECOMMENDS_${PN} += "${PN}-logrotate"
+RSUGGESTS_${PN}-logrotate += "logrotate"

This way all *-logrotate packages will get installed by default, but not the 
logrotate program. So, it will eat some little space in /etc/logrotate.d for 
everyone by default (but you can get rid of those packages if you really don't 
want them), but would allow to switch rotation on/off easily with just one 
package included or not in the image.

Also, in org.oe.dev there is already callweaver, asterisk and cluster-
resource-agents that have logrotate scripts installed in /etc/logrotate.d 
(that legitimizes RRECOMMENDS for *-logrotate a bit) and callweaver 
RRECOMMENDS logrotate (asterisk has that commented out, so it supports 
RSUGGESTS approach to logrotate itself a bit).

Suggestions, recommendations, comments?


