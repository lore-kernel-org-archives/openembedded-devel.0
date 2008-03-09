Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JYMst-0007Ib-HH
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Mar 2008 15:52:23 +0100
Received: by an-out-0708.google.com with SMTP id b33so339376ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Mar 2008 07:50:33 -0700 (PDT)
Received: by 10.100.106.1 with SMTP id e1mr8914085anc.109.1205074232811;
	Sun, 09 Mar 2008 07:50:32 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sun, 9 Mar 2008 07:50:32 -0700 (PDT)
Message-ID: <c384c5ea0803090750jba077bld01cad88f051ba45@mail.gmail.com>
Date: Sun, 9 Mar 2008 15:50:32 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.132.240
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [ANNOUNCE] witpa - content addressable package URL maintenance
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
X-List-Received-Date: Sun, 09 Mar 2008 14:52:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

The result of a weekend code sprint, as an excuse to learn sqlite3 but
mostly because OpenEmbedded builds often break if downloads/ is empty.

http://www.sidebranch.com/witpa/

A package URL maintenance tool. See usage and example below. Would be
neat to have this as a web service.

./witpa -h

witpa - where is that package at?
Maintains a list with valid URLs for a package, has Google capabilities.

create       - Create new database 'package.db'.
add <url>    - Add known good URL.
google <pkg> - Find/validate/add package URLs.
where <pkg>  - Print all URLs of a package.
delete <pkg> - Delete package data.
show <pkg>   - Show all info of given package.
list         - Show all packages with sums.
import       - Import known-good data from (OpenEmbedded) checksums.ini.


Example:


./witpa create
Creating database 'packages.db'.

./witpa import ~/sandbox/openembedded/org.openembedded.dev/conf/checksums.ini
Importing package data from 'checksums.ini'...
(This may take a minute.)
Imported 3265 packages.

./witpa add http://bitshrine.org/gpp/dtc-1.0.0.tgz
Inserting new package.
http://bitshrine.org/gpp/dtc-1.0.0.tgz
cca7b9219bc6e39926480f651c30d67a
8228023bb787460e33f6e63ab8cc032599b0ca2f54db4db97dd3e9006f983c59[NEW ADDED ]

./witpa google http://bitshrine.org/gpp/dtc-1.0.0.tgz

./witpa where http://bitshrine.org/gpp/dtc-1.0.0.tgz
http://bitshrine.org/gpp/dtc-1.0.0.tgz
http://kambing.ui.edu/gentoo/distfiles/dtc-1.0.0.tgz
http://gentoo.netnitco.net/distfiles/dtc-1.0.0.tgz
http://distfiles.gentoo.org/distfiles/dtc-1.0.0.tgz
http://www.las.ic.unicamp.br/pub/gentoo/distfiles/dtc-1.0.0.tgz
http://tldp.etf.bg.ac.yu/gentoo/distfiles/dtc-1.0.0.tgz
http://gentoo.mirrors.pair.com/distfiles/dtc-1.0.0.tgz
http://cudlug.cudenver.edu/gentoo/distfiles/dtc-1.0.0.tgz
http://ftp.cgu.edu.tw/Linux/Gentoo/gentoo/distfiles/dtc-1.0.0.tgz
http://gentoo.modulix.net/gentoo/distfiles/dtc-1.0.0.tgz
http://gentoo.llarian.net/distfiles/dtc-1.0.0.tgz


Waiting for feedback,


Regards,
-- 
Leon


