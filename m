Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1MSSwn-0005ZB-VD
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jul 2009 11:44:45 +0200
Received: from p5b036f4b.dip.t-dialin.net ([91.3.111.75] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1MSSjO-0002wn-C0 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 11:30:57 +0200
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1MSSjL-0000ko-Lf
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jul 2009 11:30:51 +0200
Date: Sun, 19 Jul 2009 11:30:51 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090719093051.GA1246@excalibur.local>
References: <200907190500.20796.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <200907190500.20796.holger+oe@freyther.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: [RFC] Bitbake 1.8 parser rework
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
X-List-Received-Date: Sun, 19 Jul 2009 09:44:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2009-07-19 at 05:00, Holger Hans Peter Freyther wrote:
> 
> I posted this patchset a bit earlier and still would be interested in 
> feedback.I have put the version of Bitbake into a git repository so it might 
> be easier to try than to apply the ~20 patches to it.

I did some parsing tests for different distros. No error occurred and the new
parser saved between 11 to 16 seconds. See below for the details:


DISTRO=openmoko, branch milestone5.5
------------------------------------
Old parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: | (6485/6485) [100 %]
NOTE: Parsing finished. 0 cached, 6201 parsed, 284 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    2m8.318s
user    2m4.740s
sys     0m2.844s

New parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: | (6485/6485) [100 %]
NOTE: Parsing finished. 0 cached, 6201 parsed, 284 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    1m57.101s
user    1m53.723s
sys     0m2.480s


DISTRO=openmoko, branch org.openembedded.dev
---------------------------------------------
Old parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: \ (6978/6978) [100 %]
NOTE: Parsing finished. 0 cached, 6694 parsed, 284 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    2m27.989s
user    2m23.577s
sys     0m3.104s

New parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: \ (6978/6978) [100 %]
NOTE: Parsing finished. 0 cached, 6694 parsed, 284 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    2m12.436s
user    2m9.580s
sys     0m2.296s


DISTRO=angstrom-2008.1, branch org.openembedded.dev
---------------------------------------------
Old parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: \ (6832/6978) [97 %]NOTE: Angstrom DOES NOT
support bluez-libs because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: | (6834/6978) [97 %]NOTE: Angstrom DOES NOT
support bluez-utils because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: - (6842/6978) [98 %]NOTE: Angstrom DOES NOT
support bluez-libs because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: / (6847/6978) [98 %]NOTE: Angstrom DOES NOT
support bluez-utils because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: \ (6850/6978) [98 %]NOTE: Angstrom DOES NOT
support bluez-libs because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: \ (6978/6978) [100 %]
NOTE: Parsing finished. 0 cached, 6689 parsed, 289 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    2m19.683s
user    2m16.357s
sys     0m3.040s

New parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: \ (6832/6978) [97 %]NOTE: Angstrom DOES NOT
support bluez-libs because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: | (6834/6978) [97 %]NOTE: Angstrom DOES NOT
support bluez-utils because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: - (6842/6978) [98 %]NOTE: Angstrom DOES NOT
support bluez-libs because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: / (6847/6978) [98 %]NOTE: Angstrom DOES NOT
support bluez-utils because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: \ (6850/6978) [98 %]NOTE: Angstrom DOES NOT
support bluez-libs because bluez3 has been replace by bluez4
NOTE: Handling BitBake files: \ (6978/6978) [100 %]
NOTE: Parsing finished. 0 cached, 6689 parsed, 289 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    2m6.955s
user    2m2.876s
sys     0m2.984s


DISTRO=micro, branch org.openembedded.dev
---------------------------------------------
Old parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: \ (6978/6978) [100 %]
NOTE: Parsing finished. 0 cached, 6694 parsed, 284 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    1m59.425s
user    1m56.187s
sys     0m2.960s

New parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: \ (6978/6978) [100 %]
NOTE: Parsing finished. 0 cached, 6694 parsed, 284 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    1m46.620s
user    1m44.471s
sys     0m1.948s


DISTRO=minimal, branch org.openembedded.dev
---------------------------------------------
Old parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: \ (6978/6978) [100 %]
NOTE: Parsing finished. 0 cached, 6694 parsed, 284 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    2m12.521s
user    2m8.052s
sys     0m3.596s

New parser:
(oe-openmoko)sschmidt@shell:~/oe/build/openmoko$ time bitbake -p fso-zhone-image
NOTE: Handling BitBake files: \ (6978/6978) [100 %]
NOTE: Parsing finished. 0 cached, 6694 parsed, 284 skipped, 0 masked.
NOTE: Requested parsing .bb files only.  Exiting.

real    1m56.785s
user    1m54.711s
sys     0m1.692s

regards
Stefan Schmidt


