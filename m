Received: from smtp-1.concepts.nl ([213.197.30.124])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pieterg@gmx.com>) id 1PgbXz-0004Eb-FM
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 12:22:23 +0100
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-1.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>)
	id 1PgbIk-0000ao-Ar; Sat, 22 Jan 2011 12:06:38 +0100
Received: from laptoppieter.localnet (laptoppieter.wielewaal [10.9.0.58])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 8CF536A077;
	Sat, 22 Jan 2011 12:06:33 +0100 (CET)
From: pieterg <pieterg@gmx.com>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Date: Sat, 22 Jan 2011 12:06:32 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.35-24-generic-pae; KDE/4.5.1; i686; ; )
MIME-Version: 1.0
Message-Id: <201101221206.32796.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1PgbIk-0000ao-Ar
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
Cc: openembedded-devel@lists.openembedded.org
Subject: e2fsprogs util-linux-ng dependency
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
X-List-Received-Date: Sat, 22 Jan 2011 11:22:23 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

in http://git.openembedded.org/cgit.cgi/openembedded/commit/recipes/e2fsprogs?h=org.openembedded.dev&id=ef73bcd899aaf182fb596e5912c20f966e0e6951
a util-linux-ng RDEPENDS was added to e2fsprogs.
But, the comment suggests that only util-linux-ng-blkid would be needed:

> # blkid used to be part of e2fsprogs but is useful outside, add it
> # as an RDEPENDS_${PN} so that anything relying on it being in e2fsprogs
> # still works
> RDEPENDS_e2fsprogs = "util-linux-ng e2fsprogs-badblocks"

util-linux-ng itself does not contain blkid, but a lot of unrelated utils
However, it RDEPENDS on other util-linux-ng- packages, among which util-linux-ng-blkid.
So eventually also util-linux-ng-blkid is installed.
But I'm wondering whether it was not intended to just RDEPEND on util-linux-ng-blkid, so we can avoid dragging in a large number of unrelated utils?

Rgds, Pieter


