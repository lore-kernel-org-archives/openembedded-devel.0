Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8GGV-0000DV-GI
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:41:55 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8GB9-0006yl-Qn
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 16:36:20 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 16:36:09 +0000
Message-ID: <1257957370.25369.356.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OEDEM 2009 summary: DISTROs and FEATURES
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
X-List-Received-Date: Wed, 11 Nov 2009 16:41:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

One topic which crops up on the mailing list now and again is the
tension between, on one hand, the desire to have packages tailored to
particular requirements or applications (for example, no x11 libs on a
system that never runs X); and, on the other hand, the desire for
"reproducible" builds.  How can we resolve this?

After a bit of discussion we arrived at the following principles.  I
think most/all of these are really just a formalisation of existing
practice rather than a radically new departure, but I don't think they
have previously been spelled out in this form:

a) a DISTRO represents a coherent set of binaries that are expected to
work together for a given MACHINE.  (If the distro chooses, there may
also be scope to share binary packages between sets of MACHINEs.)

b) we accept that, if the end user chooses to override parts of the
DISTRO configuration, there are nonetheless a myriad ways in which he
can generate incompatible binaries.  There doesn't seem to be much to
say about this other than to discourage users from doing it.

c) there is no expectation that binaries from different DISTROs, even on
the same MACHINE, should be compatible.  (For example, they might use
different C libraries or even different endianness.)

d) for a given TMPDIR, the DISTRO setting is immutable.  If you change
DISTRO you must rebuild from scratch in a different working tree.

e) DISTROs should be encouraged to minimize the number of unbound
variables which the user is expected to set in local.conf.  As a general
principle, the tuple of (MACHINE, DISTRO) should be enough to completely
determine the build environment.  Extra user-frobbable switches will
undermine the coherence of the DISTRO.

f) DISTROs have wide discretion to determine the contents of their own
binary packages (e.g. configuring python with or without x11 support)
and we should provide them with the mechanisms to do so.  There are
already various ad-hoc mechanisms to accomplish this for certain
packages (e.g. USE_LDCONFIG in glibc) and it would be desirable to come
up with a more over-arching framework.

g) the existing DISTRO_FEATURES variable is well suited to this role.
We should encourage DISTROs to use it where conditionality is needed
rather than inventing alternatives.

p.




