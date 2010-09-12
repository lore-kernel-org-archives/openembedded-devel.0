Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OujhK-0004eY-Jw
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 12:22:10 +0200
Received: from [192.168.42.31] (unknown [92.116.249.73])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id B582A1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 10:23:15 +0000 (UTC)
Message-ID: <4C8CA9A2.7040701@freyther.de>
Date: Sun, 12 Sep 2010 18:21:22 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Fedora14 and glibc-initial
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
X-List-Received-Date: Sun, 12 Sep 2010 10:22:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

has anyone else tried to build glibc-initial with Fedora14/rawhide? I am
having a build issue. At first make install tries to copy something to
/usr/local/include/sys/limits.h and now it is complaining about the Makefile
having mixed mode:

Makefile:235: *** mixed implicit and normal rules.  Stop.

Has anyone else seen that?


