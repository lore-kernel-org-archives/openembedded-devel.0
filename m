Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MFZri-0003B5-NX
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Jun 2009 22:30:15 +0200
Received: from 88-109-80-94.dynamic.dsl.as9105.com ([88.109.80.94]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MFZhi-00085a-HV; Sat, 13 Jun 2009 21:20:00 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jun 2009 21:19:38 +0100
Message-Id: <1244924378.29153.12.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Cc: Jeremy =?ISO-8859-1?Q?Lain=E9?= <jeremy.laine@m4x.org>
Subject: lib*.so in FILES_${PN}
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
X-List-Received-Date: Sat, 13 Jun 2009 20:30:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This recent checkin:

http://cgit.openembedded.net/cgit.cgi?url=openembedded/commit/&id=ba434bd1dc9dc8ed61953a1579ea9e993e81cbb2

added ${base_libdir}/lib*.so to the default FILES_${PN}, on the grounds
that this is necessary to get procps packaged correctly.

However, I think this cure is worse than the original disease, in that
it's now virtually impossible to prevent *.so development symlinks
(which obviously belong in ${PN}-dev) from leaking into ${PN}.  This
situation is particularly bad if ${base_libdir} and ${libdir} are the
same, since you then end up with a useless .so symlink being installed
in your rootfs for virtually every library on the system.

I propose to revert the patch in question, and instead just let
procps.bb adjust its own local setting of FILES as necessary.

Comments?

p.




