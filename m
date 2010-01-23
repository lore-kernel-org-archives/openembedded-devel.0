Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NYaRt-0001no-Ln
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 08:30:28 +0100
Received: from tamarin.localnet (123-192-163-227.dynamic.kbronet.com.tw
	[123.192.163.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 42A4A1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 07:26:57 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2010 08:27:49 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201001230827.49805.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OpenEmbedded and known security issues
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
X-List-Received-Date: Sat, 23 Jan 2010 07:30:28 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

the topic was brought up in another thread. Some of the software we are 
shipping as default is vulnerable to known security issues. It would take a 
full time position to subscribe to vendor security lists and make sure we are 
doing every security update as well. One example of currently vulnerable 
software in our repository is "libtool 2.2.6a" as it will dlopen a library 
from the $CWD... :)

Here is my proposal and it would be great to have some assistance. I'm using 
FreeBSD, and with FreeBSD there is huge ports tree (just like with the OE 
recipes), and since about 2003 there is this nice utility called portaudit..


1.) It offers to fetch a database from the FreeBSD servers. It is called 
"auditfile.tbz". The content of the file is quite simple, it has the 
projectname, the range of vulnerable versions, a link to the FreeBSD issue 
ticket, and the kind of vulnerability.

2.) The second mode of the script is to compare installed versions with the 
list of known vulnerabilities...


Now here comes the idea... Hack OE or bitbake to compare the PN to the PN of 
the database and the PV to the PV of known vulnerabilities.. and then mention 
a problem while parsing and then quit.


Known problems:
	- Sometimes our PN and their PN might not match so we need a different
          mapping somewhere in OE
	- The same might apply for the PV. specially with out -rX. So imagine 2.2.6a
          of libtool is vulnerable, and we apply the fix to it, we will still 
          call it 2.2.6a... so we might need a second mapping in OE to claim 
          where we have fixed known vulnerabilities..

so what do you guys think about the approach? Does someone care to hack this 
up? Would there be interest to sponsor a day or two for developing this?


regards
	holger



