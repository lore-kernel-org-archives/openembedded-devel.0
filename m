Received: from [195.170.0.94] (helo=rosebud.otenet.gr ident=OTEnet-mail-system)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <skoroneos@digital-opsis.com>) id 1JlisT-0008Hx-9z
	for openembedded-devel@openembedded.org; Tue, 15 Apr 2008 12:59:17 +0200
Received: from dias (athedsl-4396616.home.otenet.gr [79.130.134.56])
	by rosebud.otenet.gr (8.13.8/8.13.8/Debian-3) with ESMTP id
	m3FAx28r003923 for <openembedded-devel@openembedded.org>;
	Tue, 15 Apr 2008 13:59:02 +0300
Message-Id: <200804151059.m3FAx28r003923@rosebud.otenet.gr>
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Tue, 15 Apr 2008 13:58:27 +0300
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook, Build 11.0.5510
X-MIMEOLE: Produced By Microsoft MimeOLE V6.00.2900.3198
Thread-Index: Acie1o+hEyM6kCo0RxCi0njeRJCungADdc6w
In-Reply-To: <loom.20080415T082706-746@post.gmane.org>
Subject: Package_arch for x86 architectures
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
X-List-Received-Date: Tue, 15 Apr 2008 10:59:31 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

It has been discussed in the past on the irc also, but it seems we are
reaching a "limit" with the existing package_arch namespace for the x86
variant.
The x86 architecture is generaly a mess as hrw has pointed in his blog.
This creates a problem as we now have package arches like
i486,i586,i686,geode, (just to name a few) with different gcc -march and
-mtune settings and there also a  couple lile x86-32-nocona that use a
different -march but still use i686 as the package_arch
This could lead to troubles if you maintain a multimachine feed as you are
going to mix packages build with different optimizations that migh not run
well (or at all) 

There are also new embedded (and non embedded) boards coming that will
require also a package_arch.

For example I am working on an intel D201gly2 machine definition. This is a
P4 Celleron architecture cpu so I need to use -march=pentium4 mtune=celeron
How should this package_arch be named ?  i686p4c ? p4c ?
Should we have a "common" namespace ? How about geode based machines ?

Looking for input from interested parties before we move to rfc something
like that

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com
 




