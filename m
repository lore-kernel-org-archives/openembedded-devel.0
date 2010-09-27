Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P0Cde-0004iq-AQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 14:16:59 +0200
Received: (qmail 22345 invoked by uid 0); 27 Sep 2010 12:10:08 -0000
Received: from 84.157.18.181 by www046.gmx.net with HTTP;
	Mon, 27 Sep 2010 14:10:05 +0200 (CEST)
Date: Mon, 27 Sep 2010 14:10:05 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20100927121005.26700@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX189W29r4L89a3nDcSE4gX7Qn4W/91D7oQyr9UVeJ6
	4Da6pEI+aknFAIVYSi4nvE4diTdiMTLmpEHA== 
X-GMX-UID: yuzSbApreSEqW9kmjHQhGed+IGRvbwAg
X-FuHaFi: 0.68000000000000005
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: package/build problems with dropped packages
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
X-List-Received-Date: Mon, 27 Sep 2010 12:16:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

i've sent these lines to bitbake developer mailing list
a few days ago - they responded that its probably not
a problem of bitbake but rather a problem induced by
what represents the build system, e.g. that of open embedded.
over there is just silently agreed. now i am asking here again...

here's my previous posting to those list:


Subject: package/build problems in old bitbake versions - resolved in current version?
Date: Mon, 20 Sep 2010 18:01:06 +0200
Von: Alexander Stohr <Alexander.Stohr@gmx.de>
An: <bitbake-dev@lists.berlios.de>

Hello,

i was working with bitbake for cross building file system images
for an embedded project. in this setup i was updating a bigger
package to a more recent version. for some reasons it created
noticeable fewer packages for me leading to the state that
bitbake simply kept the corresponding result packages from an older
not-really-matching version from a prior build attempt in place.

for the reason of using a probably working pair of tools and recipes
i was doing my tasks using an older version of bitbake (1.8.12).
(surely there is 1.8.18 and 1.10.0 available to me
but i just did not check that versions sufficiently for now.)


my short term work-around was this:
i was manually sending the old packages to the morgue
and then started researching reasons for the changed
package build results. later packages should now be
in state to fault when something is missing instead
of being inadequately served by something older.
the first case is desirable, the later feels buggy.


does someone know how bitbake should behave in cases
where a newer recipe version does no longer produce a
certain package since no files were installed by the build?

does that further mean an ever added results package
must stay in the recipe for an indefinitely long period
even if it will be empty just for forced removal?

if that scenario is already addressed by some patch
then please drop me a note on the current state.

regards, Alex.

-- 
GMX DSL SOMMER-SPECIAL: Surf & Phone Flat 16.000 für nur 19,99 Euro/mtl.!*
http://portal.gmx.net/de/go/dsl


