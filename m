Received: from [209.253.16.26] (helo=barracuda.pager.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gwossum@pager.net>) id 1K9MNa-00026L-5Y
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jun 2008 17:48:54 +0200
X-ASG-Debug-ID: 1213890450-23d1013f0000-aWHRdb
X-Barracuda-URL: http://192.168.1.240:8000/cgi-bin/mark.cgi
Received: from mail.pager.net (localhost [127.0.0.1])
	by barracuda.pager.net (Spam Firewall) with ESMTP id 04521D472D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2008 10:47:30 -0500 (CDT)
Received: from mail.pager.net (lrs-ad1.longragesystems.local [192.168.1.254])
	by barracuda.pager.net with ESMTP id O1FUKAGC03eImSsD for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2008 10:47:30 -0500 (CDT)
X-ASG-Whitelist: Sender
Received: from [192.168.1.71] ([192.168.1.71]) by mail.pager.net with
	Microsoft SMTPSVC(6.0.3790.1830); Thu, 19 Jun 2008 10:52:25 -0500
From: Geoffrey Wossum <geoffrey@pager.net>
Organization: Long Range Systems
To: openembedded-devel@lists.openembedded.org
X-ASG-Orig-Subj: gstreamer and po-makefile-fix.patch
Date: Thu, 19 Jun 2008 10:47:26 -0500
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200806191047.27068.geoffrey@pager.net>
X-OriginalArrivalTime: 19 Jun 2008 15:52:25.0531 (UTC)
	FILETIME=[781448B0:01C8D224]
X-Barracuda-Connect: lrs-ad1.longragesystems.local[192.168.1.254]
X-Barracuda-Start-Time: 1213890451
X-Barracuda-Virus-Scanned: by Barracuda Spam Firewall at pager.net
Subject: gstreamer and po-makefile-fix.patch
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
X-List-Received-Date: Thu, 19 Jun 2008 15:48:54 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I ran into a problem with a patch to GStreamer with an AVR32 target.  My 
coworker ran into the exact same problem with a GeodeLX target.

The problem is the po-makefile-fix.patch, which looks like:
--- gstreamer-0.10.17.orig/po/Makefile.in.in    2008-01-25 23:21:31.000000000 
+0800
+++ gstreamer-0.10.17/po/Makefile.in.in 2008-03-20 19:10:54.000000000 +0800
@@ -30,7 +30,7 @@
 INSTALL = @INSTALL@
 INSTALL_DATA = @INSTALL_DATA@
 MKINSTALLDIRS = @MKINSTALLDIRS@
-mkinstalldirs = $(SHELL) `case "$(MKINSTALLDIRS)" in /*) 
echo "$(MKINSTALLDIRS)" ;; *) echo "$(top_builddir)/$(MKINSTALLDIRS)" ;; 
esac`
+mkinstalldirs = $(MKINSTALLDIRS)

 GMSGFMT = @GMSGFMT@
 MSGFMT = @MSGFMT@


"make install" fails in the po/ directory with this patch applied.  It works 
great if don't apply the patch.  

What is the purpose of this patch?  I don't see how GStreamer could 
successfully build with this patch.  Is there a companion patch that is 
missing?

---
Geoffrey




