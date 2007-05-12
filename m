Received: from [62.169.194.61] (helo=memova2.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1Hmz0P-0008Rs-Vm
	for openembedded-devel@openembedded.org; Sat, 12 May 2007 23:19:58 +0200
Received: from dias (62.169.211.226) by memova2.tellas.gr (7.3.118.8)
	id 4638635B002BFF41 for openembedded-devel@openembedded.org;
	Sat, 12 May 2007 23:18:07 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Sun, 13 May 2007 00:19:03 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHOECKLAAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <46461D72.4020206@dominion.kabel.utwente.nl>
Importance: Normal
Subject: minimal-image.bb
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
X-List-Received-Date: Sat, 12 May 2007 21:19:59 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Greetings to all !

Recently it was made apparent that bootstrap-image was generating images
that could not fit in flash restricted devices (<=4MB)
Koen has pushed angstrom-minimal-image which uses task-boot and as a result
generates images significally smaller.(800K in a jffs2 fs)

The only drawback into this (IMHO) is in the naming of the package.
Adding a distro name infront of an image package gives the impression that
this is distro specific and not a "generic" one.
I tried to push to the rep a more "generic" minimal-image.bb which was
almost identical to angstrom-minima-image but Koen had  dis-approved the
commit as duplicate.

In my opinion if angstrom-minimal-image is not distro specific should be
renamed to minimal-image or if it is distro specific a minimal-image.bb
should be created.

I discussed the matter with Koen on irc but we could not come to a
conlusion, so i am asking for the opinions of others on this, as i believe
is a issue which has to be solved to avoid any future problems.



Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com






