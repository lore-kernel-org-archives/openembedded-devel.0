Received: from mailout-de.gmx.net ([213.165.64.23] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P8sbA-0003SJ-UK
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:42:17 +0200
Received: (qmail 2015 invoked by uid 0); 21 Oct 2010 10:41:40 -0000
Received: from 193.8.40.126 by www061.gmx.net with HTTP;
	Thu, 21 Oct 2010 12:41:38 +0200 (CEST)
Date: Thu, 21 Oct 2010 12:41:38 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20101021104138.140020@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, bitbake-dev@lists.berlios.de
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX191i7Jiqbd1I/mdhfz8Zhr93slhKk+rYiF38ISfxB
	PBaszwL7cpEz5Y0GZC4WgiWgvhc3CUJF5RrQ== 
X-GMX-UID: 2i/zePBEf2IsNe8si2xoUH94dWxlc1bn
X-FuHaFi: 0.81999999999999995
X-SA-Exim-Connect-IP: 213.165.64.23
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: for the FAQ: traceback on populate_staging_postamble
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
X-List-Received-Date: Thu, 21 Oct 2010 10:42:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

when you get a traceback in the area of populate_staging_postamble
then this might originate from a broken cache. a state of that sort
seems to be relatively persistent. it might occur after a disk full 
condition. that traceback might be of help only for educated users.

solution:
go to this subdir "<distribution-build-dir>/deploy/glibc/pstage"
and delete the file "stamp-cache-staging"

regards, Alex.
-- 
GMX DSL Doppel-Flat ab 19,99 &euro;/mtl.! Jetzt auch mit 
gratis Notebook-Flat! http://portal.gmx.net/de/go/dsl


