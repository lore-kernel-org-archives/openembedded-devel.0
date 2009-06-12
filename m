Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MFD0I-0002vL-IJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jun 2009 22:05:34 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MFCqe-0005N4-IH
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Jun 2009 20:55:36 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Jun 2009 20:55:35 +0100
Message-Id: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: [rfc] change default for BUILD_OPTIMIZATION, remove spurious	assignments
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
X-List-Received-Date: Fri, 12 Jun 2009 20:05:34 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'd like to propose changing the bitbake.conf default for
BUILD_OPTIMIZATION from "-O2" to "-O2 -g".  There seems no harm in
building debuggable binaries for host-side utilities and it makes life
somewhat easier when things go wrong.

Also, while investigating why assignments to this variable from
local.conf didn't do what I was expecting, I discovered that a whole lot
of files inside conf/, notably all of the sane-toolchain-*.inc files,
contain their own assignments to BUILD_OPTIMIZATION for no good reason
that I can see.  I would also propose to delete the assignments from
those files.  (There are a few other assignments in files that are
either DISTRO or MACHINE specific but I intend to leave those alone.)

p.




