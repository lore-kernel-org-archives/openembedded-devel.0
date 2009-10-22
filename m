Received: from [64.22.125.45] (helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1N13HV-0003RN-9s
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 21:25:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id CEA862C7FE;
	Thu, 22 Oct 2009 19:19:51 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZCkjz3bcdXf; Thu, 22 Oct 2009 19:19:47 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id DD4192C7F8;
	Thu, 22 Oct 2009 19:19:46 +0000 (UTC)
Message-ID: <4AE0B157.80807@gmail.com>
Date: Thu, 22 Oct 2009 21:24:07 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Question about bluez4 and PROVIDES_append_angstrom
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
X-List-Received-Date: Thu, 22 Oct 2009 19:25:08 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hello,
first of all I must say that I am not a OE expert and I'd like to learn
and understand, so please apologize if my question is too silly for most
of you :-)

I am quite confused about a few lines I found into the following files.
The result of these lines faced me to errors using KaeilOS distro.

This modification looks (to me) related to bluez4 and Angstrom only and
I wonder why some package recipes (bluez4*.bb) contains some lines that
strictly ties them to Angstrom distribution breaking other distributions.

Files I found are the following:
recipes/bluez/bluez4_4.35.bb:PROVIDES_append_angstrom =
 " bluez-utils bluez-libs"
recipes/bluez/bluez4_4.37.bb:PROVIDES_append_angstrom =
 " bluez-utils bluez-libs"
recipes/bluez/bluez4.inc:PROVIDES_append_angstrom =
 " bluez-utils-dbus bluez-utils bluez-libs"

Lines are similar to these:
# For angstrom we want this to replace at least bluez-libs
PROVIDES_append_angstrom = " bluez-utils-dbus bluez-utils bluez-libs"
RPROVIDES_bluez4-dev_angstrom = "bluez-libs-dev"

My question is: why these lines are not into angstrom*.bb distro recipe
making bluez*.bb distro-independent (agnostic)?

Thank you in advance for your hints.

/marco



