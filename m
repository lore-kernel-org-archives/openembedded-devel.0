Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JlUua-0004iM-O6
	for Openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 22:04:20 +0200
X-ASG-Debug-ID: 1208203458-546c00ac0000-3ce4Sv
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 92C26408AB
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2008 15:04:18 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id 9BYHdfXnO3ethTUI for
	<Openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2008 15:04:18 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: Openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Building gdbserver only
Date: Mon, 14 Apr 2008 15:04:29 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200804141504.29481.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1208203458
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Building gdbserver only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Apr 2008 20:04:21 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I'm working on getting OE to build gdb-6.7.1.atmel.1.0.3 for the AVR32.  I 
have the gdb-cross working, but gdb is a little tricker.  gdb has not been 
ported to be hosted on the AVR32, so do_compile() quits when running the 
gdb/configure script.

It does support building gdbserver for the AVR32, though.  Trouble is, there 
doesn't seem to be an "easy" way to build just gdbserver.  To build just 
gdbserver, you run the gdb-${PV}/gdb/gdbserver/configure instead of 
gdb-${PV}/configure.  oe_runconf() substitutes the value of ${S} in.  If you 
try to modify ${S} so that oe_runconf() executes the correct configure 
script, then ${S} is screwed  up for do_patch() and the patches won't apply.  

Any ideas on how to solve this dillemma?

---
Geoffrey


