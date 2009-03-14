Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LicS1-0003K0-5N
	for openembedded-devel@openembedded.org; Sat, 14 Mar 2009 23:35:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id DBA0B1417196
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Mar 2009 23:35:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7eX9FfKYKh2K for <openembedded-devel@openembedded.org>;
	Sat, 14 Mar 2009 23:35:18 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id A81761417193
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Mar 2009 23:35:18 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@openembedded.org
Date: Sat, 14 Mar 2009 23:35:00 +0100
Message-Id: <1237070100.9302.8.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: "opkg install ncurses-terminfo" needs 1GB of memory
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
X-List-Received-Date: Sat, 14 Mar 2009 22:35:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hallo.

While trying to do "make upgrade", opkg failed on ncurses-terminfo. It
ended with dead swapping or being targeted b y OOM killer.

Trying to proceed, I added swap to get 800 MB of virtual memory. The
result was 30 minutes of swapping and failure - ipkg fails on "fork
failed" error. I don't know, whether 1GB would be enough, but it is
surely far more than one would expect from package manager for PDA
device.

Does anybody else see this regression? I have 822 packages installed.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



