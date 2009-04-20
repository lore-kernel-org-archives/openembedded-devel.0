Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LvvR0-0006gL-Tz
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 17:29:27 +0200
Received: (qmail 21602 invoked by uid 813007); 20 Apr 2009 15:25:07 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 20 Apr 2009 15:25:07 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Apr 2009 17:24:53 +0200
Message-Id: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.rc0
Subject: [STABLE] Some fixes from .dev tree
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
X-List-Received-Date: Mon, 20 Apr 2009 15:29:27 -0000

All changes were tested for building on Debian 'sid'/amd64.

Targets were:

- glibc: at91sam9263ek, qemuarm, qemux86, vortex86sx, beagleboard
- uclibc: atngw100, at91sam9263ek, qemuarm, qemux86, vortex86sx, beagleboard

[STABLE][PATCH 1/1] busybox 1.13.2: Add more upstream patches, bump PR

Some updates/fixes from upstream.

[STABLE][PATCH 1/1] tracker: added libgnomecanvas to dependencies

I had tracker failure during do_configure due to lack of libgnomecanvas.

[STABLE][PATCH 1/1] e2fsprogs_1.41.4.bb : remove bogus override of do_configure which breaks
[STABLE][PATCH 1/1] e2fsprogs: fix compile to use 3 args so it works.
[STABLE][PATCH 1/1] e2fsprogs 1.41.4: depends on gettext-native, due to the removal of do_configure

Those 3 make e2fsprogs build for uclibc systems.

[STABLE][PATCH 1/1] util-linux-ng: Fixed dangling symlinks.
[STABLE][PATCH 1/1] util-linux-ng: depend on virtual/libintl to pass building with uclibc
[STABLE][PATCH 1/1] checksums.ini: added checksum for util-linux-ng 2.13.1

Those fix 2.13.1 SRC_URI and make util-linux-ng build for uclibc.

[STABLE][PATCH 1/1] hostap-utils-0.4.7: use LDFLAGS (fixes QA error)
[STABLE][PATCH 1/1] irda-utils: add patch to use LDFLAGS (fixes QA error)
[STABLE][PATCH 1/1] uclibc: use LDFLAGS for ldd and ldconfig (fixes QA error)

QA fixes.




