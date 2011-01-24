Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PhUxS-0006kK-Fh
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 23:32:22 +0100
Received: (qmail invoked by alias); 24 Jan 2011 22:24:55 -0000
Received: from p5DE49494.dip.t-dialin.net (EHLO localhost.localdomain)
	[93.228.148.148]
	by mail.gmx.net (mp066) with SMTP; 24 Jan 2011 23:24:55 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/qP3N8wt7qb+FEh1fsVd4QBo241degtq+rz2KQam
	6hra7KG59ZuGhx
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 23:22:30 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
MIME-Version: 1.0
Message-Id: <201101242322.30470.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Question regarding gettext 0.18
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
X-List-Received-Date: Mon, 24 Jan 2011 22:32:22 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear OE folks,

during working on new recipes for clutter 1.4.2 I face the following issue:

Compiling fails with the message

>Making all in po
>make[2]: Entering directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
>*** error: gettext infrastructure mismatch: using a Makefile.in.in from gettext version 0.17 but the autoconf macros are from gettext version 0.18
>make[2]: *** [check-macro-version] Error 1
>make[2]: Leaving directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2/po'
>make[1]: *** [all-recursive] Error 1
>make[1]: Leaving directory `/home/Superandi/tmp/work/overo-angstrom-linux-gnueabi/clutter-1.4.2-r3.0/clutter-1.4.2'
>make: *** [all] Error 2
>FATAL: oe_runmake failed
>ERROR: Function do_compile failed

I checked google & git-log for a hint on that - nothing (yet).

It smells as a simple solution - but I am not able to find it. Can somebody please give me a hint how to solve?

Regards

Andreas


