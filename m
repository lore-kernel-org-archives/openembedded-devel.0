Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1JlT8J-0001Zy-Ai
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Apr 2008 20:10:24 +0200
X-ASG-Debug-ID: 1208196620-42e7001b0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id A5B90407C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2008 13:10:20 -0500 (CDT)
Received: from [192.168.1.71] (LRS-CiscoBackup [192.168.1.1]) by
	barracuda.pager.net with ESMTP id 1nIjBuksSjt2uSL7 for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2008 13:10:20 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: Cross compile badness with /usr/include/libffi solved
Date: Mon, 14 Apr 2008 13:10:30 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200804141310.30857.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoBackup[192.168.1.1]
X-Barracuda-Start-Time: 1208196620
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: Cross compile badness with /usr/include/libffi solved
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
X-List-Received-Date: Mon, 14 Apr 2008 18:10:27 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

Last week I encountered a problem building gcc-cross on my system.  I would 
get something along the lines of:

CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/libffi 

I found several of hits on Google for this, but no real solution.

After much headscratching and a debugger session later, I figured out that my 
CPATH environment variable (which I had been previously unaware of) was set 
in my environment.  This was being set on my Gentoo system 
by /etc/env.d/99libffi, which was there because I had installed libffi on my 
system.  I've had libffi installed the whole time I've been working with OE, 
but hadn't noticed because I hadn't been trying to use  a compiler with 
zecke-no-host-includes.patch applied.

Simply adding an "unset CPATH" in my script I source before building OE makes 
the problem go away.

It seems like adding an "unset CPATH" to the run.do_* scripts bitbake creates 
would be a good idea to prevent problems like this in the future.  Or is 
pulling in the users CPATH a feature?

---
Geoffrey




