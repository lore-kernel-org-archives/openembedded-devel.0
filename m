Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P3C8Q-00034R-VF
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 20:21:17 +0200
Received: (qmail 9504 invoked by uid 0); 5 Oct 2010 18:20:44 -0000
Received: from 193.8.40.126 by www100.gmx.net with HTTP;
	Tue, 05 Oct 2010 20:20:41 +0200 (CEST)
Date: Tue, 05 Oct 2010 20:20:41 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20101005182041.23910@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1/1+g9qbLX1Nuom4gtkbumuc/T7sc1J+nyiZri34O
	H4Y5+Z09h45w9Yc0aV3GtBTjHHhZQ0XsqjVA== 
X-GMX-UID: HwjDAWxobHIhcMp93jQ0BkciJihyahDZ
X-FuHaFi: 0.69999999999999996
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: patchutils 0.2.31 - not that compatible with state of the art automake
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
X-List-Received-Date: Tue, 05 Oct 2010 18:21:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

oe uses version 0.2.31 of patchutils. i consider this a developers packages.

thats what is at the download location right now:

[ ]	patchutils-0.2.31.tar.bz2	13-Jun-2005 17:46 	143K
[ ]	patchutils-0.3.0.tar.bz2	02-Jul-2008 12:07 	146K
[ ]	patchutils-0.3.1.tar.bz2	23-Jan-2009 18:06 	155K

i was having noticeable trouble with those 5 years old version
since i am fiddling around with a relatively recent automake.
all the build behavior of patchutils was quite erratic.

staring and dealing the source package internals i reasoned
that those old version is probably not that automake compliant.
so i once took the probably most simple choice to solve it:

  cp patchutils_0.2.31.bb patchutils_0.3.1.bb

that seemingly made me succeed with that recipes family.

regards, Alex.
-- 
Neu: GMX De-Mail - Einfach wie E-Mail, sicher wie ein Brief!  
Jetzt De-Mail-Adresse reservieren: http://portal.gmx.net/de/go/demail


