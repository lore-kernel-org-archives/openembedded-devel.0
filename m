Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NDZcT-0002BA-2x for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 09:22:32 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NDZat-0001Un-E3
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Nov 2009 09:20:51 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2009 09:20:51 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Nov 2009 09:20:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 26 Nov 2009 09:20:29 +0100
Message-ID: <heldod$obj$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: e-wm-menu problem
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
X-List-Received-Date: Thu, 26 Nov 2009 08:22:32 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Lately I've notice a problem when building and installing e-wm: it drags 
in e-menu-shr. It's due to (improper) usage of RPROVIDES + RCONFLICTS.

My proposal is that images should choose which applications.menu they 
are using (the one from gnome-desktop, e-wm, e-menu-shr-etc) and have 
e-wm stop RRECOMMENDING it.

The basic patch looks like this:

--- a/recipes/e17/e-wm_svn.bb
+++ b/recipes/e17/e-wm_svn.bb
@@ -3,7 +3,7 @@ DEPENDS = "eet evas ecore edje efreet edbus"
-PR = "r7"
+PR = "r8"

@@ -90,7 +90,6 @@ RRECOMMENDS_${PN} = "\
-  ${PN}-menu \

--- a/recipes/shr/e-wm-menu-shr_git.bb
+++ b/recipes/shr/e-wm-menu-shr_git.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "illume SHR applications.menu config"

+PR = "r1"

-RPROVIDES_${PN} = "e-wm-menu"

And then a + <menu of choice> in your tasks and/or images.

What do you think about it?

regards,

Koen



