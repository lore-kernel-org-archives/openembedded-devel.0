Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NSgHE-0000ra-O1
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jan 2010 01:31:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 002A21417182
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2010 01:04:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d46VVFZYmI8w
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2010 01:04:23 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id CBE881417181
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jan 2010 01:04:23 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 07 Jan 2010 01:03:33 +0100
Message-Id: <1262822613.6732.13.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: SIGSEGV during python-native build workarounds
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
X-List-Received-Date: Thu, 07 Jan 2010 00:31:03 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Hallo.

In last few months I encountered crashes during build of python-native
with openSUSE 11.2 x86_64 host. Backtrace signalizes that the crash
happens while ncurses attempts to parse termcap.

I has not been searching for a patch yet, but these workarounds may help
to somebody who will encounter this SIGSEGV as well:

This works:
- Adding ASSUME_PROVIDED += "ncurses-native" to my local.conf (it also
  requires ASSUME_PROVIDED += "readline-native") and installing proper
  host system packages.

This also works:
- Hide all available termcaps on the host system:
  /etc/termcap and /usr/share/misc/termcap

This did not help:
- Update python to 2.6.2

This may help (not tested yet):
- build python without ncurses support
- Update ncurses to the latest version (I did not yet succeed to do it)

Best regards.

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



