Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1Kqv1Y-0003rD-0M
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 21:30:12 +0200
Received: from 88-111-190-175.dynamic.dsl.as9105.com ([88.111.190.175]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1Kqv1R-0005If-Cj
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 20:30:05 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Oct 2008 20:30:03 +0100
Message-Id: <1224271803.4235.182.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: remove ld.so.conf from glibc?
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
X-List-Received-Date: Fri, 17 Oct 2008 19:30:12 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

At present, the main glibc package (libc6 in most DISTROs) is shipping
an /etc/ld.so.conf file which mentions /usr/local/lib
and /usr/X11R6/lib.  I think it has basically been this way for all
time, and I suspect the original file was probably imported from Chris's
openzaurus installation way back when.

As far as I can tell, this file is not serving any useful purpose on any
contemporary DISTRO.  On the contrary, aside from contributing to
filesystem clutter, its only real effect will be to slow down shared
library loading.  So, I would propose to delete it from the libc6
package.  Any DISTRO which does need this file can, of course, ship it
in a separate package of their own.

Comments?

p.




