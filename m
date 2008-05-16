Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1Jx7Eu-0000GJ-4R
	for Openembedded-devel@lists.openembedded.org;
	Fri, 16 May 2008 23:13:20 +0200
X-ASG-Debug-ID: 1210972261-598b00100000-3ce4Sv
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 13D34ADE87
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2008 16:11:02 -0500 (CDT)
Received: from [192.168.1.71] ([192.168.1.1]) by barracuda.pager.net with
	ESMTP id p7J5OpF0r2dQFEZZ for
	<Openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2008 16:11:02 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: Openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: AVR32 segfaults / Disablng virtual/libintl?
Date: Fri, 16 May 2008 16:11:50 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200805161611.50480.geoffrey@pager.net>
X-Barracuda-Connect: UNKNOWN[192.168.1.1]
X-Barracuda-Start-Time: 1210972262
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: AVR32 segfaults / Disablng virtual/libintl?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Fri, 16 May 2008 21:13:20 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I've had some odd segfaults on my AVR32 system, mostly involving avahi (always 
on startup) and the occasional Xfbdev crash.  I didn't bother looking into it 
until now, because aplay was always crashing before it even got to main(), 
which was making difficult to test my sound CODEC.

I found that both avahi-daemon and aplay were both crashing before they got to 
main(), and they both crashed due to infinite recursion calling the function 
_pthread_cleanup_push_defer().

Due to the crash being in a thread related function, I focused my initial 
attention there, but now I think the problem is related to gettext.  If I 
hand compile aplay and keep it from linking against libintl, it doesn't 
crash.  Haven't tried the same thing on avahi, but I suspect libintl/gettext 
is also the problem there since they were crashing exactly the same way.

I don't need any i18n any these types of applications.  As a workaround, can I 
keep gettext from being built and use the libintl stubs provided by uClibc?  
How do I do this?  PREFERRED_PROVIDER_virtual/libintl = ""?   
PREFERRED_PROVIDER_virtual/libintl = "uclibc"?  

TIA,
---
Geoffrey



