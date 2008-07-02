Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gwossum@pager.net>) id 1KE3sR-0002O8-A6
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jul 2008 17:04:11 +0200
X-ASG-Debug-ID: 1215010856-07eb01870000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 1DD9CE33BC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2008 10:00:56 -0500 (CDT)
Received: from mail.pager.net (lrs-ad1.longragesystems.local [192.168.1.254])
	by barracuda.pager.net with ESMTP id ZD8KUE6BHrsgYzz6 for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jul 2008 10:00:56 -0500 (CDT)
X-ASG-Whitelist: Sender
Received: from [192.168.1.71] ([192.168.1.71]) by mail.pager.net with
	Microsoft SMTPSVC(6.0.3790.1830); Wed, 2 Jul 2008 09:59:55 -0500
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: SVN Fetcher Makes Invalid Assumptions
Date: Wed, 2 Jul 2008 10:00:52 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200807021000.52998.geoffrey@pager.net>
X-OriginalArrivalTime: 02 Jul 2008 14:59:55.0343 (UTC)
	FILETIME=[49CA7DF0:01C8DC54]
X-Barracuda-Connect: lrs-ad1.longragesystems.local[192.168.1.254]
X-Barracuda-Start-Time: 1215010856
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: SVN Fetcher Makes Invalid Assumptions
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
X-List-Received-Date: Wed, 02 Jul 2008 15:04:11 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I just ran into a problem using the SVN fetcher with a project that breaks the 
fetchers assumptions about how an SVN repository is structured.  The project 
in question is phonon-vlc-mplayer 
(http://code.google.com/p/phonon-vlc-mplayer/), which has released no 
tarballs of the source (although it has released compiled binaries, go 
figure).

The SVN fetcher assumes that all SVN repositories can be checked out 
with "proto://url/module module", in other words that the module name is at 
then end of the URL.  However, phonon-vlc-mplayer requires 
using "http://phonon-vlc-mplayer.googlecode.com/svn/trunk/ 
phonon-vlc-mplayer", in other words the module name is NOT part of the URL.

As a workaround, I'm checking out the SVN repository manually, tarring it up, 
and putting into files/ for this package.  However, it seems like there 
should be an option added to the SVN fetcher that will disable this module 
appending behavior for projects like this.

Comments?

---
Geoffrey


