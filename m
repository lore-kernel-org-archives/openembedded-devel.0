Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P0wzl-0001ZC-Sb
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 15:46:57 +0200
Received: (qmail 21385 invoked by uid 0); 29 Sep 2010 13:46:38 -0000
Received: from 193.8.40.126 by www184.gmx.net with HTTP;
	Wed, 29 Sep 2010 15:46:36 +0200 (CEST)
Date: Wed, 29 Sep 2010 15:46:36 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20100929134636.22170@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX18e8IRGS8EekNRwe1RcnMLV5maWATvjR/BbU/k4cX
	hCKNv/VnBo/xVw3ao/2su6H7xmgl2Qh66Xdw== 
X-GMX-UID: DjmWJMJiZDIrBtZ2nWY20bl5emhmY4H0
X-FuHaFi: 0.60999999999999999
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: intltools 0.41.1 - needed when building from /home
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
X-List-Received-Date: Wed, 29 Sep 2010 13:46:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

hello,

according to the bug repository there was a bug in intltools-update probably with checker option "-m" that made some OE packages fault
when the OE tree was based upon the /home directory of a certain user.
https://bugs.launchpad.net/intltool/+bug/514295

namely the recipes for shared-mime-info in native and cross version were hit in a form like that:

rm -f missing notexist
| srcdir=/home/user/oe/angstrom.1-dev/work/armv7a-angstrom-linux-gnueabi/shared-mime-info-0.51-r2/shared-mime-info-0.51/po /home/user/oe/angstrom.1-dev/staging/i686-linux/usr/bin/intltool-update -m
| The following files contain translations and are currently not in use. Please
| consider adding these to the POTFILES.in file, located in the po/ directory.
|
| me/user/oe/angstrom.1-dev/work/armv7a-angstrom-linux-gnueabi/shared-mime-info-0.51-r2/shared-mime-info-0.51/po/../freedesktop.org.xml.in
| me/user/oe/angstrom.1-dev/work/armv7a-angstrom-linux-gnueabi/shared-mime-info-0.51-r2/shared-mime-info-0.51/po/../update-mime-database.c
|
| If some of these files are left out on purpose then please add them to
| POTFILES.skip instead of POTFILES.in. A file 'missing' containing this list
| of left out files has been written in the current directory.

this bug is fixed with latest release 0.41.1 of intltools (released 2010-03-24).
find it there: https://launchpad.net/intltool/trunk/0.41.1

i am not yet in state of testing that full version exhaustively but a short repetition of the formerly faulting command line with the updated tool (a perl script) seemingly passed for me.

regards, Alex.
-- 
GMX DSL SOMMER-SPECIAL: Surf & Phone Flat 16.000 für nur 19,99 Euro/mtl.!*
http://portal.gmx.net/de/go/dsl


