Received: from [130.149.4.14] (helo=mail2.zrz.tu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <torsten.sadowski@tu-berlin.de>) id 1I7vBt-00037I-Ac
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 17:30:21 +0200
Received: from localhost ([127.0.0.1] helo=mail2.zrz.TU-Berlin.DE)
	by mail2.zrz.tu-berlin.de with esmtp (exim-4.67)
	for <openembedded-devel@lists.openembedded.org>
	id 1I7v6U-0003Bk-Bh; Mon, 09 Jul 2007 17:24:46 +0200
Received: from mail2.zrz.TU-Berlin.DE ([130.149.4.14])
	by mail2.zrz.TU-Berlin.DE (MailMonitor for SMTP v1.2.2 ) ;
	Mon, 9 Jul 2007 17:24:46 +0200 (CEST)
Received: from mailbox.tu-berlin.de ([130.149.4.18])
	by mail2.zrz.tu-berlin.de with esmtp (exim-4.67)
	for <openembedded-devel@lists.openembedded.org>
	id 1I7v6U-0003Be-Ah; Mon, 09 Jul 2007 17:24:46 +0200
Received: from kapitaen.kup.tu-berlin.de ([130.149.75.153])
	by mailbox.tu-berlin.de with esmtpsa [TLSv1:DHE-RSA-AES256-SHA:256]
	(exim-4.67) for <openembedded-devel@lists.openembedded.org>
	id 1I7v6U-0000N0-74; Mon, 09 Jul 2007 17:24:46 +0200
From: Torsten Sadowski <torsten.sadowski@tu-berlin.de>
Organization: TU Berlin
To: openembedded-devel@lists.openembedded.org
Date: Mon, 9 Jul 2007 17:24:32 +0200
User-Agent: KMail/1.9.5
MIME-Version: 1.0
Message-Id: <200707091724.32860.torsten.sadowski@tu-berlin.de>
X-Virus-Scanned: Sophos MailMonitor at mail2.zrz.tu-berlin.de;
	Mon, 09 Jul 2007 17:24:46 +0200
Subject: Conflicting qte patches for Simpad
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
X-List-Received-Date: Mon, 09 Jul 2007 15:30:22 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

after some time I tried to build a Simpad opie-image again (from the devel 
branch) but I encountered conflicting patches for libqte (normal, static and 
mt).

It seems, that 
QWSTtyKeyboardHandler::QWSTtyKeyboardHandler
moved to:
kernelkeyboard.cpp

which is not accounted for in the devfs.patch.

Cheers, Torsten



Applying patch devfs.patch
patching file configure
patching file src/kernel/qgfxlinuxfb_qws.cpp
patching file src/kernel/qkeyboard_qws.cpp
Hunk #1 FAILED at 1253.
1 out of 1 hunk FAILED -- rejects in file src/kernel/qkeyboard_qws.cpp
patching file src/kernel/qwindowsystem_qws.cpp
patching file src/kernel/qsoundqss_qws.cpp
Hunk #1 succeeded at 1086 (offset -2 lines).
Patch devfs.patch does not apply (enforce with -f)
ERROR: Task 2094 
(/home/totty/simpad/bitbake2/devel/org.openembedded.dev/package
s/qte/qte-mt_2.3.10.bb, do_patch) failed
NOTE: Tasks Summary: Attempted 374 tasks of which 0 didn't need to be rerun 
and 
1 failed.
ERROR: '/home/totty/simpad/bitbake2/devel/org.openembedded.dev/packages/qte/qte-
mt_2.3.10.bb' failed
	



