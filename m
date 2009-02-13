Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1LY0v5-0006gF-Cj
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 17:29:39 +0100
Received: (qmail 24751 invoked by uid 813007); 13 Feb 2009 16:28:12 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 13 Feb 2009 16:28:12 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@openembedded.org
Date: Fri, 13 Feb 2009 17:28:08 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc2; KDE/4.2.0; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200902131728.08634.openembedded@haerwu.biz>
Subject: checksums situation
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
X-List-Received-Date: Fri, 13 Feb 2009 16:29:39 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi

It is nearly two years since conf/checksums.ini was introduced. We 
populated it with over 6000 entries during that time (mostly by 
automatic fetching of all source on CELF and EWI machines). But there 
are problems with it's format.

First problem is how to use it when overlays are used. Not every entry 
of SRC_URI can be provided into public (NDA binaries etc) so people 
starts to switch off checking of checksums which is not good idea. OE 
reads only one copy of file. OK, such users can copy it to their overlay 
and extend with own entries which will work with properly created value 
of BBPATH variable. But this does not sound as solution.

Second problem which I hit few times is using of DEBIAN_MIRROR etc 
variables. We allow users to choose fastest Debian, kernel.org, 
SourceForge mirror but this also mean that URLs for sources will differ 
from ones in checksums.ini. Of course users can submit new entries but 
we will have duplicates then (we have about 700 of them already). There 
were ideas how to solve that which were sent to this mailing list.

One of ideas was to use filename as key (instead of URL). But I can 
imagine few situations when it will be wrong way (similiar names for 
different files, different contents of same name tarballs etc).

Other was to use filename as key and add "url[0-xx]" fields which will 
list alternative locations. This one looks better but still does not 
solve situation when someone use DEBIAN_MIRROR which is not present in 
checksums.ini file.

Possible solution would be going to keeping MD5/SHA256 sums in recipes. 
We used 'md5' parametr in SRC_URI for that in past. We can switch to 
using it for md5 and sha256, but some purists can say that it will make 
SRC_URI entries much longer.

Example:

SRC_URI = "${SOURCEFORGE_MIRROR}/zziplib/zziplib-${PV}.tar.bz2"

will change to:

SRC_URI = 
"${SOURCEFORGE_MIRROR}/zziplib/zziplib-${PV}.tar.bz2;md5=a6538f6c44ceeed0ed7e8e356f444168;sha256=f684397ce39ec400ba3369521892b7c3a8711d3ef1be59115db9f8d57707bbb8"

which is very long line.

This solution also has one nasty part - now we can keep SRC_URI for 
multiple versions in common file, but if we switch to storing it in 
SRC_URI we will have to change that.

Other solution proposed on IRC was to keep checksums in extra file in 
each directory of packages/ subdirectory. I think that it is not best 
but sounds better then one file.

What do you think? Which way we should go? Do you have other ideas?

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




