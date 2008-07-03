Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gwossum@pager.net>) id 1KEPgS-0003Ue-9G
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jul 2008 16:21:23 +0200
X-ASG-Debug-ID: 1215094667-043a00150000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 58605E48B6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jul 2008 09:17:47 -0500 (CDT)
Received: from mail.pager.net (lrs-ad1.longragesystems.local [192.168.1.254])
	by barracuda.pager.net with ESMTP id uAvQeEPsMH3GV8Vh for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jul 2008 09:17:47 -0500 (CDT)
X-ASG-Whitelist: Sender
Received: from [192.168.1.71] ([192.168.1.71]) by mail.pager.net with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 3 Jul 2008 09:16:47 -0500
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: qt4x11 vs. uicmoc4-native vs. qmake2-native
Date: Thu, 3 Jul 2008 09:17:45 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200807030917.45248.geoffrey@pager.net>
X-OriginalArrivalTime: 03 Jul 2008 14:16:47.0921 (UTC)
	FILETIME=[6DFAFA10:01C8DD17]
X-Barracuda-Connect: lrs-ad1.longragesystems.local[192.168.1.254]
X-Barracuda-Start-Time: 1215094667
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: qt4x11 vs. uicmoc4-native vs. qmake2-native
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
X-List-Received-Date: Thu, 03 Jul 2008 14:22:08 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I've been doing some work with some Qt4 based applications, and I must say 
that I'm confused by the relationship between OE's qt4x11, uicmoc4-native, 
and qmake2-native packages.

As far as I can tell, this is what each package provides:

qt4x11 - headers and libraries for target system
uicmoc4-native - All Qt tools except qmake for host system
qmake2-native - qmake and mkspecs for host system

My main question is why can't uicmoc4-native and qmake2-native be combined 
into a single package?  Let me share my pain.

I need Qt 4.4 because I'm using Phonon.  So I make a new Bitbake recipe for 
qt4x11-4.4.0.  uicmoc4-native is still from 4.3.3.  Oh, noes!  uic from 4.3.3 
doesn't generate code that works with QT_NO_ACCESSIBILITY, but that was fixed 
in 4.4.0.  So I make a uicmoc4-native recipe and patches for 4.4.0.  Now I'm 
building a package that uses CMake (phonon-vlc-mplayer) and Qt.  CMake uses 
qmake (NOOOOO!) to figure out how to build Qt based applications.  
phonon-vlc-mplayer's build system punts because the qmake it finds from 
qmake2-native is for 4.3.3, and it wants at least 4.4.0.  So now I'm creating 
a qmake2-native recipe and patches that builds qmake from 4.4.0, and it feels 
like deja vu all over again.  

But it gets even worse.  uicmoc4-native gets its version number from the 
version of Qt used to build it.  But qmake2-native gets it's version number 
from the qmake version, which is independent of the Qt version.  Both Qt 
4.3.3 and 4.4.0 include qmake 2.10a.  However, qmake also remembers the 
version of Qt used to build it, which is what makes CMake unhappy.  So the 
qmake version of 2.10a really isn't the whole story.

I understand that Qt's build system doesn't really handle building host tools 
and target libraries in one shot, so at least two recipes are almost 
certainly necessary.  However, is there any good reason why uicmoc4-native 
and qmake2-native couldn't be combined into a single package?

TIA,
---
Geoffrey


