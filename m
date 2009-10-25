Received: from [65.182.109.77] (helo=mta8.brinkster.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1N21oY-00069A-OC
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Oct 2009 13:03:17 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta8.brinkster.com (Postfix) with ESMTP id 7DDAB4C83F1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2009 08:02:24 -0400 (EDT)
X-Virus-Scanned: amavisd-new at 
Received: from mta8.brinkster.com ([127.0.0.1])
	by localhost (mta8.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 42QQDINMvE84
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2009 08:02:18 -0400 (EDT)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta8.brinkster.com (Postfix) with ESMTP id 85AF24C825A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Oct 2009 08:02:15 -0400 (EDT)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 25 Oct 2009 12:02:01 -0000
Message-ID: <044c01ca556a$f6f3af20$e4db0d60$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcpVavWV5xiOxhYJQiee98CeBugB+w==
X-SA-Exim-Connect-IP: 65.182.109.77
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC/PATCH] Add support for XFCE 4.6.1.
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
X-List-Received-Date: Sun, 25 Oct 2009 12:03:18 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

I have added support to XFCE 4.6.1 to OpenEmbedded in a branch I am hosting
at 

http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=shortlog;
h=xfce46-support

This is based on the earlier patchset I sent to the list and some feedback
Koen and Corsac (Debian's XFCE maintainer) provided. 
I have tested images made from the 2 new tasks on some of my OMAP3 boards
and all seems well.

For now it adds an xfce46.bbclass to support the builds and lives alongside
of XFCE 4.4 but in fairness I would like to propose dropping XFCE 4.4.* from
dev (and leaving it in stable/2009 for now).

I have also taken the liberty of renaming xfce to xfce-base and adding an
xfce-extras folder to house the non-core apps (gigolo, squeeze,
xfce4-notifyd, that sort of thing). I would also like to clean up the XFCE
recipes scattered around the tree but that has a bearing on if XFCE 4.4
remains supported in-tree.

Any comments?

Regards,

John

--

> What is a grue?

The grue is a sinister, lurking presence in the dark places of the earth.
Its favourite diet is adventurers, but its insatiable appetite is tempered
by its fear of light. No grue has ever been seen by the light of day, and
few have survived its fearsome jaws to tell the tale.






