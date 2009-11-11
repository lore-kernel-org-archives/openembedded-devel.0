Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1N8Gl9-0003qP-JD
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 18:13:35 +0100
Received: from [85.210.2.237] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1N8Gjr-0007hA-Hj
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:12:12 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 17:12:01 +0000
Message-ID: <1257959521.25369.393.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-Broken-Reverse-DNS: no host name found for IP address 85.210.2.237
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OEDEM 2009 summary: Package management
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
X-List-Received-Date: Wed, 11 Nov 2009 17:13:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This was the last session of the OEDEM schedule and the number of
participants was much reduced compared to the previous ones.  Partly as
a result of that it was also very short.

Key issue: opkg is the defacto standard for package management in
OE-derived distros but its quality is perceived as low.  What can we do
about this?

RP: not many problems encountered with opkg in poky

PB: opkg generally performs OK within its own "comfort envelope".  Main
triggers for badness seem to be online upgrades, and the requirement to
make a decision between two alternatives.  If you stay away from those
things and use opkg only for image construction then it is not so bad.

Can we fix opkg to make it work better?

- many have tried and not gotten anywhere, e.g. openmoko spent a while
hacking on it but many problems remain.  Suspect that maybe the codebase
in its current form is just unfixable and it would be better to throw it
away.

- nonetheless, Graham Gower is trying to repair it.  All strength to his
elbow!

Can we use something else instead?

- dpkg: does its job well but this is only half the problem (and opkg is
not so bad at this part anyway).  Not obvious that this would help very
much.  Note that busybox includes a dpkg implementation nowadays as
well.

- apt: high quality but footprint is too big.  written in C++, which is
a big deal for folks who would not otherwise be shipping libstdc++.
Run-time memory requirements also larger than we think we can tolerate
on small devices.

- others?  No obvious candidates come to mind.  

Can we do something better for image construction, at least?

- when building an initial rootfs, can bring the whole power of the
build machine to bear on the problem.  Can we use another tool to
resolve dependencies, then just pass a flat package list to opkg/dpkg
for installation?

- it would be nice to leverage bitbake's knowledge of the dependency
graph if this is possible

- RP: it is not possible, bitbake thinks only in terms of task
dependencies and doesn't care about runtime ones per se.  Metadata for
output packages is not re-injected into bitbake core and hence not
usable for this purpose.

- PB: Drat.

- could write another program to do this but it would not be trivial

Conclusions

- right now, opkg seems to be as good as it gets

- encourage folks to write replacements, maybe OE e.V. can offer
bounties for this at some point

- improving image construction is a worthwhile goal in itself: not
everybody has the capability/desire to do online upgrades.





