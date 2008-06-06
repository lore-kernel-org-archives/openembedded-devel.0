Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <geoffrey@pager.net>) id 1K4k8i-0002LV-79
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jun 2008 00:10:31 +0200
X-ASG-Debug-ID: 1212789933-787a000d0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from [192.168.1.71] (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 1FCBDC7061
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2008 17:05:35 -0500 (CDT)
Received: from [192.168.1.71] (LRS-CiscoRouter [192.168.1.1]) by
	barracuda.pager.net with ESMTP id 5mXoXgMaNuYAfIs2 for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2008 17:05:35 -0500 (CDT)
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: DEPENDS="gettext" vs. DEPENDS="virtual/libintl"
Date: Fri, 6 Jun 2008 17:06:11 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200806061706.11880.geoffrey@pager.net>
X-Barracuda-Connect: LRS-CiscoRouter[192.168.1.1]
X-Barracuda-Start-Time: 1212789935
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: DEPENDS="gettext" vs. DEPENDS="virtual/libintl"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 06 Jun 2008 22:10:35 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I'm working on exorcizing gettext as a requirement for building OE.  Since 
glib-2.0 absolutely has to have libintl, I've found an alternate way of 
providing.  uClibc's libintl stub has a pretty bad case of bitrot, but I 
found proxy-libintl, which was written to get GNOME onto Windows.  By setting 
proxy-libintl up as the PREFERRED_PROVIDER for virtual/libintl, I can get 
past glib-2.0 now.

The problem now is that some packages explicitly list "gettext" in their 
DEPENDS.  Is this just legacy from before virtual/libintl was created?  Is 
there any reason why these can't all be changed to "virtual/libintl"?

TIA,
---
Geoffrey


