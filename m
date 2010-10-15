Received: from mailout-de.gmx.net ([213.165.64.22] helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Alexander.Stohr@gmx.de>) id 1P6m7M-00006c-Hj
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 17:22:50 +0200
Received: (qmail 32511 invoked by uid 0); 15 Oct 2010 15:22:00 -0000
Received: from 193.8.40.126 by www151.gmx.net with HTTP;
	Fri, 15 Oct 2010 17:22:00 +0200 (CEST)
Date: Fri, 15 Oct 2010 17:22:00 +0200
From: "Alexander Stohr" <Alexander.Stohr@gmx.de>
Message-ID: <20101015152200.222150@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #15156664
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX18QIEgLVxgQ0HxzocoLDSvKUiGk8VTrQxwHz4WO3+
	ksc7lZhJ8M/yi4q1Irig4IiWJDDib7csG5nw== 
X-GMX-UID: q0aKffN+IydmDZ0gk2drHKRSa2FkZhVc
X-SA-Exim-Connect-IP: 213.165.64.22
X-SA-Exim-Mail-From: Alexander.Stohr@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: do we need patch-native ?
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
X-List-Received-Date: Fri, 15 Oct 2010 15:22:50 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Frans Meulenbroeks wrote:

> I had to do a build on OpenSuse 11.3 today, and it failed building
> quilt-native (0.46-r2)
> Root cause is that quilt configure tries to find whether patch is
> installed and has a version > 2.4

that whole setup and the files you mentioned for a certain reason
are looking quite familiar to me.

probably you will soon see things like this one for patchutils as well:

http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-October/025087.html

variants of this line of code might help in the topic pretty generically:

  aclocal --version | head -n 1 | sed -e "s/^.*[^[:digit:]\.]//g"

this should give you the tail of the first version line starting with the first character qualifying as a digit. the result might be e.g. "1.10.1".

in fact i would rather prefer external tools that really only provide their version number on a single line by using a specific option and a full lengthy copyright/info notice when using some other option - just thinking about what makes the life of script coder much simpler.

as seen in other notes for autoconf scripts its often resolved as two variants where the $1 value determines if $2 or $3 is the desired result.
basically i would prefer having patch-native as this will provide a very well known reproducible environment dropping all such nasties and even covering the case where there is no such tool present at all. it might be a slight effort to maintain such a recipe but it will definitely kill the cross over amount of combination resulting from some 200 possible build platforms and some 50..500 recipes making use of the --version option of whatever tool is in question.

regards, Alex.
-- 
Neu: GMX De-Mail - Einfach wie E-Mail, sicher wie ein Brief!  
Jetzt De-Mail-Adresse reservieren: http://portal.gmx.net/de/go/demail


