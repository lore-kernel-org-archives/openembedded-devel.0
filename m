Received: from [213.171.216.118] (helo=deferred-out-118.livemail.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <james@torbett.co.uk>) id 1N6RsJ-0006z2-8E
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 17:41:26 +0100
Received: from cust-smtp-193.fasthosts.net.uk (smtp-out-50.livemail.co.uk
	[213.171.216.50])
	by deferred-out-118.livemail.co.uk (Postfix) with ESMTP id EA7C719CA8C3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2009 16:09:35 +0000 (GMT)
Received: from localhost (mail213-171-216-231.livemail.co.uk [213.171.216.231])
	by cust-smtp-193.fasthosts.net.uk (Postfix) with ESMTP id 58EB3141008A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Nov 2009 16:09:33 +0000 (GMT)
MIME-Version: 1.0
X-Mailer: AtMail PHP 5.4
Message-ID: <41972.1257523773@torbett.co.uk>
To: <openembedded-devel@lists.openembedded.org>
X-Origin: 78.32.122.177
X-Atmail-Account: james@torbett.co.uk
Date: Fri, 6 Nov 2009 16:09:33 +0000
From: james@torbett.co.uk
X-SA-Exim-Connect-IP: 213.171.216.118
X-SA-Exim-Mail-From: james@torbett.co.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: omap3-console-image building deploying wrong kernel
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
X-List-Received-Date: Fri, 06 Nov 2009 16:41:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

  BODY { font-family:Arial, Helvetica, sans-serif;font-size:12px; }Hi,
 I am using Openembedded as instructed on the gumstix website to set
up an image for the overo, however I am having problems as the
deployed image contains kernel 2.6.28 but the modules are for 2.6.30.
I cannot seem to find why it is deploying the old kernel as it is
definately calling the recipe to build 2.6.30. Any ideas where it is
getting that version from? I have tried manually rebuilding the
2.6.30 kernel using
 bitbake linux-omap3-2.6.30
 bitbake omap3-console-image however when I deploy and run the
target, uname -r always reports 2.6.28.
 Any ideas?! I have not change any of the configuration settings
apart from setting machine to Overo and the distro to Angstrom2008.1
which was advised.
 James.

