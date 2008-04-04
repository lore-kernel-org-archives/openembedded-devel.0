Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JhniS-0006gE-KR
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Apr 2008 17:20:32 +0200
X-ASG-Debug-ID: 1207322431-743700260000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 310C837612
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Apr 2008 10:20:31 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id GQ6ZQ5UhUx7Ok3eB for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 04 Apr 2008 10:20:31 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Changing recipe files
Date: Fri, 4 Apr 2008 10:20:39 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200804041020.39696.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1207322431
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Changing recipe files
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
X-List-Received-Date: Fri, 04 Apr 2008 15:20:33 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I'm working on build gdb-cross for the AVR32.  In the process, I've figured 
out I need to modify the do_stage() function in gdb-cross.inc.  I need to 
touch some files to prevent "oe_runmake install" from wanting to run makeinfo 
(ah, my old nemesis makeinfo) since makeinfo is a native makeinfo is not 
available in the OE build environment.

For whatever reason, though, the system doesn't seem to pick up my change.  
I've tried running "bitbake -c rebuild gdb-cross".  I've tried bumping up the 
PR value in recipe file.  I've tried wiping out the work directory for 
gdb-cross.  Still doesn't want to use my modified version of do_stage().  
Every time I look in the run.do_stage.xxxxx it's the old version of 
do_stage().  I figure I could wipe out my entire build tree and the change 
would be caught, but I don't want to wait 2.5 hours to rebuild everything.  

What is the magic incantation for my change to take effect?

TIA,
---
Geoffrey


