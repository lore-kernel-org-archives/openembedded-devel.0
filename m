Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NCuXw-0001wz-Sw
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 13:31:08 +0100
Received: from homiemail-a18.g.dreamhost.com (caiajhbdccac.dreamhost.com
	[208.97.132.202])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 9D57717A424
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 04:29:57 -0800 (PST)
Received: from [129.132.133.199] (mtec-hg-docking-1-dhcp-199.ethz.ch
	[129.132.133.199])
	by homiemail-a18.g.dreamhost.com (Postfix) with ESMTPA id 85479250069
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 04:29:29 -0800 (PST)
Message-ID: <4B0BD1AC.1010806@SSpaeth.de>
Date: Tue, 24 Nov 2009 13:29:32 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: app launchers should NOT modify /proc/sys/vm
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
X-List-Received-Date: Tue, 24 Nov 2009 12:31:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

P.S. Sorry if this comes through twice. Dreamhost mail server was having
issues...

Currently, the navit (routing app) launcher script modifies
/proc/sys/vm/overcommit_memory without ever setting it back. This change
should -if at all- should only be done with serious evaluation on the
respective devices IMHO. I don't want to introduce random OOM process
killings for everyone because apps start using the RAM the kernel has
promised to them.

Do I get the OK to remove the launcher which is only doing this hackery?
I will follow up on this mail with a patch that you can ACK.

spaetz

Commit introducing this:
http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?id=742fb4ae71e6a7e655385086ba9edebbf00b6ebd

author	Matthias Hentges <oe@hentges.net>
committer	Matthias Hentges <oe@hentges.net>	2008-01-05
commit	742fb4ae71e6a7e655385086ba9edebbf00b6ebd
--- a/dev/null
+++ b/packages/navit/files/navit.launcher
...
+ if test "$USER" = "root"
+ then
+ echo "Enabling low-mem workaround..."
+ echo 1 > /proc/sys/vm/overcommit_memory





