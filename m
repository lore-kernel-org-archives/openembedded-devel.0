Received: from [203.97.33.64] (helo=smtp3.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1MfooI-0008OX-Cx
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 07:43:11 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp3.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KOX009KS31J3D10@smtp3.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Tue,
	25 Aug 2009 17:24:56 +1200 (NZST)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id 64D8B5CE258	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 17:24:55 +1200 (NZST)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id E1IYoy79w+19	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 17:24:55 +1200 (NZST)
Received: from [192.168.1.129] (unknown [192.168.1.129])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id 0C71B5CE246	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 17:24:55 +1200 (NZST)
Date: Tue, 25 Aug 2009 17:24:53 +1200
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
To: openembedded dev <openembedded-devel@lists.openembedded.org>
Message-id: <4A9375A5.2080306@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
X-Spam-Flag: NO
X-Spam-Score: -1.44
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-Spam-Status: No, score=-1.44 tagged_above=-99 required=5
	tests=[ALL_TRUSTED=-1.44]
X-Spam-Level: 
Subject: [PATCH] add lupdate, lrelease to qmake2 bbclass
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
X-List-Received-Date: Tue, 25 Aug 2009 05:43:13 -0000
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit

add lrelease4, lupdate4 to the environment.
---
  classes/qmake2.bbclass |    2 ++
  1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/classes/qmake2.bbclass b/classes/qmake2.bbclass
index 26e813a..3772189 100644
--- a/classes/qmake2.bbclass
+++ b/classes/qmake2.bbclass
@@ -19,3 +19,5 @@ export OE_QMAKE_INCDIR_QT = "${STAGING_INCDIR}/qt4"
  export OE_QMAKE_LIBDIR_QT = "${STAGING_LIBDIR}"
  export OE_QMAKE_LIBS_QT = "qt"
  export OE_QMAKE_LIBS_X11 = "-lXext -lX11 -lm"
+export OE_QMAKE_LRELEASE = "${STAGING_BINDIR_NATIVE}/lrelease4"
+export OE_QMAKE_LUPDATE = "${STAGING_BINDIR_NATIVE}/lupdate4"
--
1.6.3.3


